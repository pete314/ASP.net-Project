USE [master]
GO
/****** Object:  Database [sergios_store]    Script Date: 2016.03.10. 15:21:07 ******/
CREATE DATABASE [sergios_store] ON  PRIMARY 
( NAME = N'sergios_store', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\sergios_store.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'sergios_store_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\sergios_store_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
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
EXEC sys.sp_db_vardecimal_storage_format N'sergios_store', N'ON'
GO
USE [sergios_store]
GO
/****** Object:  Table [dbo].[flags]    Script Date: 2016.03.10. 15:21:07 ******/
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
/****** Object:  Table [dbo].[item_flags]    Script Date: 2016.03.10. 15:21:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[item_flags](
	[store_item_flags_id] [int] NULL,
	[flag_id] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[site_errors]    Script Date: 2016.03.10. 15:21:07 ******/
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
/****** Object:  Table [dbo].[store_item_img]    Script Date: 2016.03.10. 15:21:07 ******/
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
/****** Object:  Table [dbo].[store_items]    Script Date: 2016.03.10. 15:21:07 ******/
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
	[updated] [timestamp] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[store_order_items]    Script Date: 2016.03.10. 15:21:07 ******/
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
/****** Object:  Table [dbo].[store_orders]    Script Date: 2016.03.10. 15:21:07 ******/
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
/****** Object:  Table [dbo].[support messages]    Script Date: 2016.03.10. 15:21:07 ******/
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
/****** Object:  Table [dbo].[users]    Script Date: 2016.03.10. 15:21:07 ******/
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
	[created] [timestamp] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
USE [master]
GO
ALTER DATABASE [sergios_store] SET  READ_WRITE 
GO
