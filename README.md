 # ASPNET-DK24TTK2-nguyenduchau-weblinhkien
 Website bán linh kiện điện tử
 ASPNET-DK24TTK2-nguyenduchau-weblinhkien
 Giới thiệu
 Thông tin sinh viên
 Họ tên: Nguyễn Đức Hậu
 MSSV: 0386416402
 Lớp: DK24TTK2
 Email: haund150798@tvu-onschool.edu.vn
 Website gồm các chức năng cơ bản:
 // Ngày 02/05/2026 thực hiện //
 Hiển thị danh sách sản phẩm
 Xem chi tiết sản phẩm
 Tìm kiểm sản phẩm và lọc theo loại
 Cấu trúc thư mục
 src/
 ├── Default.aspx
 ├── Default.aspx.cs
 ├── ChiTiet.aspx
 ├── ChiTiet.aspx.cs
 ├── ketnoi.cs
 ├── Web.config
 ├── image/
 └── DBLinhKien.bak
 // Ngày 03/05/2026 thực hiện //
Các chức năng đã thực hiện

- Xây dựng chức năng đăng ký tài khoản:
  - Cho phép người dùng tạo tài khoản mới
  - Kiểm tra trùng username trước khi đăng ký
- Xây dựng chức năng đăng nhập và đăng xuất:
  - Xác thực tài khoản từ cơ sở dữ liệu
  - Lưu thông tin đăng nhập bằng Session
  - Cho phép đăng xuất và xoá Session
- Xây dựng chức năng quản lý sản phẩm:
  - Hiển thị danh sách sản phẩm
  - Thêm sản phẩm mới
  - Chỉnh sửa thông tin sản phẩm
  - Xoá sản phẩm
- Phân quyền người dùng:
  - Chỉ tài khoản có role "admin" mới được truy cập và sử dụng chức năng quản lý sản phẩm
Kết quả đạt được
- Hoàn thiện hệ thống đăng nhập và phân quyền
- Cho phép quản trị viên quản lý sản phẩm trực tiếp trên website
- Đảm bảo dữ liệu được kiểm soát và bảo mật theo quyền người dùng
// Ngày 04/05/2026 thực hiện //
- Xây dựng chức năng giỏ hàng (Cart):
  - Thêm sản phẩm vào giỏ hàng
  - Tăng / giảm số lượng sản phẩm
  - Lưu giỏ hàng bằng Session
- Hiển thị số lượng sản phẩm trong giỏ hàng:
  - Tổng số lượng sản phẩm được hiển thị trên header
- Xây dựng chức năng thanh toán:
  - Lấy dữ liệu từ giỏ hàng
  - Tính tổng tiền
  - Lưu thông tin đơn hàng vào database (DonHang)
- Xây dựng chi tiết đơn hàng:
  - Lưu danh sách sản phẩm đã mua vào bảng ChiTietDonHang
- Hoàn thiện luồng xử lý:
  - Người dùng chọn sản phẩm → thêm vào giỏ → thanh toán → lưu đơn hàng
Kết quả đạt được
- Hoàn thành đầy đủ các chức năng chính của website:
  - Đăng nhập / đăng ký
  - Quản lý sản phẩm
  - Giỏ hàng
  - Thanh toán
  - Quản lý đơn hàng
- Hệ thống hoạt động ổn định, dữ liệu được lưu trữ và xử lý đúng.
 Ghi chú
- Dự án đã hoàn thiện, sẵn sàng viết báo cáo file .doc và chuẩn bị demo.
