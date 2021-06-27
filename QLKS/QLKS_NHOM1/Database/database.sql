Create batabase QLKS
Use QLKS
GO 

-------------------- Tạo bảng ----------------------

-----Tạo Bảng Account------
CREATE TABLE Account
(
	UserName nchar(100) NOT NULL PRIMARY KEY,
	PassWord nchar(1000) NOT NULL
)
GO

----Tạo Bảng Loại Phòng--------
CREATE	TABLE RoomType
(
	RoomTypeId INT IDENTITY PRIMARY KEY,
	NameType nvarchar(100) NOT NULL,
	Price INT NOT NULL,
)
GO

--Tạo Bảng Phòng------
CREATE TABLE Room
(
	RoomId INT IDENTITY PRIMARY KEY,
	NameRoom nvarchar(100) NOT NULL,
	Status int NOT NULL,
	RoomTypeId INT NOT NULL,
	FOREIGN KEY(RoomTypeId) REFERENCES RoomType (RoomTypeId)
)
GO

-------Tạo Bảng Dịch Vụ---------
CREATE TABLE Service
(
	ServiceId INT IDENTITY PRIMARY KEY,
	NameService nvarchar(100) NOT NULL,
	Price int NOT NULL,
)
GO

-------------Tạo bảng Khách hàng--------
CREATE TABLE Customer
(
	CustomerId INT IDENTITY PRIMARY KEY,
	NameCustomer nvarchar(100) NOT NULL,
	DateTimeCustomer Date NOT NULL,
	GenderCustomer nvarchar(3) NOT NULL,
	AddressCustomer nvarchar(100),
	IdCardCustomer nchar(15) NOT NULL,
	PhoneNumber Nchar(10)
)
GO

-----Tạo Bảng Bill-----
CREATE TABLE Bill
(
	BillId INT IDENTITY PRIMARY KEY,
	CustomerId int NOT NULL,
	DateCheckIn Date NOT NULL DEFAULT GETDATE(),
	DateCheckOut Date ,
	RoomId int NOT NULL,
	Status int NOT NULL, ------1: Đã Thanh Toán, 0: Chưa Thanh Toán.
	FOREIGN KEY (CustomerId) REFERENCES Customer(CustomerId),
	FOREIGN KEY (RoomId) REFERENCES Room(RoomId),
)
GO
----Tạo Bảng BillInfo-------
CREATE TABLE BillInfo
(
	BillInfoId INT IDENTITY PRIMARY KEY,
	BillId int NOT NULL,
	ServiceId int NOT NULL,
	IntCount INT NOT NULL,
	DateService DATE NOT NULL DEFAULT GETDATE(),
	FOREIGN KEY (BillId) REFERENCES Bill (BillId),
	FOREIGN KEY (ServiceId) REFERENCES Service (ServiceId)
)
GO