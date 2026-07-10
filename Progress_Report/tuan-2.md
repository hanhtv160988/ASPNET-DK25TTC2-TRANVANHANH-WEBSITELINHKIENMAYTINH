# BÁO CÁO TIẾN ĐỘ ĐỒ ÁN - TUẦN 2

- **Khoảng thời gian:** 29/06/2026 - 05/07/2026
- **Trọng tâm công việc:** Phân tích thiết kế hệ thống và Cơ sở dữ liệu

## 1. Nội dung công việc
- Khảo sát thực trạng nhu cầu mua sắm thiết bị điện tử, xác định các chức năng chính cho Website bán linh kiện máy tính G-Computer phục vụ song song hai vai trò Khách hàng và Admin.
- Đặc tả yêu cầu chức năng bao gồm xem mặt hàng, quản lý giỏ hàng, đặt hàng thanh toán, đăng ký/đăng nhập thành viên, quản lý hệ thống dữ liệu (khách hàng, hàng hóa, đơn hàng, nhà cung cấp, loại hàng).
- Thiết kế sơ đồ Use Case tổng quát mức 0 để biểu diễn sự tương tác của tác nhân đối với hệ thống.
- Cấu trúc kiến trúc dữ liệu và thiết lập quan hệ ràng buộc khóa trực quan trên hệ quản trị SQL Server.

## 2. Tài liệu liên quan
- Tài liệu hướng dẫn sử dụng phần mềm quản lý Microsoft SQL Server Management Studio (SSMS) phục vụ công tác cấu hình và quản trị cơ sở dữ liệu.
- Đặc tả thuộc tính hệ thống từ điển cơ sở dữ liệu bao gồm các cấu trúc bảng cốt lõi: Tài Khoản (`TaiKhoan`), Nhà Cung Cấp (`NhacungCap`), Loại Hàng (`LoaiHang`), Hàng Hóa (`HangHoa`), Khách Hàng (`KhachHang`), Đặt Hàng (`DatHang`), Chi Tiết Đặt Hàng (`ChiTietDatHang`).

## 3. Khó khăn gặp phải
- Việc phân định các kiểu dữ liệu, giới hạn ký tự và xây dựng ràng buộc toàn vẹn khóa chính, khóa ngoại (FK) đồng bộ giữa bảng nghiệp vụ `HangHoa` với `LoaiHang`, `NhaCungCap` gặp nhiều sai sót về kiểu dữ liệu khi ánh xạ vào thực thể C#.
- Cân đối luồng lưu trữ thông tin tài khoản dùng chung giữa bảng quản trị tổng hợp nội bộ và dữ liệu đăng ký tự động bên ngoài của khách hàng nhằm đảm bảo tính toàn vẹn thông tin bí mật.

## 4. Kết quả đạt được
- Hoàn thành tài liệu phân tích hệ thống dữ liệu gồm cấu trúc chi tiết của các bảng thực thể nghiệp vụ nghiệp vụ thương mại điện tử.
- Xuất bản thành công sơ đồ liên kết thực thể (ERD) hoàn chỉnh thể hiện mối quan hệ tương tác logic giữa các bảng trong hệ quản trị database.
