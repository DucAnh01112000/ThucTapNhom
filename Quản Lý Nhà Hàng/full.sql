USE [master]
GO
/****** Object:  Database [QUANLYNHAHANG]    Script Date: 10/05/2021 10:50:53 SA ******/
CREATE DATABASE [QUANLYNHAHANG]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QUANLYNHAHANG', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\QUANLYNHAHANG.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'QUANLYNHAHANG_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\QUANLYNHAHANG_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [QUANLYNHAHANG] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QUANLYNHAHANG].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QUANLYNHAHANG] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QUANLYNHAHANG] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QUANLYNHAHANG] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QUANLYNHAHANG] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QUANLYNHAHANG] SET ARITHABORT OFF 
GO
ALTER DATABASE [QUANLYNHAHANG] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [QUANLYNHAHANG] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QUANLYNHAHANG] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QUANLYNHAHANG] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QUANLYNHAHANG] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QUANLYNHAHANG] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QUANLYNHAHANG] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QUANLYNHAHANG] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QUANLYNHAHANG] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QUANLYNHAHANG] SET  ENABLE_BROKER 
GO
ALTER DATABASE [QUANLYNHAHANG] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QUANLYNHAHANG] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QUANLYNHAHANG] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QUANLYNHAHANG] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QUANLYNHAHANG] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QUANLYNHAHANG] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QUANLYNHAHANG] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QUANLYNHAHANG] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [QUANLYNHAHANG] SET  MULTI_USER 
GO
ALTER DATABASE [QUANLYNHAHANG] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QUANLYNHAHANG] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QUANLYNHAHANG] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QUANLYNHAHANG] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [QUANLYNHAHANG] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [QUANLYNHAHANG] SET QUERY_STORE = OFF
GO
USE [QUANLYNHAHANG]
GO
/****** Object:  UserDefinedFunction [dbo].[fcgetIdBan]    Script Date: 10/05/2021 10:50:54 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	Create function [dbo].[fcgetIdBan]()
		returns varchar(6)
		As
		Begin
			Declare @MaBan varchar(6)
			Declare @MaxIdBan varchar(6)
			Declare @Max float		
			Select @MaxIdBan = MAX(MaBan) from Ban
			
			if exists (select MaBan from Ban)
						set @Max = CONVERT(float, SUBSTRING(@MaxIdBan,2,4)) + 1
			else
						set @Max=1	
			if (@Max < 10)
						set @MaBan='B' + '00' + Convert(varchar(1),@Max)
			else
			if(@Max < 100)
						set @MaBan ='B' + '0' + Convert(varchar(2),@Max)
		--	else 
		--	if(@Max < 1000)
		--	           set @MaBan ='B' + '0' + Convert(varchar(3),@Max)
			else 
			           set @MaBan ='B'  + Convert(varchar(4),@Max)

			Return @MaBan
	End
GO
/****** Object:  UserDefinedFunction [dbo].[fcgetIdMon]    Script Date: 10/05/2021 10:50:54 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create function [dbo].[fcgetIdMon]()
		returns varchar(6)
		As
		Begin
			Declare @MaMon varchar(6)
			Declare @MaxIdMon varchar(6)
			Declare @Max float		
			Select @MaxIdMon = MAX(MaMon) from MON
			
			if exists (select MaMon from MON)
						set @Max = CONVERT(float, SUBSTRING(@MaxIdMon,2,4)) + 1
			else
						set @Max=1	
			if (@Max < 10)
						set @MaMon='M' + '00' + Convert(varchar(1),@Max)
			else
			if(@Max < 100)
						set @MaMon ='M' + '0' + Convert(varchar(2),@Max)
			else 
			           set @MaMon ='M'  + Convert(varchar(4),@Max)

			Return @MaMon
	End
GO
/****** Object:  UserDefinedFunction [dbo].[fcgetIdNhanVien]    Script Date: 10/05/2021 10:50:54 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create function [dbo].[fcgetIdNhanVien]()
		returns varchar(6)
		As
		Begin
			Declare @MaNV varchar(6)
			Declare @MaxIdNV varchar(6)
			Declare @Max float		
			Select @MaxIdNV = MAX(MaNV) from NHANVIEN
			
			if exists (select MaNV from NHANVIEN)
						set @Max = CONVERT(float, SUBSTRING(@MaxIdNV,3,4)) + 1
			else
						set @Max=1	
			if (@Max < 10)
						set @MaNV='NV' + '0' + Convert(varchar(1),@Max)
			else 
			           set @MaNV ='NV'  + Convert(varchar(4),@Max)

			Return @MaNV
	End
GO
/****** Object:  UserDefinedFunction [dbo].[fcgetMaKH]    Script Date: 10/05/2021 10:50:54 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create  function [dbo].[fcgetMaKH]()
		returns varchar(10)
		As
		Begin
			Declare @MaKH varchar(10)
			Declare @MaxMaKH varchar(10)
			Declare @Max float		
			Select @MaxMaKH = MAX(MaKH) from KHACHHANG
			
			if exists (select MaKH from KHACHHANG)
						set @Max = CONVERT(float, SUBSTRING(@MaxMaKH,3,5)) + 1
			else
						set @Max=1	
			if (@Max < 10)
						set @MaKH='KH' + '000' + Convert(varchar(1),@Max)
			else
			if(@Max < 100)
						set @MaKH ='KH' + '00' + Convert(varchar(2),@Max)
			else 
			if(@Max < 1000)
			           set @MaKH ='KH' + '0' + Convert(varchar(5),@Max)		
			else 
			           set @MaKH ='KH'  + Convert(varchar(4),@Max)
			Return @MaKH
	End
GO
/****** Object:  UserDefinedFunction [dbo].[fcgetMaPYC]    Script Date: 10/05/2021 10:50:54 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create  function [dbo].[fcgetMaPYC]()
		returns varchar(10)
		As
		Begin
			Declare @MaPYC varchar(10)
			Declare @MaxMaPYC varchar(10)
			Declare @Max float		
			Select @MaxMaPYC = MAX(MaPYC) from PHIEUYEUCAU
			
			if exists (select MaPYC from PHIEUYEUCAU)
						set @Max = CONVERT(float, SUBSTRING(@MaxMaPYC,4,7)) + 1
			else
						set @Max=1	
			if (@Max < 10)
						set @MaPYC='PYC' + '00000' + Convert(varchar(1),@Max)
			else
			if(@Max < 100)
						set @MaPYC ='PYC' + '0000' + Convert(varchar(2),@Max)
			else 
			if(@Max < 1000)
			           set @MaPYC ='PYC' + '000' + Convert(varchar(3),@Max)
			else 
			if(@Max < 10000)
			           set @MaPYC ='PYC' + '00' + Convert(varchar(4),@Max)
			else 
			if(@Max < 100000)
			           set @MaPYC ='PYC' + '0' + Convert(varchar(5),@Max)
			else 
			           set @MaPYC ='PYC'  + Convert(varchar(6),@Max)
			Return @MaPYC
	End
GO
/****** Object:  UserDefinedFunction [dbo].[GetUnsignString]    Script Date: 10/05/2021 10:50:54 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[GetUnsignString](@strInput NVARCHAR(4000)) 
RETURNS NVARCHAR(4000)
AS
BEGIN     
    IF @strInput IS NULL RETURN @strInput
    IF @strInput = '' RETURN @strInput
    DECLARE @RT NVARCHAR(4000)
    DECLARE @SIGN_CHARS NCHAR(136)
    DECLARE @UNSIGN_CHARS NCHAR (136)

    SET @SIGN_CHARS       = N'ăâđêôơưàảãạáằẳẵặắầẩẫậấèẻẽẹéềểễệếìỉĩịíòỏõọóồổỗộốờởỡợớùủũụúừửữựứỳỷỹỵýĂÂĐÊÔƠƯÀẢÃẠÁẰẲẴẶẮẦẨẪẬẤÈẺẼẸÉỀỂỄỆẾÌỈĨỊÍÒỎÕỌÓỒỔỖỘỐỜỞỠỢỚÙỦŨỤÚỪỬỮỰỨỲỶỸỴÝ'+NCHAR(272)+ NCHAR(208)
    SET @UNSIGN_CHARS = N'aadeoouaaaaaaaaaaaaaaaeeeeeeeeeeiiiiiooooooooooooooouuuuuuuuuuyyyyyAADEOOUAAAAAAAAAAAAAAAEEEEEEEEEEIIIIIOOOOOOOOOOOOOOOUUUUUUUUUUYYYYYDD'

    DECLARE @COUNTER int
    DECLARE @COUNTER1 int
    SET @COUNTER = 1
 
    WHILE (@COUNTER <=LEN(@strInput))
    BEGIN   
      SET @COUNTER1 = 1
      --Tim trong chuoi mau
       WHILE (@COUNTER1 <=LEN(@SIGN_CHARS)+1)
       BEGIN
     IF UNICODE(SUBSTRING(@SIGN_CHARS, @COUNTER1,1)) = UNICODE(SUBSTRING(@strInput,@COUNTER ,1) )
     BEGIN           
          IF @COUNTER=1
              SET @strInput = SUBSTRING(@UNSIGN_CHARS, @COUNTER1,1) + SUBSTRING(@strInput, @COUNTER+1,LEN(@strInput)-1)                   
          ELSE
              SET @strInput = SUBSTRING(@strInput, 1, @COUNTER-1) +SUBSTRING(@UNSIGN_CHARS, @COUNTER1,1) + SUBSTRING(@strInput, @COUNTER+1,LEN(@strInput)- @COUNTER)    
              BREAK         
               END
             SET @COUNTER1 = @COUNTER1 +1
       END
      --Tim tiep
       SET @COUNTER = @COUNTER +1
    END
    RETURN @strInput
END
GO
/****** Object:  Table [dbo].[ACCOUNT]    Script Date: 10/05/2021 10:50:54 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ACCOUNT](
	[UserName] [nvarchar](100) NULL,
	[TenHienThi] [nvarchar](100) NULL,
	[MatKhau] [nvarchar](1000) NULL,
	[TrangThai] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BAN]    Script Date: 10/05/2021 10:50:54 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BAN](
	[MaBan] [char](10) NOT NULL,
	[TinhTrang] [nvarchar](200) NULL,
	[MaPYC] [char](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaBan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BOPHAN]    Script Date: 10/05/2021 10:50:54 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BOPHAN](
	[MaBP] [char](10) NOT NULL,
	[TenBP] [nvarchar](100) NULL,
	[TruongBP] [char](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaBP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KHACHHANG]    Script Date: 10/05/2021 10:50:54 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KHACHHANG](
	[MaKH] [char](10) NOT NULL,
	[TenKH] [nvarchar](40) NULL,
	[SDT] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MON]    Script Date: 10/05/2021 10:50:54 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MON](
	[MaMon] [char](10) NOT NULL,
	[TenMon] [nvarchar](100) NULL,
	[DonGia] [int] NULL,
	[MaNM] [char](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaMon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NHANVIEN]    Script Date: 10/05/2021 10:50:54 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NHANVIEN](
	[MaNV] [char](10) NOT NULL,
	[TenNV] [nvarchar](50) NULL,
	[NgaySinh] [date] NULL,
	[DiaChi] [nvarchar](200) NULL,
	[GT] [nchar](3) NULL,
	[SDT] [int] NULL,
	[Luong] [int] NULL,
	[MaBP] [char](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaNV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NHOMMON]    Script Date: 10/05/2021 10:50:54 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NHOMMON](
	[MaNM] [char](10) NOT NULL,
	[TenNM] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaNM] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PHIEUYEUCAU]    Script Date: 10/05/2021 10:50:54 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PHIEUYEUCAU](
	[MaPYC] [char](10) NOT NULL,
	[NgayViet] [date] NULL,
	[TrangThai] [nvarchar](100) NULL,
	[MaKH] [char](10) NULL,
	[MaNV] [char](10) NULL,
	[GiamGia] [int] NULL,
	[TongTien] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaPYC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PHIEUYEUCAU_MON]    Script Date: 10/05/2021 10:50:54 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PHIEUYEUCAU_MON](
	[MaPYC] [char](10) NOT NULL,
	[MaMon] [char](10) NOT NULL,
	[SoLuong] [int] NULL,
	[Id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK__PYCMON] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[ACCOUNT] ([UserName], [TenHienThi], [MatKhau], [TrangThai]) VALUES (N'Quang Dao', N'Đảo PQ', N'1', 1)
INSERT [dbo].[ACCOUNT] ([UserName], [TenHienThi], [MatKhau], [TrangThai]) VALUES (N'Duc Anh', N'Nhân Viên', N'1', 0)
GO
INSERT [dbo].[BAN] ([MaBan], [TinhTrang], [MaPYC]) VALUES (N'B001      ', N'TRỐNG', N'PYC000002 ')
INSERT [dbo].[BAN] ([MaBan], [TinhTrang], [MaPYC]) VALUES (N'B002      ', N'TRỐNG', N'PYC000005 ')
INSERT [dbo].[BAN] ([MaBan], [TinhTrang], [MaPYC]) VALUES (N'B003      ', N'TRỐNG', N'PYC000004 ')
INSERT [dbo].[BAN] ([MaBan], [TinhTrang], [MaPYC]) VALUES (N'B004      ', N'TRỐNG', NULL)
INSERT [dbo].[BAN] ([MaBan], [TinhTrang], [MaPYC]) VALUES (N'B005      ', N'TRỐNG', NULL)
INSERT [dbo].[BAN] ([MaBan], [TinhTrang], [MaPYC]) VALUES (N'B006      ', N'TRỐNG', NULL)
INSERT [dbo].[BAN] ([MaBan], [TinhTrang], [MaPYC]) VALUES (N'B007      ', N'ĐẦY', N'PYC000007 ')
INSERT [dbo].[BAN] ([MaBan], [TinhTrang], [MaPYC]) VALUES (N'B008      ', N'TRỐNG', NULL)
INSERT [dbo].[BAN] ([MaBan], [TinhTrang], [MaPYC]) VALUES (N'B009      ', N'TRỐNG', NULL)
INSERT [dbo].[BAN] ([MaBan], [TinhTrang], [MaPYC]) VALUES (N'B010      ', N'TRỐNG', NULL)
INSERT [dbo].[BAN] ([MaBan], [TinhTrang], [MaPYC]) VALUES (N'B011      ', N'TRỐNG', NULL)
INSERT [dbo].[BAN] ([MaBan], [TinhTrang], [MaPYC]) VALUES (N'B012      ', N'TRỐNG', NULL)
INSERT [dbo].[BAN] ([MaBan], [TinhTrang], [MaPYC]) VALUES (N'B013      ', N'TRỐNG', NULL)
INSERT [dbo].[BAN] ([MaBan], [TinhTrang], [MaPYC]) VALUES (N'B014      ', N'TRỐNG', NULL)
INSERT [dbo].[BAN] ([MaBan], [TinhTrang], [MaPYC]) VALUES (N'B015      ', N'TRỐNG', NULL)
INSERT [dbo].[BAN] ([MaBan], [TinhTrang], [MaPYC]) VALUES (N'B016      ', N'TRỐNG', NULL)
INSERT [dbo].[BAN] ([MaBan], [TinhTrang], [MaPYC]) VALUES (N'B017      ', N'TRỐNG', NULL)
GO
INSERT [dbo].[BOPHAN] ([MaBP], [TenBP], [TruongBP]) VALUES (N'BP01      ', N'QUẢN LÍ', N'NV01                                              ')
INSERT [dbo].[BOPHAN] ([MaBP], [TenBP], [TruongBP]) VALUES (N'BP02      ', N'TÀI CHÍNH', N'NV03                                              ')
INSERT [dbo].[BOPHAN] ([MaBP], [TenBP], [TruongBP]) VALUES (N'BP03      ', N'PHỤC VỤ', N'NV05                                              ')
INSERT [dbo].[BOPHAN] ([MaBP], [TenBP], [TruongBP]) VALUES (N'BP04      ', N'KHO', N'NV12                                              ')
INSERT [dbo].[BOPHAN] ([MaBP], [TenBP], [TruongBP]) VALUES (N'BP05      ', N'CHẾ BIẾN', N'NV14                                              ')
INSERT [dbo].[BOPHAN] ([MaBP], [TenBP], [TruongBP]) VALUES (N'BP06      ', N'BẾP', N'NV17                                              ')
INSERT [dbo].[BOPHAN] ([MaBP], [TenBP], [TruongBP]) VALUES (N'BP07      ', N'AN NINH', N'NV21                                              ')
GO
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [SDT]) VALUES (N'KH0001    ', N'NGUYỄN THỊ A', 784884245)
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [SDT]) VALUES (N'KH0002    ', N'LÊ THỊ BƯỞI', 784990245)
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [SDT]) VALUES (N'KH0003    ', N'LÊ VĂN PHÚC', 224884245)
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [SDT]) VALUES (N'KH0004    ', N'DOÃN ANH ĐỨC', 784084045)
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [SDT]) VALUES (N'KH0005    ', N'LÊ THỊ B', 784884111)
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [SDT]) VALUES (N'KH0006    ', N'NGUYỄN THỊ CHUNG', 994884245)
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [SDT]) VALUES (N'KH0007    ', N'NGUYỄN ANH HIẾU', 994884989)
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [SDT]) VALUES (N'KH0008    ', N'NGUYỄN THỊ NỞ', 584884246)
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [SDT]) VALUES (N'KH0009    ', N'KIỀU TRUNG ANH', 914884366)
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [SDT]) VALUES (N'KH0010    ', N'NGUYỄN TRÀ MY', 784884009)
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [SDT]) VALUES (N'KH0011    ', N'PHẠM QUANG VINH', 878484241)
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [SDT]) VALUES (N'KH0012    ', N'NGUYỄN AN NHIÊN', 878884242)
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [SDT]) VALUES (N'KH0013    ', N'LẠI TIẾN ANH', 77848249)
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [SDT]) VALUES (N'KH0014    ', N'TRẦN TRUNG HIẾU', 838488400)
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [SDT]) VALUES (N'KH0015    ', N'TRẦN TRUNG ĐÔNG', 838884523)
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [SDT]) VALUES (N'KH0016    ', N'TRẦN QUANG BÁ', 228484500)
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [SDT]) VALUES (N'KH0017    ', N'LÊ THỊ ĐÌNH', 838488452)
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [SDT]) VALUES (N'KH0018    ', N'PHẠM XUÂN BÁCH', 838488333)
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [SDT]) VALUES (N'KH0019    ', N'PHẠM XUÂN NGHỊ', 838488393)
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [SDT]) VALUES (N'KH0020    ', N'NGUYỄN HÀ ĐÔNG', 838488773)
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [SDT]) VALUES (N'KH0021    ', N'pham thi thu', 10202222)
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [SDT]) VALUES (N'KH0022    ', N'a', 1)
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [SDT]) VALUES (N'KH0023    ', N'b', 11)
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [SDT]) VALUES (N'KH0024    ', N'a', 2)
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [SDT]) VALUES (N'KH0025    ', N'1', 1)
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [SDT]) VALUES (N'KH0026    ', N'a', 1)
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [SDT]) VALUES (N'KH0027    ', N'1', 1)
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [SDT]) VALUES (N'KH0028    ', N'1', 1)
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [SDT]) VALUES (N'KH0029    ', N'a', 1)
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [SDT]) VALUES (N'KH0030    ', N'ac', 12)
GO
INSERT [dbo].[MON] ([MaMon], [TenMon], [DonGia], [MaNM]) VALUES (N'M001      ', N'TRÂU XÀO MUỐNG', 120000, N'NM01      ')
INSERT [dbo].[MON] ([MaMon], [TenMon], [DonGia], [MaNM]) VALUES (N'M002      ', N'TRÂU LUỘC CHẤM MẺ CHƯNG', 150000, N'NM01      ')
INSERT [dbo].[MON] ([MaMon], [TenMon], [DonGia], [MaNM]) VALUES (N'M003      ', N'TRÂU NƯỚNG LÁ LỐT', 150000, N'NM01      ')
INSERT [dbo].[MON] ([MaMon], [TenMon], [DonGia], [MaNM]) VALUES (N'M004      ', N'TRÂU XÀO TỎI', 150000, N'NM01      ')
INSERT [dbo].[MON] ([MaMon], [TenMon], [DonGia], [MaNM]) VALUES (N'M005      ', N'TRÂU XÀO MĂNG CHUA', 120000, N'NM01      ')
INSERT [dbo].[MON] ([MaMon], [TenMon], [DonGia], [MaNM]) VALUES (N'M006      ', N'BÒ XÀO XẢ ỚT', 150000, N'NM01      ')
INSERT [dbo].[MON] ([MaMon], [TenMon], [DonGia], [MaNM]) VALUES (N'M007      ', N'BÒ XÀO CẦN TỎI', 150000, N'NM01      ')
INSERT [dbo].[MON] ([MaMon], [TenMon], [DonGia], [MaNM]) VALUES (N'M008      ', N'BÒ CUỐN LÁ CHẢ', 150000, N'NM01      ')
INSERT [dbo].[MON] ([MaMon], [TenMon], [DonGia], [MaNM]) VALUES (N'M009      ', N'BÒ XÀO MĂNG CHUA', 120000, N'NM01      ')
INSERT [dbo].[MON] ([MaMon], [TenMon], [DonGia], [MaNM]) VALUES (N'M010      ', N'BÒ BẮP TRẦN GIÁ', 120000, N'NM01      ')
INSERT [dbo].[MON] ([MaMon], [TenMon], [DonGia], [MaNM]) VALUES (N'M011      ', N'BÒ SỐT TIÊU ĐEN', 150000, N'NM01      ')
INSERT [dbo].[MON] ([MaMon], [TenMon], [DonGia], [MaNM]) VALUES (N'M012      ', N'BÊ TÁI CHANH', 120000, N'NM01      ')
INSERT [dbo].[MON] ([MaMon], [TenMon], [DonGia], [MaNM]) VALUES (N'M013      ', N'BÊ TÁI THÍNH', 120000, N'NM01      ')
INSERT [dbo].[MON] ([MaMon], [TenMon], [DonGia], [MaNM]) VALUES (N'M014      ', N'BÊ HẤP GỪNG', 150000, N'NM01      ')
INSERT [dbo].[MON] ([MaMon], [TenMon], [DonGia], [MaNM]) VALUES (N'M015      ', N'CẢI NGỌT XÀO NẤM', 30000, N'NM02      ')
INSERT [dbo].[MON] ([MaMon], [TenMon], [DonGia], [MaNM]) VALUES (N'M016      ', N'BÍ XÀO TỎI', 30000, N'NM02      ')
INSERT [dbo].[MON] ([MaMon], [TenMon], [DonGia], [MaNM]) VALUES (N'M017      ', N'RAU LANG XÀO TỎI', 30000, N'NM02      ')
INSERT [dbo].[MON] ([MaMon], [TenMon], [DonGia], [MaNM]) VALUES (N'M018      ', N'MỒNG TƠI XÀO', 30000, N'NM02      ')
INSERT [dbo].[MON] ([MaMon], [TenMon], [DonGia], [MaNM]) VALUES (N'M019      ', N'RAU MUỐNG XÀO TỎI', 30000, N'NM02      ')
INSERT [dbo].[MON] ([MaMon], [TenMon], [DonGia], [MaNM]) VALUES (N'M020      ', N'SU SU LUỘC CHẤM MUỐI VỪNG', 30000, N'NM02      ')
INSERT [dbo].[MON] ([MaMon], [TenMon], [DonGia], [MaNM]) VALUES (N'M021      ', N'NGỌN SU SU XÀO', 30000, N'NM02      ')
INSERT [dbo].[MON] ([MaMon], [TenMon], [DonGia], [MaNM]) VALUES (N'M022      ', N'NỘM SỨA PHỒNG TÔM', 60000, N'NM03      ')
INSERT [dbo].[MON] ([MaMon], [TenMon], [DonGia], [MaNM]) VALUES (N'M023      ', N'SALAD RAU MẦM', 50000, N'NM03      ')
INSERT [dbo].[MON] ([MaMon], [TenMon], [DonGia], [MaNM]) VALUES (N'M024      ', N'SALAD DẦM DẤM', 40000, N'NM03      ')
INSERT [dbo].[MON] ([MaMon], [TenMon], [DonGia], [MaNM]) VALUES (N'M025      ', N'MƯỚP ĐẮNG ĐÁ RUỐC', 50000, N'NM03      ')
INSERT [dbo].[MON] ([MaMon], [TenMon], [DonGia], [MaNM]) VALUES (N'M026      ', N'NỘP HOA CHUỐI', 40000, N'NM03      ')
INSERT [dbo].[MON] ([MaMon], [TenMon], [DonGia], [MaNM]) VALUES (N'M027      ', N'NỘP RAU MÁ', 40000, N'NM03      ')
INSERT [dbo].[MON] ([MaMon], [TenMon], [DonGia], [MaNM]) VALUES (N'M028      ', N'NỘP DƯA GÓP', 40000, N'NM03      ')
INSERT [dbo].[MON] ([MaMon], [TenMon], [DonGia], [MaNM]) VALUES (N'M029      ', N'LỢN MẸT', 150000, N'NM04      ')
INSERT [dbo].[MON] ([MaMon], [TenMon], [DonGia], [MaNM]) VALUES (N'M030      ', N'SƯỜN LỢN NƯỚNG', 150000, N'NM04      ')
INSERT [dbo].[MON] ([MaMon], [TenMon], [DonGia], [MaNM]) VALUES (N'M031      ', N'SƯỜN XÀO CHUA NGỌT', 150000, N'NM04      ')
INSERT [dbo].[MON] ([MaMon], [TenMon], [DonGia], [MaNM]) VALUES (N'M032      ', N'SỤN RANG MUỐI', 150000, N'NM04      ')
INSERT [dbo].[MON] ([MaMon], [TenMon], [DonGia], [MaNM]) VALUES (N'M033      ', N'LẨU GÀ ĐEN', 700000, N'NM05      ')
INSERT [dbo].[MON] ([MaMon], [TenMon], [DonGia], [MaNM]) VALUES (N'M034      ', N'LẨU VỊT', 400000, N'NM05      ')
INSERT [dbo].[MON] ([MaMon], [TenMon], [DonGia], [MaNM]) VALUES (N'M035      ', N'LẨU RIÊU CUA BẮP BÒ', 550000, N'NM05      ')
INSERT [dbo].[MON] ([MaMon], [TenMon], [DonGia], [MaNM]) VALUES (N'M036      ', N'LẨU BÒ NHÚM GIẤM', 350000, N'NM05      ')
INSERT [dbo].[MON] ([MaMon], [TenMon], [DonGia], [MaNM]) VALUES (N'M037      ', N'LẨU THẬP CẨM', 600000, N'NM05      ')
INSERT [dbo].[MON] ([MaMon], [TenMon], [DonGia], [MaNM]) VALUES (N'M038      ', N'LẨU ẾCH MĂNG CAY', 400000, N'NM05      ')
INSERT [dbo].[MON] ([MaMon], [TenMon], [DonGia], [MaNM]) VALUES (N'M039      ', N'LẨU CÁ QUẢ', 350000, N'NM05      ')
INSERT [dbo].[MON] ([MaMon], [TenMon], [DonGia], [MaNM]) VALUES (N'M040      ', N'LẨU CÁ CHÉP NẤU RIÊU', 380000, N'NM05      ')
INSERT [dbo].[MON] ([MaMon], [TenMon], [DonGia], [MaNM]) VALUES (N'M041      ', N'LẨU GÀ NÂM TƯƠI', 550000, N'NM05      ')
INSERT [dbo].[MON] ([MaMon], [TenMon], [DonGia], [MaNM]) VALUES (N'M042      ', N'LẨU CHÁO CHIM CÂU', 600000, N'NM05      ')
INSERT [dbo].[MON] ([MaMon], [TenMon], [DonGia], [MaNM]) VALUES (N'M043      ', N'LẨU CHIM RỪNG', 700000, N'NM05      ')
INSERT [dbo].[MON] ([MaMon], [TenMon], [DonGia], [MaNM]) VALUES (N'M044      ', N'LẨU  LỢN RỪNG TÍA TÔ', 700000, N'NM05      ')
INSERT [dbo].[MON] ([MaMon], [TenMon], [DonGia], [MaNM]) VALUES (N'M045      ', N'LẨU GÀ RƯỢU VANG', 600000, N'NM05      ')
INSERT [dbo].[MON] ([MaMon], [TenMon], [DonGia], [MaNM]) VALUES (N'M046      ', N'LẨU SƯỜN', 500000, N'NM05      ')
INSERT [dbo].[MON] ([MaMon], [TenMon], [DonGia], [MaNM]) VALUES (N'M047      ', N'LẨU CÁ LĂNG', 500000, N'NM05      ')
INSERT [dbo].[MON] ([MaMon], [TenMon], [DonGia], [MaNM]) VALUES (N'M048      ', N'DÊ NƯỚNG TẢNG', 180000, N'NM06      ')
INSERT [dbo].[MON] ([MaMon], [TenMon], [DonGia], [MaNM]) VALUES (N'M049      ', N'DÊ TÁI CHANH', 150000, N'NM06      ')
INSERT [dbo].[MON] ([MaMon], [TenMon], [DonGia], [MaNM]) VALUES (N'M051      ', N'DÊ HẤP TÍA TÔ', 300000, N'NM06      ')
INSERT [dbo].[MON] ([MaMon], [TenMon], [DonGia], [MaNM]) VALUES (N'M052      ', N'DÊ HẦM HẢI SÂM', 160000, N'NM06      ')
INSERT [dbo].[MON] ([MaMon], [TenMon], [DonGia], [MaNM]) VALUES (N'M053      ', N'CHÂN DÊ RANG MUỐI', 180000, N'NM06      ')
INSERT [dbo].[MON] ([MaMon], [TenMon], [DonGia], [MaNM]) VALUES (N'M054      ', N'CHÂN DÊ HẦM THUỐC BẮC', 180000, N'NM06      ')
INSERT [dbo].[MON] ([MaMon], [TenMon], [DonGia], [MaNM]) VALUES (N'M055      ', N'LẨU DÊ', 700000, N'NM06      ')
INSERT [dbo].[MON] ([MaMon], [TenMon], [DonGia], [MaNM]) VALUES (N'M056      ', N'DÊ XÀO LĂN', 180000, N'NM06      ')
INSERT [dbo].[MON] ([MaMon], [TenMon], [DonGia], [MaNM]) VALUES (N'M057      ', N'MỰC XÀO THẬP CẨM', 180000, N'NM07      ')
INSERT [dbo].[MON] ([MaMon], [TenMon], [DonGia], [MaNM]) VALUES (N'M058      ', N'MỰC CHIÊN BƠ', 180000, N'NM07      ')
INSERT [dbo].[MON] ([MaMon], [TenMon], [DonGia], [MaNM]) VALUES (N'M059      ', N'MỰC TRỨNG NƯỚNG MUỐI ỚT', 180000, N'NM07      ')
INSERT [dbo].[MON] ([MaMon], [TenMon], [DonGia], [MaNM]) VALUES (N'M060      ', N'SÚP CÁ HÔI', 15000, N'NM07      ')
INSERT [dbo].[MON] ([MaMon], [TenMon], [DonGia], [MaNM]) VALUES (N'M061      ', N'CÁ HỒI SỐT CHANH LEO', 400000, N'NM07      ')
INSERT [dbo].[MON] ([MaMon], [TenMon], [DonGia], [MaNM]) VALUES (N'M062      ', N'ẾCH CHIÊN BƠ', 120000, N'NM07      ')
INSERT [dbo].[MON] ([MaMon], [TenMon], [DonGia], [MaNM]) VALUES (N'M063      ', N'TÔM SÔNG CHAO', 100000, N'NM07      ')
INSERT [dbo].[MON] ([MaMon], [TenMon], [DonGia], [MaNM]) VALUES (N'M064      ', N'GHẸ HẤP', 180000, N'NM07      ')
INSERT [dbo].[MON] ([MaMon], [TenMon], [DonGia], [MaNM]) VALUES (N'M065      ', N'TÔM HẤP SẢ', 180000, N'NM07      ')
INSERT [dbo].[MON] ([MaMon], [TenMon], [DonGia], [MaNM]) VALUES (N'M066      ', N'GỎI TÔM', 250000, N'NM07      ')
INSERT [dbo].[MON] ([MaMon], [TenMon], [DonGia], [MaNM]) VALUES (N'M067      ', N'BA BA LẨU RƯỢU VANG', 800000, N'NM07      ')
INSERT [dbo].[MON] ([MaMon], [TenMon], [DonGia], [MaNM]) VALUES (N'M068      ', N'BA BA RANG MUỐI', 160000, N'NM07      ')
INSERT [dbo].[MON] ([MaMon], [TenMon], [DonGia], [MaNM]) VALUES (N'M069      ', N'CÁ CHÉP CHIÊN XÙ', 180000, N'NM07      ')
INSERT [dbo].[MON] ([MaMon], [TenMon], [DonGia], [MaNM]) VALUES (N'M070      ', N'CANH CUA MÙNG TƠI', 40000, N'NM08      ')
INSERT [dbo].[MON] ([MaMon], [TenMon], [DonGia], [MaNM]) VALUES (N'M071      ', N'CANH CÁ NẤU RIÊU', 90000, N'NM08      ')
INSERT [dbo].[MON] ([MaMon], [TenMon], [DonGia], [MaNM]) VALUES (N'M072      ', N'CANH ĐẦU CÁ', 90000, N'NM08      ')
INSERT [dbo].[MON] ([MaMon], [TenMon], [DonGia], [MaNM]) VALUES (N'M073      ', N'CANH CẢI THỊT', 40000, N'NM08      ')
INSERT [dbo].[MON] ([MaMon], [TenMon], [DonGia], [MaNM]) VALUES (N'M074      ', N'CANH DƯA CHUA HẤP BÒ', 120000, N'NM08      ')
INSERT [dbo].[MON] ([MaMon], [TenMon], [DonGia], [MaNM]) VALUES (N'M075      ', N'CANH THỊT CHUA', 40000, N'NM08      ')
INSERT [dbo].[MON] ([MaMon], [TenMon], [DonGia], [MaNM]) VALUES (N'M076      ', N'GÀ HẤP LÁ CHANH', 170000, N'NM09      ')
INSERT [dbo].[MON] ([MaMon], [TenMon], [DonGia], [MaNM]) VALUES (N'M077      ', N'GÀ NƯỚNG LU', 180000, N'NM09      ')
INSERT [dbo].[MON] ([MaMon], [TenMon], [DonGia], [MaNM]) VALUES (N'M078      ', N'VỊT CHIÊN NAY', 180000, N'NM09      ')
INSERT [dbo].[MON] ([MaMon], [TenMon], [DonGia], [MaNM]) VALUES (N'M079      ', N'VỊT QUAY', 300000, N'NM09      ')
INSERT [dbo].[MON] ([MaMon], [TenMon], [DonGia], [MaNM]) VALUES (N'M080      ', N'VỊT OM SẤU', 300000, N'NM09      ')
INSERT [dbo].[MON] ([MaMon], [TenMon], [DonGia], [MaNM]) VALUES (N'M081      ', N'COCACOLA', 15000, N'NM10      ')
INSERT [dbo].[MON] ([MaMon], [TenMon], [DonGia], [MaNM]) VALUES (N'M082      ', N'NƯỚC CAM', 15000, N'NM10      ')
INSERT [dbo].[MON] ([MaMon], [TenMon], [DonGia], [MaNM]) VALUES (N'M083      ', N'NƯỚC KHOÁNG', 10000, N'NM10      ')
INSERT [dbo].[MON] ([MaMon], [TenMon], [DonGia], [MaNM]) VALUES (N'M084      ', N'RƯỢU', 70000, N'NM10      ')
INSERT [dbo].[MON] ([MaMon], [TenMon], [DonGia], [MaNM]) VALUES (N'M085      ', N'BIA', 10000, N'NM10      ')
INSERT [dbo].[MON] ([MaMon], [TenMon], [DonGia], [MaNM]) VALUES (N'M086      ', N'RƯỢU Nghi An', 11111, N'NM10      ')
GO
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [NgaySinh], [DiaChi], [GT], [SDT], [Luong], [MaBP]) VALUES (N'NV01      ', N'PHẠM QUANG ĐẢO', CAST(N'2000-04-02' AS Date), N'NGHỆ AN', N'NAM', 865659232, 50000000, N'BP01      ')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [NgaySinh], [DiaChi], [GT], [SDT], [Luong], [MaBP]) VALUES (N'NV02      ', N'NGUYỄN ĐỨC ANH', CAST(N'2000-01-05' AS Date), N'THANH HÓA', N'NAM', 975659232, 30000000, N'BP01      ')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [NgaySinh], [DiaChi], [GT], [SDT], [Luong], [MaBP]) VALUES (N'NV03      ', N'NGUYỄN THU THỦY', CAST(N'2000-12-02' AS Date), N'NGHỆ AN', N'NỮ ', 163459232, 10000000, N'BP02      ')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [NgaySinh], [DiaChi], [GT], [SDT], [Luong], [MaBP]) VALUES (N'NV04      ', N'BÙI ĐỨC ANH', CAST(N'2000-01-02' AS Date), N'THÁI BÌNH', N'NAM', 365651333, 7000000, N'BP02      ')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [NgaySinh], [DiaChi], [GT], [SDT], [Luong], [MaBP]) VALUES (N'NV05      ', N'LẠI TIẾN ĐẠT', CAST(N'2000-03-05' AS Date), N'HÀ NAM', N'NAM', 985659298, 9000000, N'BP03      ')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [NgaySinh], [DiaChi], [GT], [SDT], [Luong], [MaBP]) VALUES (N'NV06      ', N'VŨ VĂN A', CAST(N'1998-11-05' AS Date), N'HÀ NAM', N'NAM', 985659768, 7000000, N'BP03      ')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [NgaySinh], [DiaChi], [GT], [SDT], [Luong], [MaBP]) VALUES (N'NV07      ', N'NGUYỄN THỊ A', CAST(N'2000-10-05' AS Date), N'HÀ NỘI', N'NỮ ', 885609298, 7000000, N'BP03      ')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [NgaySinh], [DiaChi], [GT], [SDT], [Luong], [MaBP]) VALUES (N'NV08      ', N'NGUYỄN NHƯ QUỲNH', CAST(N'2000-11-11' AS Date), N'HẢI PHÒNG', N'NỮ ', 775659298, 7000000, N'BP03      ')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [NgaySinh], [DiaChi], [GT], [SDT], [Luong], [MaBP]) VALUES (N'NV09      ', N'NGUYỄN ĐỨC KHẢI', CAST(N'2000-09-05' AS Date), N'HÀ NAM', N'NAM', 987656298, 7000000, N'BP03      ')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [NgaySinh], [DiaChi], [GT], [SDT], [Luong], [MaBP]) VALUES (N'NV10      ', N'LỆ THỊ TÚ', CAST(N'1999-12-01' AS Date), N'THANH HÓA', N'NỮ ', 285659298, 7000000, N'BP03      ')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [NgaySinh], [DiaChi], [GT], [SDT], [Luong], [MaBP]) VALUES (N'NV11      ', N'TRẦN ĐỨC BO', CAST(N'2000-03-25' AS Date), N'BÌNH ĐỊNH', N'NAM', 981699298, 7000000, N'BP03      ')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [NgaySinh], [DiaChi], [GT], [SDT], [Luong], [MaBP]) VALUES (N'NV12      ', N'NGUYỄN THÀNH ĐẠT', CAST(N'1998-11-11' AS Date), N'NGHỆ AN', N'NAM', 892659298, 7000000, N'BP04      ')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [NgaySinh], [DiaChi], [GT], [SDT], [Luong], [MaBP]) VALUES (N'NV13      ', N'LÊ TRUNG QUÂN', CAST(N'1999-07-11' AS Date), N'HÀ NỘI', N'NAM', 892677298, 7000000, N'BP04      ')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [NgaySinh], [DiaChi], [GT], [SDT], [Luong], [MaBP]) VALUES (N'NV14      ', N'NGUYỄN VĂN A', CAST(N'1999-03-05' AS Date), N'HẢI DƯƠNG', N'NAM', 865659444, 7000000, N'BP05      ')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [NgaySinh], [DiaChi], [GT], [SDT], [Luong], [MaBP]) VALUES (N'NV15      ', N'NGUYỄN THỊ B', CAST(N'1999-01-05' AS Date), N'NINH BÌNH', N'NỮ ', 865659444, 7000000, N'BP05      ')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [NgaySinh], [DiaChi], [GT], [SDT], [Luong], [MaBP]) VALUES (N'NV16      ', N'NGUYỄN THỊ LƯỢNG', CAST(N'1998-10-05' AS Date), N'NINH BÌNH', N'NỮ ', 865659444, 7000000, N'BP05      ')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [NgaySinh], [DiaChi], [GT], [SDT], [Luong], [MaBP]) VALUES (N'NV17      ', N'PHẠM THỊ THẢO', CAST(N'1999-04-05' AS Date), N'THÁI BÌNH', N'NỮ ', 765659244, 9000000, N'BP06      ')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [NgaySinh], [DiaChi], [GT], [SDT], [Luong], [MaBP]) VALUES (N'NV18      ', N'PHẠM QUỐC ĐẠT', CAST(N'2000-09-09' AS Date), N'HÀ TĨNH', N'NAM', 262629789, 9000000, N'BP06      ')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [NgaySinh], [DiaChi], [GT], [SDT], [Luong], [MaBP]) VALUES (N'NV19      ', N'NGUYỄN TÂN CƯƠNG', CAST(N'2000-10-01' AS Date), N'NGHỆ AN', N'NAM', 768745244, 9000000, N'BP06      ')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [NgaySinh], [DiaChi], [GT], [SDT], [Luong], [MaBP]) VALUES (N'NV20      ', N'NGUYỄN QUÔC BẢO', CAST(N'2000-10-08' AS Date), N'NGHỆ AN', N'NAM', 768745266, 9000000, N'BP06      ')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [NgaySinh], [DiaChi], [GT], [SDT], [Luong], [MaBP]) VALUES (N'NV21      ', N'LAI QUANG ANH', CAST(N'1999-10-02' AS Date), N'HÀ NAM', N'NAM', 998745244, 5000000, N'BP07      ')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [NgaySinh], [DiaChi], [GT], [SDT], [Luong], [MaBP]) VALUES (N'NV22      ', N'HÀ TRỌNG TRUNG', CAST(N'2000-10-02' AS Date), N'PHÚ THỌ', N'NAM', 998745343, 5000000, N'BP07      ')
GO
INSERT [dbo].[NHOMMON] ([MaNM], [TenNM]) VALUES (N'NM01      ', N'TRÂU VÀ BÒ')
INSERT [dbo].[NHOMMON] ([MaNM], [TenNM]) VALUES (N'NM02      ', N'RAU')
INSERT [dbo].[NHOMMON] ([MaNM], [TenNM]) VALUES (N'NM03      ', N'NỘM VÀ SALAD')
INSERT [dbo].[NHOMMON] ([MaNM], [TenNM]) VALUES (N'NM04      ', N'LỢN')
INSERT [dbo].[NHOMMON] ([MaNM], [TenNM]) VALUES (N'NM05      ', N'LẨU CÁC LOẠI')
INSERT [dbo].[NHOMMON] ([MaNM], [TenNM]) VALUES (N'NM06      ', N'DÊ')
INSERT [dbo].[NHOMMON] ([MaNM], [TenNM]) VALUES (N'NM07      ', N'THỦY HẢI SẢN')
INSERT [dbo].[NHOMMON] ([MaNM], [TenNM]) VALUES (N'NM08      ', N'CANH CÁC MÓN')
INSERT [dbo].[NHOMMON] ([MaNM], [TenNM]) VALUES (N'NM09      ', N'VỊT VÀ GÀ')
INSERT [dbo].[NHOMMON] ([MaNM], [TenNM]) VALUES (N'NM10      ', N'NƯỚC UỐNG')
GO
INSERT [dbo].[PHIEUYEUCAU] ([MaPYC], [NgayViet], [TrangThai], [MaKH], [MaNV], [GiamGia], [TongTien]) VALUES (N'PYC000001 ', CAST(N'2021-05-07' AS Date), N'0', NULL, N'NV01      ', 0, NULL)
INSERT [dbo].[PHIEUYEUCAU] ([MaPYC], [NgayViet], [TrangThai], [MaKH], [MaNV], [GiamGia], [TongTien]) VALUES (N'PYC000002 ', CAST(N'2021-05-07' AS Date), N'1', N'KH0027    ', N'NV01      ', 0, 120000)
INSERT [dbo].[PHIEUYEUCAU] ([MaPYC], [NgayViet], [TrangThai], [MaKH], [MaNV], [GiamGia], [TongTien]) VALUES (N'PYC000003 ', CAST(N'2021-05-07' AS Date), N'1', N'KH0028    ', N'NV01      ', 0, 450000)
INSERT [dbo].[PHIEUYEUCAU] ([MaPYC], [NgayViet], [TrangThai], [MaKH], [MaNV], [GiamGia], [TongTien]) VALUES (N'PYC000004 ', CAST(N'2021-05-08' AS Date), N'0', NULL, NULL, 0, NULL)
INSERT [dbo].[PHIEUYEUCAU] ([MaPYC], [NgayViet], [TrangThai], [MaKH], [MaNV], [GiamGia], [TongTien]) VALUES (N'PYC000005 ', CAST(N'2021-05-08' AS Date), N'1', N'KH0030    ', N'NV02      ', 0, 300000)
INSERT [dbo].[PHIEUYEUCAU] ([MaPYC], [NgayViet], [TrangThai], [MaKH], [MaNV], [GiamGia], [TongTien]) VALUES (N'PYC000006 ', CAST(N'2021-05-08' AS Date), N'1', N'KH0029    ', N'NV02      ', 0, 420000)
INSERT [dbo].[PHIEUYEUCAU] ([MaPYC], [NgayViet], [TrangThai], [MaKH], [MaNV], [GiamGia], [TongTien]) VALUES (N'PYC000007 ', CAST(N'2021-05-09' AS Date), N'0', NULL, NULL, 0, NULL)
GO
SET IDENTITY_INSERT [dbo].[PHIEUYEUCAU_MON] ON 

INSERT [dbo].[PHIEUYEUCAU_MON] ([MaPYC], [MaMon], [SoLuong], [Id]) VALUES (N'PYC000001 ', N'M001      ', 1, 36)
INSERT [dbo].[PHIEUYEUCAU_MON] ([MaPYC], [MaMon], [SoLuong], [Id]) VALUES (N'PYC000001 ', N'M004      ', 1, 37)
INSERT [dbo].[PHIEUYEUCAU_MON] ([MaPYC], [MaMon], [SoLuong], [Id]) VALUES (N'PYC000002 ', N'M001      ', 1, 38)
INSERT [dbo].[PHIEUYEUCAU_MON] ([MaPYC], [MaMon], [SoLuong], [Id]) VALUES (N'PYC000003 ', N'M006      ', 2, 39)
INSERT [dbo].[PHIEUYEUCAU_MON] ([MaPYC], [MaMon], [SoLuong], [Id]) VALUES (N'PYC000003 ', N'M004      ', 1, 40)
INSERT [dbo].[PHIEUYEUCAU_MON] ([MaPYC], [MaMon], [SoLuong], [Id]) VALUES (N'PYC000005 ', N'M002      ', 1, 41)
INSERT [dbo].[PHIEUYEUCAU_MON] ([MaPYC], [MaMon], [SoLuong], [Id]) VALUES (N'PYC000005 ', N'M003      ', 1, 42)
INSERT [dbo].[PHIEUYEUCAU_MON] ([MaPYC], [MaMon], [SoLuong], [Id]) VALUES (N'PYC000006 ', N'M001      ', 1, 43)
INSERT [dbo].[PHIEUYEUCAU_MON] ([MaPYC], [MaMon], [SoLuong], [Id]) VALUES (N'PYC000006 ', N'M004      ', 1, 44)
INSERT [dbo].[PHIEUYEUCAU_MON] ([MaPYC], [MaMon], [SoLuong], [Id]) VALUES (N'PYC000006 ', N'M002      ', 1, 45)
INSERT [dbo].[PHIEUYEUCAU_MON] ([MaPYC], [MaMon], [SoLuong], [Id]) VALUES (N'PYC000007 ', N'M001      ', 1, 46)
SET IDENTITY_INSERT [dbo].[PHIEUYEUCAU_MON] OFF
GO
ALTER TABLE [dbo].[BAN]  WITH CHECK ADD  CONSTRAINT [FK_BAN_MAPYC] FOREIGN KEY([MaPYC])
REFERENCES [dbo].[PHIEUYEUCAU] ([MaPYC])
GO
ALTER TABLE [dbo].[BAN] CHECK CONSTRAINT [FK_BAN_MAPYC]
GO
ALTER TABLE [dbo].[MON]  WITH CHECK ADD FOREIGN KEY([MaNM])
REFERENCES [dbo].[NHOMMON] ([MaNM])
GO
ALTER TABLE [dbo].[NHANVIEN]  WITH CHECK ADD FOREIGN KEY([MaBP])
REFERENCES [dbo].[BOPHAN] ([MaBP])
GO
ALTER TABLE [dbo].[PHIEUYEUCAU]  WITH CHECK ADD FOREIGN KEY([MaKH])
REFERENCES [dbo].[KHACHHANG] ([MaKH])
GO
ALTER TABLE [dbo].[PHIEUYEUCAU]  WITH CHECK ADD FOREIGN KEY([MaNV])
REFERENCES [dbo].[NHANVIEN] ([MaNV])
GO
ALTER TABLE [dbo].[PHIEUYEUCAU_MON]  WITH CHECK ADD FOREIGN KEY([MaMon])
REFERENCES [dbo].[MON] ([MaMon])
GO
ALTER TABLE [dbo].[PHIEUYEUCAU_MON]  WITH CHECK ADD FOREIGN KEY([MaPYC])
REFERENCES [dbo].[PHIEUYEUCAU] ([MaPYC])
GO
ALTER TABLE [dbo].[NHANVIEN]  WITH CHECK ADD CHECK  (([GT]=N'Nữ' OR [GT]='NAM'))
GO
/****** Object:  StoredProcedure [dbo].[GetChiTietBan]    Script Date: 10/05/2021 10:50:55 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[GetChiTietBan]
as
begin
	select  b.MaBan,MON.TenMon,pyc_m.DonGia,pyc_m.SoLuong,(pyc_m.DonGia*pyc_m.SoLuong) as N'Thành Tiền'
	from PHIEUYEUCAU pyc,PHIEUYEUCAU_MON pyc_m,BAN b,MON
	where pyc.MaPYC = b.MaPYC and MON.MaMon = pyc_m.MaMon and pyc_m.MaPYC = pyc.MaPYC
end
GO
/****** Object:  StoredProcedure [dbo].[HoaDonByMaBan]    Script Date: 10/05/2021 10:50:55 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[HoaDonByMaBan]
@MaBan char(50)
as
begin
	select m.TenMon as fooodName,pyc_m.SoLuong as count,m.DonGia as price,m.DonGia*pyc_m.SoLuong as totalPrice from BAN b,PHIEUYEUCAU pyc,PHIEUYEUCAU_MON pyc_m,MON m
where b.MaPYC = pyc.MaPYC and pyc.MaPYC = pyc_m.MaPYC and pyc.TrangThai = 0  
        and m.MaMon = pyc_m.MaMon and b.MaBan = @MaBan
end
GO
/****** Object:  StoredProcedure [dbo].[spBillFood]    Script Date: 10/05/2021 10:50:55 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spBillFood]
(@MaPYC char(50),@MaMon char(10), @SoLuong int)
as
begin
	insert into PHIEUYEUCAU_MON(MaPYC,MaMon,SoLuong)
    values(@MaPYC,@MaMon,@SoLuong)
end
GO
/****** Object:  StoredProcedure [dbo].[spDeleteBoPhan]    Script Date: 10/05/2021 10:50:55 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spDeleteBoPhan]
(
	@MaBP		char(10)
)
as
begin
	Delete BOPHAN
	where  MaBP = @MaBP
end
GO
/****** Object:  StoredProcedure [dbo].[spDeleteKhachHang]    Script Date: 10/05/2021 10:50:55 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spDeleteKhachHang]
(
	@MaKH		char(10)
)
as
begin
	delete KHACHHANG  
	where MaKH = @MaKH
end
GO
/****** Object:  StoredProcedure [dbo].[spDeleteNhomMonByMaNM]    Script Date: 10/05/2021 10:50:55 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spDeleteNhomMonByMaNM]
(
	@MaNM		char(10)
)
as
begin
	Delete NHOMMON
	where MaNM = @MaNM
end
GO
/****** Object:  StoredProcedure [dbo].[spGetBan]    Script Date: 10/05/2021 10:50:55 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[spGetBan]
as
begin
	select MaBan,TinhTrang
	from BAN
end
GO
/****** Object:  StoredProcedure [dbo].[spGetBoPhan]    Script Date: 10/05/2021 10:50:55 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spGetBoPhan]
as
begin
	select MaBP,TenBP,TruongBP
	from BOPHAN
end
GO
/****** Object:  StoredProcedure [dbo].[spGetDanhSachBan_GoiMon]    Script Date: 10/05/2021 10:50:55 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spGetDanhSachBan_GoiMon]
as
begin
	select distinct BAN.MaBan as N'Tên Bàn'
	from BAN,PHIEUYEUCAU
	where BAN.MaPYC = PHIEUYEUCAU.MaPYC
	order by BAN.MaBan
end
GO
/****** Object:  StoredProcedure [dbo].[spGetDanhSachBan_NotGoiMon]    Script Date: 10/05/2021 10:50:55 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------- Hien Thi Ban- chua goi mon ------------*/
create proc [dbo].[spGetDanhSachBan_NotGoiMon]
as
begin
	select distinct BAN.MaBan as N'Tên Bàn'
	from BAN 
	where BAN.MaPYC is NULL
