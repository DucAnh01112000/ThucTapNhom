use QLKS
go
-----------------------Customer------------------------
CREATE PROCEDURE SP_Customer_GetAll
AS
BEGIN
  SELECT *
  FROM Customer
END
GO

CREATE PROCEDURE SP_Customer_Insert
  @NameCustomer NVARCHAR(100),
  @DateTimeCustomer DATE,
  @GenderCustomer NVARCHAR(3),
  @AddressCustomer NVARCHAR(100),
  @idCardCustomer NCHAR(15),
  @PhoneNumber NCHAR(10)
AS
BEGIN
  INSERT INTO Customer
    (NameCustomer, DateTimeCustomer, GenderCustomer, AddressCustomer, idCardCustomer, PhoneNumber)
  VALUES(@NameCustomer, @DateTimeCustomer, @GenderCustomer, @AddressCustomer, @idCardCustomer, @PhoneNumber)
END
GO

CREATE PROCEDURE SP_Customer_Delete
  @CustomerId INT
AS
BEGIN
  UPDATE Bill
  SET CustomerId = NULL
  WHERE CustomerId = @CustomerId

  DELETE Customer
  WHERE CustomerId = @CustomerId
END
GO

CREATE PROCEDURE SP_Customer_Update
  @CustomerId INT,
  @NameCustomer NVARCHAR(100),
  @DateTimeCustomer DATE,
  @GenderCustomer NVARCHAR(3),
  @AddressCustomer NVARCHAR(100),
  @idCardCustomer NCHAR(15),
  @PhoneNumber NCHAR(10)
AS
BEGIN
  UPDATE Customer
  SET NameCustomer = @NameCustomer,
	  DateTimeCustomer = @DateTimeCustomer,
	  GenderCustomer = @GenderCustomer,
	  AddressCustomer = @AddressCustomer,
	  idCardCustomer = @idCardCustomer,
	  PhoneNumber = @PhoneNumber
  WHERE CustomerId = @CustomerId
END
GO

CREATE PROCEDURE SP_Customer_Search
  @searchValue NVARCHAR(200)
AS
BEGIN
  SELECT *
  FROM Customer
  WHERE CustomerId LIKE N'%' + @searchValue + '%'
    OR  NameCustomer LIKE N'%' + @searchValue + '%'
    OR  DateTimeCustomer LIKE N'%' + @searchValue + '%'
    OR  GenderCustomer LIKE N'%' + @searchValue + '%'
    OR  AddressCustomer LIKE N'%' + @searchValue + '%'
	OR  idCardCustomer LIKE N'%' + @searchValue + '%'
    OR  PhoneNumber LIKE N'%' + @searchValue + '%'
END
GO

-----------------------Account------------------------
CREATE PROCEDURE QLKS_Login
@UserName NCHAR(100),
@PassWord NCHAR(100)
AS
BEGIN
	SELECT * FROM Account WHERE UserName = @UserName AND PassWord = @PassWord
END
GO

CREATE PROCEDURE SP_Account_Insert
  @UserName NCHAR(100),
  @PassWord NCHAR(100)
AS
BEGIN
  INSERT INTO Account
    (UserName, PassWord)
  VALUES(@UserName ,@Password)
END
GO
-----------------------RoomType------------------------
CREATE PROCEDURE SP_RoomType_GetAll
AS
BEGIN
  SELECT *
  FROM RoomType
END
GO

CREATE PROCEDURE SP_RoomType_Insert
  @NameType nvarchar(100),
  @Price int
AS
BEGIN
  INSERT INTO RoomType
    (NameType,Price)
  VALUES(@NameType,@Price)
END
GO

CREATE PROCEDURE SP_RoomType_Delete
  @RoomTypeId INT
AS
BEGIN
  UPDATE Room
  SET @RoomTypeId = NULL
  WHERE RoomTypeId = @RoomTypeId

  DELETE RoomType
  WHERE @RoomTypeId = @RoomTypeId
END
GO

CREATE PROCEDURE SP_RoomType_Update
  @RoomTypeId int ,
  @NameType nvarchar(100),
  @Price int
AS
BEGIN
  UPDATE RoomType
  SET NameType = @NameType,
	  Price=@Price

  WHERE RoomTypeId = @RoomTypeId
END
GO

CREATE PROCEDURE SP_RoomType_Search
  @searchValue NVARCHAR(200)
AS
BEGIN
  SELECT *
  FROM RoomType
  WHERE RoomTypeId LIKE N'%' + @searchValue + '%'
    OR  NameType LIKE N'%' + @searchValue + '%'
    OR  Price LIKE N'%' + @searchValue + '%'
   
END
GO
-----------------------Room-----------------------
CREATE PROCEDURE SP_Room_GetAll
AS
BEGIN
  SELECT *
  FROM Room
