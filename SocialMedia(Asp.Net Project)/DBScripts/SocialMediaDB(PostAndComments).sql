USE [master]
GO
/****** Object:  Database [SocaialMediaDB]    Script Date: 16.02.2020 21:07:48 ******/
CREATE DATABASE [SocaialMediaDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SocaialMediaDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\SocaialMediaDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SocaialMediaDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\SocaialMediaDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [SocaialMediaDB] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SocaialMediaDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SocaialMediaDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SocaialMediaDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SocaialMediaDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SocaialMediaDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SocaialMediaDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [SocaialMediaDB] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [SocaialMediaDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SocaialMediaDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SocaialMediaDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SocaialMediaDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SocaialMediaDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SocaialMediaDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SocaialMediaDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SocaialMediaDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SocaialMediaDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [SocaialMediaDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SocaialMediaDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SocaialMediaDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SocaialMediaDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SocaialMediaDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SocaialMediaDB] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [SocaialMediaDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SocaialMediaDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SocaialMediaDB] SET  MULTI_USER 
GO
ALTER DATABASE [SocaialMediaDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SocaialMediaDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SocaialMediaDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SocaialMediaDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SocaialMediaDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SocaialMediaDB] SET QUERY_STORE = OFF
GO
USE [SocaialMediaDB]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 16.02.2020 21:07:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comments]    Script Date: 16.02.2020 21:07:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comments](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[PostId] [int] NOT NULL,
	[UserId] [nvarchar](max) NOT NULL,
	[UserFullName] [nvarchar](max) NULL,
	[UserName] [nvarchar](max) NULL,
 CONSTRAINT [PK_Comments] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Friends]    Script Date: 16.02.2020 21:07:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Friends](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId1] [nvarchar](max) NULL,
	[UserId2] [nvarchar](max) NULL,
	[Status] [nvarchar](max) NULL,
 CONSTRAINT [PK_Friends] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Posts]    Script Date: 16.02.2020 21:07:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Posts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](max) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[ImageURL] [nvarchar](max) NULL,
	[UserId] [nvarchar](max) NOT NULL,
	[UserFullName] [nvarchar](max) NULL,
	[UserName] [nvarchar](max) NULL,
 CONSTRAINT [PK_Posts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200209142410_InitialForSMDB', N'2.2.6-servicing-10079')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200209143208_InitialForSMDB2', N'2.2.6-servicing-10079')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200210115601_InitialForSMDB3', N'2.2.6-servicing-10079')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200211130318_Init3', N'2.2.6-servicing-10079')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200214161648_Init5', N'2.2.6-servicing-10079')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200214161856_Init6', N'2.2.6-servicing-10079')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200214172513_Init7', N'2.2.6-servicing-10079')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200216111214_Init8', N'2.2.6-servicing-10079')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200216113536_Init9', N'2.2.6-servicing-10079')
SET IDENTITY_INSERT [dbo].[Comments] ON 