end
GO
/****** Object:  StoredProcedure [dbo].[spGetHoaDon]    Script Date: 10/05/2021 10:50:55 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
----

CREATE proc [dbo].[spGetHoaDon] 
@date1 date,@date2 date
as
begin
	select b.MaBan as [Tên Bàn],pyc.MaPYC as [Mã Hóa Đơn],pyc.TongTien as [Tổng Tiền],NgayViet as [Ngày Viết],GiamGia as [Giảm Giá] from PHIEUYEUCAU pyc,BAN b
	where @date2 >= '20210505' and @date1 <= '20210508' and b.MaPYC = pyc.MaPYC and pyc.TrangThai = 1
end
GO
/****** Object:  StoredProcedure [dbo].[spGetKhachHang]    Script Date: 10/05/2021 10:50:55 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[spGetKhachHang]
as
begin
	select MaKH,TenKH,SDT
	from KHACHHANG
end
GO
/****** Object:  StoredProcedure [dbo].[spGetKhachHangByMaKH]    Script Date: 10/05/2021 10:50:55 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spGetKhachHangByMaKH]
(
	@MaKH		char(10)
)
as
begin
	select MaKH,TenKH,SDT
	from KHACHHANG
	where MaKH = @MaKH
end
GO
/****** Object:  StoredProcedure [dbo].[spGetMaPYC]    Script Date: 10/05/2021 10:50:55 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[spGetMaPYC]
as
begin
	select max(MaPYC) from PHIEUYEUCAU
end
GO
/****** Object:  StoredProcedure [dbo].[spGetMonByNhomMon]    Script Date: 10/05/2021 10:50:55 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[spGetMonByNhomMon]
@MaNM char(50)
as
begin
	select MaMon ,TenMon, DonGia,MaNM  from MON where MaNM = @MaNM
end
GO
/****** Object:  StoredProcedure [dbo].[spgetNhanVien]    Script Date: 10/05/2021 10:50:55 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[spgetNhanVien]
as
begin
   select MaNV,TenNV,NgaySinh,DiaChi,GT,SDT,Luong,BOPHAN.TenBP 
from NHANVIEN,BOPHAN where NHANVIEN.MaBP = BOPHAN.MaBP
end
GO
/****** Object:  StoredProcedure [dbo].[spGetNhomMon]    Script Date: 10/05/2021 10:50:55 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spGetNhomMon]
as
begin
	select MaNM,TenNM
	from NHOMMON
end
GO
/****** Object:  StoredProcedure [dbo].[spGetTenBoPhan]    Script Date: 10/05/2021 10:50:55 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spGetTenBoPhan]
as
begin
	select TenBP
	from BOPHAN
end
GO
/****** Object:  StoredProcedure [dbo].[spInsertBan]    Script Date: 10/05/2021 10:50:55 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[spInsertBan]
as
begin
	Insert into BAN(MaBan,TinhTrang,MaPYC)
	values(dbo.fcgetIdBan(),N'TRỐNG',null)
end
GO
/****** Object:  StoredProcedure [dbo].[spInsertBillFood]    Script Date: 10/05/2021 10:50:55 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[spInsertBillFood]
(@MaPYC char(50),@MaMon char(10), @SoLuong int)
as
begin
	declare @isExitsBillFood char;
	declare @FoodCount int = 1;
	select @isExitsBillFood = MaPYC, @FoodCount = SoLuong 
	from PHIEUYEUCAU_MON 
	where MaPYC = @MaPYC and MaMon = @MaMon
	if(@isExitsBillFood != '')
		begin	
			 declare @newCount int =  @FoodCount + @SoLuong 
			 if(@newCount > 0)
			 update PHIEUYEUCAU_MON set SoLuong = @FoodCount + @SoLuong where MaMon = @MaMon and MaPYC = @MaPYC
			 else 
			 delete PHIEUYEUCAU_MON where  MaPYC = @MaPYC and MaMon = @MaMon
		end
	else
		begin
			 insert into  PHIEUYEUCAU_MON(MaPYC,MaMon,SoLuong)
			 values(@MaPYC,@MaMon,@SoLuong)
		end

end
GO
/****** Object:  StoredProcedure [dbo].[spInsertBoPhan]    Script Date: 10/05/2021 10:50:55 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------- Insert Bo Phan ------------*/
create proc [dbo].[spInsertBoPhan]
(
	@MaBP		char(10),
	@TenBP		nvarchar(100),
	@TruongBP	char(50)
)
as
begin
	Insert into BOPHAN(MaBP,TenBP,TruongBP)
	values(@MaBP,@TenBP,@TruongBP)
