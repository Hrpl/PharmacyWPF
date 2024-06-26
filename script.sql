USE [master]
GO
/****** Object:  Database [PharmApp]    Script Date: 11.04.2024 10:46:42 ******/
CREATE DATABASE [PharmApp]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PharmApp', FILENAME = N'C:\Users\Денис\PharmApp.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PharmApp_log', FILENAME = N'C:\Users\Денис\PharmApp_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [PharmApp] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PharmApp].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PharmApp] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PharmApp] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PharmApp] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PharmApp] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PharmApp] SET ARITHABORT OFF 
GO
ALTER DATABASE [PharmApp] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [PharmApp] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PharmApp] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PharmApp] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PharmApp] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PharmApp] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PharmApp] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PharmApp] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PharmApp] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PharmApp] SET  ENABLE_BROKER 
GO
ALTER DATABASE [PharmApp] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PharmApp] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PharmApp] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PharmApp] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PharmApp] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PharmApp] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [PharmApp] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PharmApp] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [PharmApp] SET  MULTI_USER 
GO
ALTER DATABASE [PharmApp] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PharmApp] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PharmApp] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PharmApp] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PharmApp] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PharmApp] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [PharmApp] SET QUERY_STORE = OFF
GO
USE [PharmApp]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 11.04.2024 10:46:42 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 11.04.2024 10:46:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Surname] [nvarchar](max) NOT NULL,
	[Patronymic] [nvarchar](max) NOT NULL,
	[Phone] [nvarchar](max) NOT NULL,
	[Address] [nvarchar](max) NOT NULL,
	[Birthday] [date] NOT NULL,
	[Email] [nvarchar](max) NOT NULL,
	[Login] [nvarchar](max) NOT NULL,
	[Password] [nvarchar](max) NOT NULL,
	[RoleId] [int] NOT NULL,
 CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Medicines]    Script Date: 11.04.2024 10:46:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Medicines](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Manufacture] [nvarchar](max) NOT NULL,
	[ExpretionDate] [date] NULL,
	[Quantity] [int] NULL,
	[BuyPrice] [int] NULL,
	[SalePrice] [int] NULL,
 CONSTRAINT [PK_Medicines] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MedicInOrders]    Script Date: 11.04.2024 10:46:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MedicInOrders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[MedicineId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[PriceForOne] [int] NOT NULL,
 CONSTRAINT [PK_MedicInOrders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MedicInRequest]    Script Date: 11.04.2024 10:46:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MedicInRequest](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MedicineId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[InUnitPrice] [int] NULL,
	[AllPrice] [int] NULL,
	[RequestNumber] [nvarchar](max) NULL,
 CONSTRAINT [PK_MedicInRequest] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 11.04.2024 10:46:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Date] [datetime2](7) NOT NULL,
	[SummaryPrice] [int] NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Request]    Script Date: 11.04.2024 10:46:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Request](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DateTime] [datetime2](7) NOT NULL,
	[ProviderName] [nvarchar](max) NOT NULL,
	[Status] [nvarchar](max) NOT NULL,
	[SummaryPrice] [int] NULL,
	[Number] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Request] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 11.04.2024 10:46:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240404181224_1.0', N'8.0.3')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240404202143_1.1', N'8.0.3')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240404202352_1.1', N'8.0.3')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240405201219_1.2', N'8.0.3')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240406065428_1.2.1', N'8.0.3')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240406091309_1.3', N'8.0.3')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240406091656_1.3.1', N'8.0.3')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240406115012_1.4', N'8.0.3')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240406131325_1.5', N'8.0.3')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240406132117_1.6', N'8.0.3')
GO
SET IDENTITY_INSERT [dbo].[Employees] ON 

