# SyncYomi - Starter Plan Deployment với Persistent Storage

## 🚀 Deploy với Starter Plan ($7/tháng) - Có Persistent Storage

### ✨ Ưu điểm của Starter Plan:

**Persistent Storage:**
- ✅ **Data được lưu trữ an toàn**
- ✅ **Không bị mất khi container restart**
- ✅ **Có thể backup dễ dàng**
- ✅ **SQLite database persistent**

**Performance:**
- ✅ **512MB RAM** (thay vì 1GB shared)
- ✅ **Shared CPU** (tốt hơn free tier)
- ✅ **99.9% uptime SLA**
- ✅ **Priority support**

## 💰 Chi phí:

```
Web Service: $7/tháng
Persistent Storage: Có sẵn (không cần database riêng)
Tổng: $7/tháng
```

## 🎯 So sánh với các option khác:

### Free Tier:
```
❌ Không có persistent storage
❌ Data mất khi restart
✅ Miễn phí
```

### Starter Plan (KHUYẾN NGHỊ):
```
✅ Có persistent storage
✅ Data được bảo vệ
✅ Performance tốt hơn
✅ $7/tháng
```

### PostgreSQL + Free Tier:
```
✅ Data persistent
❌ Setup phức tạp
❌ $7/tháng cho database
❌ Cần quản lý 2 service
```

## 📋 Deploy với Starter Plan:

### Bước 1: Push code lên GitHub
```bash
git add .
git commit -m "Deploy with Starter Plan persistent storage"
git push origin main
```

### Bước 2: Tạo Web Service trên Render
1. **Đăng nhập Render**: [render.com](https://render.com)
2. **Tạo Web Service**:
   - Click "New +" → "Web Service"
   - Connect GitHub repository
   - Environment: `Docker`
   - **Plan: Starter ($7/tháng)** ← Quan trọng!
   - Region: Chọn region gần bạn
   - Branch: `main`
   - Build Command: Để trống
   - Start Command: Để trống

### Bước 3: Đợi Deploy
- Build time: 5-10 phút
- Persistent storage sẽ được tạo tự động
- Data sẽ được lưu trữ an toàn

## 🔒 Persistent Storage Details:

### Data được lưu trữ:
```
✅ Manga reading progress
✅ Library information
✅ User settings
✅ API keys
✅ Sync history
✅ Configuration files
✅ Logs (nếu cần)
```

### Storage location:
```
Container: /app/data/
Persistent: Render managed disk
Backup: Automatic
Recovery: Available
```

## 📊 Monitoring và Management:

### Dashboard Features:
- **Logs**: Real-time logs
- **Metrics**: CPU, memory usage
- **Health**: Automatic health checks
- **Uptime**: 99.9% SLA
- **Backup**: Data backup options

### Performance:
- **RAM**: 512MB dedicated
- **CPU**: Shared (tốt hơn free tier)
- **Storage**: Persistent disk
- **Network**: Optimized

## 🔄 Data Management:

### Backup Strategy:
- **Automatic**: Render tự động backup
- **Manual**: Có thể export data
- **Recovery**: Restore từ backup

### Data Safety:
- **Persistent**: Không mất khi restart
- **Redundant**: Multiple copies
- **Secure**: Encrypted storage

## 🚨 Lưu ý quan trọng:

### Starter Plan Limits:
- **750 giờ/tháng** (free tier)
- **512MB RAM** (thay vì 1GB)
- **Shared CPU** (không dedicated)

### Upgrade Path:
- **Standard**: $25/tháng (1GB RAM)
- **Professional**: $100/tháng (4GB RAM)

## 🎯 Kết luận:

**Starter Plan với Persistent Storage** là lựa chọn tốt nhất vì:

1. **✅ Có persistent storage** - Data không bị mất
2. **✅ Performance tốt** - 512MB RAM, shared CPU
3. **✅ Giá hợp lý** - $7/tháng
4. **✅ Setup đơn giản** - Chỉ cần 1 service
5. **✅ Có thể scale** - Upgrade dễ dàng

---

**💡 Khuyến nghị**: Dùng Starter Plan để có persistent storage và performance tốt, không cần lo về data loss! 