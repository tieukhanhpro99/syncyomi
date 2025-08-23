# Build stage
FROM golang:1.20-alpine AS builder

# Install build dependencies
RUN apk add --no-cache git make build-base tzdata nodejs npm sqlite

# Install pnpm
RUN npm install -g pnpm

WORKDIR /app

# Copy package files
COPY go.mod go.sum ./
COPY web/package.json web/pnpm-lock.yaml ./web/

# Install Go dependencies
RUN go mod download

# Install and build frontend
WORKDIR /app/web
RUN pnpm install --frozen-lockfile
COPY web/ .
RUN pnpm build

# Build Go application
WORKDIR /app
COPY . .
COPY --from=builder /app/web/dist ./web/dist

RUN go build -ldflags "-s -w" -o bin/syncyomi main.go

# Final stage
FROM alpine:latest

# Install runtime dependencies including SQLite
RUN apk add --no-cache ca-certificates tzdata wget sqlite

WORKDIR /app

# Copy binary
COPY --from=builder /app/bin/syncyomi .

# Create config and data directories
RUN mkdir -p /app/config /app/data

# Expose port (Render uses PORT env var)
EXPOSE 10000

# Health check
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
  CMD wget --no-verbose --tries=1 --spider http://localhost:10000/health || exit 1

# Start command
CMD ["./syncyomi", "--config", "/app/config"] 