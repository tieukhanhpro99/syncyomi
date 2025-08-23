# Hướng dẫn Deploy SyncYomi lên Render

## Tổng quan
Hướng dẫn này sẽ giúp bạn deploy SyncYomi lên Render một cách dễ dàng và hiệu quả.

## Yêu cầu
- Tài khoản Render (miễn phí)
- GitHub repository chứa code SyncYomi
- Kiến thức cơ bản về Docker và web services

## Các bước thực hiện

### 1. Chuẩn bị Repository
Đảm bảo repository của bạn có các file sau:
- `render.yaml` - Cấu hình Render
- `render.Dockerfile` - Dockerfile tối ưu cho Render
- `config.toml` - Cấu hình ứng dụng
- `.dockerignore` - Loại trừ file không cần thiết

### 2. Tạo Service trên Render

#### Bước 1: Đăng nhập Render
- Truy cập [render.com](https://render.com)
- Đăng nhập hoặc tạo tài khoản mới

#### Bước 2: Tạo Web Service
- Click "New +" → "Web Service"
- Connect với GitHub repository
- Chọn branch `main`

#### Bước 3: Cấu hình Service
- **Name**: `syncyomi` (hoặc tên bạn muốn)
- **Environment**: `Docker`
- **Region**: Chọn region gần bạn nhất
- **Branch**: `main`
- **Root Directory**: Để trống (nếu code ở root)
- **Build Command**: Để trống (sẽ dùng Dockerfile)
- **Start Command**: Để trống (sẽ dùng Dockerfile)

#### Bước 4: Tạo Database
- Click "New +" → "PostgreSQL"
- **Name**: `syncyomi-postgres`
- **Database**: `syncyomi`
- **User**: `syncyomi`
- **Region**: Cùng region với web service

### 3. Cấu hình Environment Variables

Render sẽ tự động set các biến môi trường từ database:
- `POSTGRES_HOST`
- `POSTGRES_PORT`
- `POSTGRES_DATABASE`
- `POSTGRES_USER`
- `POSTGRES_PASS`

Các biến khác:
- `HOST`: `0.0.0.0`
- `PORT`: `10000`
- `DATABASE_TYPE`: `postgres`
- `NODE_ENV`: `production`

### 4. Deploy

#### Bước 1: Deploy Database
- Click "Create PostgreSQL"
- Đợi database được tạo xong

#### Bước 2: Deploy Web Service
- Click "Create Web Service"
- Render sẽ tự động build và deploy
- Quá trình này có thể mất 5-10 phút

### 5. Kiểm tra Deployment

#### Health Check
- Render sẽ tự động kiểm tra endpoint `/health`
- Nếu fail, kiểm tra logs trong dashboard

#### Truy cập ứng dụng
- URL sẽ có dạng: `https://your-app-name.onrender.com`
- Kiểm tra web interface hoạt động bình thường

### 6. Cấu hình Domain (Tùy chọn)

#### Custom Domain
- Vào Settings → Custom Domains
- Thêm domain của bạn
- Cấu hình DNS records theo hướng dẫn

#### SSL Certificate
- Render tự động cung cấp SSL certificate
- Không cần cấu hình thêm

## Troubleshooting

### Build Failures
- Kiểm tra logs trong Render dashboard
- Đảm bảo tất cả dependencies được cài đặt
- Kiểm tra Dockerfile syntax

### Database Connection Issues
- Đảm bảo database đã được tạo
- Kiểm tra environment variables
- Kiểm tra firewall settings

### Health Check Failures
- Kiểm tra ứng dụng có start thành công không
- Kiểm tra port binding
- Kiểm tra logs

### Performance Issues
- Upgrade plan nếu cần
- Tối ưu database queries
- Sử dụng CDN cho static files

## Monitoring và Maintenance

### Logs
- Truy cập logs trong Render dashboard
- Set up log aggregation nếu cần

### Metrics
- Monitor CPU, memory usage
- Set up alerts cho critical metrics

### Updates
- Pull code mới từ GitHub
- Render sẽ tự động redeploy
- Test sau mỗi update

## Chi phí

### Free Tier
- 750 giờ/tháng cho web services
- 1GB RAM, shared CPU
- 1GB storage cho database

### Paid Plans
- Starter: $7/tháng
- Standard: $25/tháng
- Professional: $100/tháng

## Kết luận

Với cấu hình này, SyncYomi sẽ chạy ổn định trên Render và có thể scale theo nhu cầu. Đảm bảo monitor performance và logs thường xuyên để duy trì service ổn định.

## Hỗ trợ

Nếu gặp vấn đề:
1. Kiểm tra logs trong Render dashboard
2. Tham khảo [Render documentation](https://render.com/docs)
3. Tạo issue trên GitHub repository
4. Tham gia Discord community 