INSERT [dbo].[Employees] ([Id], [Name], [Surname], [Patronymic], [Phone], [Address], [Birthday], [Email], [Login], [Password], [RoleId]) VALUES (1, N'Андрей', N'Смирнов', N'Николаевич', N'89054498811', N'Мира 1', CAST(N'2004-04-28' AS Date), N'p@mail.ru', N'a', N'0000', 1)
INSERT [dbo].[Employees] ([Id], [Name], [Surname], [Patronymic], [Phone], [Address], [Birthday], [Email], [Login], [Password], [RoleId]) VALUES (6, N'Дмитрий', N'Александрович', N'Трофимов', N'89284563271', N'Пушкина 1', CAST(N'2004-10-11' AS Date), N'd@mail.ru', N'dima', N'456', 2)
INSERT [dbo].[Employees] ([Id], [Name], [Surname], [Patronymic], [Phone], [Address], [Birthday], [Email], [Login], [Password], [RoleId]) VALUES (7, N'Алексей', N'Алексеевич', N'Пушкарёв', N'88005353535', N'Ленина 1', CAST(N'2004-05-24' AS Date), N'a@mail.ru', N'lesha', N'789', 3)
SET IDENTITY_INSERT [dbo].[Employees] OFF
GO
SET IDENTITY_INSERT [dbo].[Medicines] ON 

INSERT [dbo].[Medicines] ([Id], [Name], [Manufacture], [ExpretionDate], [Quantity], [BuyPrice], [SalePrice]) VALUES (1, N'Анальгин', N'ООО Экстра', CAST(N'2025-03-13' AS Date), 26, 15, 20)
INSERT [dbo].[Medicines] ([Id], [Name], [Manufacture], [ExpretionDate], [Quantity], [BuyPrice], [SalePrice]) VALUES (2, N'Парацетамол', N'ООО Экстра', CAST(N'2026-05-13' AS Date), 20, 8, 10)
INSERT [dbo].[Medicines] ([Id], [Name], [Manufacture], [ExpretionDate], [Quantity], [BuyPrice], [SalePrice]) VALUES (3, N'Ремантадин', N'ООО Эвалар', CAST(N'2025-08-22' AS Date), 23, 5, 10)
INSERT [dbo].[Medicines] ([Id], [Name], [Manufacture], [ExpretionDate], [Quantity], [BuyPrice], [SalePrice]) VALUES (4, N'Пустырник Форте', N'ООО Эвалар', CAST(N'2025-01-01' AS Date), 15, 25, 37)
INSERT [dbo].[Medicines] ([Id], [Name], [Manufacture], [ExpretionDate], [Quantity], [BuyPrice], [SalePrice]) VALUES (6, N'fdfd', N'dffd', NULL, NULL, 0, 0)
SET IDENTITY_INSERT [dbo].[Medicines] OFF
GO
SET IDENTITY_INSERT [dbo].[MedicInOrders] ON 

INSERT [dbo].[MedicInOrders] ([Id], [OrderId], [MedicineId], [Quantity], [PriceForOne]) VALUES (2, 5, 1, 2, 20)
INSERT [dbo].[MedicInOrders] ([Id], [OrderId], [MedicineId], [Quantity], [PriceForOne]) VALUES (3, 6, 2, 3, 10)
INSERT [dbo].[MedicInOrders] ([Id], [OrderId], [MedicineId], [Quantity], [PriceForOne]) VALUES (4, 6, 3, 1, 10)
SET IDENTITY_INSERT [dbo].[MedicInOrders] OFF
GO
SET IDENTITY_INSERT [dbo].[MedicInRequest] ON 

INSERT [dbo].[MedicInRequest] ([Id], [MedicineId], [Quantity], [InUnitPrice], [AllPrice], [RequestNumber]) VALUES (1, 1, 12, 12, 144, N'12')
INSERT [dbo].[MedicInRequest] ([Id], [MedicineId], [Quantity], [InUnitPrice], [AllPrice], [RequestNumber]) VALUES (2, 1, 12, 12, 144, N'sdds')
INSERT [dbo].[MedicInRequest] ([Id], [MedicineId], [Quantity], [InUnitPrice], [AllPrice], [RequestNumber]) VALUES (3, 2, 12, 12, 144, N'sdds')
INSERT [dbo].[MedicInRequest] ([Id], [MedicineId], [Quantity], [InUnitPrice], [AllPrice], [RequestNumber]) VALUES (9, 1, 1, NULL, NULL, N'123')
INSERT [dbo].[MedicInRequest] ([Id], [MedicineId], [Quantity], [InUnitPrice], [AllPrice], [RequestNumber]) VALUES (10, 2, 2, NULL, NULL, N'123')
SET IDENTITY_INSERT [dbo].[MedicInRequest] OFF
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([Id], [Date], [SummaryPrice]) VALUES (5, CAST(N'2024-04-08T23:59:17.3258826' AS DateTime2), 40)
INSERT [dbo].[Order] ([Id], [Date], [SummaryPrice]) VALUES (6, CAST(N'2024-04-08T23:59:54.2753102' AS DateTime2), 40)
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
SET IDENTITY_INSERT [dbo].[Request] ON 

