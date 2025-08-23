# SyncYomi - Render Deployment Quick Guide

## 🚀 Deploy to Render in 5 minutes

### Prerequisites
- [ ] GitHub repository with SyncYomi code
- [ ] Render account (free at render.com)
- [ ] All files from this repository

### Quick Deploy Steps

1. **Push code to GitHub**
   ```bash
   git add .
   git commit -m "Add Render deployment support"
   git push origin main
   ```

2. **Create Web Service on Render**
   - Go to [render.com](https://render.com)
   - Click "New +" → "Web Service"
   - Connect GitHub repository
   - Environment: `Docker`
   - Build Command: Leave empty
   - Start Command: Leave empty
   - Auto-deploy: ✅ Enabled

3. **Wait for Deployment**
   - Build time: ~5-10 minutes
   - Check logs for any errors
   - Service will be available at: `https://your-app-name.onrender.com`

### 🧪 Test Locally First

```bash
# Build for Render
make build/render

# Test with Docker Compose
docker-compose -f docker-compose.render.yml up -d

# Access at http://localhost:10000
```

### 🔧 Environment Variables

Render automatically sets:
- `HOST`: `0.0.0.0`
- `PORT`: `10000`
- `DATABASE_TYPE`: `sqlite`
- `NODE_ENV`: `production`

**Note**: Using SQLite for simplicity - no database setup required!

### 📁 Files Added for Render

- `render.yaml` - Render configuration
- `render.Dockerfile` - Optimized Dockerfile
- `config.toml` - Updated config for Render
- `.dockerignore` - Build optimization
- `docker-compose.render.yml` - Local testing

### 🚨 Common Issues

**Build fails:**
- Check Go version compatibility (1.20+)
- Ensure all dependencies are committed
- Check Dockerfile syntax

**Health check fails:**
- Check if app starts successfully
- Verify port binding
- Check logs for errors

### 📊 Monitoring

- **Logs**: Available in Render dashboard
- **Health**: Automatic health checks
- **Metrics**: CPU, memory usage
- **Uptime**: 99.9% SLA on paid plans

### 💰 Pricing

- **Free**: 750 hours/month, 1GB RAM
- **Starter**: $7/month, 512MB RAM
- **Standard**: $25/month, 1GB RAM
- **Professional**: $100/month, 4GB RAM

### 🔗 Useful Commands

```bash
# Build for Render
make build/render

# Test Render Docker image
make build/render-docker

# Clean Render build files
make clean/render

# Get deployment help
make render/deploy
```

### 📚 Full Documentation

See `render-deploy.md` for detailed step-by-step instructions.

### 🆘 Support

- [Render Documentation](https://render.com/docs)
- [SyncYomi Discord](https://discord.gg/aydqBWAZs8)
- [GitHub Issues](https://github.com/SyncYomi/SyncYomi/issues)

---

**Happy Deploying! 🎉** 