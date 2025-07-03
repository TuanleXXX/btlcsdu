CREATE DATABASE QL_ThamMyVien;
GO

USE QL_ThamMyVien;
GO

CREATE TABLE DONVI (
    MaDV INT PRIMARY KEY,
    TenDV NVARCHAR(100)
);

CREATE TABLE NHANVIEN (
    MaNV INT PRIMARY KEY,
    HoTen NVARCHAR(100),
    NgaySinh DATE,
    GioiTinh NVARCHAR(10),
    DiaChi NVARCHAR(200),
    MaDV INT NULL,
    FOREIGN KEY (MaDV) REFERENCES DONVI(MaDV)
);

CREATE TABLE QL_DONVI (
    MaNV INT PRIMARY KEY,
    MaDV INT,
    FOREIGN KEY (MaNV) REFERENCES NHANVIEN(MaNV),
    FOREIGN KEY (MaDV) REFERENCES DONVI(MaDV)
);

CREATE TABLE DICHVU (
    MaDVU INT PRIMARY KEY,
    TenDVU NVARCHAR(100),
    NgayBD DATE,
    NgayKT DATE
);

CREATE TABLE DIEUTRI (
    MaNV INT,
    MaDVU INT,
    PRIMARY KEY (MaNV, MaDVU),
    FOREIGN KEY (MaNV) REFERENCES NHANVIEN(MaNV),
    FOREIGN KEY (MaDVU) REFERENCES DICHVU(MaDVU)
);

CREATE TABLE LICHHEN (
    MaLH INT PRIMARY KEY,
    TenLH NVARCHAR(100)
);

CREATE TABLE LICHLAMVIEC (
    MaDV INT,
    MaLH INT,
    ThoiGian DATE,
    PRIMARY KEY (MaDV, MaLH, ThoiGian),
    FOREIGN KEY (MaDV) REFERENCES DONVI(MaDV),
    FOREIGN KEY (MaLH) REFERENCES LICHHEN(MaLH)
);
--Insert dữ liệu
INSERT INTO DONVI VALUES
(1, N'Phòng CNTT'), (2, N'Phòng Nhân sự'), (3, N'Phòng Kế toán'),
(4, N'Phòng Marketing'), (5, N'Phòng Kỹ thuật'), (6, N'Phòng Thiết kế'),
(7, N'Phòng Bán hàng'), (8, N'Phòng QA'), (9, N'Phòng Nghiên cứu'),
(10, N'Phòng Pháp lý'), (11, N'Phòng Sản xuất'), (12, N'Phòng Hành chính'),
(13, N'Phòng Logistics'), (14, N'Phòng Đối ngoại'), (15, N'Phòng Dự án'),
(16, N'Phòng Chăm sóc KH'), (17, N'Phòng Kiểm thử'), (18, N'Phòng Mạng'),
(19, N'Phòng An ninh mạng'), (20, N'Phòng Đào tạo');

INSERT INTO NHANVIEN VALUES
(101, N'Nguyễn Văn A', '1990-01-01', N'Nam', N'Hà Nội', 1),
(102, N'Trần Thị B', '1992-03-15', N'Nữ', N'Hải Phòng', 2),
(103, N'Lê Văn C', '1988-05-20', N'Nam', N'TP.HCM', 1),
(104, N'Phạm Thị D', '1995-08-12', N'Nữ', N'Cần Thơ', NULL),
(105, N'Hoàng Văn E', '1991-06-22', N'Nam', N'Đà Nẵng', 3),
(106, N'Ngô Thị F', '1993-02-10', N'Nữ', N'Nghệ An', 4),
(107, N'Bùi Văn G', '1990-09-18', N'Nam', N'Thanh Hóa', 5),
(108, N'Đỗ Thị H', '1994-12-01', N'Nữ', N'Hà Nội', 6),
(109, N'Phan Văn I', '1996-07-30', N'Nam', N'HCM', 7),
(110, N'Nguyễn Thị J', '1991-11-25', N'Nữ', N'Bình Dương', 8),
(111, N'Trần Văn K', '1989-10-14', N'Nam', N'TP.HCM', 9),
(112, N'Lê Thị L', '1995-03-09', N'Nữ', N'Cần Thơ', 10),
(113, N'Phạm Văn M', '1987-08-05', N'Nam', N'Hà Nội', 11),
(114, N'Nguyễn Thị N', '1992-04-28', N'Nữ', N'Huế', 12),
(115, N'Hồ Văn O', '1985-05-17', N'Nam', N'Nghệ An', 13),
(116, N'Cao Thị P', '1993-10-30', N'Nữ', N'Bắc Ninh', 14),
(117, N'Mai Văn Q', '1990-07-08', N'Nam', N'TP.HCM', 15),
(118, N'Tạ Thị R', '1994-11-02', N'Nữ', N'Bình Định', 16),
(119, N'Võ Văn S', '1988-01-27', N'Nam', N'Tây Ninh', 17),
(120, N'Đinh Thị T', '1996-06-18', N'Nữ', N'Lào Cai', 18);