end
GO
/****** Object:  StoredProcedure [dbo].[spInsertKH]    Script Date: 10/05/2021 10:50:55 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[spInsertKH]
(
	@Ten  nvarchar(100),
	@Sdt int
)
as
begin
	insert into KHACHHANG
	values(dbo.fcgetMaKH(),@Ten,@Sdt)
end
GO
/****** Object:  StoredProcedure [dbo].[spInsertKhachHang]    Script Date: 10/05/2021 10:50:55 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spInsertKhachHang]
(
	@MaKH		char(10),
	@TenKH		nvarchar(40),
	@SDT		int
)
as
begin
	insert into KHACHHANG(MaKH,TenKH,SDT)
	values(@MaKH,@TenKH,@SDT)
end
GO
/****** Object:  StoredProcedure [dbo].[spInsertMon]    Script Date: 10/05/2021 10:50:55 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[spInsertMon]
(
	@TenMon		nvarchar(100),
	@DonGia		int,
	@MaNM		char(10)
)
as
begin
	insert into MON(MaMon,TenMon,DonGia,MaNM)
	values(dbo.fcgetIdMon(),@TenMon,@DonGia,@MaNM)	
end
GO
/****** Object:  StoredProcedure [dbo].[spInsertNhanVien]    Script Date: 10/05/2021 10:50:55 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[spInsertNhanVien]
(
	   @TenNV			nvarchar(50),
	   @NgaySinh		date,
	   @DiaChi          nvarchar(200),
	   @GT				nchar(10),
	   @SDT				int,
	   @Luong			int,
	   @TenBP			nvarchar(100)
)
as
begin
   declare @MaBP char(10)
   select @MaBP = MaBP from BOPHAN where TenBP = @TenBP

   insert into NHANVIEN(MaNV,TenNV,NgaySinh,DiaChi,GT,SDT,Luong,MaBP)
   values(dbo.fcgetIdNhanVien(),@TenNV,@NgaySinh,@DiaChi,@GT,@SDT,@Luong,@MaBP)
end
GO
/****** Object:  StoredProcedure [dbo].[spInsertPYC]    Script Date: 10/05/2021 10:50:55 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[spInsertPYC]
as
begin
insert into PHIEUYEUCAU(MaPYC,NgayViet,TrangThai,MaKH,MaNV,GiamGia)
values (dbo.fcgetMaPYC(),GETDATE(),0,null,null,0)
end
GO
/****** Object:  StoredProcedure [dbo].[spInsertPhieuYeuCau]    Script Date: 10/05/2021 10:50:55 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spInsertPhieuYeuCau]
@MaPYC char(50)
as
begin
	insert into PHIEUYEUCAU(MaPYC,NgayViet,TrangThai,MaKH,MaNV)
	values (@MaPYC,GETDATE(),0,null,null)
end
GO
/****** Object:  StoredProcedure [dbo].[spLogin]    Script Date: 10/05/2021 10:50:55 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROC [dbo].[spLogin]
( @userName nvarchar(100),
  @passWord nvarchar(100)
)
as begin
	select * from ACCOUNT where UserName = @userName and MatKhau = @passWord;
end
GO
/****** Object:  StoredProcedure [dbo].[spSearchNhanVien]    Script Date: 10/05/2021 10:50:55 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[spSearchNhanVien]
@TenNV char(10)
as
begin
   select MaNV,TenNV,NgaySinh,DiaChi,GT,SDT,Luong,BOPHAN.TenBP 
   from NHANVIEN,BOPHAN where NHANVIEN.MaBP = BOPHAN.MaBP and dbo.GetUnsignString(TenNV) like '%'+dbo.GetUnsignString('@TenNV')+'%'
end
GO
/****** Object:  StoredProcedure [dbo].[spSwitchTable]    Script Date: 10/05/2021 10:50:55 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[spSwitchTable]
@idTable1 char(10) , @idTable2 char(10) 
as
begin
	declare @idFirstPYC char(10)
	declare @idSecondPYC char(10)

	declare @isFirstTableEmpty int = 1
	declare @isSecondTableEmpty int = 1

	select @idSecondPYC = Ban.MaPYC from Ban,PhieuYeuCau where Ban.MaPYC = PhieuYeuCau.MaPYC and  MaBan = @idTable2 and PhieuYeuCau.TrangThai = 0
	select @idFirstPYC = Ban.MaPYC from Ban,PhieuYeuCau where Ban.MaPYC = PhieuYeuCau.MaPYC and  MaBan = @idTable1 and PhieuYeuCau.TrangThai = 0

	if(@idFirstPYC is NULL)
	begin
		insert into PHIEUYEUCAU(MaPYC,NgayViet,TrangThai,MaKH,MaNV)
        values (dbo.fcgetMaPYC(),GETDATE(),0,null,null)
		update BAN set MaPYC = (select max(PHIEUYEUCAU.MaPYC) from PHIEUYEUCAU) where MaBan = @idTable1	
		select @idFirstPYC = MaPYC from BAN where BAN.MaBan = @idTable1
	end

	select @isFirstTableEmpty = count(*) from PHIEUYEUCAU_MON where MaPYC = @idFirstPYC

	if(@idSecondPYC is NULL)
	begin
		insert into PHIEUYEUCAU(MaPYC,NgayViet,TrangThai,MaKH,MaNV)
        values (dbo.fcgetMaPYC(),GETDATE(),0,null,null)
		update BAN set MaPYC = (select max(PHIEUYEUCAU.MaPYC) from PHIEUYEUCAU) where MaBan = @idTable2	
		select @idSecondPYC = MaPYC from BAN where BAN.MaBan = @idTable2		
	end

	select @isSecondTableEmpty = count(*) from PHIEUYEUCAU_MON where MaPYC = @idSecondPYC

	select Id into IdPYC_MonTable from PHIEUYEUCAU_MON where MaPYC = @idSecondPYC;
	update PHIEUYEUCAU_MON set MaPYC = @idSecondPYC where MaPYC = @idFirstPYC
	update PHIEUYEUCAU_MON set MaPYC = @idFirstPYC where Id in (select * from IdPYC_MonTable)

	drop table IdPYC_MonTable
	if(@isFirstTableEmpty = 0)
	update BAN set TinhTrang = N'TRỐNG' WHERE MaBan = @idTable2;
	if(@isSecondTableEmpty = 0)
	update BAN set TinhTrang = N'TRỐNG' WHERE MaBan = @idTable1;
	
end
GO
/****** Object:  StoredProcedure [dbo].[spUpdateAccount]    Script Date: 10/05/2021 10:50:55 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[spUpdateAccount]
@username nvarchar(100), @tenhienthi nvarchar(100), @matkhau nvarchar(100), @matkhaumoi nvarchar(100)
as
begin
	declare @isRightPass int
	select @isRightPass = count(*) from ACCOUNT where UserName = @username and MatKhau = @matkhau
	if(@isRightPass = 1)
	begin
		if(@matkhaumoi = null or @matkhaumoi = '')
		begin
			update ACCOUNT set TenHienThi = @tenhienthi where UserName = @username
		end
		else
			update ACCOUNT set TenHienThi = @tenhienthi,MatKhau = @matkhaumoi where UserName = @username

	end
end
GO
/****** Object:  StoredProcedure [dbo].[spUpdateBan]    Script Date: 10/05/2021 10:50:55 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spUpdateBan]
(
	@MaBan			char(10),
	@TinhTrang		nvarchar(200),
	@MaPYC			char(10)
)
as
begin
	Update BAN set @TinhTrang = @TinhTrang,MaPYC = @MaPYC
	where MaBan = @MaBan
end
GO
/****** Object:  StoredProcedure [dbo].[spUpdateBanForPYC]    Script Date: 10/05/2021 10:50:55 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spUpdateBanForPYC]
(@MaPYC char(50),@MaBan char(50))
as
begin
	update BAN set MaPYC = @MaPYC
     where BAN.MaBan = @MaBan
end
GO
/****** Object:  StoredProcedure [dbo].[spUpdateBoPhan]    Script Date: 10/05/2021 10:50:55 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------- Update Bo Phan ------------*/
create proc [dbo].[spUpdateBoPhan]
(
	@MaBP		char(10),
	@TenBP		nvarchar(100),
	@TruongBP	char(50)
)
as
begin
	Update BOPHAN set TenBP = @TenBP,TruongBP = @TruongBP
	where MaBP = @MaBP
