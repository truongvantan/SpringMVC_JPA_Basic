USE [master]
GO
/****** Object:  Database [SpringMVC_JPA]    Script Date: 10/04/2024 19:54:29 PM ******/
CREATE DATABASE [SpringMVC_JPA]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SpringMVC_JPA', FILENAME = N'E:\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\SpringMVC_JPA.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SpringMVC_JPA_log', FILENAME = N'E:\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\SpringMVC_JPA_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [SpringMVC_JPA] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SpringMVC_JPA].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SpringMVC_JPA] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SpringMVC_JPA] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SpringMVC_JPA] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SpringMVC_JPA] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SpringMVC_JPA] SET ARITHABORT OFF 
GO
ALTER DATABASE [SpringMVC_JPA] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SpringMVC_JPA] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SpringMVC_JPA] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SpringMVC_JPA] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SpringMVC_JPA] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SpringMVC_JPA] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SpringMVC_JPA] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SpringMVC_JPA] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SpringMVC_JPA] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SpringMVC_JPA] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SpringMVC_JPA] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SpringMVC_JPA] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SpringMVC_JPA] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SpringMVC_JPA] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SpringMVC_JPA] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SpringMVC_JPA] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SpringMVC_JPA] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SpringMVC_JPA] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SpringMVC_JPA] SET  MULTI_USER 
GO
ALTER DATABASE [SpringMVC_JPA] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SpringMVC_JPA] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SpringMVC_JPA] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SpringMVC_JPA] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SpringMVC_JPA] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SpringMVC_JPA] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [SpringMVC_JPA] SET QUERY_STORE = OFF
GO
USE [SpringMVC_JPA]
GO
/****** Object:  Table [dbo].[ACCOUNT]    Script Date: 10/04/2024 19:54:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ACCOUNT](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[password] [varchar](255) NULL,
	[role] [varchar](255) NULL,
	[username] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CATEGORY]    Script Date: 10/04/2024 19:54:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CATEGORY](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[category_name] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PRODUCT]    Script Date: 10/04/2024 19:54:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PRODUCT](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[description] [nvarchar](max) NULL,
	[link_image] [varchar](max) NULL,
	[price_in] [float] NULL,
	[price_sell] [float] NULL,
	[product_name] [varchar](255) NULL,
	[category_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ACCOUNT] ON 

INSERT [dbo].[ACCOUNT] ([id], [password], [role], [username]) VALUES (1, N'123456', N'admin', N'admin')
INSERT [dbo].[ACCOUNT] ([id], [password], [role], [username]) VALUES (2, N'123456', N'user', N'user')
SET IDENTITY_INSERT [dbo].[ACCOUNT] OFF
GO
SET IDENTITY_INSERT [dbo].[CATEGORY] ON 

INSERT [dbo].[CATEGORY] ([id], [category_name]) VALUES (1, N'Apple')
INSERT [dbo].[CATEGORY] ([id], [category_name]) VALUES (2, N'Samsung')
INSERT [dbo].[CATEGORY] ([id], [category_name]) VALUES (3, N'Ericsson')
SET IDENTITY_INSERT [dbo].[CATEGORY] OFF
GO
SET IDENTITY_INSERT [dbo].[PRODUCT] ON 

INSERT [dbo].[PRODUCT] ([id], [description], [link_image], [price_in], [price_sell], [product_name], [category_id]) VALUES (1, N'Description 1
', N'https://fdn2.gsmarena.com/vv/bigpic/apple-ipad-10-2022.jpg
', 1000000, 2000000, N'Apple iPad (2022)
', 1)
INSERT [dbo].[PRODUCT] ([id], [description], [link_image], [price_in], [price_sell], [product_name], [category_id]) VALUES (2, N'Description 2', N'https://fdn2.gsmarena.com/vv/bigpic/apple-ipad7-102-inches.jpg', 2000000, 3000000, N'Apple iPad 10.2 (2019)', 1)
INSERT [dbo].[PRODUCT] ([id], [description], [link_image], [price_in], [price_sell], [product_name], [category_id]) VALUES (3, N'Description 3', N'https://fdn2.gsmarena.com/vv/bigpic/apple-ipad8-102-inches-2020.jpg', 3000000, 4000000, N'Apple iPad 10.2 (2020)', 1)
INSERT [dbo].[PRODUCT] ([id], [description], [link_image], [price_in], [price_sell], [product_name], [category_id]) VALUES (4, N'Description 4', N'https://fdn2.gsmarena.com/vv/bigpic/apple-ipad-102-2021-.jpg', 4000000, 5000000, N'Apple iPad 10.2 (2021)', 1)
INSERT [dbo].[PRODUCT] ([id], [description], [link_image], [price_in], [price_sell], [product_name], [category_id]) VALUES (5, N'Description 5', N'https://fdn2.gsmarena.com/vv/bigpic/apple-ipad2-new.jpg', 5000000, 6000000, N'Apple iPad 2 CDMA', 1)
INSERT [dbo].[PRODUCT] ([id], [description], [link_image], [price_in], [price_sell], [product_name], [category_id]) VALUES (6, N'Description 6', N'https://fdn2.gsmarena.com/vv/bigpic/apple-ipad2-new.jpg', 6000000, 7000000, N'Apple iPad 2 Wi-Fi', 1)
INSERT [dbo].[PRODUCT] ([id], [description], [link_image], [price_in], [price_sell], [product_name], [category_id]) VALUES (7, N'Description 7', N'https://fdn2.gsmarena.com/vv/bigpic/apple-ipad2-new.jpg', 7000000, 8000000, N'Apple iPad 2 Wi-Fi + 3G', 1)
INSERT [dbo].[PRODUCT] ([id], [description], [link_image], [price_in], [price_sell], [product_name], [category_id]) VALUES (8, N'Description 8', N'https://fdn2.gsmarena.com/vv/bigpic/apple-ipad-3-new.jpg', 8000000, 9000000, N'Apple iPad 3 Wi-Fi', 1)
INSERT [dbo].[PRODUCT] ([id], [description], [link_image], [price_in], [price_sell], [product_name], [category_id]) VALUES (9, N'Description 9', N'https://fdn2.gsmarena.com/vv/bigpic/apple-ipad-3-new.jpg', 9000000, 10000000, N'Apple iPad 3 Wi-Fi + Cellular', 1)
INSERT [dbo].[PRODUCT] ([id], [description], [link_image], [price_in], [price_sell], [product_name], [category_id]) VALUES (10, N'Description 10', N'https://fdn2.gsmarena.com/vv/bigpic/apple-ipad-3-new.jpg', 10000000, 11000000, N'Apple iPad 4 Wi-Fi', 1)
INSERT [dbo].[PRODUCT] ([id], [description], [link_image], [price_in], [price_sell], [product_name], [category_id]) VALUES (11, N'Description 11', N'https://fdn2.gsmarena.com/vv/bigpic/apple-ipad-3-new.jpg', 11000000, 12000000, N'Apple iPad 4 Wi-Fi + Cellular', 1)
INSERT [dbo].[PRODUCT] ([id], [description], [link_image], [price_in], [price_sell], [product_name], [category_id]) VALUES (12, N'Description 12', N'https://fdn2.gsmarena.com/vv/bigpic/apple-ipad-97-2017.jpg', 12000000, 13000000, N'Apple iPad 9.7 (2017)', 1)
INSERT [dbo].[PRODUCT] ([id], [description], [link_image], [price_in], [price_sell], [product_name], [category_id]) VALUES (13, N'Description 13', N'https://fdn2.gsmarena.com/vv/bigpic/apple-ipad-97-2018.jpg', 13000000, 14000000, N'Apple iPad 9.7 (2018)', 1)
INSERT [dbo].[PRODUCT] ([id], [description], [link_image], [price_in], [price_sell], [product_name], [category_id]) VALUES (14, N'Description 14', N'https://fdn2.gsmarena.com/vv/bigpic/apple-ipad-air.jpg', 14000000, 15000000, N'Apple iPad Air', 1)
INSERT [dbo].[PRODUCT] ([id], [description], [link_image], [price_in], [price_sell], [product_name], [category_id]) VALUES (15, N'Description 15', N'https://fdn2.gsmarena.com/vv/bigpic/apple-ipad-air3-2019.jpg', 15000000, 16000000, N'Apple iPad Air (2019)', 1)
INSERT [dbo].[PRODUCT] ([id], [description], [link_image], [price_in], [price_sell], [product_name], [category_id]) VALUES (16, N'Description 16', N'https://fdn2.gsmarena.com/vv/bigpic/apple-ipad-air4-2020.jpg', 16000000, 17000000, N'Apple iPad Air (2020)', 1)
INSERT [dbo].[PRODUCT] ([id], [description], [link_image], [price_in], [price_sell], [product_name], [category_id]) VALUES (17, N'Description 17', N'https://fdn2.gsmarena.com/vv/bigpic/apple-ipad-air-2022-new.jpg', 17000000, 18000000, N'Apple iPad Air (2022)', 1)
INSERT [dbo].[PRODUCT] ([id], [description], [link_image], [price_in], [price_sell], [product_name], [category_id]) VALUES (18, N'Description 18', N'https://fdn2.gsmarena.com/vv/bigpic/apple-ipad-air-2-new.jpg', 18000000, 19000000, N'Apple iPad Air 2', 1)
INSERT [dbo].[PRODUCT] ([id], [description], [link_image], [price_in], [price_sell], [product_name], [category_id]) VALUES (19, N'Description 19', N'https://fdn2.gsmarena.com/vv/bigpic/apple-ipad-mini-2019.jpg', 19000000, 20000000, N'Apple iPad mini (2019)', 1)
INSERT [dbo].[PRODUCT] ([id], [description], [link_image], [price_in], [price_sell], [product_name], [category_id]) VALUES (20, N'Description 20', N'https://fdn2.gsmarena.com/vv/bigpic/apple-ipad-mini-2021.jpg', 20000000, 21000000, N'Apple iPad mini (2021)', 1)
INSERT [dbo].[PRODUCT] ([id], [description], [link_image], [price_in], [price_sell], [product_name], [category_id]) VALUES (21, N'Description 21', N'https://fdn2.gsmarena.com/vv/bigpic/apple-ipad-mini2.jpg', 21000000, 22000000, N'Apple iPad mini 2', 1)
INSERT [dbo].[PRODUCT] ([id], [description], [link_image], [price_in], [price_sell], [product_name], [category_id]) VALUES (22, N'Description 22', N'https://fdn2.gsmarena.com/vv/bigpic/apple-ipad-mini-3-new.jpg', 22000000, 23000000, N'Apple iPad mini 3', 1)
INSERT [dbo].[PRODUCT] ([id], [description], [link_image], [price_in], [price_sell], [product_name], [category_id]) VALUES (23, N'Description 23', N'https://fdn2.gsmarena.com/vv/bigpic/ipad-mini-41.jpg', 23000000, 24000000, N'Apple iPad mini 4 (2015)', 1)
INSERT [dbo].[PRODUCT] ([id], [description], [link_image], [price_in], [price_sell], [product_name], [category_id]) VALUES (24, N'Description 24', N'https://fdn2.gsmarena.com/vv/bigpic/apple-ipad-mini-final.jpg', 24000000, 25000000, N'Apple iPad mini Wi-Fi', 1)
INSERT [dbo].[PRODUCT] ([id], [description], [link_image], [price_in], [price_sell], [product_name], [category_id]) VALUES (25, N'Description 25', N'https://fdn2.gsmarena.com/vv/bigpic/apple-ipad-mini-final.jpg', 25000000, 26000000, N'Apple iPad mini Wi-Fi + Cellular', 1)
INSERT [dbo].[PRODUCT] ([id], [description], [link_image], [price_in], [price_sell], [product_name], [category_id]) VALUES (26, N'Description 26', N'https://fdn2.gsmarena.com/vv/bigpic/apple-ipad-pro-105-2017.jpg', 26000000, 27000000, N'Apple iPad Pro 10.5 (2017)', 1)
INSERT [dbo].[PRODUCT] ([id], [description], [link_image], [price_in], [price_sell], [product_name], [category_id]) VALUES (27, N'Description 27', N'https://fdn2.gsmarena.com/vv/bigpic/apple-ipad-pro-11-2018.jpg', 27000000, 28000000, N'Apple iPad Pro 11 (2018)', 1)
INSERT [dbo].[PRODUCT] ([id], [description], [link_image], [price_in], [price_sell], [product_name], [category_id]) VALUES (28, N'Description 28', N'https://fdn2.gsmarena.com/vv/bigpic/apple-ipad-pro-11-2020.jpg', 28000000, 29000000, N'Apple iPad Pro 11 (2020)', 1)
INSERT [dbo].[PRODUCT] ([id], [description], [link_image], [price_in], [price_sell], [product_name], [category_id]) VALUES (29, N'Description 29', N'https://fdn2.gsmarena.com/vv/bigpic/apple-ipad-pro-11-2021.jpg', 29000000, 30000000, N'Apple iPad Pro 11 (2021)', 1)
INSERT [dbo].[PRODUCT] ([id], [description], [link_image], [price_in], [price_sell], [product_name], [category_id]) VALUES (30, N'Description 30', N'https://fdn2.gsmarena.com/vv/bigpic/apple-ipad-pro-11-2022.jpg', 30000000, 31000000, N'Apple iPad Pro 11 (2022)', 1)
INSERT [dbo].[PRODUCT] ([id], [description], [link_image], [price_in], [price_sell], [product_name], [category_id]) VALUES (31, N'Description 31', N'https://fdn2.gsmarena.com/vv/bigpic/apple-ipad-pro-.jpg', 31000000, 32000000, N'Apple iPad Pro 12.9 (2015)', 1)
INSERT [dbo].[PRODUCT] ([id], [description], [link_image], [price_in], [price_sell], [product_name], [category_id]) VALUES (32, N'Description 32', N'https://fdn2.gsmarena.com/vv/bigpic/apple-ipad-pro-129-2017.jpg', 32000000, 33000000, N'Apple iPad Pro 12.9 (2017)', 1)
INSERT [dbo].[PRODUCT] ([id], [description], [link_image], [price_in], [price_sell], [product_name], [category_id]) VALUES (33, N'Description 33', N'https://fdn2.gsmarena.com/vv/bigpic/apple-ipad-pro-129-2018.jpg', 33000000, 34000000, N'Apple iPad Pro 12.9 (2018)', 1)
INSERT [dbo].[PRODUCT] ([id], [description], [link_image], [price_in], [price_sell], [product_name], [category_id]) VALUES (34, N'Description 34', N'https://fdn2.gsmarena.com/vv/bigpic/apple-ipad-pro-12-2020.jpg', 34000000, 35000000, N'Apple iPad Pro 12.9 (2020)', 1)
INSERT [dbo].[PRODUCT] ([id], [description], [link_image], [price_in], [price_sell], [product_name], [category_id]) VALUES (35, N'Description 35', N'https://fdn2.gsmarena.com/vv/bigpic/apple-ipad-pro-129-2021.jpg', 35000000, 36000000, N'Apple iPad Pro 12.9 (2021)', 1)
INSERT [dbo].[PRODUCT] ([id], [description], [link_image], [price_in], [price_sell], [product_name], [category_id]) VALUES (36, N'Description 36', N'https://fdn2.gsmarena.com/vv/bigpic/apple-ipad-pro-129-2022.jpg', 36000000, 37000000, N'Apple iPad Pro 12.9 (2022)', 1)
INSERT [dbo].[PRODUCT] ([id], [description], [link_image], [price_in], [price_sell], [product_name], [category_id]) VALUES (37, N'Description 37', N'https://fdn2.gsmarena.com/vv/bigpic/apple-ipad-pro-97.jpg', 37000000, 38000000, N'Apple iPad Pro 9.7 (2016)', 1)
INSERT [dbo].[PRODUCT] ([id], [description], [link_image], [price_in], [price_sell], [product_name], [category_id]) VALUES (38, N'Description 38', N'https://fdn2.gsmarena.com/vv/bigpic/apple-ipad-original.jpg', 38000000, 39000000, N'Apple iPad Wi-Fi', 1)
INSERT [dbo].[PRODUCT] ([id], [description], [link_image], [price_in], [price_sell], [product_name], [category_id]) VALUES (39, N'Description 39', N'https://fdn2.gsmarena.com/vv/bigpic/apple-ipad-original.jpg', 39000000, 40000000, N'Apple iPad Wi-Fi + 3G', 1)
INSERT [dbo].[PRODUCT] ([id], [description], [link_image], [price_in], [price_sell], [product_name], [category_id]) VALUES (40, N'Description 40', N'https://fdn2.gsmarena.com/vv/bigpic/apple-iphone.gif', 40000000, 41000000, N'Apple iPhone', 1)
INSERT [dbo].[PRODUCT] ([id], [description], [link_image], [price_in], [price_sell], [product_name], [category_id]) VALUES (41, N'Description 41', N'https://fdn2.gsmarena.com/vv/bigpic/apple-iphone-11.jpg', 41000000, 42000000, N'Apple iPhone 11', 1)
INSERT [dbo].[PRODUCT] ([id], [description], [link_image], [price_in], [price_sell], [product_name], [category_id]) VALUES (42, N'Description 42', N'https://fdn2.gsmarena.com/vv/bigpic/apple-iphone-11-pro-max-.jpg', 42000000, 43000000, N'Apple iPhone 11 Pro', 1)
INSERT [dbo].[PRODUCT] ([id], [description], [link_image], [price_in], [price_sell], [product_name], [category_id]) VALUES (43, N'Description 43', N'https://fdn2.gsmarena.com/vv/bigpic/apple-iphone-11-pro.jpg', 43000000, 44000000, N'Apple iPhone 11 Pro Max', 1)
INSERT [dbo].[PRODUCT] ([id], [description], [link_image], [price_in], [price_sell], [product_name], [category_id]) VALUES (44, N'Description 44', N'https://fdn2.gsmarena.com/vv/bigpic/apple-iphone-12.jpg', 44000000, 45000000, N'Apple iPhone 12', 1)
INSERT [dbo].[PRODUCT] ([id], [description], [link_image], [price_in], [price_sell], [product_name], [category_id]) VALUES (45, N'Description 45', N'https://fdn2.gsmarena.com/vv/bigpic/apple-iphone-12-mini.jpg', 45000000, 46000000, N'Apple iPhone 12 mini', 1)
INSERT [dbo].[PRODUCT] ([id], [description], [link_image], [price_in], [price_sell], [product_name], [category_id]) VALUES (46, N'Description 46', N'https://fdn2.gsmarena.com/vv/bigpic/apple-iphone-12-pro--.jpg', 46000000, 47000000, N'Apple iPhone 12 Pro', 1)
INSERT [dbo].[PRODUCT] ([id], [description], [link_image], [price_in], [price_sell], [product_name], [category_id]) VALUES (47, N'Description 47', N'https://fdn2.gsmarena.com/vv/bigpic/apple-iphone-12-pro-max-.jpg', 47000000, 48000000, N'Apple iPhone 12 Pro Max', 1)
INSERT [dbo].[PRODUCT] ([id], [description], [link_image], [price_in], [price_sell], [product_name], [category_id]) VALUES (48, N'Description 48', N'https://fdn2.gsmarena.com/vv/bigpic/apple-iphone-13.jpg', 48000000, 49000000, N'Apple iPhone 13', 1)
INSERT [dbo].[PRODUCT] ([id], [description], [link_image], [price_in], [price_sell], [product_name], [category_id]) VALUES (49, N'Description 49', N'https://fdn2.gsmarena.com/vv/bigpic/apple-iphone-13-mini.jpg', 49000000, 50000000, N'Apple iPhone 13 mini', 1)
INSERT [dbo].[PRODUCT] ([id], [description], [link_image], [price_in], [price_sell], [product_name], [category_id]) VALUES (50, N'Description 50', N'https://fdn2.gsmarena.com/vv/bigpic/apple-iphone-13-pro.jpg', 50000000, 51000000, N'Apple iPhone 13 Pro', 1)
INSERT [dbo].[PRODUCT] ([id], [description], [link_image], [price_in], [price_sell], [product_name], [category_id]) VALUES (51, N'Description 51', N'https://fdn2.gsmarena.com/vv/bigpic/apple-iphone-13-pro-max.jpg', 51000000, 52000000, N'Apple iPhone 13 Pro Max', 1)
INSERT [dbo].[PRODUCT] ([id], [description], [link_image], [price_in], [price_sell], [product_name], [category_id]) VALUES (52, N'Description 52', N'https://fdn2.gsmarena.com/vv/bigpic/apple-iphone-14.jpg', 52000000, 53000000, N'Apple iPhone 14', 1)
INSERT [dbo].[PRODUCT] ([id], [description], [link_image], [price_in], [price_sell], [product_name], [category_id]) VALUES (53, N'Description 53', N'https://fdn2.gsmarena.com/vv/bigpic/apple-iphone-14-plus.jpg', 53000000, 54000000, N'Apple iPhone 14 Plus', 1)
INSERT [dbo].[PRODUCT] ([id], [description], [link_image], [price_in], [price_sell], [product_name], [category_id]) VALUES (54, N'Description 54', N'https://fdn2.gsmarena.com/vv/bigpic/apple-iphone-14-pro.jpg', 54000000, 55000000, N'Apple iPhone 14 Pro', 1)
INSERT [dbo].[PRODUCT] ([id], [description], [link_image], [price_in], [price_sell], [product_name], [category_id]) VALUES (55, N'Description 55', N'https://fdn2.gsmarena.com/vv/bigpic/apple-iphone-14-pro-max-.jpg', 55000000, 56000000, N'Apple iPhone 14 Pro Max', 1)
INSERT [dbo].[PRODUCT] ([id], [description], [link_image], [price_in], [price_sell], [product_name], [category_id]) VALUES (56, N'Description 56', N'https://fdn2.gsmarena.com/vv/bigpic/apple-iphone3g.jpg', 56000000, 57000000, N'Apple iPhone 3G', 1)
INSERT [dbo].[PRODUCT] ([id], [description], [link_image], [price_in], [price_sell], [product_name], [category_id]) VALUES (57, N'Description 57', N'https://fdn2.gsmarena.com/vv/bigpic/apple-iphone-3gs-ofic.jpg', 57000000, 58000000, N'Apple iPhone 3GS', 1)
INSERT [dbo].[PRODUCT] ([id], [description], [link_image], [price_in], [price_sell], [product_name], [category_id]) VALUES (58, N'Description 58', N'https://fdn2.gsmarena.com/vv/bigpic/apple-iphone-4-ofic-final.jpg', 58000000, 59000000, N'Apple iPhone 4', 1)
INSERT [dbo].[PRODUCT] ([id], [description], [link_image], [price_in], [price_sell], [product_name], [category_id]) VALUES (59, N'Description 59', N'https://fdn2.gsmarena.com/vv/bigpic/apple-iphone4-cdma.jpg', 59000000, 60000000, N'Apple iPhone 4 CDMA', 1)
INSERT [dbo].[PRODUCT] ([id], [description], [link_image], [price_in], [price_sell], [product_name], [category_id]) VALUES (60, N'Description 60', N'https://fdn2.gsmarena.com/vv/bigpic/apple-iphone-4s-new.jpg', 60000000, 61000000, N'Apple iPhone 4s', 1)
INSERT [dbo].[PRODUCT] ([id], [description], [link_image], [price_in], [price_sell], [product_name], [category_id]) VALUES (61, N'Description 61', N'https://fdn2.gsmarena.com/vv/bigpic/apple-iphone-5-ofic.jpg', 61000000, 62000000, N'Apple iPhone 5', 1)
INSERT [dbo].[PRODUCT] ([id], [description], [link_image], [price_in], [price_sell], [product_name], [category_id]) VALUES (62, N'Description 62', N'https://fdn2.gsmarena.com/vv/bigpic/apple-iphone-5c-new2.jpg', 62000000, 63000000, N'Apple iPhone 5c', 1)
INSERT [dbo].[PRODUCT] ([id], [description], [link_image], [price_in], [price_sell], [product_name], [category_id]) VALUES (63, N'Description 63', N'https://fdn2.gsmarena.com/vv/bigpic/apple-iphone-5s-ofic.jpg', 63000000, 64000000, N'Apple iPhone 5s', 1)
INSERT [dbo].[PRODUCT] ([id], [description], [link_image], [price_in], [price_sell], [product_name], [category_id]) VALUES (64, N'Description 64', N'https://fdn2.gsmarena.com/vv/bigpic/apple-iphone-6-4.jpg', 64000000, 65000000, N'Apple iPhone 6', 1)
INSERT [dbo].[PRODUCT] ([id], [description], [link_image], [price_in], [price_sell], [product_name], [category_id]) VALUES (65, N'Description 65', N'https://fdn2.gsmarena.com/vv/bigpic/apple-iphone-6-plus2.jpg', 65000000, 66000000, N'Apple iPhone 6 Plus', 1)
INSERT [dbo].[PRODUCT] ([id], [description], [link_image], [price_in], [price_sell], [product_name], [category_id]) VALUES (66, N'Description 66', N'https://fdn2.gsmarena.com/vv/bigpic/apple-iphone-6s1.jpg', 66000000, 67000000, N'Apple iPhone 6s', 1)
INSERT [dbo].[PRODUCT] ([id], [description], [link_image], [price_in], [price_sell], [product_name], [category_id]) VALUES (67, N'Description 67', N'https://fdn2.gsmarena.com/vv/bigpic/apple-iphone-6s-plus.jpg', 67000000, 68000000, N'Apple iPhone 6s Plus', 1)
INSERT [dbo].[PRODUCT] ([id], [description], [link_image], [price_in], [price_sell], [product_name], [category_id]) VALUES (68, N'Description 68', N'https://fdn2.gsmarena.com/vv/bigpic/apple-iphone-7r4.jpg', 68000000, 69000000, N'Apple iPhone 7', 1)
INSERT [dbo].[PRODUCT] ([id], [description], [link_image], [price_in], [price_sell], [product_name], [category_id]) VALUES (69, N'Description 69', N'https://fdn2.gsmarena.com/vv/bigpic/apple-iphone-7-plus-r2.jpg', 69000000, 70000000, N'Apple iPhone 7 Plus', 1)
INSERT [dbo].[PRODUCT] ([id], [description], [link_image], [price_in], [price_sell], [product_name], [category_id]) VALUES (70, N'Description 70', N'https://fdn2.gsmarena.com/vv/bigpic/apple-iphone-8-new.jpg', 70000000, 71000000, N'Apple iPhone 8', 1)
INSERT [dbo].[PRODUCT] ([id], [description], [link_image], [price_in], [price_sell], [product_name], [category_id]) VALUES (71, N'Description 71', N'https://fdn2.gsmarena.com/vv/bigpic/apple-iphone-8-plus-new.jpg', 71000000, 72000000, N'Apple iPhone 8 Plus', 1)
INSERT [dbo].[PRODUCT] ([id], [description], [link_image], [price_in], [price_sell], [product_name], [category_id]) VALUES (72, N'Description 72', N'https://fdn2.gsmarena.com/vv/bigpic/apple-iphone-5se-ofic.jpg', 72000000, 73000000, N'Apple iPhone SE', 1)
INSERT [dbo].[PRODUCT] ([id], [description], [link_image], [price_in], [price_sell], [product_name], [category_id]) VALUES (73, N'Description 73', N'https://fdn2.gsmarena.com/vv/bigpic/apple-iphone-se-2020.jpg', 73000000, 74000000, N'Apple iPhone SE (2020)', 1)
INSERT [dbo].[PRODUCT] ([id], [description], [link_image], [price_in], [price_sell], [product_name], [category_id]) VALUES (74, N'Description 74', N'https://fdn2.gsmarena.com/vv/bigpic/apple-iphone-se-2022.jpg', 74000000, 75000000, N'Apple iPhone SE (2022)', 1)
INSERT [dbo].[PRODUCT] ([id], [description], [link_image], [price_in], [price_sell], [product_name], [category_id]) VALUES (75, N'Description 75', N'https://fdn2.gsmarena.com/vv/bigpic/apple-iphone-x.jpg', 75000000, 76000000, N'Apple iPhone X', 1)
INSERT [dbo].[PRODUCT] ([id], [description], [link_image], [price_in], [price_sell], [product_name], [category_id]) VALUES (76, N'Description 76', N'https://fdn2.gsmarena.com/vv/bigpic/apple-iphone-xr-new.jpg', 76000000, 77000000, N'Apple iPhone XR', 1)
INSERT [dbo].[PRODUCT] ([id], [description], [link_image], [price_in], [price_sell], [product_name], [category_id]) VALUES (77, N'Description 77', N'https://fdn2.gsmarena.com/vv/bigpic/apple-iphone-xs-new.jpg', 77000000, 78000000, N'Apple iPhone XS', 1)
INSERT [dbo].[PRODUCT] ([id], [description], [link_image], [price_in], [price_sell], [product_name], [category_id]) VALUES (78, N'Description 78', N'https://fdn2.gsmarena.com/vv/bigpic/apple-iphone-xs-max-new1.jpg', 78000000, 79000000, N'Apple iPhone XS Max', 1)
INSERT [dbo].[PRODUCT] ([id], [description], [link_image], [price_in], [price_sell], [product_name], [category_id]) VALUES (79, N'Description 79', N'https://fdn2.gsmarena.com/vv/bigpic/apple-watch-38mm.jpg', 79000000, 80000000, N'Apple Watch 38mm (1st gen)', 1)
INSERT [dbo].[PRODUCT] ([id], [description], [link_image], [price_in], [price_sell], [product_name], [category_id]) VALUES (80, N'Description 80', N'https://fdn2.gsmarena.com/vv/bigpic/apple-watch-42mm.jpg', 80000000, 81000000, N'Apple Watch 42mm (1st gen)', 1)
INSERT [dbo].[PRODUCT] ([id], [description], [link_image], [price_in], [price_sell], [product_name], [category_id]) VALUES (81, N'Description 81', N'https://fdn2.gsmarena.com/vv/bigpic/apple-watch-edition-38mm.jpg', 81000000, 82000000, N'Apple Watch Edition 38mm (1st gen)', 1)
INSERT [dbo].[PRODUCT] ([id], [description], [link_image], [price_in], [price_sell], [product_name], [category_id]) VALUES (82, N'Description 82', N'https://fdn2.gsmarena.com/vv/bigpic/apple-watch-edition-42mm.jpg', 82000000, 83000000, N'Apple Watch Edition 42mm (1st gen)', 1)
INSERT [dbo].[PRODUCT] ([id], [description], [link_image], [price_in], [price_sell], [product_name], [category_id]) VALUES (83, N'Description 83', N'https://fdn2.gsmarena.com/vv/bigpic/apple-watch2-s2-edition-38mm.jpg', 83000000, 84000000, N'Apple Watch Edition Series 2 38mm', 1)
INSERT [dbo].[PRODUCT] ([id], [description], [link_image], [price_in], [price_sell], [product_name], [category_id]) VALUES (84, N'Description 84', N'https://fdn2.gsmarena.com/vv/bigpic/apple-watch2-edition-42mm.jpg', 84000000, 85000000, N'Apple Watch Edition Series 2 42mm', 1)
INSERT [dbo].[PRODUCT] ([id], [description], [link_image], [price_in], [price_sell], [product_name], [category_id]) VALUES (85, N'Description 85', N'https://fdn2.gsmarena.com/vv/bigpic/apple-watch-edition-series3.jpg', 85000000, 86000000, N'Apple Watch Edition Series 3', 1)
INSERT [dbo].[PRODUCT] ([id], [description], [link_image], [price_in], [price_sell], [product_name], [category_id]) VALUES (86, N'Description 86', N'https://fdn2.gsmarena.com/vv/bigpic/apple-watch-edition-series-5.jpg', 86000000, 87000000, N'Apple Watch Edition Series 5', 1)
INSERT [dbo].[PRODUCT] ([id], [description], [link_image], [price_in], [price_sell], [product_name], [category_id]) VALUES (87, N'Description 87', N'https://fdn2.gsmarena.com/vv/bigpic/apple-watch-s6-titanium.jpg', 87000000, 88000000, N'Apple Watch Edition Series 6', 1)
INSERT [dbo].[PRODUCT] ([id], [description], [link_image], [price_in], [price_sell], [product_name], [category_id]) VALUES (88, N'Description 88', N'https://fdn2.gsmarena.com/vv/bigpic/apple-watch-series-7-titanium.jpg', 88000000, 89000000, N'Apple Watch Edition Series 7', 1)
INSERT [dbo].[PRODUCT] ([id], [description], [link_image], [price_in], [price_sell], [product_name], [category_id]) VALUES (89, N'Description 89', N'https://fdn2.gsmarena.com/vv/bigpic/apple-watch-se.jpg', 89000000, 90000000, N'Apple Watch SE', 1)
INSERT [dbo].[PRODUCT] ([id], [description], [link_image], [price_in], [price_sell], [product_name], [category_id]) VALUES (90, N'Description 90', N'https://fdn2.gsmarena.com/vv/bigpic/apple-watch-8se-2022.jpg', 90000000, 91000000, N'Apple Watch SE (2022)', 1)
INSERT [dbo].[PRODUCT] ([id], [description], [link_image], [price_in], [price_sell], [product_name], [category_id]) VALUES (91, N'Description 91', N'https://fdn2.gsmarena.com/vv/bigpic/apple-watch2-s2-sport-38mm.jpg', 91000000, 92000000, N'Apple Watch Series 1 Aluminum 38mm', 1)
INSERT [dbo].[PRODUCT] ([id], [description], [link_image], [price_in], [price_sell], [product_name], [category_id]) VALUES (92, N'Description 92', N'https://fdn2.gsmarena.com/vv/bigpic/apple-watch1-sport-42mm.jpg', 92000000, 93000000, N'Apple Watch Series 1 Aluminum 42mm', 1)
INSERT [dbo].[PRODUCT] ([id], [description], [link_image], [price_in], [price_sell], [product_name], [category_id]) VALUES (93, N'Description 93', N'https://fdn2.gsmarena.com/vv/bigpic/apple-watch2-s2-38mm.jpg', 93000000, 94000000, N'Apple Watch Series 2 38mm', 1)
INSERT [dbo].[PRODUCT] ([id], [description], [link_image], [price_in], [price_sell], [product_name], [category_id]) VALUES (94, N'Description 94', N'https://fdn2.gsmarena.com/vv/bigpic/apple-watch2-s2-42mm.jpg', 94000000, 95000000, N'Apple Watch Series 2 42mm', 1)
INSERT [dbo].[PRODUCT] ([id], [description], [link_image], [price_in], [price_sell], [product_name], [category_id]) VALUES (95, N'Description 95', N'https://fdn2.gsmarena.com/vv/bigpic/apple-watch2-s2-sport-38mm.jpg', 95000000, 96000000, N'Apple Watch Series 2 Aluminum 38mm', 1)
INSERT [dbo].[PRODUCT] ([id], [description], [link_image], [price_in], [price_sell], [product_name], [category_id]) VALUES (96, N'Description 96', N'https://fdn2.gsmarena.com/vv/bigpic/apple-watch2-s2-sport-42mm.jpg', 96000000, 97000000, N'Apple Watch Series 2 Aluminum 42mm', 1)
INSERT [dbo].[PRODUCT] ([id], [description], [link_image], [price_in], [price_sell], [product_name], [category_id]) VALUES (97, N'Description 97', N'https://fdn2.gsmarena.com/vv/bigpic/apple-watch-series3-.jpg', 97000000, 98000000, N'Apple Watch Series 3', 1)
INSERT [dbo].[PRODUCT] ([id], [description], [link_image], [price_in], [price_sell], [product_name], [category_id]) VALUES (98, N'Description 98', N'https://fdn2.gsmarena.com/vv/bigpic/apple-watch-series3-sport-.jpg', 98000000, 99000000, N'Apple Watch Series 3 Aluminum', 1)
INSERT [dbo].[PRODUCT] ([id], [description], [link_image], [price_in], [price_sell], [product_name], [category_id]) VALUES (99, N'Description 99', N'https://fdn2.gsmarena.com/vv/bigpic/apple-watch-series-4-steel.jpg', 99000000, 100000000, N'Apple Watch Series 4', 1)
GO
INSERT [dbo].[PRODUCT] ([id], [description], [link_image], [price_in], [price_sell], [product_name], [category_id]) VALUES (100, N'Description 100', N'https://fdn2.gsmarena.com/vv/bigpic/apple-watch-series-4-aluminum.jpg', 100000000, 101000000, N'Apple Watch Series 4 Aluminum', 1)
INSERT [dbo].[PRODUCT] ([id], [description], [link_image], [price_in], [price_sell], [product_name], [category_id]) VALUES (101, N'Description 101', N'https://fdn2.gsmarena.com/vv/bigpic/apple-watch-series-5.jpg', 101000000, 102000000, N'Apple Watch Series 5', 1)
INSERT [dbo].[PRODUCT] ([id], [description], [link_image], [price_in], [price_sell], [product_name], [category_id]) VALUES (102, N'Description 102', N'https://fdn2.gsmarena.com/vv/bigpic/apple-watch-aluminum-series-5.jpg', 102000000, 103000000, N'Apple Watch Series 5 Aluminum', 1)
INSERT [dbo].[PRODUCT] ([id], [description], [link_image], [price_in], [price_sell], [product_name], [category_id]) VALUES (103, N'Description 103', N'https://fdn2.gsmarena.com/vv/bigpic/apple-watch-s6-steel.jpg', 103000000, 104000000, N'Apple Watch Series 6', 1)
INSERT [dbo].[PRODUCT] ([id], [description], [link_image], [price_in], [price_sell], [product_name], [category_id]) VALUES (104, N'Description 104', N'https://fdn2.gsmarena.com/vv/bigpic/apple-watch-s6.jpg', 104000000, 105000000, N'Apple Watch Series 6 Aluminum', 1)
INSERT [dbo].[PRODUCT] ([id], [description], [link_image], [price_in], [price_sell], [product_name], [category_id]) VALUES (105, N'Description 105', N'https://fdn2.gsmarena.com/vv/bigpic/apple-watch-series-7-stainless-steel.jpg', 105000000, 106000000, N'Apple Watch Series 7', 1)
INSERT [dbo].[PRODUCT] ([id], [description], [link_image], [price_in], [price_sell], [product_name], [category_id]) VALUES (106, N'Description 106', N'https://fdn2.gsmarena.com/vv/bigpic/apple-watch-series-7-aluminum.jpg', 106000000, 107000000, N'Apple Watch Series 7 Aluminum', 1)
INSERT [dbo].[PRODUCT] ([id], [description], [link_image], [price_in], [price_sell], [product_name], [category_id]) VALUES (107, N'Description 107', N'https://fdn2.gsmarena.com/vv/bigpic/apple-watch-8.jpg', 107000000, 108000000, N'Apple Watch Series 8', 1)
INSERT [dbo].[PRODUCT] ([id], [description], [link_image], [price_in], [price_sell], [product_name], [category_id]) VALUES (108, N'Description 108', N'https://fdn2.gsmarena.com/vv/bigpic/apple-watch-8-aluminum.jpg', 108000000, 109000000, N'Apple Watch Series 8 Aluminum', 1)
INSERT [dbo].[PRODUCT] ([id], [description], [link_image], [price_in], [price_sell], [product_name], [category_id]) VALUES (109, N'Description 109', N'https://fdn2.gsmarena.com/vv/bigpic/apple-watch-sport-38mm.jpg', 109000000, 110000000, N'Apple Watch Sport 38mm (1st gen)', 1)
INSERT [dbo].[PRODUCT] ([id], [description], [link_image], [price_in], [price_sell], [product_name], [category_id]) VALUES (110, N'Description 110', N'https://fdn2.gsmarena.com/vv/bigpic/apple-watch-sport-42mm2.jpg', 110000000, 111000000, N'Apple Watch Sport 42mm (1st gen)', 1)
INSERT [dbo].[PRODUCT] ([id], [description], [link_image], [price_in], [price_sell], [product_name], [category_id]) VALUES (112, N'Description 112', N'https://fdn2.gsmarena.com/vv/bigpic/samsung-galaxy-note-101-2014-new.jpg', 1000000, 2000000, N'Samsung Galaxy Note 10.1 (2014)', 2)
INSERT [dbo].[PRODUCT] ([id], [description], [link_image], [price_in], [price_sell], [product_name], [category_id]) VALUES (113, N'Description 113', N'https://fdn2.gsmarena.com/vv/bigpic/samsung-galaxy-note-101-n8000.jpg', 2000000, 3000000, N'Samsung Galaxy Note 10.1 N8000', 2)
INSERT [dbo].[PRODUCT] ([id], [description], [link_image], [price_in], [price_sell], [product_name], [category_id]) VALUES (114, N'Description 114', N'https://fdn2.gsmarena.com/vv/bigpic/samsung-galaxy-note-101-n8000.jpg', 3000000, 4000000, N'Samsung Galaxy Note 10.1 N8010', 2)
INSERT [dbo].[PRODUCT] ([id], [description], [link_image], [price_in], [price_sell], [product_name], [category_id]) VALUES (115, N'Description 115', N'https://fdn2.gsmarena.com/vv/bigpic/samsung-galaxy-note-3.jpg', 4000000, 5000000, N'Samsung Galaxy Note 3', 2)
INSERT [dbo].[PRODUCT] ([id], [description], [link_image], [price_in], [price_sell], [product_name], [category_id]) VALUES (116, N'Description 116', N'https://fdn2.gsmarena.com/vv/bigpic/-samsung-galaxy-note-3-neo-new1.jpg', 5000000, 6000000, N'Samsung Galaxy Note 3 Neo', 2)
INSERT [dbo].[PRODUCT] ([id], [description], [link_image], [price_in], [price_sell], [product_name], [category_id]) VALUES (117, N'Description 117', N'https://fdn2.gsmarena.com/vv/bigpic/-samsung-galaxy-note-3-neo-new1.jpg', 6000000, 7000000, N'Samsung Galaxy Note 3 Neo Duos', 2)
INSERT [dbo].[PRODUCT] ([id], [description], [link_image], [price_in], [price_sell], [product_name], [category_id]) VALUES (118, N'Description 118', N'https://fdn2.gsmarena.com/vv/bigpic/samsung-galaxy-note-4-new.jpg', 7000000, 8000000, N'Samsung Galaxy Note 4', 2)
INSERT [dbo].[PRODUCT] ([id], [description], [link_image], [price_in], [price_sell], [product_name], [category_id]) VALUES (119, N'Description 119', N'https://fdn2.gsmarena.com/vv/bigpic/samsung-galaxy-note-4-cdma.jpg', 8000000, 9000000, N'Samsung Galaxy Note 4 (USA)', 2)
INSERT [dbo].[PRODUCT] ([id], [description], [link_image], [price_in], [price_sell], [product_name], [category_id]) VALUES (120, N'Description 120', N'https://fdn2.gsmarena.com/vv/bigpic/samsung-galaxy-note-4-duos-sm-n9100.jpg', 9000000, 10000000, N'Samsung Galaxy Note 4 Duos', 2)
INSERT [dbo].[PRODUCT] ([id], [description], [link_image], [price_in], [price_sell], [product_name], [category_id]) VALUES (121, N'Description 121', N'https://fdn2.gsmarena.com/vv/bigpic/samsung-galaxy-note-80-n5100.jpg', 10000000, 11000000, N'Samsung Galaxy Note 8.0', 2)
INSERT [dbo].[PRODUCT] ([id], [description], [link_image], [price_in], [price_sell], [product_name], [category_id]) VALUES (122, N'Description 122', N'https://fdn2.gsmarena.com/vv/bigpic/samsung-galaxy-note-80-n5110.jpg', 11000000, 12000000, N'Samsung Galaxy Note 8.0 Wi-Fi', 2)
INSERT [dbo].[PRODUCT] ([id], [description], [link_image], [price_in], [price_sell], [product_name], [category_id]) VALUES (123, N'Description 123', N'https://fdn2.gsmarena.com/vv/bigpic/samsung-galaxy-note-edge1.jpg', 12000000, 13000000, N'Samsung Galaxy Note Edge', 2)
INSERT [dbo].[PRODUCT] ([id], [description], [link_image], [price_in], [price_sell], [product_name], [category_id]) VALUES (124, N'Description 124', N'https://fdn2.gsmarena.com/vv/bigpic/samsung-galaxy-note-fe1.jpg', 13000000, 14000000, N'Samsung Galaxy Note FE', 2)
INSERT [dbo].[PRODUCT] ([id], [description], [link_image], [price_in], [price_sell], [product_name], [category_id]) VALUES (125, N'Description 125', N'https://fdn2.gsmarena.com/vv/bigpic/samsung-galaxy-note-lte-new.jpg', 14000000, 15000000, N'Samsung Galaxy Note I717', 2)
INSERT [dbo].[PRODUCT] ([id], [description], [link_image], [price_in], [price_sell], [product_name], [category_id]) VALUES (126, N'Description 126', N'https://fdn2.gsmarena.com/vv/bigpic/samsung-galaxy-note-ii-cdma.jpg', 15000000, 16000000, N'Samsung Galaxy Note II CDMA', 2)
INSERT [dbo].[PRODUCT] ([id], [description], [link_image], [price_in], [price_sell], [product_name], [category_id]) VALUES (127, N'Description 127', N'https://fdn2.gsmarena.com/vv/bigpic/samsung-galaxy-note-ii-n7100-new.jpg', 16000000, 17000000, N'Samsung Galaxy Note II N7100', 2)
INSERT [dbo].[PRODUCT] ([id], [description], [link_image], [price_in], [price_sell], [product_name], [category_id]) VALUES (128, N'Description 128', N'https://fdn2.gsmarena.com/vv/bigpic/samsung-galaxy-note-101-lte-n8020.jpg', 17000000, 18000000, N'Samsung Galaxy Note LTE 10.1 N8020', 2)
INSERT [dbo].[PRODUCT] ([id], [description], [link_image], [price_in], [price_sell], [product_name], [category_id]) VALUES (129, N'Description 129', N'https://fdn2.gsmarena.com/vv/bigpic/samsung-galaxy-note.jpg', 18000000, 19000000, N'Samsung Galaxy Note N7000', 2)
INSERT [dbo].[PRODUCT] ([id], [description], [link_image], [price_in], [price_sell], [product_name], [category_id]) VALUES (130, N'Description 130', N'https://fdn2.gsmarena.com/vv/bigpic/samsung-note-pro-122.jpg', 19000000, 20000000, N'Samsung Galaxy Note Pro 12.2', 2)
INSERT [dbo].[PRODUCT] ([id], [description], [link_image], [price_in], [price_sell], [product_name], [category_id]) VALUES (131, N'Description 131', N'https://fdn2.gsmarena.com/vv/bigpic/samsung-note-pro-122.jpg', 20000000, 21000000, N'Samsung Galaxy Note Pro 12.2 3G', 2)
INSERT [dbo].[PRODUCT] ([id], [description], [link_image], [price_in], [price_sell], [product_name], [category_id]) VALUES (132, N'Description 132', N'https://fdn2.gsmarena.com/vv/bigpic/samsung-note-pro-122.jpg', 21000000, 22000000, N'Samsung Galaxy Note Pro 12.2 LTE', 2)
INSERT [dbo].[PRODUCT] ([id], [description], [link_image], [price_in], [price_sell], [product_name], [category_id]) VALUES (133, N'Description 133', N'https://fdn2.gsmarena.com/vv/bigpic/samsung-galaxy-note-t-mobile-sgh-t879.jpg', 22000000, 23000000, N'Samsung Galaxy Note T879', 2)
INSERT [dbo].[PRODUCT] ([id], [description], [link_image], [price_in], [price_sell], [product_name], [category_id]) VALUES (134, N'Description 134', N'https://fdn2.gsmarena.com/vv/bigpic/samsung-galaxy-note10-.jpg', 23000000, 24000000, N'Samsung Galaxy Note10', 2)
INSERT [dbo].[PRODUCT] ([id], [description], [link_image], [price_in], [price_sell], [product_name], [category_id]) VALUES (135, N'Description 135', N'https://fdn2.gsmarena.com/vv/bigpic/samsung-galaxy-note10-.jpg', 24000000, 25000000, N'Samsung Galaxy Note10 5G', 2)
INSERT [dbo].[PRODUCT] ([id], [description], [link_image], [price_in], [price_sell], [product_name], [category_id]) VALUES (136, N'Description 136', N'https://fdn2.gsmarena.com/vv/bigpic/sasmung-galaxy-note10-lite-r.jpg', 25000000, 26000000, N'Samsung Galaxy Note10 Lite', 2)
INSERT [dbo].[PRODUCT] ([id], [description], [link_image], [price_in], [price_sell], [product_name], [category_id]) VALUES (137, N'Description 137', N'https://fdn2.gsmarena.com/vv/bigpic/samsung-galaxy-note10-plus-.jpg', 26000000, 27000000, N'Samsung Galaxy Note10+', 2)
INSERT [dbo].[PRODUCT] ([id], [description], [link_image], [price_in], [price_sell], [product_name], [category_id]) VALUES (138, N'Description 138', N'https://fdn2.gsmarena.com/vv/bigpic/samsung-galaxy-note10-plus-.jpg', 27000000, 28000000, N'Samsung Galaxy Note10+ 5G', 2)
INSERT [dbo].[PRODUCT] ([id], [description], [link_image], [price_in], [price_sell], [product_name], [category_id]) VALUES (139, N'Description 139', N'https://fdn2.gsmarena.com/vv/bigpic/samsung-galaxy-note20-5g-r.jpg', 28000000, 29000000, N'Samsung Galaxy Note20', 2)
INSERT [dbo].[PRODUCT] ([id], [description], [link_image], [price_in], [price_sell], [product_name], [category_id]) VALUES (140, N'Description 140', N'https://fdn2.gsmarena.com/vv/bigpic/samsung-galaxy-note20-5g-r.jpg', 29000000, 30000000, N'Samsung Galaxy Note20 5G', 2)
INSERT [dbo].[PRODUCT] ([id], [description], [link_image], [price_in], [price_sell], [product_name], [category_id]) VALUES (141, N'Description 141', N'https://fdn2.gsmarena.com/vv/bigpic/samsung-galaxy-note20-ultra-.jpg', 30000000, 31000000, N'Samsung Galaxy Note20 Ultra', 2)
INSERT [dbo].[PRODUCT] ([id], [description], [link_image], [price_in], [price_sell], [product_name], [category_id]) VALUES (142, N'Description 142', N'https://fdn2.gsmarena.com/vv/bigpic/samsung-galaxy-note20-ultra-.jpg', 31000000, 32000000, N'Samsung Galaxy Note20 Ultra 5G', 2)
INSERT [dbo].[PRODUCT] ([id], [description], [link_image], [price_in], [price_sell], [product_name], [category_id]) VALUES (143, N'Description 143', N'https://fdn2.gsmarena.com/vv/bigpic/samsung-galaxy-note5.jpg', 32000000, 33000000, N'Samsung Galaxy Note5', 2)
INSERT [dbo].[PRODUCT] ([id], [description], [link_image], [price_in], [price_sell], [product_name], [category_id]) VALUES (144, N'Description 144', N'https://fdn2.gsmarena.com/vv/bigpic/samsung-galaxy-note5.jpg', 33000000, 34000000, N'Samsung Galaxy Note5 (USA)', 2)
INSERT [dbo].[PRODUCT] ([id], [description], [link_image], [price_in], [price_sell], [product_name], [category_id]) VALUES (145, N'Description 145', N'https://fdn2.gsmarena.com/vv/bigpic/samsung-galaxy-note5.jpg', 34000000, 35000000, N'Samsung Galaxy Note5 Duos', 2)
INSERT [dbo].[PRODUCT] ([id], [description], [link_image], [price_in], [price_sell], [product_name], [category_id]) VALUES (146, N'Description 146', N'https://fdn2.gsmarena.com/vv/bigpic/samsung-galaxy-note7.jpg', 35000000, 36000000, N'Samsung Galaxy Note7', 2)
INSERT [dbo].[PRODUCT] ([id], [description], [link_image], [price_in], [price_sell], [product_name], [category_id]) VALUES (147, N'Description 147', N'https://fdn2.gsmarena.com/vv/bigpic/samsung-galaxy-note7-usa.jpg', 36000000, 37000000, N'Samsung Galaxy Note7 (USA)', 2)
INSERT [dbo].[PRODUCT] ([id], [description], [link_image], [price_in], [price_sell], [product_name], [category_id]) VALUES (148, N'Description 148', N'https://fdn2.gsmarena.com/vv/bigpic/samsung-galaxy-note-8-sm-n950.jpg', 37000000, 38000000, N'Samsung Galaxy Note8', 2)
INSERT [dbo].[PRODUCT] ([id], [description], [link_image], [price_in], [price_sell], [product_name], [category_id]) VALUES (149, N'Description 149', N'https://fdn2.gsmarena.com/vv/bigpic/samsung-galaxy-note9-r1.jpg', 38000000, 39000000, N'Samsung Galaxy Note9', 2)
INSERT [dbo].[PRODUCT] ([id], [description], [link_image], [price_in], [price_sell], [product_name], [category_id]) VALUES (150, N'Description 150', N'https://fdn2.gsmarena.com/vv/bigpic/er1018sb.gif', 1000000, 2000000, N'Ericsson A1018s', 3)
INSERT [dbo].[PRODUCT] ([id], [description], [link_image], [price_in], [price_sell], [product_name], [category_id]) VALUES (151, N'Description 151', N'https://fdn2.gsmarena.com/vv/bigpic/era2618b.gif', 2000000, 3000000, N'Ericsson A2618', 3)
INSERT [dbo].[PRODUCT] ([id], [description], [link_image], [price_in], [price_sell], [product_name], [category_id]) VALUES (152, N'Description 152', N'https://fdn2.gsmarena.com/vv/bigpic/era2628.gif', 3000000, 4000000, N'Ericsson A2628', 3)
INSERT [dbo].[PRODUCT] ([id], [description], [link_image], [price_in], [price_sell], [product_name], [category_id]) VALUES (153, N'Description 153', N'https://fdn2.gsmarena.com/vv/bigpic/era3618.gif', 4000000, 5000000, N'Ericsson A3618', 3)
INSERT [dbo].[PRODUCT] ([id], [description], [link_image], [price_in], [price_sell], [product_name], [category_id]) VALUES (154, N'Description 154', N'https://fdn2.gsmarena.com/vv/bigpic/erga318b.gif', 5000000, 6000000, N'Ericsson GA 318', 3)
INSERT [dbo].[PRODUCT] ([id], [description], [link_image], [price_in], [price_sell], [product_name], [category_id]) VALUES (155, N'Description 155', N'https://fdn2.gsmarena.com/vv/bigpic/erga628b.gif', 6000000, 7000000, N'Ericsson GA 628', 3)
INSERT [dbo].[PRODUCT] ([id], [description], [link_image], [price_in], [price_sell], [product_name], [category_id]) VALUES (156, N'Description 156', N'https://fdn2.gsmarena.com/vv/bigpic/ergf337b.gif', 7000000, 8000000, N'Ericsson GF 337', 3)
INSERT [dbo].[PRODUCT] ([id], [description], [link_image], [price_in], [price_sell], [product_name], [category_id]) VALUES (157, N'Description 157', N'https://fdn2.gsmarena.com/vv/bigpic/ergf388b.gif', 8000000, 9000000, N'Ericsson GF 388', 3)
INSERT [dbo].[PRODUCT] ([id], [description], [link_image], [price_in], [price_sell], [product_name], [category_id]) VALUES (158, N'Description 158', N'https://fdn2.gsmarena.com/vv/bigpic/ergf768b.gif', 9000000, 10000000, N'Ericsson GF 768', 3)
INSERT [dbo].[PRODUCT] ([id], [description], [link_image], [price_in], [price_sell], [product_name], [category_id]) VALUES (159, N'Description 159', N'https://fdn2.gsmarena.com/vv/bigpic/ergf788b.gif', 10000000, 11000000, N'Ericsson GF 788', 3)
INSERT [dbo].[PRODUCT] ([id], [description], [link_image], [price_in], [price_sell], [product_name], [category_id]) VALUES (160, N'Description 160', N'https://fdn2.gsmarena.com/vv/bigpic/erg788eb.gif', 11000000, 12000000, N'Ericsson GF 788e', 3)
INSERT [dbo].[PRODUCT] ([id], [description], [link_image], [price_in], [price_sell], [product_name], [category_id]) VALUES (161, N'Description 161', N'https://fdn2.gsmarena.com/vv/bigpic/ergh218b.gif', 12000000, 13000000, N'Ericsson GH 218', 3)
INSERT [dbo].[PRODUCT] ([id], [description], [link_image], [price_in], [price_sell], [product_name], [category_id]) VALUES (162, N'Description 162', N'https://fdn2.gsmarena.com/vv/bigpic/ergh337b.gif', 13000000, 14000000, N'Ericsson GH 337', 3)
INSERT [dbo].[PRODUCT] ([id], [description], [link_image], [price_in], [price_sell], [product_name], [category_id]) VALUES (163, N'Description 163', N'https://fdn2.gsmarena.com/vv/bigpic/ergh388b.gif', 14000000, 15000000, N'Ericsson GH 388', 3)
INSERT [dbo].[PRODUCT] ([id], [description], [link_image], [price_in], [price_sell], [product_name], [category_id]) VALUES (164, N'Description 164', N'https://fdn2.gsmarena.com/vv/bigpic/ergh688b.gif', 15000000, 16000000, N'Ericsson GH 688', 3)
INSERT [dbo].[PRODUCT] ([id], [description], [link_image], [price_in], [price_sell], [product_name], [category_id]) VALUES (165, N'Description 165', N'https://fdn2.gsmarena.com/vv/bigpic/ergo118b.gif', 16000000, 17000000, N'Ericsson GO 118', 3)
INSERT [dbo].[PRODUCT] ([id], [description], [link_image], [price_in], [price_sell], [product_name], [category_id]) VALUES (166, N'Description 166', N'https://fdn2.gsmarena.com/vv/bigpic/ergs18b.gif', 17000000, 18000000, N'Ericsson GS 18', 3)
INSERT [dbo].[PRODUCT] ([id], [description], [link_image], [price_in], [price_sell], [product_name], [category_id]) VALUES (167, N'Description 167', N'https://fdn2.gsmarena.com/vv/bigpic/ergs337b.gif', 18000000, 19000000, N'Ericsson GS 337', 3)
INSERT [dbo].[PRODUCT] ([id], [description], [link_image], [price_in], [price_sell], [product_name], [category_id]) VALUES (168, N'Description 168', N'https://fdn2.gsmarena.com/vv/bigpic/eri888b.gif', 19000000, 20000000, N'Ericsson I 888', 3)
INSERT [dbo].[PRODUCT] ([id], [description], [link_image], [price_in], [price_sell], [product_name], [category_id]) VALUES (169, N'Description 169', N'https://fdn2.gsmarena.com/vv/bigpic/erpf768b.gif', 20000000, 21000000, N'Ericsson PF 768', 3)
INSERT [dbo].[PRODUCT] ([id], [description], [link_image], [price_in], [price_sell], [product_name], [category_id]) VALUES (170, N'Description 170', N'https://fdn2.gsmarena.com/vv/bigpic/err250sb.gif', 21000000, 22000000, N'Ericsson R250s PRO', 3)
INSERT [dbo].[PRODUCT] ([id], [description], [link_image], [price_in], [price_sell], [product_name], [category_id]) VALUES (171, N'Description 171', N'https://fdn2.gsmarena.com/vv/bigpic/err310s.gif', 22000000, 23000000, N'Ericsson R310s', 3)
INSERT [dbo].[PRODUCT] ([id], [description], [link_image], [price_in], [price_sell], [product_name], [category_id]) VALUES (172, N'Description 172', N'https://fdn2.gsmarena.com/vv/bigpic/err320b.gif', 23000000, 24000000, N'Ericsson R320', 3)
INSERT [dbo].[PRODUCT] ([id], [description], [link_image], [price_in], [price_sell], [product_name], [category_id]) VALUES (173, N'Description 173', N'https://fdn2.gsmarena.com/vv/bigpic/err380b.gif', 24000000, 25000000, N'Ericsson R380', 3)
INSERT [dbo].[PRODUCT] ([id], [description], [link_image], [price_in], [price_sell], [product_name], [category_id]) VALUES (174, N'Description 174', N'https://fdn2.gsmarena.com/vv/bigpic/err520m.gif', 25000000, 26000000, N'Ericsson R520m', 3)
INSERT [dbo].[PRODUCT] ([id], [description], [link_image], [price_in], [price_sell], [product_name], [category_id]) VALUES (175, N'Description 175', N'https://fdn2.gsmarena.com/vv/bigpic/err600.gif', 26000000, 27000000, N'Ericsson R600', 3)
INSERT [dbo].[PRODUCT] ([id], [description], [link_image], [price_in], [price_sell], [product_name], [category_id]) VALUES (176, N'Description 176', N'https://fdn2.gsmarena.com/vv/bigpic/ers868b.gif', 27000000, 28000000, N'Ericsson S 868', 3)
INSERT [dbo].[PRODUCT] ([id], [description], [link_image], [price_in], [price_sell], [product_name], [category_id]) VALUES (177, N'Description 177', N'https://fdn2.gsmarena.com/vv/bigpic/ersh888b.gif', 28000000, 29000000, N'Ericsson SH 888', 3)
INSERT [dbo].[PRODUCT] ([id], [description], [link_image], [price_in], [price_sell], [product_name], [category_id]) VALUES (178, N'Description 178', N'https://fdn2.gsmarena.com/vv/bigpic/ert10sb.gif', 29000000, 30000000, N'Ericsson T10s', 3)
INSERT [dbo].[PRODUCT] ([id], [description], [link_image], [price_in], [price_sell], [product_name], [category_id]) VALUES (179, N'Description 179', N'https://fdn2.gsmarena.com/vv/bigpic/ert18sb.gif', 30000000, 31000000, N'Ericsson T18s', 3)
INSERT [dbo].[PRODUCT] ([id], [description], [link_image], [price_in], [price_sell], [product_name], [category_id]) VALUES (180, N'Description 180', N'https://fdn2.gsmarena.com/vv/bigpic/ert20e.gif', 31000000, 32000000, N'Ericsson T20e', 3)
INSERT [dbo].[PRODUCT] ([id], [description], [link_image], [price_in], [price_sell], [product_name], [category_id]) VALUES (181, N'Description 181', N'https://fdn2.gsmarena.com/vv/bigpic/ert20s.gif', 32000000, 33000000, N'Ericsson T20s', 3)
INSERT [dbo].[PRODUCT] ([id], [description], [link_image], [price_in], [price_sell], [product_name], [category_id]) VALUES (182, N'Description 182', N'https://fdn2.gsmarena.com/vv/bigpic/ert28wb.gif', 33000000, 34000000, N'Ericsson T28 World', 3)
INSERT [dbo].[PRODUCT] ([id], [description], [link_image], [price_in], [price_sell], [product_name], [category_id]) VALUES (183, N'Description 183', N'https://fdn2.gsmarena.com/vv/bigpic/ert28sb.gif', 34000000, 35000000, N'Ericsson T28s', 3)
INSERT [dbo].[PRODUCT] ([id], [description], [link_image], [price_in], [price_sell], [product_name], [category_id]) VALUES (184, N'Description 184', N'https://fdn2.gsmarena.com/vv/bigpic/ert29.gif', 35000000, 36000000, N'Ericsson T29s', 3)
INSERT [dbo].[PRODUCT] ([id], [description], [link_image], [price_in], [price_sell], [product_name], [category_id]) VALUES (185, N'Description 185', N'https://fdn2.gsmarena.com/vv/bigpic/ert36b.gif', 36000000, 37000000, N'Ericsson T36', 3)
INSERT [dbo].[PRODUCT] ([id], [description], [link_image], [price_in], [price_sell], [product_name], [category_id]) VALUES (186, N'Description 186', N'https://fdn2.gsmarena.com/vv/bigpic/ert39.gif', 37000000, 38000000, N'Ericsson T39', 3)
INSERT [dbo].[PRODUCT] ([id], [description], [link_image], [price_in], [price_sell], [product_name], [category_id]) VALUES (187, N'Description 187', N'https://fdn2.gsmarena.com/vv/bigpic/ert65.gif', 38000000, 39000000, N'Ericsson T65', 3)
INSERT [dbo].[PRODUCT] ([id], [description], [link_image], [price_in], [price_sell], [product_name], [category_id]) VALUES (188, N'Description 188', N'https://fdn2.gsmarena.com/vv/bigpic/ert66.gif', 39000000, 40000000, N'Ericsson T66', 3)
SET IDENTITY_INSERT [dbo].[PRODUCT] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK_7spu4jsok1ktyrrme1byardrh]    Script Date: 10/04/2024 19:54:29 PM ******/
ALTER TABLE [dbo].[ACCOUNT] ADD  CONSTRAINT [UK_7spu4jsok1ktyrrme1byardrh] UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[PRODUCT]  WITH CHECK ADD  CONSTRAINT [FK7u438kvwr308xcwr4wbx36uiw] FOREIGN KEY([category_id])
REFERENCES [dbo].[CATEGORY] ([id])
GO
ALTER TABLE [dbo].[PRODUCT] CHECK CONSTRAINT [FK7u438kvwr308xcwr4wbx36uiw]
GO
USE [master]
GO
ALTER DATABASE [SpringMVC_JPA] SET  READ_WRITE 
GO