END
GO

CREATE PROCEDURE SP_Room_Insert
  @NameRoom NVARCHAR(100),
  @Status int,
  @RoomTypeId int 
AS
BEGIN
  INSERT INTO Room
    (NameRoom, Status, RoomTypeId)
  VALUES( @NameRoom , @Status,@RoomTypeId)
END
GO

CREATE PROCEDURE SP_Room_Delete
  @RoomId INT
AS
BEGIN
  UPDATE Bill
  SET RoomId = NULL
  WHERE RoomId = @RoomId

  DELETE Room
  WHERE RoomId = @RoomId
END
GO

CREATE PROCEDURE SP_Room_Update
  @RoomId int,
   @NameRoom NVARCHAR(100),
  @Status int,
  @RoomTypeId int 
  
AS
BEGIN
  UPDATE Room
  
  SET    
         NameRoom = @NameRoom,
         Status = @Status,
		 RoomTypeId = @RoomTypeId
  WHERE RoomId = @RoomId
END
GO

CREATE PROCEDURE SP_Room_Search
  @searchValue NVARCHAR(200)
AS
BEGIN
  SELECT *
  FROM Room
  WHERE RoomId LIKE N'%' + @searchValue + '%'
    OR  NameRoom LIKE N'%' + @searchValue + '%'
    OR  Status LIKE N'%' + @searchValue + '%'
    OR  RoomTypeId LIKE N'%' + @searchValue + '%'
  
END
GO
-----------------------Service------------------------
CREATE PROCEDURE SP_Service_GetAll
AS
BEGIN
  SELECT *
  FROM Service
END
GO

CREATE PROCEDURE SP_Service_Insert
  @NameService nvarchar(100),
  @Price int
AS
BEGIN
  INSERT INTO Service
    (NameService, Price)
  VALUES(@NameService, @Price)
END
GO

CREATE PROCEDURE SP_Service_Delete
  @ServiceId INT
AS
BEGIN
  

  DELETE Service
  WHERE ServiceId = @ServiceId
END
GO

CREATE PROCEDURE SP_Service_Update
  @ServiceId INT,
  @NameService NVARCHAR(100),
  @Price int
AS
BEGIN
  UPDATE Service
  SET NameService = @NameService,
	  Price = @Price
  WHERE ServiceId = @ServiceId
END
GO

CREATE PROCEDURE SP_Service_Search
  @searchValue NVARCHAR(200)
AS
BEGIN
  SELECT *
  FROM Service
  WHERE ServiceId LIKE N'%' + @searchValue + '%'
    OR  NameService LIKE N'%' + @searchValue + '%'
    OR  Price LIKE N'%' + @searchValue + '%'
END
GO
-----------------------Bill------------------------
CREATE PROCEDURE SP_Bill_GetAll
AS
BEGIN
  SELECT *
  FROM Bill
END
GO

CREATE PROCEDURE SP_Bill_Insert
  @CustomerId int,
  @DateCheckIn Date,
  @DateCheckOut Date,
  @RoomId int,
  @Status int
  
AS
BEGIN
  INSERT INTO Bill
    (CustomerId, DateCheckIn, DateCheckOut, RoomId,Status)
  VALUES(@CustomerId,  @DateCheckIn , @DateCheckOut, @RoomId, @Status)
END
GO

CREATE PROCEDURE SP_Bill_Delete
  @BillId INT
AS
BEGIN
  UPDATE BillInfo
  SET BillId = NULL
  WHERE BillId = @BillId

  DELETE Bill
  WHERE BillId = @BillId
END
GO

CREATE PROCEDURE SP_Bill_Update
  @BillId int,
  @CustomerId int,
  @DateCheckIn Date,
  @DateCheckOut Date,
  @RoomId int,
  @Status int
  
AS
BEGIN
  UPDATE Bill
  SET CustomerId= @CustomerId,
	  DateCheckIn=@DateCheckIn,
	  DateCheckOut=@DateCheckIn,
	  RoomId=@RoomId,
	  Status=@Status

  WHERE BillId = @BillId
END
GO

CREATE PROCEDURE SP_Bill_Search
  @searchValue NVARCHAR(200)
AS
BEGIN
  SELECT *
  FROM Bill
  WHERE BillId LIKE N'%' + @searchValue + '%'
    OR  CustomerId LIKE N'%' + @searchValue + '%'
    OR  DateCheckIn LIKE N'%' + @searchValue + '%'
    OR  DateCheckOut LIKE N'%' + @searchValue + '%'
    OR  RoomId LIKE N'%' + @searchValue + '%'
	OR  Status LIKE N'%' + @searchValue + '%'
  
END
GO


