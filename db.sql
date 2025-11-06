
USE AddressBookDB;
GO

CREATE TABLE Contacts (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    FullName NVARCHAR(100) NOT NULL,
    Email NVARCHAR(100),
    Phone NVARCHAR(20),
    Address NVARCHAR(200),
    CreatedAt DATETIME DEFAULT GETDATE(),
    UpdatedAt DATETIME DEFAULT GETDATE()
);
USE AddressBookDB;
GO

/*INSERT INTO Contacts (FullName, Email, Phone, Address, CreatedAt, UpdatedAt)
VALUES
(N'Nguyễn Văn An', 'an.nguyen@example.com', '0912345678', N'123 Nguyễn Trãi, Hà Nội', GETDATE(), GETDATE()),
(N'Trần Thị Bình', 'binh.tran@example.com', '0987654321', N'45 Lý Thường Kiệt, Đà Nẵng', GETDATE(), GETDATE()),
(N'Lê Hoàng Nam', 'nam.le@example.com', '0905123456', N'78 Hai Bà Trưng, TP.HCM', GETDATE(), GETDATE()),
(N'Phạm Minh Hằng', 'hang.pham@example.com', '0938123456', N'12 Nguyễn Huệ, Huế', GETDATE(), GETDATE()),
(N'Đỗ Mạnh Cường', 'cuong.do@example.com', '0965123456', N'9 Trần Phú, Hải Phòng', GETDATE(), GETDATE()),
(N'Vũ Thị Thu Hà', 'ha.vu@example.com', '0946123456', N'88 Lạch Tray, Hải Phòng', GETDATE(), GETDATE()),
(N'Ngô Đức Tài', 'tai.ngo@example.com', '0912987654', N'56 Lê Duẩn, Hà Nội', GETDATE(), GETDATE()),
(N'Phan Thanh Tâm', 'tam.phan@example.com', '0973123456', N'34 Bạch Đằng, Đà Nẵng', GETDATE(), GETDATE()),
(N'Lương Quang Huy', 'huy.luong@example.com', '0903234567', N'2 Nguyễn Văn Linh, TP.HCM', GETDATE(), GETDATE()),
(N'Bùi Thu Trang', 'trang.bui@example.com', '0981234567', N'25 Nguyễn Công Trứ, Huế', GETDATE(), GETDATE());
*/
CREATE TABLE Users (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Username NVARCHAR(50) NOT NULL UNIQUE,
    Password NVARCHAR(255) NOT NULL,
    Email NVARCHAR(100),
    Role NVARCHAR(20) DEFAULT 'User',
    CreatedAt DATETIME DEFAULT GETDATE(),
    IsActive BIT DEFAULT 1
);
ALTER TABLE Contacts
ADD UserId INT FOREIGN KEY REFERENCES Users(Id);
USE AddressBookDB;
GO