INSERT [dbo].[Request] ([Id], [DateTime], [ProviderName], [Status], [SummaryPrice], [Number]) VALUES (1, CAST(N'2024-04-06T20:46:31.3445590' AS DateTime2), N'sfddsdsf', N'Accept', NULL, N'12')
INSERT [dbo].[Request] ([Id], [DateTime], [ProviderName], [Status], [SummaryPrice], [Number]) VALUES (2, CAST(N'2024-04-06T23:00:57.9339485' AS DateTime2), N'dssd', N'Create', NULL, N'sdds')
INSERT [dbo].[Request] ([Id], [DateTime], [ProviderName], [Status], [SummaryPrice], [Number]) VALUES (5, CAST(N'2024-04-08T23:04:32.5613096' AS DateTime2), N'qwerty', N'Accept', NULL, N'123')
SET IDENTITY_INSERT [dbo].[Request] OFF
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([Id], [Name]) VALUES (1, N'Админ')
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (2, N'Глав врач')
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (3, N'Сотрудник')
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
/****** Object:  Index [IX_Employees_RoleId]    Script Date: 11.04.2024 10:46:42 ******/
CREATE NONCLUSTERED INDEX [IX_Employees_RoleId] ON [dbo].[Employees]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_MedicInOrders_MedicineId]    Script Date: 11.04.2024 10:46:42 ******/
CREATE NONCLUSTERED INDEX [IX_MedicInOrders_MedicineId] ON [dbo].[MedicInOrders]
(
	[MedicineId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_MedicInOrders_OrderId]    Script Date: 11.04.2024 10:46:42 ******/
CREATE NONCLUSTERED INDEX [IX_MedicInOrders_OrderId] ON [dbo].[MedicInOrders]
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_MedicInRequest_MedicineId]    Script Date: 11.04.2024 10:46:42 ******/
CREATE NONCLUSTERED INDEX [IX_MedicInRequest_MedicineId] ON [dbo].[MedicInRequest]
(
	[MedicineId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Medicines] ADD  DEFAULT ((0)) FOR [BuyPrice]
GO
ALTER TABLE [dbo].[Medicines] ADD  DEFAULT ((0)) FOR [SalePrice]
GO
ALTER TABLE [dbo].[MedicInRequest] ADD  DEFAULT ((0)) FOR [InUnitPrice]
GO
ALTER TABLE [dbo].[MedicInRequest] ADD  DEFAULT ((0)) FOR [AllPrice]
GO
ALTER TABLE [dbo].[Request] ADD  DEFAULT ((0)) FOR [Number]
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [FK_Employees_Roles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [FK_Employees_Roles_RoleId]
GO
ALTER TABLE [dbo].[MedicInOrders]  WITH CHECK ADD  CONSTRAINT [FK_MedicInOrders_Medicines_MedicineId] FOREIGN KEY([MedicineId])
REFERENCES [dbo].[Medicines] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[MedicInOrders] CHECK CONSTRAINT [FK_MedicInOrders_Medicines_MedicineId]
GO
ALTER TABLE [dbo].[MedicInOrders]  WITH CHECK ADD  CONSTRAINT [FK_MedicInOrders_Order_OrderId] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Order] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[MedicInOrders] CHECK CONSTRAINT [FK_MedicInOrders_Order_OrderId]
GO
ALTER TABLE [dbo].[MedicInRequest]  WITH CHECK ADD  CONSTRAINT [FK_MedicInRequest_Medicines_MedicineId] FOREIGN KEY([MedicineId])
REFERENCES [dbo].[Medicines] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[MedicInRequest] CHECK CONSTRAINT [FK_MedicInRequest_Medicines_MedicineId]
GO
USE [master]
GO
ALTER DATABASE [PharmApp] SET  READ_WRITE 
GO