INSERT INTO QL_DONVI VALUES
(101, 1), (102, 2), (105, 3), (106, 4), (107, 5),
(108, 6), (109, 7), (110, 8), (111, 9), (112, 10),
(113, 11), (114, 12), (115, 13), (116, 14), (117, 15),
(118, 16), (119, 17), (120, 18), (103, 19), (104, 20);

INSERT INTO DICHVU VALUES
(201, N'Dự án A', '2024-01-01', '2024-06-30'),
(202, N'Dự án B', '2024-07-01', '2024-12-31'),
(203, N'Dự án C', '2025-01-01', '2025-06-30'),
(204, N'Dự án D', '2023-05-01', '2023-11-30'),
(205, N'Dự án E', '2022-03-15', '2022-09-15'),
(206, N'Dự án F', '2024-02-10', '2024-08-10'),
(207, N'Dự án G', '2024-09-01', '2025-03-01'),
(208, N'Dự án H', '2023-01-01', '2023-06-01'),
(209, N'Dự án I', '2025-04-01', '2025-10-01'),
(210, N'Dự án J', '2023-07-01', '2024-01-01'),
(211, N'Dự án K', '2024-03-01', '2024-07-01'),
(212, N'Dự án L', '2023-09-01', '2024-02-01'),
(213, N'Dự án M', '2022-11-01', '2023-04-01'),
(214, N'Dự án N', '2024-05-01', '2024-11-01'),
(215, N'Dự án O', '2023-08-01', '2024-02-01'),
(216, N'Dự án P', '2024-06-15', '2025-01-15'),
(217, N'Dự án Q', '2025-01-01', '2025-06-01'),
(218, N'Dự án R', '2023-10-01', '2024-03-01'),
(219, N'Dự án S', '2023-12-01', '2024-06-01'),
(220, N'Dự án T', '2024-09-15', '2025-04-15'),
(222, N'Dự án trống', '2025-06-23', '2025-06-24'); 

INSERT INTO DIEUTRI VALUES
(101, 201), (101, 202), (102, 201), (103, 202),
(104, 203), (105, 204), (106, 205), (107, 206), (108, 207), (109, 208),
(110, 209), (111, 210), (112, 211), (113, 212), (114, 213),
(115, 214), (116, 215), (117, 216), (118, 217), (119, 218),
(120, 219), (101, 220), (102, 203), (103, 204), (104, 205),
(105, 206), (106, 207), (107, 208), (108, 209), (109, 210);

INSERT INTO LICHHEN VALUES
(301, N'Triển khai phần mềm'), (302, N'Bảo trì hệ thống'),
(303, N'Phân tích yêu cầu'), (304, N'Thiết kế UI/UX'),
(305, N'Kiểm thử chức năng'), (306, N'Triển khai DevOps'),
(307, N'Quản lý máy chủ'), (308, N'Nâng cấp hệ thống'),
(309, N'Đào tạo người dùng'), (310, N'Tư vấn giải pháp'),
(311, N'Phát triển Backend'), (312, N'Phát triển Frontend'),
(313, N'Tối ưu hiệu suất'), (314, N'Triển khai AI'),
(315, N'Ứng cứu sự cố'), (316, N'Backup dữ liệu'),
(317, N'Giám sát hệ thống'), (318, N'Thiết lập mạng nội bộ'),
(319, N'Bảo mật dữ liệu'), (320, N'Tổ chức hội thảo'),
(322, N'Hoạt động chưa phân công');	