end
GO
/****** Object:  StoredProcedure [dbo].[spUpdateKhachHang]    Script Date: 10/05/2021 10:50:55 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spUpdateKhachHang]
(
	@MaKH		char(10),
	@TenKH		nvarchar(40),
	@SDT		int
)
as
begin
	update KHACHHANG set  TenKH = @TenKH,
						  SDT = @SDT
	where MaKH = @MaKH
end
GO
/****** Object:  StoredProcedure [dbo].[spUpdateKHNVforPYC]    Script Date: 10/05/2021 10:50:55 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spUpdateKHNVforPYC]
(
	@MaPYC char(10),
	@MaKH char(10),
	@MaNV char(10)
)
as
begin
update PHIEUYEUCAU set MaKH = @MaKH,MaNV = @MaNV where MaPYC = @MaPYC
end
GO
/****** Object:  StoredProcedure [dbo].[spUpdateMon]    Script Date: 10/05/2021 10:50:55 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spUpdateMon]
(
	@MaMon		char(10),
	@TenMon		nvarchar(100),
	@DonGia		int,
	@MaNM		char(10)
)
as
begin
	Update MON  set TenMon = @TenMon,DonGia = @DonGia,MaNM = @MaNM
	where MaMon = @MaMon
end
GO
/****** Object:  StoredProcedure [dbo].[spUpdateNhanVien]    Script Date: 10/05/2021 10:50:55 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[spUpdateNhanVien]
(      @MaNV            char(10),
	   @TenNV			nvarchar(50),
	   @NgaySinh		date,
	   @DiaChi          nvarchar(200),
	   @GT				nchar(10),
	   @SDT				int,
	   @Luong			int,
	   @TenBP			char(10)
)
as
begin
   declare @MaBP char(10)
   select @MaBP = MaBP from BOPHAN where TenBP = @TenBP
	update NHANVIEN set 
					TenNV = @TenNV,
					NgaySinh= @NgaySinh,
					DiaChi = @DiaChi,
					GT = @GT,
					SDT = @SDT,
					Luong = @Luong,
					MaBP = @MaBP
	where NHANVIEN.MaNV = @MaNV
end
GO
/****** Object:  StoredProcedure [dbo].[spUpdateNhomMonByMaNM]    Script Date: 10/05/2021 10:50:55 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spUpdateNhomMonByMaNM]
(
	@MaNM		char(10),
	@TenNM		nvarchar(100)
)
as
begin
	Update NHOMMON set TenNM = @TenNM
	where MaNM = @MaNM
end
GO
USE [master]
GO
ALTER DATABASE [QUANLYNHAHANG] SET  READ_WRITE 
GO
