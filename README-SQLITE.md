# SyncYomi - SQLite Deployment trên Render Free Tier

## 🚀 Deploy miễn phí với SQLite

### ⚠️ Lưu ý quan trọng về SQLite trên Render Free Tier:

**Data Storage:**
- ❌ **Data sẽ bị mất khi container restart**
- ❌ **Không có persistent storage**
- ❌ **Không thể backup dễ dàng**

**Ưu điểm:**
- ✅ **Hoàn toàn miễn phí**
- ✅ **Setup đơn giản**
- ✅ **Không cần database riêng**
- ✅ **Deploy nhanh**

## 🎯 Khi nào nên dùng SQLite:

- **Testing/Development**
- **Personal use** (không quan trọng data)
- **Free tier deployment**
- **Temporary projects**

## 🚨 Khi nào KHÔNG nên dùng SQLite:

- **Production use**
- **Important data**
- **Multiple users**
- **Long-term deployment**

## 📋 Deploy với SQLite:

### Bước 1: Push code lên GitHub
```bash
git add .
git commit -m "Switch back to SQLite for free tier deployment"
git push origin main
```

### Bước 2: Tạo Web Service trên Render
1. **Đăng nhập Render**: [render.com](https://render.com)
2. **Tạo Web Service**:
   - Click "New +" → "Web Service"
   - Connect GitHub repository
   - Environment: `Docker`
   - Plan: **Free** (750 giờ/tháng)
   - Build Command: Để trống
   - Start Command: Để trống

### Bước 3: Đợi Deploy
- Build time: 5-10 phút
- Kiểm tra logs nếu có lỗi

## 🔄 Data Management với SQLite:

### Backup Strategy:
```bash
# Export data định kỳ
# Sync với local database
# Sử dụng cloud storage (Google Drive, Dropbox)
```

### Data Loss Prevention:
- **Regular exports**: Export data mỗi tuần
- **Local sync**: Đồng bộ với máy local
- **Multiple instances**: Chạy nhiều instance để backup

## 💰 Chi phí:

```
Web Service: Miễn phí (750 giờ/tháng)
Database: Không cần
Tổng: $0/tháng
```

## 🚀 Upgrade Path:

Nếu sau này cần persistent storage:

1. **Upgrade lên Starter Plan** ($7/tháng)
2. **Chuyển sang PostgreSQL**
3. **Migrate data từ SQLite**

## 📊 Monitoring:

- **Logs**: Có sẵn trong dashboard
- **Health**: Tự động kiểm tra
- **Uptime**: Free tier limits
- **Performance**: 1GB RAM, shared CPU

## 🔧 Troubleshooting:

### Data mất:
- Đây là đặc điểm của SQLite trên free tier
- Không phải lỗi, mà là limitation

### Container restart:
- Render sẽ tự động restart khi cần
- Data sẽ bị mất mỗi lần restart

### Performance issues:
- Upgrade lên paid plan
- Hoặc optimize code

## 📚 Alternatives:

### Free Tier với Persistent Storage:
- **Railway**: Free tier với persistent storage
- **Fly.io**: Free tier với persistent storage
- **Heroku**: Free tier (limited)

### Paid Services:
- **Render Starter**: $7/tháng
- **DigitalOcean**: $5/tháng
- **Vultr**: $2.50/tháng

## 🎯 Kết luận:

**SQLite trên Render Free Tier** phù hợp cho:
- Testing và development
- Personal projects
- Temporary deployments
- Learning purposes

**KHÔNG phù hợp cho:**
- Production use
- Important data
- Long-term projects
- Multiple users

---

**💡 Khuyến nghị**: Bắt đầu với SQLite free tier để test, sau đó upgrade lên PostgreSQL khi cần persistent storage! 