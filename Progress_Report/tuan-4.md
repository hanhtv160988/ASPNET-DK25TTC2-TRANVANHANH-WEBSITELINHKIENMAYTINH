# BÁO CÁO TIẾN ĐỘ ĐỒ ÁN - TUẦN 4

- **Khoảng thời gian:** 13/07/2026 - 19/07/2026
- **Trọng tâm công việc:** Hiện thực hóa code chức năng quản trị (Phía Admin) và bổ sung tính năng cải tiến

## 1. Nội dung công việc
- Tích hợp thành công cấu trúc giao diện trang quản trị dành riêng cho vai trò quản lý hệ thống của Admin.
- Lập trình phát triển các chức năng quản lý nghiệp vụ mở rộng CRUD (Thêm, Xóa, Sửa, Xem thông tin) chi tiết:
  + Phân hệ quản lý thông tin khách hàng, lưu trữ tài khoản cá nhân của người mua.
  + Phân hệ quản lý hàng hóa linh kiện điện tử kết hợp chức năng theo dõi số lượng tồn kho, ngày nhập, giá cũ/giá mới và trạng thái sản phẩm.
  + Phân hệ quản lý đơn hàng hỗ trợ chủ cửa hàng theo dõi số điện thoại, địa chỉ giao hàng, phương thức thanh toán, tình trạng thanh toán và trạng thái vận đơn.
- Xây dựng xử lý chức năng đăng ký thành viên mới và đăng nhập xác thực tài khoản bảo mật hệ thống.

## 2. Tài liệu liên quan
- Phương thức mã hóa dữ liệu cơ bản phục vụ lưu trữ chuỗi bảo mật mật khẩu khách hàng trong database.
- Nghiên cứu cơ chế bắt lỗi biểu mẫu xác thực dữ liệu đầu vào dữ liệu đầu vào (Data Validation) trong Model Class của ASP.NET.

## 3. Khó khăn khi viết thêm chức năng
- Gặp trở ngại lớn khi nghiên cứu tích hợp các chức năng nâng cao theo đề xuất cải tiến: Thiết lập hệ thống thông báo nổi thời gian thực tại trang quản trị Admin khi có đơn hàng mới từ khách để xử lý nhanh đơn hàng.
- Việc xây dựng thuật toán logic gợi ý thông minh tự động so khớp thông tin lịch sử mua hàng cũ dựa trên số điện thoại để tự động điền nhanh hồ sơ khách hàng tại biểu mẫu tạo đơn hàng nội bộ tốn rất nhiều thời gian phân tích, thử nghiệm bất đồng bộ thời gian thực (Realtime).

## 4. Kết quả đạt được
- Hoàn tất lập trình hệ thống toàn bộ các phân hệ chức năng CRUD phía quản trị Admin, bảo đảm đồng bộ cơ sở dữ liệu khi thực hiện cập nhật hoặc xóa bỏ thông tin.
- Tri triển khai thành công cơ chế chuyển đổi định danh tên hiển thị trên thanh Menu từ trạng thái tài khoản người dùng sang tên khách hàng cụ thể khi đăng nhập thành công.
