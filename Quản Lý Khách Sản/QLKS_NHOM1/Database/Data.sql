use QuanLyKhachSan

------------------- Thêm dữ liệu vào bảng RoomType ----------
SELECT * FROM RoomType
GO

SET IDENTITY_INSERT [dbo].[RoomType] ON
INSERT INTO RoomType ([RoomTypeId], [NameType], [Price]) Values (1, N'Phòng VIP', 720000)
INSERT INTO RoomType ([RoomTypeId], [NameType], [Price]) Values (2, N'Phòng thường', 120000)
INSERT INTO RoomType ([RoomTypeId], [NameType], [Price]) Values (3, N'Phòng thương gia', 400000)
INSERT INTO RoomType ([RoomTypeId], [NameType], [Price]) Values (4, N'Phòng đôi', 180000)
INSERT INTO RoomType ([RoomTypeId], [NameType], [Price]) Values (5, N'Phòng ba', 200000)
SET IDENTITY_INSERT [dbo].[RoomType] OFF
GO
--------------------------Thêm dữ liệu vào bảng phòng ------------------------
SELECT * FROM Room
GO

SET IDENTITY_INSERT [dbo].[Room] ON
INSERT INTO Room([RoomId], [NameRoom], [Status], [RoomTypeId]) Values (1, N'Phòng VIP', 1, 1)
INSERT INTO Room([RoomId], [NameRoom], [Status], [RoomTypeId]) Values (2, N'Phòng 10',0, 3)
INSERT INTO Room([RoomId], [NameRoom], [Status], [RoomTypeId]) Values (3, N'Phòng 11',1, 3)
INSERT INTO Room([RoomId], [NameRoom], [Status], [RoomTypeId]) Values (4, N'Phòng 31',1, 4)
INSERT INTO Room([RoomId], [NameRoom], [Status], [RoomTypeId]) Values (5, N'Phòng 32',1, 5)
INSERT INTO Room([RoomId], [NameRoom], [Status], [RoomTypeId]) Values (6, N'Phòng 33',1, 5)
INSERT INTO Room([RoomId], [NameRoom], [Status], [RoomTypeId]) Values (7, N'Phòng 101',1 , 2)
INSERT INTO Room([RoomId], [NameRoom], [Status], [RoomTypeId]) Values (8, N'Phòng 102',0, 2)
INSERT INTO Room([RoomId], [NameRoom], [Status], [RoomTypeId]) Values (9, N'Phòng 103',0 , 2)
INSERT INTO Room([RoomId], [NameRoom], [Status], [RoomTypeId]) Values (10, N'Phòng 104',0, 2)
SET IDENTITY_INSERT [dbo].[Room] OFF
GO

---------------------------------------Thêm dữ liệu vào bảng Customer -------------------

SET DATEFORMAT dmy
SET IDENTITY_INSERT [dbo].Customer ON
INSERT INTO Customer ([CustomerId], [NameCustomer], [DateTimeCustomer], [GenderCustomer], [AddressCustomer], [IdCardCustomer], [PhoneNumber])
VALUES (1, N'Nguyễn Văn B', '02/01/1996', N'Nam', N'Bạc Liêu', '385758646', '0964429603')
SET IDENTITY_INSERT [dbo].Customer OFF
GO
INSERT INTO Customer ( [NameCustomer], [DateTimeCustomer], [GenderCustomer], [AddressCustomer], [IdCardCustomer], [PhoneNumber])
VALUES (N'Nguyễn Văn C', '22/08/1996', N'Nam', N'Bạc Liêu', '385758659', '0964423435')
GO
INSERT INTO Customer ([NameCustomer], [DateTimeCustomer], [GenderCustomer], [AddressCustomer], [IdCardCustomer], [PhoneNumber])
VALUES (N'Nguyễn Thị Bông', '14/06/1994', N'Nữ', N'Bạc Liêu', '385758634', '0964234432')
GO
SELECT * FROM Customer
GO


