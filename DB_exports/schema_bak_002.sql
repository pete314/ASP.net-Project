USE [master]
GO
/****** Object:  Database [sergios_store]    Script Date: 2016.03.11. 15:35:09 ******/
CREATE DATABASE [sergios_store]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'sergios_store', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\sergios_store.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'sergios_store_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\sergios_store_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [sergios_store] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [sergios_store].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [sergios_store] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [sergios_store] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [sergios_store] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [sergios_store] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [sergios_store] SET ARITHABORT OFF 
GO
ALTER DATABASE [sergios_store] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [sergios_store] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [sergios_store] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [sergios_store] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [sergios_store] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [sergios_store] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [sergios_store] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [sergios_store] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [sergios_store] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [sergios_store] SET  DISABLE_BROKER 
GO
ALTER DATABASE [sergios_store] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [sergios_store] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [sergios_store] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [sergios_store] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [sergios_store] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [sergios_store] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [sergios_store] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [sergios_store] SET RECOVERY FULL 
GO
ALTER DATABASE [sergios_store] SET  MULTI_USER 
GO
ALTER DATABASE [sergios_store] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [sergios_store] SET DB_CHAINING OFF 
GO
ALTER DATABASE [sergios_store] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [sergios_store] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [sergios_store] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'sergios_store', N'ON'
GO
USE [sergios_store]
GO
/****** Object:  Table [dbo].[flags]    Script Date: 2016.03.11. 15:35:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[flags](
	[id] [int] NULL,
	[flag_name] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[item_flags]    Script Date: 2016.03.11. 15:35:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[item_flags](
	[store_item_flags_id] [int] NULL,
	[flag_id] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[password_reset_token]    Script Date: 2016.03.11. 15:35:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[password_reset_token](
	[id] [uniqueidentifier] NOT NULL,
	[user_id] [int] NULL,
	[created] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[site_errors]    Script Date: 2016.03.11. 15:35:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[site_errors](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[error_code] [varchar](255) NULL,
	[long_description] [text] NULL,
	[created] [timestamp] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[store_item_img]    Script Date: 2016.03.11. 15:35:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[store_item_img](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[store_item_id] [int] NOT NULL,
	[image_path] [varchar](255) NULL,
	[is_default] [bit] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[store_items]    Script Date: 2016.03.11. 15:35:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[store_items](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[brand] [varchar](50) NULL,
	[model] [varchar](50) NULL,
	[release] [varchar](50) NULL,
	[description] [text] NULL,
	[price] [varchar](50) NULL,
	[created] [datetime] NULL,
	[updated] [datetime] NOT NULL DEFAULT (getdate()),
 CONSTRAINT [PK_store_items] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[store_order_items]    Script Date: 2016.03.11. 15:35:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[store_order_items](
	[order_id] [int] NULL,
	[item_id] [int] NULL,
	[qty] [tinyint] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[store_orders]    Script Date: 2016.03.11. 15:35:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[store_orders](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[created] [timestamp] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[support messages]    Script Date: 2016.03.11. 15:35:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[support messages](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[subject] [varchar](255) NULL,
	[message] [text] NULL,
	[created] [timestamp] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[users]    Script Date: 2016.03.11. 15:35:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[email] [varchar](50) NOT NULL,
	[password] [varchar](33) NOT NULL,
	[address_street] [varchar](50) NULL,
	[address_city] [varchar](50) NULL,
	[address_state] [varchar](50) NULL,
	[address_country] [varchar](50) NULL,
	[address_code] [varchar](50) NULL,
	[created] [datetime] NOT NULL DEFAULT (getdate()),
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[password_reset_token] ([id], [user_id], [created]) VALUES (N'6f73b9c3-874b-4ee9-bb50-6dcc6d8d54a2', 1, CAST(N'2016-03-11 11:39:19.167' AS DateTime))
INSERT [dbo].[password_reset_token] ([id], [user_id], [created]) VALUES (N'e33589b7-cd9a-4f21-9435-cc2eac71f86d', 1, CAST(N'2016-03-11 15:30:17.497' AS DateTime))
INSERT [dbo].[password_reset_token] ([id], [user_id], [created]) VALUES (N'b9bdb07a-e78e-45f2-8e72-d5cc1ee40f6d', 1, CAST(N'2016-03-11 11:33:10.593' AS DateTime))
INSERT [dbo].[password_reset_token] ([id], [user_id], [created]) VALUES (N'b1c70d0b-5237-4d94-815e-e11f8b23d0df', 1, CAST(N'2016-03-11 11:29:02.043' AS DateTime))
INSERT [dbo].[password_reset_token] ([id], [user_id], [created]) VALUES (N'44d3842f-64db-4e0d-a08b-f437ec4592e9', 1, CAST(N'2016-03-11 11:38:07.327' AS DateTime))
SET IDENTITY_INSERT [dbo].[store_items] ON 

INSERT [dbo].[store_items] ([id], [brand], [model], [release], [description], [price], [created], [updated]) VALUES (1, N'Samsung', N'Galaxy', N'S2-mini', N'Android touchscreen device with fast multicore processor', N'220', CAST(N'2016-03-10 20:45:35.543' AS DateTime), CAST(N'2016-03-10 20:45:35.543' AS DateTime))
INSERT [dbo].[store_items] ([id], [brand], [model], [release], [description], [price], [created], [updated]) VALUES (2, N'Samsung', N'Galaxy', N'S2', N'Android touchscreen device with fast multicore processor', N'220', CAST(N'2016-03-10 20:45:53.133' AS DateTime), CAST(N'2016-03-10 20:45:53.133' AS DateTime))
INSERT [dbo].[store_items] ([id], [brand], [model], [release], [description], [price], [created], [updated]) VALUES (3, N'Samsung', N'Galaxy', N'S3', N'Android touchscreen device with fast multicore processor', N'275', CAST(N'2016-03-10 20:45:53.133' AS DateTime), CAST(N'2016-03-10 20:45:53.133' AS DateTime))
INSERT [dbo].[store_items] ([id], [brand], [model], [release], [description], [price], [created], [updated]) VALUES (4, N'Samsung', N'Galaxy', N'S4', N'Android touchscreen device with fast multicore processor', N'355', CAST(N'2016-03-10 20:45:53.133' AS DateTime), CAST(N'2016-03-10 20:45:53.133' AS DateTime))
INSERT [dbo].[store_items] ([id], [brand], [model], [release], [description], [price], [created], [updated]) VALUES (5, N'Samsung', N'Galaxy', N'S5', N'Android touchscreen device with fast multicore processor', N'455', CAST(N'2016-03-10 20:45:53.133' AS DateTime), CAST(N'2016-03-10 20:45:53.133' AS DateTime))
INSERT [dbo].[store_items] ([id], [brand], [model], [release], [description], [price], [created], [updated]) VALUES (6, N'Samsung', N'Galaxy', N'Note 2', N'Android touchscreen device with fast multicore processor with pen', N'285', CAST(N'2016-03-10 20:45:53.133' AS DateTime), CAST(N'2016-03-10 20:45:53.133' AS DateTime))
INSERT [dbo].[store_items] ([id], [brand], [model], [release], [description], [price], [created], [updated]) VALUES (7, N'Samsung', N'Galaxy', N'Note 3', N'Android touchscreen device with fast multicore processor with pen', N'415', CAST(N'2016-03-10 20:45:53.133' AS DateTime), CAST(N'2016-03-10 20:45:53.133' AS DateTime))
INSERT [dbo].[store_items] ([id], [brand], [model], [release], [description], [price], [created], [updated]) VALUES (8, N'Apple', N'iPhone', N'2', N'IOS touchscreen device  from Apple with fast multicore processor', N'285', CAST(N'2016-03-10 20:45:53.133' AS DateTime), CAST(N'2016-03-10 20:45:53.133' AS DateTime))
INSERT [dbo].[store_items] ([id], [brand], [model], [release], [description], [price], [created], [updated]) VALUES (9, N'Apple', N'iPhone', N'3', N'IOS touchscreen device  from Apple with fast multicore processor', N'325', CAST(N'2016-03-10 20:45:53.133' AS DateTime), CAST(N'2016-03-10 20:45:53.133' AS DateTime))
INSERT [dbo].[store_items] ([id], [brand], [model], [release], [description], [price], [created], [updated]) VALUES (10, N'Apple', N'iPhone', N'4', N'IOS touchscreen device  from Apple with fast multicore processor', N'415', CAST(N'2016-03-10 20:45:53.133' AS DateTime), CAST(N'2016-03-10 20:45:53.133' AS DateTime))
INSERT [dbo].[store_items] ([id], [brand], [model], [release], [description], [price], [created], [updated]) VALUES (11, N'Apple', N'iPhone', N'6', N'IOS touchscreen device  from Apple with fast multicore processor', N'595', CAST(N'2016-03-10 20:45:53.133' AS DateTime), CAST(N'2016-03-10 20:45:53.133' AS DateTime))
INSERT [dbo].[store_items] ([id], [brand], [model], [release], [description], [price], [created], [updated]) VALUES (12, N'Apple', N'iPhone', N'5', N'IOS touchscreen device  from Apple with fast multicore processor', N'515', CAST(N'2016-03-10 20:45:53.133' AS DateTime), CAST(N'2016-03-10 20:45:53.133' AS DateTime))
SET IDENTITY_INSERT [dbo].[store_items] OFF
SET IDENTITY_INSERT [dbo].[users] ON 

INSERT [dbo].[users] ([id], [name], [email], [password], [address_street], [address_city], [address_state], [address_country], [address_code], [created]) VALUES (1, N'Peter Nagy', N'peternagymails@gmail.com', N'hacker', N'56 Main Street', N'Sligo', N'Co. Sligo', N'Ireland', N'0000', CAST(N'2016-03-11 08:46:04.977' AS DateTime))
SET IDENTITY_INSERT [dbo].[users] OFF
ALTER TABLE [dbo].[password_reset_token]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([id])
GO
/****** Object:  StoredProcedure [dbo].[spChangeUserPassword]    Script Date: 2016.03.11. 15:35:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[spChangeUserPassword]
@Password nvarchar(100),
@UserId int,
@GUID uniqueidentifier
as
Begin
 if(@UserId is null)
 Begin
  Select 0 as IsPasswordChanged
 End
 Else
 Begin
  Update users set
  [password] = @Password
  where id = @UserId
  
  -- delete token
  Delete from password_reset_token
  where id = @GUID
  
  Select 1 as IsPasswordChanged
 End
End
GO
/****** Object:  StoredProcedure [dbo].[spResetPassword]    Script Date: 2016.03.11. 15:35:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[spResetPassword]
@UserEmail nvarchar(100)
as
Begin
 Declare @UserId int
 Declare @Email nvarchar(100)
 Declare @UserName nvarchar(100)
 
 Select @UserId = id, @Email = email, @UserName = name
 from users
 where email = @UserEmail
 
 if(@UserId IS NOT NULL)
 Begin
  Declare @GUID UniqueIdentifier
  Set @GUID = NEWID()
  
  Insert into password_reset_token
  (id, user_id, created)
  Values(@GUID, @UserId, GETDATE())
  
  Select 1 as ReturnCode, @GUID as Token, @Email as Email, @UserName as Name
 End
 Else
 Begin
  SELECT 0 as ReturnCode, NULL as Token, NULL as Email, NULL as Name
 End
End
GO
/****** Object:  StoredProcedure [dbo].[spTokenLookup]    Script Date: 2016.03.11. 15:35:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Return user id if is valid
CREATE Proc [dbo].[spTokenLookup] 
@TOKEN uniqueidentifier
as
Begin
 Declare @UserId int
 
 If(Exists(Select user_id from password_reset_token where id = @TOKEN))
 Begin
  Select @UserId = user_id from password_reset_token where id = @TOKEN

  Select 1 as IsValidToken, @UserId as USERID
 End
 Else
 Begin
  Select 0 as IsValidToken, @UserId as USERID
 End
End

GO
USE [master]
GO
ALTER DATABASE [sergios_store] SET  READ_WRITE 
GO
