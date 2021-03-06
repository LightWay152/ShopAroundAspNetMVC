USE [master]
GO
/****** Object:  Database [dbShopAround]    Script Date: 01-Jul-17 10:31:00 PM ******/
CREATE DATABASE [dbShopAround]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'dbShopAround', FILENAME = N'E:\WorkSpace\WebASP\Database\dbShopAround.mdf' , SIZE = 2097152KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1048576KB )
 LOG ON 
( NAME = N'dbShopAround_log', FILENAME = N'E:\WorkSpace\WebASP\Database\dbShopAround_log.ldf' , SIZE = 1048576KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [dbShopAround] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [dbShopAround].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [dbShopAround] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [dbShopAround] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [dbShopAround] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [dbShopAround] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [dbShopAround] SET ARITHABORT OFF 
GO
ALTER DATABASE [dbShopAround] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [dbShopAround] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [dbShopAround] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [dbShopAround] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [dbShopAround] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [dbShopAround] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [dbShopAround] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [dbShopAround] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [dbShopAround] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [dbShopAround] SET  DISABLE_BROKER 
GO
ALTER DATABASE [dbShopAround] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [dbShopAround] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [dbShopAround] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [dbShopAround] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [dbShopAround] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [dbShopAround] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [dbShopAround] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [dbShopAround] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [dbShopAround] SET  MULTI_USER 
GO
ALTER DATABASE [dbShopAround] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [dbShopAround] SET DB_CHAINING OFF 
GO
ALTER DATABASE [dbShopAround] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [dbShopAround] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [dbShopAround] SET DELAYED_DURABILITY = DISABLED 
GO
USE [dbShopAround]
GO
/****** Object:  Table [dbo].[nn_admin]    Script Date: 01-Jul-17 10:31:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[nn_admin](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[email] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_nn_admin] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[nn_category]    Script Date: 01-Jul-17 10:31:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[nn_category](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[order_id] [int] NULL,
	[active] [int] NULL,
 CONSTRAINT [PK_nn_category] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[nn_order]    Script Date: 01-Jul-17 10:31:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[nn_order](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[create_at] [datetime] NULL,
	[name] [nvarchar](50) NULL,
	[address] [nvarchar](500) NULL,
	[mobile] [nvarchar](50) NULL,
	[email] [nvarchar](50) NULL,
	[status] [int] NULL,
 CONSTRAINT [PK_nn_order] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[nn_order_detail]    Script Date: 01-Jul-17 10:31:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[nn_order_detail](
	[order_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[quantity] [int] NULL,
	[price] [decimal](18, 2) NULL,
 CONSTRAINT [PK_nn_order_detail] PRIMARY KEY CLUSTERED 
(
	[order_id] ASC,
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[nn_product]    Script Date: 01-Jul-17 10:31:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[nn_product](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[category_id] [int] NULL,
	[name] [nvarchar](50) NOT NULL,
	[price] [decimal](18, 2) NOT NULL,
	[description] [nvarchar](250) NOT NULL,
	[big_img_url] [nvarchar](500) NOT NULL,
	[small_img_url] [nvarchar](500) NULL,
	[quantity] [int] NULL,
	[qty_view] [int] NULL,
	[create_at] [datetime] NULL,
	[active] [int] NULL,
 CONSTRAINT [PK_nn_product] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[nn_user]    Script Date: 01-Jul-17 10:31:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[nn_user](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[email] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[mobile] [nvarchar](50) NOT NULL,
	[address] [nvarchar](500) NOT NULL,
	[dob] [datetime] NULL,
	[gender] [int] NULL,
	[create_at] [datetime] NULL,
	[active] [int] NULL,
 CONSTRAINT [PK_nn_user] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[nn_admin] ON 

INSERT [dbo].[nn_admin] ([id], [email], [password], [name]) VALUES (1, N'admin@gmail.com', N'123456', N'Admin')
SET IDENTITY_INSERT [dbo].[nn_admin] OFF
SET IDENTITY_INSERT [dbo].[nn_category] ON 

INSERT [dbo].[nn_category] ([id], [name], [order_id], [active]) VALUES (1, N'Áo thun nam', 1, 1)
INSERT [dbo].[nn_category] ([id], [name], [order_id], [active]) VALUES (2, N'Áo sơ mi nam', 2, 1)
INSERT [dbo].[nn_category] ([id], [name], [order_id], [active]) VALUES (3, N'Áo khoác nam', 3, 1)
INSERT [dbo].[nn_category] ([id], [name], [order_id], [active]) VALUES (4, N'Quần nam', 4, 1)
INSERT [dbo].[nn_category] ([id], [name], [order_id], [active]) VALUES (5, N'Phụ kiện nam', 5, 1)
INSERT [dbo].[nn_category] ([id], [name], [order_id], [active]) VALUES (6, N'Áo nữ', 6, 1)
INSERT [dbo].[nn_category] ([id], [name], [order_id], [active]) VALUES (7, N'Áo khoác nữ', 7, 1)
INSERT [dbo].[nn_category] ([id], [name], [order_id], [active]) VALUES (8, N'Đầm', 8, 1)
INSERT [dbo].[nn_category] ([id], [name], [order_id], [active]) VALUES (9, N'Quần nữ', 9, 1)
INSERT [dbo].[nn_category] ([id], [name], [order_id], [active]) VALUES (10, N'Phụ kiện nữ', 10, 1)
SET IDENTITY_INSERT [dbo].[nn_category] OFF
SET IDENTITY_INSERT [dbo].[nn_order] ON 

INSERT [dbo].[nn_order] ([id], [user_id], [create_at], [name], [address], [mobile], [email], [status]) VALUES (1, 1, NULL, N'Tèo', N'08 Nguyễn Văn Tráng, P. Bến Thành, Q. 1, Tp.HCM', N'09012345678', N'teo@gmail.com', 1)
INSERT [dbo].[nn_order] ([id], [user_id], [create_at], [name], [address], [mobile], [email], [status]) VALUES (2, 2, NULL, N'Tý', N'02 Tản Viên, Quận Tân Bình, Tp.HCM, Tản Viên', N'09012345699', N'ty@gmail.com', 0)
SET IDENTITY_INSERT [dbo].[nn_order] OFF
INSERT [dbo].[nn_order_detail] ([order_id], [product_id], [quantity], [price]) VALUES (1, 9, 10, CAST(54.45 AS Decimal(18, 2)))
INSERT [dbo].[nn_order_detail] ([order_id], [product_id], [quantity], [price]) VALUES (2, 23, 5, CAST(54.45 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[nn_product] ON 

INSERT [dbo].[nn_product] ([id], [category_id], [name], [price], [description], [big_img_url], [small_img_url], [quantity], [qty_view], [create_at], [active]) VALUES (4, 1, N'Áo thun nam 1', CAST(54.45 AS Decimal(18, 2)), N'Mô tả 1', N'big/aothunnam/aothunnam1.jpg', N'small/aothunnam/aothunnam1.jpg', 100, 15, NULL, 1)
INSERT [dbo].[nn_product] ([id], [category_id], [name], [price], [description], [big_img_url], [small_img_url], [quantity], [qty_view], [create_at], [active]) VALUES (5, 1, N'Áo thun nam 2', CAST(54.45 AS Decimal(18, 2)), N'Mô tả 2', N'big/aothunnam/aothunnam2.jpg', N'small/aothunnam/aothunnam2.jpg', 100, 20, NULL, 1)
INSERT [dbo].[nn_product] ([id], [category_id], [name], [price], [description], [big_img_url], [small_img_url], [quantity], [qty_view], [create_at], [active]) VALUES (6, 1, N'Áo thun nam 3', CAST(54.45 AS Decimal(18, 2)), N'Mô tả 3', N'big/aothunnam/aothunnam3.jpg', N'small/aothunnam/aothunnam3.jpg', 100, 25, NULL, 1)
INSERT [dbo].[nn_product] ([id], [category_id], [name], [price], [description], [big_img_url], [small_img_url], [quantity], [qty_view], [create_at], [active]) VALUES (7, 2, N'Áo sơ mi nam 1', CAST(54.45 AS Decimal(18, 2)), N'Mô tả 4', N'big/aosominam/aosominam1.jpg', N'small/aosominam/aosominam1.jpg', 100, 10, NULL, 1)
INSERT [dbo].[nn_product] ([id], [category_id], [name], [price], [description], [big_img_url], [small_img_url], [quantity], [qty_view], [create_at], [active]) VALUES (8, 2, N'Áo sơ mi nam 2', CAST(54.45 AS Decimal(18, 2)), N'Mô tả 5', N'big/aosominam/aosominam2.jpg', N'small/aosominam/aosominam2.jpg', 100, 12, NULL, 1)
INSERT [dbo].[nn_product] ([id], [category_id], [name], [price], [description], [big_img_url], [small_img_url], [quantity], [qty_view], [create_at], [active]) VALUES (9, 2, N'Áo sơ mi nam 3', CAST(54.45 AS Decimal(18, 2)), N'Mô tả 6', N'big/aosominam/aosominam3.jpg', N'small/aosominam/aosominam3.jpg', 100, 16, NULL, 1)
INSERT [dbo].[nn_product] ([id], [category_id], [name], [price], [description], [big_img_url], [small_img_url], [quantity], [qty_view], [create_at], [active]) VALUES (10, 3, N'Áo khoác nam 1', CAST(54.45 AS Decimal(18, 2)), N'Mô tả 7', N'big/aokhoacnam/aokhoacnam1.jpg', N'small/aokhoacnam/aokhoacnam1.jpg', 100, 21, NULL, 1)
INSERT [dbo].[nn_product] ([id], [category_id], [name], [price], [description], [big_img_url], [small_img_url], [quantity], [qty_view], [create_at], [active]) VALUES (11, 3, N'Áo khoác nam 2', CAST(54.45 AS Decimal(18, 2)), N'Mô tả 8', N'big/aokhoacnam/aokhoacnam2.jpg', N'small/aokhoacnam/aokhoacnam2.jpg', 100, 11, NULL, 1)
INSERT [dbo].[nn_product] ([id], [category_id], [name], [price], [description], [big_img_url], [small_img_url], [quantity], [qty_view], [create_at], [active]) VALUES (12, 3, N'Áo khoác nam 3', CAST(54.45 AS Decimal(18, 2)), N'Mô tả 9', N'big/aokhoacnam/aokhoacnam3.jpg', N'small/aokhoacnam/aokhoacnam3.jpg', 100, 22, NULL, 1)
INSERT [dbo].[nn_product] ([id], [category_id], [name], [price], [description], [big_img_url], [small_img_url], [quantity], [qty_view], [create_at], [active]) VALUES (13, 4, N'Quần nam 1', CAST(54.45 AS Decimal(18, 2)), N'Mô tả 10', N'big/quannam/quannam1.jpg', N'small/quannam/quannam1.jpg', 100, 31, NULL, 1)
INSERT [dbo].[nn_product] ([id], [category_id], [name], [price], [description], [big_img_url], [small_img_url], [quantity], [qty_view], [create_at], [active]) VALUES (14, 4, N'Quần nam 2', CAST(54.45 AS Decimal(18, 2)), N'Mô tả 11', N'big/quannam/quannam2.jpg', N'small/quannam/quannam2.jpg', 100, 9, NULL, 1)
INSERT [dbo].[nn_product] ([id], [category_id], [name], [price], [description], [big_img_url], [small_img_url], [quantity], [qty_view], [create_at], [active]) VALUES (15, 4, N'Quần nam 3', CAST(54.45 AS Decimal(18, 2)), N'Mô tả 12', N'big/quannam/quannam3.jpg', N'small/quannam/quannam3.jpg', 100, 19, NULL, 1)
INSERT [dbo].[nn_product] ([id], [category_id], [name], [price], [description], [big_img_url], [small_img_url], [quantity], [qty_view], [create_at], [active]) VALUES (16, 5, N'Phụ kiện nam 1', CAST(54.45 AS Decimal(18, 2)), N'Mô tả 13', N'big/phukiennam/phukiennam1.jpg', N'small/phukiennam/phukiennam1.jpg', 100, 17, NULL, 1)
INSERT [dbo].[nn_product] ([id], [category_id], [name], [price], [description], [big_img_url], [small_img_url], [quantity], [qty_view], [create_at], [active]) VALUES (17, 5, N'Phụ kiện nam 2', CAST(54.45 AS Decimal(18, 2)), N'Mô tả 14', N'big/phukiennam/phukiennam2.jpg', N'small/phukiennam/phukiennam2.jpg', 100, 26, NULL, 1)
INSERT [dbo].[nn_product] ([id], [category_id], [name], [price], [description], [big_img_url], [small_img_url], [quantity], [qty_view], [create_at], [active]) VALUES (18, 5, N'Phụ kiện nam 3', CAST(54.45 AS Decimal(18, 2)), N'Mô tả 15', N'big/phukiennam/phukiennam3.jpg', N'small/phukiennam/phukiennam3.jpg', 100, 14, NULL, 1)
INSERT [dbo].[nn_product] ([id], [category_id], [name], [price], [description], [big_img_url], [small_img_url], [quantity], [qty_view], [create_at], [active]) VALUES (19, 6, N'Áo nữ 1', CAST(54.45 AS Decimal(18, 2)), N'Mô tả 16', N'big/aonu/aonu1.jpg', N'small/aonu/aonu1.jpg', 100, 18, NULL, 1)
INSERT [dbo].[nn_product] ([id], [category_id], [name], [price], [description], [big_img_url], [small_img_url], [quantity], [qty_view], [create_at], [active]) VALUES (20, 6, N'Áo nữ 2', CAST(54.45 AS Decimal(18, 2)), N'Mô tả 17', N'big/aonu/aonu2.jpg', N'small/aonu/aonu2.jpg', 100, 23, NULL, 1)
INSERT [dbo].[nn_product] ([id], [category_id], [name], [price], [description], [big_img_url], [small_img_url], [quantity], [qty_view], [create_at], [active]) VALUES (21, 6, N'Áo nữ 3', CAST(54.45 AS Decimal(18, 2)), N'Mô tả 18', N'big/aonu/aonu3.jpg', N'small/aonu/aonu3.jpg', 100, 28, NULL, 1)
INSERT [dbo].[nn_product] ([id], [category_id], [name], [price], [description], [big_img_url], [small_img_url], [quantity], [qty_view], [create_at], [active]) VALUES (22, 7, N'Áo khoác nữ 1', CAST(54.45 AS Decimal(18, 2)), N'Mô tả 19', N'big/aokhoacnu/aokhoacnu1.jpg', N'small/aokhoacnu/aokhoacnu1.jpg', 100, 29, NULL, 1)
INSERT [dbo].[nn_product] ([id], [category_id], [name], [price], [description], [big_img_url], [small_img_url], [quantity], [qty_view], [create_at], [active]) VALUES (23, 7, N'Áo khoác nữ 2', CAST(54.45 AS Decimal(18, 2)), N'Mô tả 20', N'big/aokhoacnu/aokhoacnu2.jpg', N'small/aokhoacnu/aokhoacnu2.jpg', 100, 8, NULL, 1)
INSERT [dbo].[nn_product] ([id], [category_id], [name], [price], [description], [big_img_url], [small_img_url], [quantity], [qty_view], [create_at], [active]) VALUES (24, 7, N'Áo khoác nữ 3', CAST(54.45 AS Decimal(18, 2)), N'Mô tả 21', N'big/aokhoacnu/aokhoacnu3.jpg', N'small/aokhoacnu/aokhoacnu3.jpg', 100, 27, NULL, 1)
INSERT [dbo].[nn_product] ([id], [category_id], [name], [price], [description], [big_img_url], [small_img_url], [quantity], [qty_view], [create_at], [active]) VALUES (25, 8, N'Đầm 1', CAST(54.45 AS Decimal(18, 2)), N'Mô tả 22', N'big/dam/dam1.jpg', N'small/dam/dam1.jpg', 100, 15, NULL, 1)
INSERT [dbo].[nn_product] ([id], [category_id], [name], [price], [description], [big_img_url], [small_img_url], [quantity], [qty_view], [create_at], [active]) VALUES (26, 8, N'Đầm 2', CAST(54.45 AS Decimal(18, 2)), N'Mô tả 23', N'big/dam/dam2.jpg', N'small/dam/dam2.jpg', 100, 21, NULL, 1)
INSERT [dbo].[nn_product] ([id], [category_id], [name], [price], [description], [big_img_url], [small_img_url], [quantity], [qty_view], [create_at], [active]) VALUES (27, 8, N'Đầm 3', CAST(54.45 AS Decimal(18, 2)), N'Mô tả 24', N'big/dam/dam3.jpg', N'small/dam/dam3.jpg', 100, 31, NULL, 1)
INSERT [dbo].[nn_product] ([id], [category_id], [name], [price], [description], [big_img_url], [small_img_url], [quantity], [qty_view], [create_at], [active]) VALUES (28, 9, N'Quần nữ 1', CAST(54.45 AS Decimal(18, 2)), N'Mô tả 25', N'big/quannu/quannu1.jpg', N'small/quannu/quannu1.jpg', 100, 25, NULL, 1)
INSERT [dbo].[nn_product] ([id], [category_id], [name], [price], [description], [big_img_url], [small_img_url], [quantity], [qty_view], [create_at], [active]) VALUES (29, 9, N'Quần nữ 2', CAST(54.45 AS Decimal(18, 2)), N'Mô tả 26', N'big/quannu/quannu2.jpg', N'small/quannu/quannu2.jpg', 100, 26, NULL, 1)
INSERT [dbo].[nn_product] ([id], [category_id], [name], [price], [description], [big_img_url], [small_img_url], [quantity], [qty_view], [create_at], [active]) VALUES (30, 9, N'Quần nữ 3', CAST(54.45 AS Decimal(18, 2)), N'Mô tả 27', N'big/quannu/quannu3.jpg', N'small/quannu/quannu3.jpg', 100, 27, NULL, 1)
INSERT [dbo].[nn_product] ([id], [category_id], [name], [price], [description], [big_img_url], [small_img_url], [quantity], [qty_view], [create_at], [active]) VALUES (31, 10, N'Phụ kiện nữ 1', CAST(54.45 AS Decimal(18, 2)), N'Mô tả 28', N'big/phukiennu/phukiennu1.jpg', N'small/phukiennu/phukiennu1.jpg', 100, 16, NULL, 1)
INSERT [dbo].[nn_product] ([id], [category_id], [name], [price], [description], [big_img_url], [small_img_url], [quantity], [qty_view], [create_at], [active]) VALUES (32, 10, N'Phụ kiện nữ 2', CAST(54.45 AS Decimal(18, 2)), N'Mô tả 29', N'big/phukiennu/phukiennu2.jpg', N'small/phukiennu/phukiennu2.jpg', 100, 32, NULL, 1)
INSERT [dbo].[nn_product] ([id], [category_id], [name], [price], [description], [big_img_url], [small_img_url], [quantity], [qty_view], [create_at], [active]) VALUES (33, 10, N'Phụ kiện nữ 3', CAST(54.45 AS Decimal(18, 2)), N'Mô tả 30', N'big/phukiennu/phukiennu3.jpg', N'small/phukiennu/phukiennu3.jpg', 100, 27, NULL, 1)
SET IDENTITY_INSERT [dbo].[nn_product] OFF
SET IDENTITY_INSERT [dbo].[nn_user] ON 

INSERT [dbo].[nn_user] ([id], [email], [password], [name], [mobile], [address], [dob], [gender], [create_at], [active]) VALUES (1, N'teo@gmail.com', N'e10adc3949ba59abbe56e057f20f883e', N'Tèo', N'0901234567', N'08 Nguyễn Văn Tráng, P. Bến Thành, Q. 1, Tp.HCM', CAST(N'1999-09-09 00:00:00.000' AS DateTime), 1, CAST(N'2016-09-09 00:00:00.000' AS DateTime), 1)
INSERT [dbo].[nn_user] ([id], [email], [password], [name], [mobile], [address], [dob], [gender], [create_at], [active]) VALUES (2, N'ty@gmail.com', N'e10adc3949ba59abbe56e057f20f883e', N'Tý', N'0987654321', N'02 Tản Viên, Quận Tân Bình, Tp.HCM, Tản Viên', CAST(N'1998-08-08 00:00:00.000' AS DateTime), 0, CAST(N'2016-08-08 00:00:00.000' AS DateTime), 1)
INSERT [dbo].[nn_user] ([id], [email], [password], [name], [mobile], [address], [dob], [gender], [create_at], [active]) VALUES (4, N'bin@gmail.com', N'e10adc3949ba59abbe56e057f20f883e', N'Bin', N'0965483597', N'Nhà Bin', CAST(N'1999-09-09 00:00:00.000' AS DateTime), 1, CAST(N'2009-09-09 00:00:00.000' AS DateTime), 1)
INSERT [dbo].[nn_user] ([id], [email], [password], [name], [mobile], [address], [dob], [gender], [create_at], [active]) VALUES (5, N'test@gmail.com', N'e10adc3949ba59abbe56e057f20f883e', N'Test', N'090123467', N'Nhà Test', CAST(N'1999-09-09 00:00:00.000' AS DateTime), 1, CAST(N'1999-09-09 00:00:00.000' AS DateTime), 1)
INSERT [dbo].[nn_user] ([id], [email], [password], [name], [mobile], [address], [dob], [gender], [create_at], [active]) VALUES (6, N'ben@gmail.com', N'e10adc3949ba59abbe56e057f20f883e', N'Ben', N'0901234567', N'Nhà Ben', CAST(N'1999-09-09 00:00:00.000' AS DateTime), 1, CAST(N'1999-09-09 00:00:00.000' AS DateTime), 1)
INSERT [dbo].[nn_user] ([id], [email], [password], [name], [mobile], [address], [dob], [gender], [create_at], [active]) VALUES (7, N'abc@gmail.com', N'e10adc3949ba59abbe56e057f20f883e', N'ABC', N'0926468351', N'Nhà ABC', CAST(N'1998-08-09 00:00:00.000' AS DateTime), 0, CAST(N'1998-08-09 00:00:00.000' AS DateTime), 1)
INSERT [dbo].[nn_user] ([id], [email], [password], [name], [mobile], [address], [dob], [gender], [create_at], [active]) VALUES (9, N'tui@gmail.com', N'e10adc3949ba59abbe56e057f20f883e', N'Tui', N'092315678', N'Nhà Tui', CAST(N'1998-08-08 00:00:00.000' AS DateTime), 1, CAST(N'2008-08-08 00:00:00.000' AS DateTime), 1)
INSERT [dbo].[nn_user] ([id], [email], [password], [name], [mobile], [address], [dob], [gender], [create_at], [active]) VALUES (10, N'tin@gmail.com', N'e10adc3949ba59abbe56e057f20f883e', N'Tin', N'0983654856', N'Nhà Tin', CAST(N'1998-09-08 00:00:00.000' AS DateTime), 0, CAST(N'2008-09-08 00:00:00.000' AS DateTime), 1)
INSERT [dbo].[nn_user] ([id], [email], [password], [name], [mobile], [address], [dob], [gender], [create_at], [active]) VALUES (11, N'teo2@gmail.com', N'123456', N'Tèo 2', N'0983384683', N'Nhà Tèo', CAST(N'1998-09-08 00:00:00.000' AS DateTime), 1, CAST(N'2008-09-08 00:00:00.000' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[nn_user] OFF
ALTER TABLE [dbo].[nn_order]  WITH CHECK ADD  CONSTRAINT [FK_nn_order_nn_user] FOREIGN KEY([user_id])
REFERENCES [dbo].[nn_user] ([id])
GO
ALTER TABLE [dbo].[nn_order] CHECK CONSTRAINT [FK_nn_order_nn_user]
GO
ALTER TABLE [dbo].[nn_order_detail]  WITH CHECK ADD  CONSTRAINT [FK_nn_order_detail_nn_order] FOREIGN KEY([order_id])
REFERENCES [dbo].[nn_order] ([id])
GO
ALTER TABLE [dbo].[nn_order_detail] CHECK CONSTRAINT [FK_nn_order_detail_nn_order]
GO
ALTER TABLE [dbo].[nn_order_detail]  WITH CHECK ADD  CONSTRAINT [FK_nn_order_detail_nn_product] FOREIGN KEY([product_id])
REFERENCES [dbo].[nn_product] ([id])
GO
ALTER TABLE [dbo].[nn_order_detail] CHECK CONSTRAINT [FK_nn_order_detail_nn_product]
GO
ALTER TABLE [dbo].[nn_product]  WITH CHECK ADD  CONSTRAINT [FK_nn_product_nn_category] FOREIGN KEY([category_id])
REFERENCES [dbo].[nn_category] ([id])
GO
ALTER TABLE [dbo].[nn_product] CHECK CONSTRAINT [FK_nn_product_nn_category]
GO
USE [master]
GO
ALTER DATABASE [dbShopAround] SET  READ_WRITE 
GO