INSERT [dbo].[Comments] ([Id], [Description], [PostId], [UserId], [UserFullName], [UserName]) VALUES (1, N'Teyyare adam imishe aydaaa', 1, N'1f878cc1-9c13-4622-bb0c-940400e7f67e', N'Rufat Ismayilov', N'Ruf_smay86')
INSERT [dbo].[Comments] ([Id], [Description], [PostId], [UserId], [UserFullName], [UserName]) VALUES (2, N'Salam qaqaq', 0, N'1f878cc1-9c13-4622-bb0c-940400e7f67e', N'Rufat  Ismayilov', N'Ruf_smay86')
INSERT [dbo].[Comments] ([Id], [Description], [PostId], [UserId], [UserFullName], [UserName]) VALUES (3, N'Salam qaqaq55555555', 0, N'1f878cc1-9c13-4622-bb0c-940400e7f67e', N'Rufat  Ismayilov', N'Ruf_smay86')
INSERT [dbo].[Comments] ([Id], [Description], [PostId], [UserId], [UserFullName], [UserName]) VALUES (4, N'Salam qaqaq55555555', 0, N'1f878cc1-9c13-4622-bb0c-940400e7f67e', N'Rufat  Ismayilov', N'Ruf_smay86')
INSERT [dbo].[Comments] ([Id], [Description], [PostId], [UserId], [UserFullName], [UserName]) VALUES (5, N'Salam qaqaq', 0, N'1f878cc1-9c13-4622-bb0c-940400e7f67e', N'Rufat  Ismayilov', N'Ruf_smay86')
INSERT [dbo].[Comments] ([Id], [Description], [PostId], [UserId], [UserFullName], [UserName]) VALUES (6, N'sdfsdf', 0, N'1f878cc1-9c13-4622-bb0c-940400e7f67e', N'Rufat  Ismayilov', N'Ruf_smay86')
INSERT [dbo].[Comments] ([Id], [Description], [PostId], [UserId], [UserFullName], [UserName]) VALUES (7, N'sdfsdfds', 0, N'1f878cc1-9c13-4622-bb0c-940400e7f67e', N'Rufat  Ismayilov', N'Ruf_smay86')
INSERT [dbo].[Comments] ([Id], [Description], [PostId], [UserId], [UserFullName], [UserName]) VALUES (8, N'sdfsdfsd', 0, N'1f878cc1-9c13-4622-bb0c-940400e7f67e', N'Rufat  Ismayilov', N'Ruf_smay86')
INSERT [dbo].[Comments] ([Id], [Description], [PostId], [UserId], [UserFullName], [UserName]) VALUES (9, N'sdfsdfds', 0, N'1f878cc1-9c13-4622-bb0c-940400e7f67e', N'Rufat  Ismayilov', N'Ruf_smay86')
INSERT [dbo].[Comments] ([Id], [Description], [PostId], [UserId], [UserFullName], [UserName]) VALUES (10, N'sfsdfsdfsdf', 0, N'1f878cc1-9c13-4622-bb0c-940400e7f67e', N'Rufat  Ismayilov', N'Ruf_smay86')
INSERT [dbo].[Comments] ([Id], [Description], [PostId], [UserId], [UserFullName], [UserName]) VALUES (11, N'sadasdas', 0, N'1f878cc1-9c13-4622-bb0c-940400e7f67e', N'Rufat  Ismayilov', N'Ruf_smay86')
INSERT [dbo].[Comments] ([Id], [Description], [PostId], [UserId], [UserFullName], [UserName]) VALUES (13, N'sdfsdfsd', 4, N'1f878cc1-9c13-4622-bb0c-940400e7f67e', N'Rufat  Ismayilov', N'Ruf_smay86')
INSERT [dbo].[Comments] ([Id], [Description], [PostId], [UserId], [UserFullName], [UserName]) VALUES (14, N'Yeeeeee', 4, N'1f878cc1-9c13-4622-bb0c-940400e7f67e', N'Rufat  Ismayilov', N'Ruf_smay86')
INSERT [dbo].[Comments] ([Id], [Description], [PostId], [UserId], [UserFullName], [UserName]) VALUES (15, N'Ishledi axirki', 1, N'1f878cc1-9c13-4622-bb0c-940400e7f67e', N'Rufat  Ismayilov', N'Ruf_smay86')
INSERT [dbo].[Comments] ([Id], [Description], [PostId], [UserId], [UserFullName], [UserName]) VALUES (16, N'Geldimee geldimm', 1, N'e50c9afe-9480-49be-8eac-138ee08fd343', N'Mamed Mamedov', N'mam_amed43')
INSERT [dbo].[Comments] ([Id], [Description], [PostId], [UserId], [UserFullName], [UserName]) VALUES (17, N'sdfsdfsd', 1, N'1f878cc1-9c13-4622-bb0c-940400e7f67e', N'Rufat  Ismayilov', N'Ruf_smay86')
INSERT [dbo].[Comments] ([Id], [Description], [PostId], [UserId], [UserFullName], [UserName]) VALUES (18, N'sdfs', 1, N'1f878cc1-9c13-4622-bb0c-940400e7f67e', N'Rufat  Ismayilov', N'Ruf_smay86')
INSERT [dbo].[Comments] ([Id], [Description], [PostId], [UserId], [UserFullName], [UserName]) VALUES (19, N'aaaa', 1, N'1f878cc1-9c13-4622-bb0c-940400e7f67e', N'Rufat  Ismayilov', N'Ruf_smay86')
INSERT [dbo].[Comments] ([Id], [Description], [PostId], [UserId], [UserFullName], [UserName]) VALUES (20, N'dasdasd', 1, N'1f878cc1-9c13-4622-bb0c-940400e7f67e', N'Rufat  Ismayilov', N'Ruf_smay86')
INSERT [dbo].[Comments] ([Id], [Description], [PostId], [UserId], [UserFullName], [UserName]) VALUES (21, N'ne qeder yazime day', 1, N'1f878cc1-9c13-4622-bb0c-940400e7f67e', N'Rufat  Ismayilov', N'Ruf_smay86')
INSERT [dbo].[Comments] ([Id], [Description], [PostId], [UserId], [UserFullName], [UserName]) VALUES (22, N'ayy Allah', 1, N'1f878cc1-9c13-4622-bb0c-940400e7f67e', N'Rufat  Ismayilov', N'Ruf_smay86')
INSERT [dbo].[Comments] ([Id], [Description], [PostId], [UserId], [UserFullName], [UserName]) VALUES (23, N'Bu yarashigli kimdi bele', 7, N'1f878cc1-9c13-4622-bb0c-940400e7f67e', N'Rufat  Ismayilov', N'Ruf_smay86')
INSERT [dbo].[Comments] ([Id], [Description], [PostId], [UserId], [UserFullName], [UserName]) VALUES (24, N'Besdideee', 7, N'1f878cc1-9c13-4622-bb0c-940400e7f67e', N'Rufat  Ismayilov', N'Ruf_smay86')
INSERT [dbo].[Comments] ([Id], [Description], [PostId], [UserId], [UserFullName], [UserName]) VALUES (25, N'hahahhaha', 7, N'e50c9afe-9480-49be-8eac-138ee08fd343', N'Mamed Mamedov', N'mam_amed43')
SET IDENTITY_INSERT [dbo].[Comments] OFF
SET IDENTITY_INSERT [dbo].[Friends] ON 

