
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

INSERT INTO Contacts (FullName, Email, Phone, Address, CreatedAt, UpdatedAt)
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