INSERT INTO LICHLAMVIEC VALUES
(1, 301, '2024-04-01'), (2, 302, '2024-05-10'),
(3, 303, '2024-03-05'), (4, 304, '2024-06-01'),
(5, 305, '2024-07-15'),(6, 306, '2024-08-01'),
(7, 307, '2024-09-12'), (8, 308, '2024-10-22'),
(9, 309, '2024-11-01'), (10, 310, '2024-12-05'),
(11, 311, '2024-06-18'), (12, 312, '2024-07-25'),
(13, 313, '2024-08-20'), (14, 314, '2024-09-30'),
(15, 315, '2024-10-15'), (16, 316, '2024-11-21'),
(17, 317, '2024-12-30'), (18, 318, '2025-01-10'),
(19, 319, '2025-02-01'), (20, 320, '2025-03-05'),
(1, 305, '2024-04-05'), (1, 306, '2024-04-10'),
(2, 307, '2024-05-12'), (3, 308, '2024-06-06'),
(4, 309, '2024-06-20');


--Truy vấn cơ bản
-- 1. Thêm nhân viên mới
INSERT INTO NHANVIEN VALUES (121, N'Ngô Thị U', '1997-01-01', N'Nữ', N'Hải Dương', 1);

-- 2. Thêm phòng ban mới
INSERT INTO DONVI VALUES (21, N'Phòng Khách hàng');

-- 3. Thêm dự án mới
INSERT INTO DICHVU VALUES (221, N'Dự án U', '2025-01-01', '2025-12-31');

-- 4. Thêm hoạt động mới
INSERT INTO LICHHEN VALUES (321, N'Đánh giá hiệu quả');

-- 5. Thêm phân công mới
INSERT INTO LICHLAMVIEC VALUES (21, 321, '2025-02-01');

-- 6. Thêm quan hệ quản lý mới
INSERT INTO QL_DONVI VALUES (121, 21);

-- 7. Nhân viên mới không thuộc phòng ban
INSERT INTO NHANVIEN VALUES (122, N'Phan Văn V', '1990-09-09', N'Nam', N'Thanh Hóa', NULL);

-- 8. Thêm nhân viên và gán vào dự án
INSERT INTO NHANVIEN VALUES (123, N'Trần Thị W', '1998-02-28', N'Nữ', N'Nha Trang', 2);
INSERT INTO DIEUTRI VALUES (123, 221);

-- 9. Nhân viên tham gia 2 dự án
INSERT INTO DIEUTRI VALUES (121, 201), (121, 202);

-- 10. Thêm hoạt động khác cho phòng ban 1
INSERT INTO LICHLAMVIEC VALUES (1, 302, '2025-01-01');

-- 11. Cập nhật địa chỉ nhân viên 105
UPDATE NHANVIEN SET DiaChi = N'Bắc Giang' WHERE MaNV = 105;

-- 12. Chuyển nhân viên 106 sang phòng ban 1
UPDATE NHANVIEN SET MaDV = 1 WHERE MaNV = 106;

-- 13. Đổi tên dự án 201
UPDATE DICHVU SET TenDVU = N'Dự án Alpha' WHERE MaDVU = 201;

-- 14. Đổi giới tính nhân viên 122 thành 'Nữ'
UPDATE NHANVIEN SET GioiTinh = N'Nữ' WHERE MaNV = 122;

-- 15. Cập nhật thời gian phân công của phòng 1 và hoạt động 301
UPDATE LICHLAMVIEC SET ThoiGian = '2024-04-05' WHERE MaDV = 1 AND MaLH = 301;

-- 16. Xóa tất cả các phân công liên quan trước khi xóa hoạt động
DELETE FROM LICHLAMVIEC WHERE MaLH = 321;
DELETE FROM LICHHEN WHERE MaLH = 321;

-- 17. Xóa nhân viên không thuộc phòng ban nào và không có tham gia, quản lý, phân công
DELETE FROM DIEUTRI WHERE MaNV IN (
    SELECT MaNV FROM NHANVIEN WHERE MaDV IS NULL
);
DELETE FROM QL_DONVI WHERE MaNV IN (
    SELECT MaNV FROM NHANVIEN WHERE MaDV IS NULL
);
DELETE FROM NHANVIEN WHERE MaDV IS NULL;

-- 18. Xóa phân công của phòng 2 với hoạt động 302
DELETE FROM LICHLAMVIEC WHERE MaDV = 2 AND MaLH = 302;