INSERT INTO Users (Username, Password, Email, Role, CreatedAt, IsActive)
VALUES
('admin', 'admin123', 'admin@example.com', 'Admin', GETDATE(), 1),
('hien', '123456', 'hien@example.com', 'User', GETDATE(), 1),
('hien123', '123456', 'thanh@example.com', 'User', GETDATE(), 1);
INSERT INTO Contacts (FullName, Email, Phone, Address, CreatedAt, UpdatedAt, UserId)
VALUES
(N'Lê Quốc Tuấn', 'tuan.le@example.com', '0909009001', N'12 Nguyễn Du, Hà Nội', GETDATE(), GETDATE(), 1),
(N'Trần Thu Hà', 'ha.tran@example.com', '0938123123', N'55 Lý Thường Kiệt, Đà Nẵng', GETDATE(), GETDATE(), 1),
(N'Phạm Quốc Khánh', 'khanh.pham@example.com', '0912333444', N'9 Phan Bội Châu, Huế', GETDATE(), GETDATE(), 1),
(N'Nguyễn Văn Lâm', 'lam.nguyen@example.com', '0987567890', N'77 Nguyễn Trãi, Hà Nội', GETDATE(), GETDATE(), 1),
(N'Hoàng Đức Long', 'long.hoang@example.com', '0912988888', N'23 Nguyễn Du, Hà Nội', GETDATE(), GETDATE(), 1),
(N'Lưu Thị Hương', 'huong.luu@example.com', '0902123456', N'45 Lê Lợi, Đà Nẵng', GETDATE(), GETDATE(), 1),
(N'Bùi Minh Anh', 'anh.bui@example.com', '0978999988', N'29 Lý Thường Kiệt, TP.HCM', GETDATE(), GETDATE(), 1),
(N'Đào Ngọc Mai', 'mai.dao@example.com', '0965333222', N'31 Bạch Đằng, Huế', GETDATE(), GETDATE(), 1),
(N'Vũ Ngọc Tú', 'tu.vu@example.com', '0937333444', N'8 Hai Bà Trưng, Hà Nội', GETDATE(), GETDATE(), 1),
(N'Lý Thanh Tùng', 'tung.ly@example.com', '0909999555', N'20 Nguyễn Văn Linh, Đà Nẵng', GETDATE(), GETDATE(), 1);
INSERT INTO Contacts (FullName, Email, Phone, Address, CreatedAt, UpdatedAt, UserId)
VALUES
(N'Nguyễn Văn An', 'an.nguyen@example.com', '0912345678', N'123 Nguyễn Trãi, Hà Nội', GETDATE(), GETDATE(), 2),
(N'Lê Hoàng Nam', 'nam.le@example.com', '0905123456', N'78 Hai Bà Trưng, TP.HCM', GETDATE(), GETDATE(), 2),
(N'Phạm Minh Hằng', 'hang.pham@example.com', '0938123456', N'12 Nguyễn Huệ, Huế', GETDATE(), GETDATE(), 2),
(N'Đỗ Mạnh Cường', 'cuong.do@example.com', '0965123456', N'9 Trần Phú, Hải Phòng', GETDATE(), GETDATE(), 2),
(N'Trịnh Thị Nga', 'nga.trinh@example.com', '0912000111', N'25 Nguyễn Du, Hà Nội', GETDATE(), GETDATE(), 2),
(N'Hoàng Thế Anh', 'anh.hoang@example.com', '0944333444', N'34 Bạch Đằng, Đà Nẵng', GETDATE(), GETDATE(), 2),
(N'Vũ Mai Hương', 'huong.vu@example.com', '0977999000', N'56 Lê Duẩn, TP.HCM', GETDATE(), GETDATE(), 2),
(N'Lâm Quốc Huy', 'huy.lam@example.com', '0934555666', N'8 Nguyễn Văn Linh, Huế', GETDATE(), GETDATE(), 2),
(N'Nguyễn Thanh Sơn', 'son.nguyen@example.com', '0987111222', N'78 Cách Mạng Tháng 8, Hà Nội', GETDATE(), GETDATE(), 2),
(N'Trần Thị Thu', 'thu.tran@example.com', '0908555666', N'45 Hai Bà Trưng, Đà Nẵng', GETDATE(), GETDATE(), 2);
INSERT INTO Contacts (FullName, Email, Phone, Address, CreatedAt, UpdatedAt, UserId)
VALUES
(N'Vũ Thị Thu Hà', 'ha.vu@example.com', '0946123456', N'88 Lạch Tray, Hải Phòng', GETDATE(), GETDATE(), 3),
(N'Ngô Đức Tài', 'tai.ngo@example.com', '0912987654', N'56 Lê Duẩn, Hà Nội', GETDATE(), GETDATE(), 3),
(N'Phan Thanh Tâm', 'tam.phan@example.com', '0973123456', N'34 Bạch Đằng, Đà Nẵng', GETDATE(), GETDATE(), 3),
(N'Lương Quang Huy', 'huy.luong@example.com', '0903234567', N'2 Nguyễn Văn Linh, TP.HCM', GETDATE(), GETDATE(), 3),
(N'Bùi Thu Trang', 'trang.bui@example.com', '0981234567', N'25 Nguyễn Công Trứ, Huế', GETDATE(), GETDATE(), 3),
(N'Trần Đình Hoàng', 'hoang.tran@example.com', '0917888999', N'10 Nguyễn Thị Minh Khai, Hà Nội', GETDATE(), GETDATE(), 3),
(N'Đặng Minh Tú', 'tu.dang@example.com', '0963444555', N'89 Nguyễn Du, Đà Nẵng', GETDATE(), GETDATE(), 3),
(N'Lê Hồng Phúc', 'phuc.le@example.com', '0934999000', N'5 Nguyễn Văn Linh, TP.HCM', GETDATE(), GETDATE(), 3),
(N'Nguyễn Hải Nam', 'nam.hai@example.com', '0977333555', N'11 Hai Bà Trưng, Huế', GETDATE(), GETDATE(), 3),
(N'Phạm Quang Vinh', 'vinh.pham@example.com', '0906888999', N'23 Trần Hưng Đạo, Hà Nội', GETDATE(), GETDATE(), 3);
