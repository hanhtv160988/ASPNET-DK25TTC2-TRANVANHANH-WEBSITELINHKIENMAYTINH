-- ================================================================
-- Drop & Create Database StoreComputer
-- Chay trong SSMS: ket noi .\SQLEXPRESS → New Query → F5
-- ================================================================

USE master;
GO

-- Drop database neu da ton tai
IF EXISTS (SELECT name FROM sys.databases WHERE name = N'StoreComputer')
BEGIN
    ALTER DATABASE StoreComputer SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE StoreComputer;
END
GO

-- Tao moi database
CREATE DATABASE StoreComputer;
GO

USE StoreComputer;
GO

-- ================================================================
-- TAO BANG
-- ================================================================

CREATE TABLE [dbo].[LoaiHang](
    [maLoai] [int] NOT NULL,
    [tenLoai] [nvarchar](30) NOT NULL,
    CONSTRAINT [PK_LoaiHang] PRIMARY KEY CLUSTERED ([maLoai] ASC)
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[NhaCungCap](
    [maNCC] [int] NOT NULL,
    [tenNCC] [nvarchar](30) NOT NULL,
    [diaChi] [nvarchar](20) NOT NULL,
    [soDienThoai] [nvarchar](13) NOT NULL,
    CONSTRAINT [PK_NhaCungCap] PRIMARY KEY CLUSTERED ([maNCC] ASC)
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[TaiKhoan](
    [TaiKhoan] [nvarchar](50) NOT NULL,
    [MatKhau] [nvarchar](20) NOT NULL,
    [hoTen] [nvarchar](20) NOT NULL,
    CONSTRAINT [PK_TaiKhoan] PRIMARY KEY CLUSTERED ([TaiKhoan] ASC)
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[KhachHang](
    [maKH] [int] IDENTITY(1,1) NOT NULL,
    [tenKH] [nvarchar](30) NOT NULL,
    [diaChi] [nvarchar](500) NOT NULL,
    [soDienThoai] [nvarchar](13) NOT NULL,
    [taiKhoan] [nvarchar](30) NOT NULL,
    [matKhau] [nvarchar](1000) NOT NULL,
    [Email] [nvarchar](30) NOT NULL,
    CONSTRAINT [PK_KhachHang] PRIMARY KEY CLUSTERED ([maKH] ASC)
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[HangHoa](
    [maHang] [int] IDENTITY(1,1) NOT NULL,
    [maLoai] [int] NOT NULL,
    [maNCC] [int] NOT NULL,
    [tenHang] [nvarchar](30) NOT NULL,
    [ngayNhap] [date] NOT NULL,
    [giaMoi] [float] NOT NULL,
    [giaCu] [float] NOT NULL,
    [soLuong] [int] NOT NULL,
    [hinhAnh] [nvarchar](1000) NULL,
    [moTa] [nvarchar](2000) NOT NULL,
    [maTaChiTiet] [nvarchar](4000) NOT NULL,
    [giamGia] [nvarchar](10) NULL,
    [trangThaiSP] [nvarchar](10) NOT NULL,
    CONSTRAINT [PK_HangHoa] PRIMARY KEY CLUSTERED ([maHang] ASC),
    CONSTRAINT [FK_HangHoa_LoaiHang] FOREIGN KEY([maLoai]) REFERENCES [dbo].[LoaiHang]([maLoai]),
    CONSTRAINT [FK_HangHoa_NhaCungCap] FOREIGN KEY([maNCC]) REFERENCES [dbo].[NhaCungCap]([maNCC])
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[DatHang](
    [maHD] [int] IDENTITY(1,1) NOT NULL,
    [tenKhachHang] [nvarchar](30) NULL,
    [sdtKhachHang] [nvarchar](13) NULL,
    [diaChi] [nvarchar](50) NULL,
    [ghiChu] [nvarchar](1000) NULL,
    [soLuong] [int] NULL,
    [tongTien] [float] NULL,
    [ptThanhToan] [nvarchar](50) NULL,
    [tinhtrangThanhToan] [nvarchar](50) NULL,
    [tinhtrangDonHang] [nvarchar](50) NULL,
    CONSTRAINT [PK_HoaDon] PRIMARY KEY CLUSTERED ([maHD] ASC)
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[ChiTietDatHang](
    [maHD] [int] NOT NULL,
    [maHang] [int] NOT NULL,
    [soLuong] [int] NOT NULL,
    [thanhTien] [float] NOT NULL,
    CONSTRAINT [PK_ChiTietHoaDon] PRIMARY KEY CLUSTERED ([maHD] ASC, [maHang] ASC),
    CONSTRAINT [FK_ChiTietDatHang_DatHang] FOREIGN KEY([maHD]) REFERENCES [dbo].[DatHang]([maHD]),
    CONSTRAINT [FK_ChiTietDatHang_HangHoa] FOREIGN KEY([maHang]) REFERENCES [dbo].[HangHoa]([maHang])
) ON [PRIMARY]
GO

-- ================================================================
-- INSERT DU LIEU
-- ================================================================

INSERT [dbo].[LoaiHang] ([maLoai], [tenLoai]) VALUES (1, N'Laptop')
INSERT [dbo].[LoaiHang] ([maLoai], [tenLoai]) VALUES (2, N'Ban Phim va Chuot')
INSERT [dbo].[LoaiHang] ([maLoai], [tenLoai]) VALUES (3, N'Man Hinh')
INSERT [dbo].[LoaiHang] ([maLoai], [tenLoai]) VALUES (4, N'RAM')
INSERT [dbo].[LoaiHang] ([maLoai], [tenLoai]) VALUES (5, N'CPU')
INSERT [dbo].[LoaiHang] ([maLoai], [tenLoai]) VALUES (6, N'VGA')
INSERT [dbo].[LoaiHang] ([maLoai], [tenLoai]) VALUES (7, N'PSU')
INSERT [dbo].[LoaiHang] ([maLoai], [tenLoai]) VALUES (8, N'Mainboard')
INSERT [dbo].[LoaiHang] ([maLoai], [tenLoai]) VALUES (9, N'O cung')
INSERT [dbo].[LoaiHang] ([maLoai], [tenLoai]) VALUES (10, N'Case')
INSERT [dbo].[LoaiHang] ([maLoai], [tenLoai]) VALUES (11, N'Tan nhiet')
GO

INSERT [dbo].[NhaCungCap] ([maNCC], [tenNCC], [diaChi], [soDienThoai]) VALUES (8, N'ASUS', N'130 Dien Bien Phu', N'0938123456')
INSERT [dbo].[NhaCungCap] ([maNCC], [tenNCC], [diaChi], [soDienThoai]) VALUES (9, N'Acer', N'150 Dong Nai', N'0908457764')
INSERT [dbo].[NhaCungCap] ([maNCC], [tenNCC], [diaChi], [soDienThoai]) VALUES (10, N'Gigabyte', N'123 Da Nang', N'0989765894')
INSERT [dbo].[NhaCungCap] ([maNCC], [tenNCC], [diaChi], [soDienThoai]) VALUES (11, N'MSI', N'150 Ha Noi', N'0123456789')
INSERT [dbo].[NhaCungCap] ([maNCC], [tenNCC], [diaChi], [soDienThoai]) VALUES (12, N'Intel', N'123 Ton That Hiep', N'09383845123')
INSERT [dbo].[NhaCungCap] ([maNCC], [tenNCC], [diaChi], [soDienThoai]) VALUES (13, N'Kingston', N'123 Phan Dang Luu', N'093123123')
GO

INSERT [dbo].[TaiKhoan] ([TaiKhoan], [MatKhau], [hoTen]) VALUES (N'admin', N'admin', N'Quan Tri Vien')
GO

INSERT [dbo].[KhachHang] ([tenKH], [diaChi], [soDienThoai], [taiKhoan], [matKhau], [Email])
VALUES (N'Do Xuan Hoang', N'250 Hoa Lu Quan Phu Nhuan', N'0938388445', N'hoang123', N'202cb962ac59075b964b07152d234b70', N'hoang@gmail.com')
GO

SET IDENTITY_INSERT [dbo].[HangHoa] ON
INSERT [dbo].[HangHoa] ([maHang], [maLoai], [maNCC], [tenHang], [ngayNhap], [giaMoi], [giaCu], [soLuong], [hinhAnh], [moTa], [maTaChiTiet], [giamGia], [trangThaiSP])
VALUES (6, 1, 8, N'ASUS ROG Strix G15', CAST(N'2023-04-02' AS Date), 22990000, 26990000, 10, N'Data/gearvn-laptop-gaming-asus-rog-strix-g15-g513ie-hn246w-1_21909f6cb1144db7a4b8ce164efcd13f.jpg', N'AMD Ryzen 7 4800H 2.9GHz up to 4.2GHz 8MB, 1x USB 3.2 Gen 2 Type-C support DisplayPort, 3x USB 3.2 Gen 1 Type-A, 1x HDMI 2.0b, GeForce RTX 3050Ti 4GB GDDR6', N'Danh gia chi tiet laptop gaming ASUS ROG Strix G15 G513IE-HN246W. Cau hinh manh me voi AMD Ryzen 7 4800H, 8GB RAM DDR4, SSD 512GB, card NVIDIA RTX 3050Ti.', N'-10%', N'Con hang')
INSERT [dbo].[HangHoa] ([maHang], [maLoai], [maNCC], [tenHang], [ngayNhap], [giaMoi], [giaCu], [soLuong], [hinhAnh], [moTa], [maTaChiTiet], [giamGia], [trangThaiSP])
VALUES (7, 1, 8, N'ASUS TUF A15', CAST(N'2023-04-03' AS Date), 18990000, 21990000, 10, N'Data/gearvn-laptop-gaming-asus-tuf-a15-fa506icb-hn355w-1_96a61949a11345ac906fce99162c2b81.jpg', N'AMD Ryzen 5 4600H 3.0GHz up to 4.0GHz, 8GB DDR4, 512GB SSD M.2, RTX 3050 4GB GDDR6, 15.6inch FHD IPS 144Hz', N'Danh gia chi tiet laptop gaming ASUS TUF A15 FA506ICB HN355W. Ket hop CPU AMD Ryzen 5 va card NVIDIA RTX 3050 mang den hieu nang vuot troi.', N'-10%', N'Con hang')
INSERT [dbo].[HangHoa] ([maHang], [maLoai], [maNCC], [tenHang], [ngayNhap], [giaMoi], [giaCu], [soLuong], [hinhAnh], [moTa], [maTaChiTiet], [giamGia], [trangThaiSP])
VALUES (8, 1, 10, N'Gigabyte G5 GE 51VN263SH', CAST(N'2023-04-03' AS Date), 21690000, 25590000, 5, N'Data/g5-ge-51vn263sh-fix_3da6856774d849cf8c80548b6ef3f0cd_c55c38c0994f498b8ded543fd86fbeb4.jpg', N'Intel Core i5-12500H 12 Cores 16 Threads, 8GB DDR4-3200MHz, 512GB SSD M.2 PCIE G4X4, RTX 3050 4GB GDDR6, 15.6 inch FHD 144Hz IPS-level', N'Danh gia chi tiet laptop gaming Gigabyte G5 GE 51VN263SH. Thiet ke manh me voi CPU Intel Core i5-12500H, mang den trai nghiem game AAA.', N'-20%', N'Con hang')
INSERT [dbo].[HangHoa] ([maHang], [maLoai], [maNCC], [tenHang], [ngayNhap], [giaMoi], [giaCu], [soLuong], [hinhAnh], [moTa], [maTaChiTiet], [giamGia], [trangThaiSP])
VALUES (9, 1, 9, N'Acer Aspire 7 A715', CAST(N'2023-04-03' AS Date), 16490000, 20990000, 10, N'Data/laptop_gaming_acer_aspire_7_a715_42g_r05g_f9b4034f328d4211b9ffe51f7b1c4cbf.jpg', N'AMD Ryzen 5 5500U 6 nhan 12 luong, 8GB DDR4, 512GB PCIe NVMe SSD, GTX 1650 4GB GDDR6, 15.6 FHD IPS Anti-Glare 144Hz', N'Danh gia chi tiet laptop gaming Acer Aspire 7 A715. Laptop gaming tot nhat phan khuc voi card NVIDIA GTX 1650, phu hop cho game va lam viec.', N'-30%', N'Con hang')
INSERT [dbo].[HangHoa] ([maHang], [maLoai], [maNCC], [tenHang], [ngayNhap], [giaMoi], [giaCu], [soLuong], [hinhAnh], [moTa], [maTaChiTiet], [giamGia], [trangThaiSP])
VALUES (10, 1, 11, N'MSI Katana GF66', CAST(N'2023-04-03' AS Date), 25990000, 32990000, 10, N'Data/836vn_d9b5e5cf468d40cdbac9281b068957c9.jpg', N'Intel Core i7-11800H 2.3GHz up to 4.6GHz, 16GB DDR4 3200MHz, 512GB NVMe PCIe SSD, RTX 3060 6GB GDDR6, 15.6 inch FHD 144Hz IPS-Level', N'Danh gia chi tiet laptop gaming MSI Katana GF66 11UE 836VN. Phu hop cho game thu va cac tinh dong moi.', N'-40%', N'Con hang')
INSERT [dbo].[HangHoa] ([maHang], [maLoai], [maNCC], [tenHang], [ngayNhap], [giaMoi], [giaCu], [soLuong], [hinhAnh], [moTa], [maTaChiTiet], [giamGia], [trangThaiSP])
VALUES (11, 5, 12, N'CPU Intel Core i5-12400', CAST(N'2023-04-03' AS Date), 4890000, 6439000, 15, N'Data/unnamed.jpg', N'Socket 1700, Intel Core thu he 12, 6 nhan 12 luong, 2.5GHz - 4.4GHz, 18MB cache, Intel UHD Graphics 730', N'Mo ta san pham CPU Intel Core i5 12400 the he 12 voi socket LGA 1700, phu hop cho PC trung cao cap.', N'-24%', N'Con hang')
INSERT [dbo].[HangHoa] ([maHang], [maLoai], [maNCC], [tenHang], [ngayNhap], [giaMoi], [giaCu], [soLuong], [hinhAnh], [moTa], [maTaChiTiet], [giamGia], [trangThaiSP])
VALUES (12, 5, 12, N'CPU Intel Core i5-11400', CAST(N'2023-04-03' AS Date), 4199000, 5629000, 10, N'Data/unnamed1.jpg', N'Socket 1200, Intel Core thu he 11, 6 nhan 12 luong, 2.6GHz - 4.4GHz, 12MB cache, Intel UHD Graphics 730', N'Mo ta san pham CPU Intel Core i5-11400 the he 11, mang den hieu nang tot cho PC gaming va lam viec.', N'-20%', N'Con hang')
INSERT [dbo].[HangHoa] ([maHang], [maLoai], [maNCC], [tenHang], [ngayNhap], [giaMoi], [giaCu], [soLuong], [hinhAnh], [moTa], [maTaChiTiet], [giamGia], [trangThaiSP])
VALUES (13, 9, 13, N'SSD Kingston A400 240GB', CAST(N'2023-04-03' AS Date), 519000, 889000, 15, N'Data/unnamed3.jpg', N'240GB, 2.5 inch, SATA 3, Toc do doc/ghi: 500MB/s / 350MB/s', N'Tong quan san pham o cung SSD Kingston A400 240GB, thuong hieu Kingston chat luong cao.', N'-10%', N'Con hang')
INSERT [dbo].[HangHoa] ([maHang], [maLoai], [maNCC], [tenHang], [ngayNhap], [giaMoi], [giaCu], [soLuong], [hinhAnh], [moTa], [maTaChiTiet], [giamGia], [trangThaiSP])
VALUES (14, 6, 8, N'Card do hoa ASUS TUF GTX1660S', CAST(N'2023-04-03' AS Date), 5190000, 6499000, 10, N'Data/unnamed4.jpg', N'GTX 1660 Super, 6GB GDDR6, 1845 MHz Boost Clock, 1x 8-pin', N'Mo ta san pham card do hoa ASUS TUF Gaming GTX 1660 Super, tan nhiet tot, phu hop cho game 1080p.', N'-5%', N'Con hang')
INSERT [dbo].[HangHoa] ([maHang], [maLoai], [maNCC], [tenHang], [ngayNhap], [giaMoi], [giaCu], [soLuong], [hinhAnh], [moTa], [maTaChiTiet], [giamGia], [trangThaiSP])
VALUES (15, 7, 10, N'Nguon GIGABYTE P850GM 850W', CAST(N'2023-03-31' AS Date), 2459000, 2650000, 5, N'Data/unnamed5.jpg', N'850W, 80 Plus Gold, Modular, 1x 120mm fan', N'Mo ta san pham nguon Gigabyte GP-P850GM 850W 80 Plus Gold Modular, phu hop cho PC gaming trung cap.', N'-8%', N'Con hang')
INSERT [dbo].[HangHoa] ([maHang], [maLoai], [maNCC], [tenHang], [ngayNhap], [giaMoi], [giaCu], [soLuong], [hinhAnh], [moTa], [maTaChiTiet], [giamGia], [trangThaiSP])
VALUES (16, 8, 8, N'ASUS TUF B660M-PLUS D4', CAST(N'2023-04-07' AS Date), 3690000, 4890000, 10, N'Data/unnamed6.jpg', N'Micro-ATX, Socket 1700, Chipset B660, 4 khe DDR4, 2x M.2 NVMe, HDMI, DisplayPort', N'Mo ta san pham mainboard Asus TUF Gaming B660M-PLUS D4, tuong thich CPU Intel 12, co RGB.', N'-10%', N'Con hang')
INSERT [dbo].[HangHoa] ([maHang], [maLoai], [maNCC], [tenHang], [ngayNhap], [giaMoi], [giaCu], [soLuong], [hinhAnh], [moTa], [maTaChiTiet], [giamGia], [trangThaiSP])
VALUES (17, 11, 8, N'Tan nhiet AIO ASUS ROG 240', CAST(N'2023-04-05' AS Date), 5559000, 5990000, 5, N'Data/unnamed7.jpg', N'240mm, OLED 1.77 inch, AURA Sync RGB, 2x Noctua NF-F12 2000 RPM', N'Mo ta san pham tan nhiet nuoc AIO ASUS ROG RYUJIN 240, co man hinh OLED, tan nhiet cho CPU.', N'-8%', N'Con hang')
INSERT [dbo].[HangHoa] ([maHang], [maLoai], [maNCC], [tenHang], [ngayNhap], [giaMoi], [giaCu], [soLuong], [hinhAnh], [moTa], [maTaChiTiet], [giamGia], [trangThaiSP])
VALUES (18, 4, 10, N'RAM GIGABYTE Aorus 32GB DDR5', CAST(N'2023-04-03' AS Date), 7450000, 7999000, 10, N'Data/unnamed8.jpg', N'32GB (2x16GB), DDR5, Bus 5200MHz, Cas 40, XMP 3.0', N'Mo ta san pham RAM Gigabyte Aorus 32GB DDR5 5200MHz, phu hop cho PC hieu nang cao.', N'-8%', N'Con hang')
INSERT [dbo].[HangHoa] ([maHang], [maLoai], [maNCC], [tenHang], [ngayNhap], [giaMoi], [giaCu], [soLuong], [hinhAnh], [moTa], [maTaChiTiet], [giamGia], [trangThaiSP])
VALUES (19, 3, 8, N'Man hinh ASUS VP249QGR 24inch', CAST(N'2023-04-03' AS Date), 3690000, 4090000, 10, N'Data/unnamed10.jpg', N'24 inch FHD IPS, 144Hz, 1ms, FreeSync, 250 cd/m2', N'Mo ta san pham man hinh Asus 24 inch VP249QGR, tan nhiet, 144Hz cho game va lam viec.', N'-10%', N'Con hang')
SET IDENTITY_INSERT [dbo].[HangHoa] OFF
GO

SET IDENTITY_INSERT [dbo].[DatHang] ON
INSERT [dbo].[DatHang] ([maHD], [tenKhachHang], [sdtKhachHang], [diaChi], [ghiChu], [soLuong], [tongTien], [ptThanhToan], [tinhtrangThanhToan], [tinhtrangDonHang])
VALUES (5, N'Do Xuan Hoang', N'0938312381', N'125 Hoa Lu', N'Khong co gi', NULL, 68970000, N'COD', N'Da thanh toan', N'Da giao hang')
INSERT [dbo].[DatHang] ([maHD], [tenKhachHang], [sdtKhachHang], [diaChi], [ghiChu], [soLuong], [tongTien], [ptThanhToan], [tinhtrangThanhToan], [tinhtrangDonHang])
VALUES (6, N'123', N'123', N'123', N'123', NULL, 12597000, N'COD', N'Da thanh toan', N'Chua giao hang')
SET IDENTITY_INSERT [dbo].[DatHang] OFF
GO

INSERT [dbo].[ChiTietDatHang] ([maHD], [maHang], [soLuong], [thanhTien]) VALUES (5, 6, 3, 22990000)
INSERT [dbo].[ChiTietDatHang] ([maHD], [maHang], [soLuong], [thanhTien]) VALUES (6, 12, 3, 4199000)
GO

PRINT N'Database StoreComputer initialized successfully!'
GO