-- 19. Xóa tất cả tham gia của nhân viên 121
DELETE FROM DIEUTRI WHERE MaNV = 121;

-- 20. Xóa dự án có mã 220
DELETE FROM DIEUTRI WHERE MaDVU = 220;
DELETE FROM DICHVU WHERE MaDVU = 220;

-- 21. Xem danh sách tất cả phòng ban
SELECT * FROM DONVI;

-- 22. Xem thông tin tất cả nhân viên
SELECT MaNV, HoTen, DiaChi FROM NHANVIEN;

-- 23. Liệt kê nhân viên làm ở Hà Nội
SELECT * FROM NHANVIEN WHERE DiaChi = N'Hà Nội';

-- 24. Liệt kê dự án bắt đầu trong năm 2024
SELECT * FROM DICHVU WHERE YEAR(NgayBD) = 2024;

-- 25. Liệt kê các hoạt động được phân công cho phòng ban 1
SELECT * FROM LICHLAMVIEC WHERE MaDV = 1;

-- 26. Lấy tên và mã nhân viên thuộc phòng ban 2
SELECT MaNV, HoTen FROM NHANVIEN WHERE MaDV = 2;

-- 27. Lấy danh sách nhân viên sinh sau năm 1990
SELECT * FROM NHANVIEN WHERE YEAR(NgaySinh) > 1990;

-- 28. Liệt kê các mã hoạt động chưa có phân công
SELECT MaLH FROM LICHHEN WHERE MaLH NOT IN (SELECT DISTINCT MaLH FROM LICHLAMVIEC);

-- 29. Lấy tên nhân viên và tên phòng ban
SELECT NV.HoTen, PB.TenDV
FROM NHANVIEN NV JOIN DONVI PB ON NV.MaDV = PB.MaDV;

-- 30. Lấy các nhân viên có họ bắt đầu bằng 'Nguyễn'
SELECT * FROM NHANVIEN WHERE HoTen LIKE N'Nguyễn';
--Truy vấn nâng cao
-- 31. Đếm số nhân viên ở mỗi phòng ban
SELECT MaDV, COUNT(*) AS SoNhanVien
FROM NHANVIEN
GROUP BY MaDV;

-- 32. Tìm phòng ban có nhiều hơn 2 nhân viên
SELECT MaDV
FROM NHANVIEN
GROUP BY MaDV
HAVING COUNT(*) > 2;

-- 33. Tính số dự án mỗi nhân viên đã tham gia
SELECT MaNV, COUNT(MaDVU) AS SoDuAn
FROM DIEUTRI
GROUP BY MaNV;

-- 34. Tìm nhân viên tham gia nhiều hơn 1 dự án
SELECT MaNV
FROM DIEUTRI
GROUP BY MaNV
HAVING COUNT(MaDVU) > 1;

-- 35. Tìm nhân viên chưa tham gia bất kỳ dự án nào
SELECT * FROM NHANVIEN
WHERE MaNV NOT IN (SELECT MaNV FROM DIEUTRI);

-- 36. Dự án chưa có ai tham gia
SELECT * FROM DICHVU
WHERE MaDVU NOT IN (SELECT MaDVU FROM DIEUTRI);

-- 37. Tính tuổi của mỗi nhân viên
SELECT MaNV, HoTen, YEAR(GETDATE()) - YEAR(NgaySinh) AS Tuoi
FROM NHANVIEN;

-- 38. Tìm phòng ban có phân công hoạt động sau 01/05/2024
SELECT DISTINCT MaDV
FROM LICHLAMVIEC
WHERE ThoiGian > '2024-05-01';

-- 39. Tìm nhân viên làm ở Hà Nội và thuộc phòng CNTT
SELECT NV.HoTen
FROM NHANVIEN NV JOIN DONVI PB ON NV.MaDV = PB.MaDV
WHERE NV.DiaChi = N'Hà Nội' AND PB.TenDV = N'Phòng CNTT';

-- 40. Liệt kê tên nhân viên và số hoạt động của phòng ban họ thuộc
SELECT NV.HoTen, COUNT(PC.MaLH) AS SoHoatDong
FROM NHANVIEN NV
JOIN LICHLAMVIEC PC ON NV.MaDV = PC.MaDV
GROUP BY NV.HoTen;