----------------------Thêm dữ liệu vào bảng Service -------------------------
SELECT * FROM Service
GO

SET IDENTITY_INSERT [dbo].[Service] ON
INSERT INTO Service ([ServiceId], [NameService], [Price]) Values (1, N'Quầy bar', 100000)
INSERT INTO Service ([ServiceId], [NameService], [Price]) Values (2, N'Café', 10000)
INSERT INTO Service ([ServiceId], [NameService], [Price]) Values (3, N'Spa', 100000)
INSERT INTO Service ([ServiceId], [NameService], [Price]) Values (4, N'Phòng họp', 120000)
INSERT INTO Service ([ServiceId], [NameService], [Price]) Values (5, N'Giặt ủi', 20000)
INSERT INTO Service ([ServiceId], [NameService], [Price]) Values (6, N'Dịch vụ 24/24', 200000)
INSERT INTO Service ([ServiceId], [NameService], [Price]) Values (7, N'Fitness centre', 10000)
SET IDENTITY_INSERT [dbo].[Service] OFF
GO


------------------------Thêm dữ liệu vào bảng Bill ------------------

SET IDENTITY_INSERT [dbo].[Bill] ON
INSERT INTO Bill ([BillId],[CustomerId], [DateCheckIn], [DateCheckOut], [RoomId], [Status])  Values (1, 1, GETDATE(), NULl,  1, 0)
INSERT INTO Bill ([BillId], [CustomerId], [DateCheckIn], [DateCheckOut], [RoomId], [Status])  Values (2, 2, GETDATE(), GETDATE(),  1, 1)
INSERT INTO Bill ([BillId], [CustomerId], [DateCheckIn], [DateCheckOut], [RoomId], [Status])  Values (3, 3, GETDATE(), NULl,  7, 0)
SET IDENTITY_INSERT [dbo].[Bill] OFF
GO
INSERT INTO Bill ([CustomerId], [DateCheckIn], [DateCheckOut], [RoomId], [Status])  
Values (1, GETDATE(), NULl,  3, 0)
GO

SELECT * FROM Bill
GO

-----------------------------------Thêm dữ liệu vào bảng billInfo ---------------------
SELECT * FROM BillInfo
GO

SET IDENTITY_INSERT [dbo].[BillInfo] ON
INSERT INTO BillInfo ([BillInfoId], [BillId], [ServiceId], [IntCount], [DateService]) Values (1, 1, 1, 1, GETDATE())
INSERT INTO BillInfo ([BillInfoId], [BillId], [ServiceId], [IntCount], [DateService]) Values (2, 2, 6, 1, GETDATE())
INSERT INTO BillInfo ([BillInfoId], [BillId], [ServiceId], [IntCount], [DateService]) Values (3, 2, 3, 1, GETDATE())
INSERT INTO BillInfo ([BillInfoId], [BillId], [ServiceId], [IntCount], [DateService]) Values (4, 2, 2, 4, GETDATE())
SET IDENTITY_INSERT [dbo].[BillInfo] OFF
GO
INSERT INTO BillInfo ([BillId], [ServiceId], [intCount], [DateService]) Values (1, 2, 4, GETDATE())
INSERT INTO BillInfo ([BillId], [ServiceId], [intCount], [DateService]) Values (3, 3, 4, GETDATE())
INSERT INTO BillInfo ([BillId], [ServiceId], [intCount], [DateService]) Values (3, 6, 3, GETDATE())

--------------------------Thêm dữ liệu vào bảng Account--------------------
select * from Account

INSERT INTO Account ([UserName], [DisplayName], [PassWord], [Type]) Values ('admin', N'Trưởng Phòng', 'admin', 1)
GO
INSERT INTO Account ([UserName], [DisplayName], [PassWord], [Type]) Values ('dinh', N'Trưởng Phòng', 'dinh', 0)
GO