INSERT [dbo].[Friends] ([Id], [UserId1], [UserId2], [Status]) VALUES (23, N'e50c9afe-9480-49be-8eac-138ee08fd343', N'f8bf5ea3-898a-4ae1-a8d8-8c0290208fb1', N'Accepted')
INSERT [dbo].[Friends] ([Id], [UserId1], [UserId2], [Status]) VALUES (24, N'1f878cc1-9c13-4622-bb0c-940400e7f67e', N'f8bf5ea3-898a-4ae1-a8d8-8c0290208fb1', N'Accepted')
SET IDENTITY_INSERT [dbo].[Friends] OFF
SET IDENTITY_INSERT [dbo].[Posts] ON 

INSERT [dbo].[Posts] ([Id], [Title], [Description], [ImageURL], [UserId], [UserFullName], [UserName]) VALUES (1, N'Bakıda maşın Təyyarəni vurdu', N'hE heee okkk', N'90436.jpg', N'1f878cc1-9c13-4622-bb0c-940400e7f67e', N'Rufat Ismayilov', N'Ruf_smay86')
INSERT [dbo].[Posts] ([Id], [Title], [Description], [ImageURL], [UserId], [UserFullName], [UserName]) VALUES (4, N'', N'Jizn voram AUEeeee', N'90436.jpg', N'1f878cc1-9c13-4622-bb0c-940400e7f67e', N'Rufat Ismayilov', N'Ruf_smay86')
INSERT [dbo].[Posts] ([Id], [Title], [Description], [ImageURL], [UserId], [UserFullName], [UserName]) VALUES (7, N'', N'Oydaaaaa,aydaaaa,eydeeedadadad', N'linkedinpic.jpg', N'e50c9afe-9480-49be-8eac-138ee08fd343', N'Mamed Mamedov', N'mam_amed43')
INSERT [dbo].[Posts] ([Id], [Title], [Description], [ImageURL], [UserId], [UserFullName], [UserName]) VALUES (8, N'', N'Geldimeeee geldimmmmmm', N'img4cv.jpg', N'f8bf5ea3-898a-4ae1-a8d8-8c0290208fb1', N'Filankes Filankesov', N'fil_ilan45')
SET IDENTITY_INSERT [dbo].[Posts] OFF
USE [master]
GO
ALTER DATABASE [SocaialMediaDB] SET  READ_WRITE 
GO
