.PHONY: test
.POSIX:
.SUFFIXES:

GIT_COMMIT := $(shell git rev-parse HEAD 2> /dev/null)
GIT_TAG := $(shell git describe --abbrev=0 --tags)
BUILD_DATE := $(shell date -u +"%Y-%m-%dT%H:%M:%SZ")

SERVICE = syncyomi
GO = go
RM = rm
GOFLAGS = "-X main.commit=$(GIT_COMMIT) -X main.version=$(GIT_TAG) -X main.date=$(BUILD_DATE)"
PREFIX = /usr/local
BINDIR = bin

all: clean build

deps:
	sudo npm install -g pnpm
	cd web && pnpm install
	go mod download

build: deps build/web build/app

build/app:
	go build -ldflags $(GOFLAGS) -o bin/$(SERVICE) main.go

build/web:
	cd web && pnpm build

build/docker:
	docker build -t syncyomi:dev -f Dockerfile . --build-arg GIT_TAG=$(GIT_TAG) --build-arg GIT_COMMIT=$(GIT_COMMIT) --build-arg BUILD_DATE=$(BUILD_DATE)

# Render-specific build targets
build/render: deps build/web build/app
	@echo "Building for Render deployment..."
	@echo "Frontend built successfully"
	@echo "Go binary built successfully"
	@echo "Ready for Render deployment"

build/render-docker:
	docker build -t syncyomi:render -f render.Dockerfile . --build-arg GIT_TAG=$(GIT_TAG) --build-arg GIT_COMMIT=$(GIT_COMMIT) --build-arg BUILD_DATE=$(BUILD_DATE)

# Test targets
test:
	go test ./...

test/coverage:
	go test -coverprofile=coverage.out ./...
	go tool cover -html=coverage.out

# Clean targets
clean:
	$(RM) -rf bin
	$(RM) -rf web/dist
	$(RM) -rf web/node_modules

clean/render:
	$(RM) -rf bin
	$(RM) -rf web/dist

install: all
	echo $(DESTDIR)$(PREFIX)/$(BINDIR)
	mkdir -p $(DESTDIR)$(PREFIX)/$(BINDIR)
	cp -f bin/$(SERVICE) $(DESTDIR)$(PREFIX)/$(BINDIR)

# Development helpers
dev:
	@echo "Starting development environment..."
	@echo "Make sure you have Go and Node.js installed"
	@echo "Run 'make deps' to install dependencies"
	@echo "Run 'make build' to build the project"
	@echo "Run 'go run main.go' to start the server"

# Render deployment helpers
render/deploy:
	@echo "Preparing for Render deployment..."
	@echo "1. Ensure all changes are committed and pushed to GitHub"
	@echo "2. Create a new Web Service on Render"
	@echo "3. Connect your GitHub repository"
	@echo "4. Set Environment to 'Docker'"
	@echo "5. Deploy!"
	@echo ""
	@echo "For detailed instructions, see render-deploy.md"
