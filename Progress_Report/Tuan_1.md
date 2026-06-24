# BAO CAO TIEN DO TUAN 1
## Do An Tot Nghiep - He Thong Ban Laptop & Linh Kien May Tinh

**Hoc vien:** Tran Van Hanh
**MSSV:** 170125153
**Lop:** DK25TTC2
**Giang vien huong dan:** [Ten GVHD]
**Thoi gian:** 22/06/2026 - 28/06/2026

---

## 1. Muc tieu tuan nay
- [ ] Tai ma nguon project ve may
- [ ] Cai dat moi truong: Visual Studio 2022, SQL Server
- [ ] Khoi tao va kiem tra database StoreComputer

## 2. Cong viec da hoan thanh
| STT | Noi dung | Trang thai |
|-----|---------|------------|
| 1 | Tai ma nguon project ve may | Hoan thanh |
| 2 | Kiem tra cau truc thu muc project | Hoan thanh |
| 3 | Cau hinh SQL Server (SQLEXPRESS01 - port 21136) | Hoan thanh |
| 4 | Kiem tra file Web.config va connection string | Hoan thanh |
| 5 | Khoi tao database StoreComputer | Hoan thanh |
| 6 | Chay script tao bang (7 bang: LoaiHang, NhaCungCap, HangHoa, TaiKhoan, KhachHang, DatHang, ChiTietDatHang) | Hoan thanh |

## 3. Muc tieu dat duoc
- Da tai va cai dat ma nguon project ve may.
- Da kiem tra cau truc project: ASP.NET MVC 5, Entity Framework 6 (Database First), chay tren .NET Framework 4.7.2.
- Da xac dinh duong dan project: D:\tvu-Project\projectlkdt\StoreComputer
- Da co database StoreComputer voi day du 7 bang, FK, va du lieu mau.
- Da xac nhan chuoi ket noi (connection string) tro dung SQL Server.

## 4. Kho khan gap phai
- Loi "There is already an object named 'ChiTietDatHang' in the database" khi chay script nhieu lan
  - Nguyen nhan: script SQL chua co lenh DROP TABLE truoc CREATE TABLE
  - Xu ly: Viet lai script, them DROP DATABASE o dau de dam bao luc nao cung tao moi hoan toan
- Loi "Invalid object name 'dbo.HangHoa'" khi chay loi
  - Nguyen nhan: script bi loi o mot so dong, chua tao duoc bang
  - Xu ly: kiem tra lai thu tu tao bang (bang cha truoc, bang con sau), viet lai script hoan chinh
- Loi "Cannot drop database because it is currently in use"
  - Nguyen nhan: SQL Server con ket noi cu tu ung dung
  - Xu ly: Them ALTER DATABASE SET SINGLE_USER WITH ROLLBACK IMMEDIATE truoc khi DROP DATABASE

## 5. Ke hoach tuan sau
- [ ] Tim hieu cau truc project ASP.NET MVC 5
- [ ] Kiem tra cac Controller da co san
- [ ] Chay thu ung dung lan dau tren Visual Studio 2022
- [ ] Kiem tra trang Admin

## 6. Ghi chu them
De nghi GVHD xem lai cau truc database, dac biet phan Foreign Key giua cac bang.
