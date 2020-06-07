USE [master]
GO
/****** Object:  Database [CoTEC-2020]    Script Date: 6/3/2020 3:53:42 AM ******/
CREATE DATABASE [CoTEC-2020]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CoTEC-2020', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQL2019\MSSQL\DATA\CoTEC-2020.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CoTEC-2020_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQL2019\MSSQL\DATA\CoTEC-2020_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [CoTEC-2020] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CoTEC-2020].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CoTEC-2020] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CoTEC-2020] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CoTEC-2020] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CoTEC-2020] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CoTEC-2020] SET ARITHABORT OFF 
GO
ALTER DATABASE [CoTEC-2020] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CoTEC-2020] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CoTEC-2020] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CoTEC-2020] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CoTEC-2020] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CoTEC-2020] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CoTEC-2020] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CoTEC-2020] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CoTEC-2020] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CoTEC-2020] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CoTEC-2020] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CoTEC-2020] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CoTEC-2020] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CoTEC-2020] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CoTEC-2020] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CoTEC-2020] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CoTEC-2020] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CoTEC-2020] SET RECOVERY FULL 
GO
ALTER DATABASE [CoTEC-2020] SET  MULTI_USER 
GO
ALTER DATABASE [CoTEC-2020] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CoTEC-2020] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CoTEC-2020] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CoTEC-2020] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CoTEC-2020] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'CoTEC-2020', N'ON'
GO
ALTER DATABASE [CoTEC-2020] SET QUERY_STORE = OFF
GO
USE [CoTEC-2020]
GO
/****** Object:  Schema [CoTEC-2020 Schema I]    Script Date: 6/3/2020 3:53:42 AM ******/
CREATE SCHEMA [CoTEC-2020 Schema I]
GO
/****** Object:  Table [dbo].[Centro_Hospitalario]    Script Date: 6/3/2020 3:53:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Centro_Hospitalario](
	[Id_Centro_Hospitalario] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](100) NULL,
	[Capacidad] [int] NULL,
	[Capacidad_UCI] [int] NULL,
	[Director] [nvarchar](100) NULL,
	[Contacto] [nvarchar](50) NULL,
	[Id_Ubicacion] [int] NULL,
 CONSTRAINT [PK_Centro_Hospitalario] PRIMARY KEY CLUSTERED 
(
	[Id_Centro_Hospitalario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contacto]    Script Date: 6/3/2020 3:53:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contacto](
	[Id_Contacto] [int] IDENTITY(1,1) NOT NULL,
	[Correo] [nvarchar](100) NULL,
	[Id_Paciente] [int] NULL,
	[Cedula] [nvarchar](30) NULL,
 CONSTRAINT [PK_Contacto] PRIMARY KEY CLUSTERED 
(
	[Id_Contacto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Medicamento]    Script Date: 6/3/2020 3:53:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Medicamento](
	[Id_Medicamento] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](100) NULL,
	[Descripcion] [nvarchar](300) NULL,
	[Casa_Farmaceutica] [nvarchar](100) NULL,
 CONSTRAINT [PK_Medicamento] PRIMARY KEY CLUSTERED 
(
	[Id_Medicamento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Medicamento_Paciente]    Script Date: 6/3/2020 3:53:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Medicamento_Paciente](
	[Id_Medicamento] [int] NULL,
	[Id_Paciente] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Medida_Sanitaria]    Script Date: 6/3/2020 3:53:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Medida_Sanitaria](
	[Id_Medida_Sanitaria] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](100) NULL,
	[Descripcion] [nvarchar](300) NULL,
	[Estado] [nvarchar](20) NULL,
	[Fecha_Inicio] [date] NULL,
	[Fecha_Final] [date] NULL,
 CONSTRAINT [PK_Medida_Sanitaria] PRIMARY KEY CLUSTERED 
(
	[Id_Medida_Sanitaria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Paciente]    Script Date: 6/3/2020 3:53:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Paciente](
	[Id_Paciente] [int] IDENTITY(1,1) NOT NULL,
	[Estado] [nvarchar](100) NULL,
	[Internado] [nvarchar](10) NULL,
	[UCI] [nvarchar](10) NULL,
	[Fecha_Ingreso] [date] NULL,
	[Cedula] [nvarchar](30) NULL,
 CONSTRAINT [PK_Paciente] PRIMARY KEY CLUSTERED 
(
	[Id_Paciente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Patologia]    Script Date: 6/3/2020 3:53:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Patologia](
	[Id_Patologia] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](100) NULL,
	[Descripcion] [nvarchar](300) NULL,
	[Tratamiento] [nvarchar](300) NULL,
 CONSTRAINT [PK_Patologia] PRIMARY KEY CLUSTERED 
(
	[Id_Patologia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Persona]    Script Date: 6/3/2020 3:53:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Persona](
	[Cedula] [nvarchar](30) NOT NULL,
	[Nombre] [nvarchar](75) NULL,
	[Primer_Apellido] [nvarchar](75) NULL,
	[Segundo_Apellido] [nvarchar](75) NULL,
	[Fecha_Nacimiento] [date] NULL,
	[Id_Ubicacion] [int] NULL,
 CONSTRAINT [PK_Persona] PRIMARY KEY CLUSTERED 
(
	[Cedula] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Persona_Patologia]    Script Date: 6/3/2020 3:53:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Persona_Patologia](
	[Cedula] [nvarchar](30) NULL,
	[Id_Patologia] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ubicacion]    Script Date: 6/3/2020 3:53:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ubicacion](
	[Id_Ubicacion] [int] NOT NULL,
	[Continente] [nvarchar](75) NULL,
	[Pais] [nvarchar](75) NULL,
	[Region] [nvarchar](75) NULL,
 CONSTRAINT [PK_Ubicacion] PRIMARY KEY CLUSTERED 
(
	[Id_Ubicacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ubicacion_Medida_Sanitaria]    Script Date: 6/3/2020 3:53:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ubicacion_Medida_Sanitaria](
	[Id_Ubicacion] [int] NULL,
	[Id_Medida_Sanitaria] [int] NULL
) ON [PRIMARY]
GO
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16000218 -3838', N'Rajah', N'Stafford', N'Bradford', CAST(N'1954-05-06' AS Date), 43)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16000411 -3510', N'Aurora', N'Witt', N'Rhodes', CAST(N'1980-08-10' AS Date), 11)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16000810 -7542', N'Sophia', N'Hopper', N'Pugh', CAST(N'1986-04-21' AS Date), 188)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16000812 -5601', N'Byron', N'Faulkner', N'Mayo', CAST(N'2012-12-01' AS Date), 101)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16000914 -5400', N'Tad', N'Ramirez', N'Stone', CAST(N'1951-05-29' AS Date), 56)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16000922 -9105', N'Hu', N'Roach', N'Farley', CAST(N'1954-04-30' AS Date), 123)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16001026 -7235', N'Omar', N'Ortiz', N'Aguirre', CAST(N'1971-02-28' AS Date), 157)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16001218 -5591', N'Len', N'Mathews', N'Wynn', CAST(N'1985-06-18' AS Date), 110)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16001221 -3971', N'Olga', N'Mcguire', N'Miranda', CAST(N'2012-06-01' AS Date), 122)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16001225 -2839', N'Lillian', N'Pacheco', N'Hamilton', CAST(N'1990-03-23' AS Date), 170)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16010107 -0076', N'Preston', N'Mayer', N'Goodwin', CAST(N'1972-12-28' AS Date), 64)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16010224 -8788', N'Abbot', N'Hays', N'Barnett', CAST(N'1928-10-19' AS Date), 104)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16010410 -3403', N'Leah', N'Mitchell', N'Gay', CAST(N'1927-04-29' AS Date), 68)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16010623 -9940', N'Lester', N'Jacobs', N'Arnold', CAST(N'1970-09-25' AS Date), 75)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16010829 -6815', N'Kibo', N'Downs', N'Bailey', CAST(N'1978-12-07' AS Date), 101)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16011102 -6803', N'Iona', N'Browning', N'Peterson', CAST(N'1930-01-24' AS Date), 22)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16011126 -3240', N'Shafira', N'Peck', N'Henry', CAST(N'1949-08-03' AS Date), 153)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16020202 -9245', N'Hilda', N'Torres', N'Shepard', CAST(N'1967-10-16' AS Date), 119)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16020910 -3738', N'Diana', N'Albert', N'Hampton', CAST(N'1926-07-27' AS Date), 106)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16030220 -9655', N'Amity', N'Cote', N'Chambers', CAST(N'1960-05-17' AS Date), 138)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16030424 -7935', N'Hall', N'Levine', N'Clements', CAST(N'1992-06-13' AS Date), 137)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16030513 -4090', N'Ulysses', N'Valenzuela', N'Ortiz', CAST(N'2019-08-31' AS Date), 147)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16030908 -9506', N'Karina', N'Jacobs', N'Mcgowan', CAST(N'2002-01-14' AS Date), 109)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16030918 -9587', N'Sade', N'Lindsay', N'Hudson', CAST(N'1922-02-04' AS Date), 52)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16040304 -6394', N'Lucy', N'Tanner', N'Bryant', CAST(N'1978-06-11' AS Date), 145)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16040419 -6131', N'Illana', N'Garner', N'Cervantes', CAST(N'1945-01-08' AS Date), 198)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16040523 -9625', N'Baxter', N'Bartlett', N'Anthony', CAST(N'1944-06-15' AS Date), 29)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16040924 -5677', N'Britanney', N'Blevins', N'Frost', CAST(N'1945-01-08' AS Date), 193)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16041113 -5197', N'Paloma', N'Delaney', N'Rivers', CAST(N'1991-09-23' AS Date), 80)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16050227 -8039', N'Rina', N'Berry', N'Ochoa', CAST(N'2011-09-14' AS Date), 81)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16050229 -9217', N'Willa', N'Bright', N'Cortez', CAST(N'2012-07-10' AS Date), 60)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16051214 -0922', N'Murphy', N'Hartman', N'Phelps', CAST(N'1971-01-10' AS Date), 26)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16060911 -7791', N'Demetrius', N'Workman', N'Berg', CAST(N'2013-07-23' AS Date), 32)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16061223 -1258', N'Oleg', N'Rowland', N'Walls', CAST(N'1975-08-28' AS Date), 148)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16070110 -9845', N'Beck', N'Sellers', N'Hyde', CAST(N'1985-08-08' AS Date), 151)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16070211 -0842', N'Reed', N'Hicks', N'Calderon', CAST(N'1975-04-21' AS Date), 23)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16070726 -2739', N'Yoko', N'Holt', N'Massey', CAST(N'1994-12-23' AS Date), 194)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16070920 -9522', N'Ivy', N'Gates', N'Cooke', CAST(N'1943-04-22' AS Date), 149)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16071006 -7901', N'Lilah', N'Zamora', N'English', CAST(N'1941-06-07' AS Date), 164)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16080325 -5041', N'Ferdinand', N'Sears', N'Douglas', CAST(N'1955-12-31' AS Date), 113)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16080413 -9814', N'Helen', N'Garner', N'Ellison', CAST(N'1979-08-16' AS Date), 168)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16080610 -0186', N'Shea', N'Wiley', N'Aguirre', CAST(N'2017-03-28' AS Date), 39)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16080728 -5093', N'Hector', N'Hamilton', N'Miles', CAST(N'1981-06-13' AS Date), 45)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16080928 -8780', N'Brooke', N'Ingram', N'Hensley', CAST(N'1926-11-11' AS Date), 79)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16090609 -9510', N'Maia', N'Humphrey', N'Kelly', CAST(N'1975-06-28' AS Date), 111)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16090617 -8868', N'Brenden', N'Bolton', N'James', CAST(N'1994-04-03' AS Date), 151)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16090823 -5757', N'Bo', N'Atkinson', N'Miller', CAST(N'1948-03-30' AS Date), 184)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16100225 -2086', N'Gavin', N'Henry', N'Duffy', CAST(N'1944-06-07' AS Date), 70)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16100510 -3351', N'Xantha', N'Delacruz', N'Waller', CAST(N'1983-09-06' AS Date), 30)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16100817 -3799', N'Jacob', N'Barry', N'Neal', CAST(N'2010-12-04' AS Date), 66)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16100906 -8238', N'Isabelle', N'Davidson', N'Coffey', CAST(N'1923-09-08' AS Date), 120)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16110206 -8150', N'Kerry', N'Greene', N'Hickman', CAST(N'1935-06-30' AS Date), 86)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16110320 -0406', N'Aimee', N'Crane', N'Moreno', CAST(N'1989-09-26' AS Date), 83)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16110420 -6485', N'William', N'Stone', N'Baird', CAST(N'2008-09-27' AS Date), 126)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16110505 -6822', N'Illiana', N'Wilkins', N'Clarke', CAST(N'1959-02-05' AS Date), 190)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16110708 -6660', N'Riley', N'Tran', N'Yates', CAST(N'1950-06-28' AS Date), 15)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16120121 -7419', N'Debra', N'Lawrence', N'Foster', CAST(N'1996-03-14' AS Date), 43)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16120207 -2375', N'Pamela', N'Payne', N'Love', CAST(N'1982-08-09' AS Date), 118)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16120614 -3511', N'Imani', N'Ellis', N'Mcguire', CAST(N'1931-06-13' AS Date), 186)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16121206 -7902', N'Ignatius', N'Vinson', N'Schultz', CAST(N'1924-12-21' AS Date), 84)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16130124 -0881', N'Germaine', N'Cervantes', N'Mercado', CAST(N'1927-11-24' AS Date), 154)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16130208 -6317', N'Hector', N'Sims', N'Parsons', CAST(N'2009-12-01' AS Date), 174)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16130607 -7569', N'Malachi', N'Brown', N'Rivas', CAST(N'1980-06-19' AS Date), 10)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16130618 -1007', N'Tara', N'Whitley', N'Anthony', CAST(N'1954-08-27' AS Date), 7)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16130906 -2774', N'Bruno', N'Porter', N'House', CAST(N'1921-07-18' AS Date), 111)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16131109 -4583', N'Rajah', N'Holden', N'Stuart', CAST(N'2010-04-22' AS Date), 21)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16140108 -2084', N'Brianna', N'Hill', N'Hester', CAST(N'1948-01-07' AS Date), 34)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16140226 -2404', N'Quail', N'French', N'Mcclain', CAST(N'1928-07-15' AS Date), 18)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16140318 -2270', N'Aimee', N'Potter', N'Roth', CAST(N'1948-06-01' AS Date), 35)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16140320 -6202', N'Erin', N'Chavez', N'Rivera', CAST(N'1986-06-09' AS Date), 38)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16141024 -2489', N'Charlotte', N'Tyler', N'Stewart', CAST(N'1952-07-18' AS Date), 21)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16150105 -2037', N'Gregory', N'Gibbs', N'Dalton', CAST(N'1949-09-10' AS Date), 18)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16150228 -5776', N'Kiayada', N'Goodman', N'Kane', CAST(N'1960-04-19' AS Date), 121)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16150703 -0813', N'Kermit', N'Cannon', N'Brown', CAST(N'2013-01-12' AS Date), 186)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16150817 -3109', N'Aline', N'Carson', N'Beach', CAST(N'1940-04-26' AS Date), 45)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16150904 -7849', N'Jakeem', N'Lowe', N'Skinner', CAST(N'1979-03-19' AS Date), 66)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16151201 -3549', N'Nash', N'Brock', N'Byers', CAST(N'1977-07-28' AS Date), 24)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16160230 -3420', N'Addison', N'Anthony', N'Young', CAST(N'2015-02-14' AS Date), 115)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16160818 -9401', N'Pascale', N'Matthews', N'Osborne', CAST(N'1992-10-03' AS Date), 25)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16161023 -2561', N'Grace', N'Kemp', N'Prince', CAST(N'1961-04-01' AS Date), 107)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16161024 -5563', N'Walker', N'Gray', N'Melton', CAST(N'1995-10-12' AS Date), 196)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16161123 -8138', N'Jerry', N'Mclean', N'Sherman', CAST(N'1988-11-24' AS Date), 126)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16170402 -5434', N'Mara', N'Luna', N'Freeman', CAST(N'1952-10-07' AS Date), 51)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16170523 -2344', N'Justin', N'Bishop', N'Oconnor', CAST(N'1981-05-14' AS Date), 56)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16170630 -0272', N'Aphrodite', N'Berger', N'Madden', CAST(N'1984-01-07' AS Date), 105)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16170728 -0002', N'Stone', N'Wade', N'Rodriguez', CAST(N'2001-09-23' AS Date), 48)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16170912 -4216', N'Kibo', N'Avery', N'Mcclain', CAST(N'1967-04-13' AS Date), 73)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16170925 -5606', N'Vincent', N'Holt', N'Sutton', CAST(N'1991-06-26' AS Date), 157)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16171130 -2149', N'Dara', N'Bruce', N'Sullivan', CAST(N'1987-02-10' AS Date), 170)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16171204 -3361', N'Eric', N'Peterson', N'Buckley', CAST(N'1998-03-23' AS Date), 158)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16180629 -3849', N'Cynthia', N'Hyde', N'Wallace', CAST(N'1989-12-15' AS Date), 24)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16181222 -9324', N'Chadwick', N'Cummings', N'Mclean', CAST(N'1921-09-07' AS Date), 119)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16190108 -0653', N'Sydnee', N'Garner', N'Doyle', CAST(N'1988-03-11' AS Date), 192)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16190617 -9989', N'Lester', N'Pollard', N'Garza', CAST(N'1942-09-22' AS Date), 115)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16190622 -9446', N'Eleanor', N'Anthony', N'Adkins', CAST(N'2006-01-13' AS Date), 40)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16191018 -3225', N'Jescie', N'Hahn', N'Ferrell', CAST(N'1924-03-31' AS Date), 120)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16191107 -5164', N'Montana', N'Valentine', N'Mccormick', CAST(N'1984-04-15' AS Date), 145)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16191130 -9035', N'Whitney', N'Wheeler', N'Burch', CAST(N'1971-12-05' AS Date), 24)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16191219 -1614', N'Justine', N'Colon', N'Jenkins', CAST(N'1989-07-03' AS Date), 163)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16200303 -4697', N'Berk', N'Brewer', N'Watson', CAST(N'2006-11-15' AS Date), 153)
GO
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16200412 -3952', N'Stephanie', N'Farley', N'Sweet', CAST(N'1983-03-31' AS Date), 128)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16200607 -2595', N'Cadman', N'Shepard', N'Cummings', CAST(N'1948-09-02' AS Date), 156)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16200726 -3920', N'Carolyn', N'Santiago', N'Griffith', CAST(N'1958-12-23' AS Date), 46)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16200821 -1191', N'Chanda', N'Robbins', N'Oliver', CAST(N'2018-10-09' AS Date), 158)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16201111 -4887', N'Alexander', N'Martinez', N'Curry', CAST(N'1933-05-12' AS Date), 45)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16201213 -2839', N'Andrew', N'Holder', N'Stewart', CAST(N'1988-12-16' AS Date), 40)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16210820 -2454', N'Kevin', N'Schwartz', N'Hardin', CAST(N'1999-09-26' AS Date), 20)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16210928 -5060', N'Plato', N'Blanchard', N'Parker', CAST(N'1982-06-25' AS Date), 64)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16211213 -8322', N'Emerald', N'Ray', N'Justice', CAST(N'1956-10-22' AS Date), 116)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16220307 -5599', N'Steel', N'Good', N'Petty', CAST(N'1959-12-24' AS Date), 49)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16220611 -5749', N'Keegan', N'Rogers', N'Barnes', CAST(N'2002-11-25' AS Date), 109)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16220828 -6118', N'Ulysses', N'Gomez', N'Mercer', CAST(N'1996-04-26' AS Date), 197)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16221117 -8849', N'Nevada', N'Rios', N'Tanner', CAST(N'1951-08-08' AS Date), 144)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16221128 -6634', N'Daryl', N'Mcneil', N'Miller', CAST(N'1999-07-15' AS Date), 68)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16221217 -9689', N'Cherokee', N'Stark', N'Whitley', CAST(N'1989-09-01' AS Date), 55)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16230902 -4517', N'Joshua', N'Rice', N'Hart', CAST(N'2007-12-31' AS Date), 185)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16230919 -1282', N'Sacha', N'Head', N'Rose', CAST(N'2017-09-07' AS Date), 38)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16240110 -5354', N'Colorado', N'Malone', N'Mcguire', CAST(N'1929-11-07' AS Date), 3)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16240411 -8347', N'Oleg', N'Key', N'Whitehead', CAST(N'2012-08-29' AS Date), 50)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16250112 -1574', N'Darius', N'Nash', N'Williams', CAST(N'1958-08-22' AS Date), 47)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16250130 -2356', N'Eden', N'Glover', N'Norris', CAST(N'1976-10-14' AS Date), 85)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16250225 -9084', N'Dana', N'Mullen', N'Livingston', CAST(N'1968-07-30' AS Date), 127)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16250318 -8027', N'Kirby', N'Ward', N'Meadows', CAST(N'2002-12-14' AS Date), 33)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16260117 -1537', N'Imelda', N'Craig', N'Wolfe', CAST(N'1929-08-03' AS Date), 147)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16261011 -6481', N'Allen', N'Shepard', N'Riddle', CAST(N'1920-09-18' AS Date), 73)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16261013 -0508', N'Leila', N'Nolan', N'Morrow', CAST(N'1978-10-13' AS Date), 197)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16270113 -6919', N'Kirsten', N'Nichols', N'Cortez', CAST(N'1944-05-19' AS Date), 156)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16270119 -1815', N'Winter', N'Christian', N'Morse', CAST(N'1976-06-10' AS Date), 13)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16270121 -5176', N'Erasmus', N'Sanders', N'Kennedy', CAST(N'1980-09-21' AS Date), 51)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16270918 -6734', N'Nissim', N'Perry', N'Oneal', CAST(N'1934-09-10' AS Date), 30)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16270922 -9799', N'Rajah', N'Park', N'Melendez', CAST(N'2013-08-26' AS Date), 172)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16271118 -4115', N'Ryan', N'Battle', N'Paul', CAST(N'1951-03-17' AS Date), 17)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16271207 -8035', N'Lunea', N'Turner', N'Cunningham', CAST(N'1926-11-23' AS Date), 181)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16280420 -1024', N'Colleen', N'Cote', N'Mullins', CAST(N'1958-07-09' AS Date), 143)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16280825 -1108', N'Jessica', N'Sutton', N'Blevins', CAST(N'1927-11-10' AS Date), 193)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16280830 -3008', N'Leah', N'Rice', N'Mendez', CAST(N'1932-10-27' AS Date), 73)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16281018 -2572', N'Vera', N'Slater', N'Grimes', CAST(N'1930-01-29' AS Date), 194)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16290130 -7179', N'Baxter', N'Clemons', N'Irwin', CAST(N'1961-05-20' AS Date), 118)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16290418 -2074', N'Haviva', N'Rhodes', N'Meyer', CAST(N'1935-11-22' AS Date), 62)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16290525 -0094', N'Shelly', N'Langley', N'Holmes', CAST(N'1983-09-29' AS Date), 124)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16290613 -8116', N'Janna', N'Fleming', N'Dean', CAST(N'1976-10-13' AS Date), 60)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16290622 -6218', N'Justine', N'Reyes', N'Blackwell', CAST(N'2015-05-14' AS Date), 189)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16290903 -0724', N'Stacy', N'Middleton', N'Sanford', CAST(N'1931-05-30' AS Date), 27)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16291005 -0950', N'Cassandra', N'Bartlett', N'Reynolds', CAST(N'1995-09-18' AS Date), 4)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16291125 -8909', N'Ishmael', N'Hogan', N'Wright', CAST(N'1983-04-27' AS Date), 108)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16300508 -1660', N'Ifeoma', N'Holland', N'Jones', CAST(N'2018-10-28' AS Date), 193)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16300725 -5007', N'Imani', N'Giles', N'Lane', CAST(N'1935-10-22' AS Date), 188)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16300810 -5748', N'Magee', N'Gibbs', N'Potts', CAST(N'1929-05-27' AS Date), 173)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16301109 -8005', N'May', N'Willis', N'Blair', CAST(N'2002-03-05' AS Date), 36)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16301118 -7568', N'Xerxes', N'Horne', N'Spence', CAST(N'2000-08-30' AS Date), 60)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16301121 -2721', N'Kerry', N'Banks', N'Lambert', CAST(N'2015-07-18' AS Date), 39)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16310305 -3025', N'George', N'Garrett', N'Benjamin', CAST(N'1923-08-15' AS Date), 91)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16310309 -4961', N'Marah', N'Arnold', N'Puckett', CAST(N'2004-11-10' AS Date), 109)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16310328 -3333', N'Mara', N'Garza', N'Reilly', CAST(N'1942-11-20' AS Date), 28)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16310402 -3332', N'Ciara', N'Booth', N'Massey', CAST(N'2001-07-03' AS Date), 20)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16310414 -1092', N'Kenneth', N'Johns', N'Barrett', CAST(N'2019-02-05' AS Date), 96)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16310711 -2009', N'Justina', N'Noel', N'Kent', CAST(N'2009-11-03' AS Date), 4)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16310730 -7971', N'Christine', N'Chang', N'Lawrence', CAST(N'1961-06-26' AS Date), 101)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16310805 -3996', N'Kitra', N'Mills', N'Case', CAST(N'2019-04-29' AS Date), 94)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16310928 -9524', N'Mona', N'Hardy', N'Hardy', CAST(N'2017-03-10' AS Date), 71)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16311203 -4529', N'Tanner', N'Weber', N'Bonner', CAST(N'1967-05-21' AS Date), 96)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16320918 -0656', N'Irene', N'Gray', N'Hoover', CAST(N'2001-11-19' AS Date), 98)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16321030 -2109', N'Allen', N'Gallagher', N'Vang', CAST(N'1930-12-22' AS Date), 46)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16330117 -5042', N'Leilani', N'Mayer', N'Swanson', CAST(N'1968-02-24' AS Date), 81)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16330725 -0336', N'Kimberley', N'Rivas', N'Perez', CAST(N'2009-12-05' AS Date), 172)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16331007 -9532', N'Rudyard', N'Williams', N'Griffin', CAST(N'1951-04-24' AS Date), 169)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16331105 -9624', N'Eliana', N'Dorsey', N'Martinez', CAST(N'1954-01-05' AS Date), 10)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16340403 -4856', N'Oleg', N'Gallegos', N'Sexton', CAST(N'2020-04-23' AS Date), 46)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16340504 -9358', N'Macey', N'Dillon', N'Larsen', CAST(N'1955-03-11' AS Date), 39)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16340509 -5062', N'Allistair', N'Shaw', N'Walton', CAST(N'1980-08-12' AS Date), 33)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16340914 -7802', N'Steel', N'Norton', N'Alford', CAST(N'1990-10-26' AS Date), 5)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16340915 -9526', N'Yvonne', N'Schmidt', N'Lowery', CAST(N'1959-12-08' AS Date), 114)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16341109 -5874', N'Stacey', N'Farmer', N'Boyle', CAST(N'1946-07-27' AS Date), 81)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16350203 -5318', N'Chancellor', N'Landry', N'Patton', CAST(N'1985-08-01' AS Date), 188)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16350322 -7807', N'Skyler', N'Kemp', N'Chavez', CAST(N'1981-02-17' AS Date), 163)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16350514 -8191', N'Alisa', N'Valentine', N'Beach', CAST(N'1950-07-15' AS Date), 121)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16350719 -9184', N'Ronan', N'Moon', N'Ingram', CAST(N'1976-11-22' AS Date), 181)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16351117 -0791', N'Mannix', N'Sexton', N'Perez', CAST(N'1945-08-29' AS Date), 116)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16351201 -4071', N'Georgia', N'Lane', N'Abbott', CAST(N'1991-07-13' AS Date), 18)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16351220 -2239', N'Ruby', N'Allison', N'Rich', CAST(N'1946-01-04' AS Date), 171)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16360111 -1457', N'Beck', N'Sims', N'Workman', CAST(N'1981-08-26' AS Date), 159)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16360727 -3483', N'Steven', N'Hinton', N'Jacobson', CAST(N'1923-12-24' AS Date), 128)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16360911 -2705', N'Ryder', N'Hancock', N'Heath', CAST(N'1920-05-16' AS Date), 99)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16361023 -8952', N'May', N'Whitehead', N'Becker', CAST(N'2016-05-08' AS Date), 109)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16361210 -8906', N'Jessamine', N'Delacruz', N'Rhodes', CAST(N'1946-09-25' AS Date), 26)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16370112 -4426', N'Otto', N'Cummings', N'Mcleod', CAST(N'1950-05-24' AS Date), 87)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16370120 -3170', N'Oleg', N'Harrell', N'Pacheco', CAST(N'1923-02-02' AS Date), 138)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16370417 -6209', N'September', N'Dixon', N'Byers', CAST(N'1997-02-06' AS Date), 187)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16380306 -9610', N'Amethyst', N'Riley', N'Sanford', CAST(N'1956-06-11' AS Date), 152)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16380721 -5730', N'Lois', N'Dominguez', N'Parker', CAST(N'1983-08-04' AS Date), 33)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16381106 -2300', N'Aspen', N'Roth', N'Weiss', CAST(N'1922-01-17' AS Date), 163)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16390614 -0094', N'Jarrod', N'Pope', N'Mccall', CAST(N'1932-04-20' AS Date), 49)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16390624 -4490', N'Zeus', N'Conway', N'Arnold', CAST(N'2008-09-20' AS Date), 103)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16390907 -8408', N'Angela', N'Callahan', N'Marshall', CAST(N'1977-04-15' AS Date), 168)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16391221 -5419', N'Perry', N'Mcguire', N'Hancock', CAST(N'1938-01-11' AS Date), 26)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16400209 -9465', N'Cora', N'Juarez', N'Case', CAST(N'1969-08-17' AS Date), 115)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16400313 -5797', N'Cedric', N'Hart', N'Vincent', CAST(N'2002-12-21' AS Date), 184)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16400405 -5564', N'Ferris', N'Vaughan', N'Bradford', CAST(N'1972-05-31' AS Date), 174)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16400909 -5680', N'Clayton', N'Bailey', N'Patel', CAST(N'1923-11-30' AS Date), 179)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16400922 -3530', N'Rama', N'Chase', N'May', CAST(N'1996-03-02' AS Date), 122)
GO
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16401209 -1528', N'Elaine', N'Patton', N'Mercado', CAST(N'1991-07-22' AS Date), 94)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16410216 -7014', N'Burke', N'Gallegos', N'Prince', CAST(N'1946-08-12' AS Date), 174)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16410223 -3147', N'Mary', N'Soto', N'Boone', CAST(N'2003-11-17' AS Date), 130)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16410225 -1560', N'Denise', N'Romero', N'Murphy', CAST(N'1956-01-24' AS Date), 149)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16410302 -5831', N'Kathleen', N'Mason', N'Duffy', CAST(N'2016-01-26' AS Date), 114)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16410426 -6723', N'Jessamine', N'Horn', N'Green', CAST(N'1989-11-01' AS Date), 148)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16410616 -4520', N'Portia', N'Talley', N'Perez', CAST(N'1951-01-22' AS Date), 79)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16410801 -0283', N'Elizabeth', N'Page', N'Sanchez', CAST(N'1959-01-28' AS Date), 6)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16420126 -8754', N'Finn', N'Adams', N'Case', CAST(N'1922-03-11' AS Date), 114)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16420512 -0050', N'Harper', N'Maynard', N'Patel', CAST(N'1931-08-01' AS Date), 81)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16420728 -5844', N'Kevyn', N'Torres', N'Parker', CAST(N'1971-10-04' AS Date), 15)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16421029 -9998', N'Adele', N'Franco', N'Oneil', CAST(N'1925-12-27' AS Date), 9)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16430303 -2579', N'Courtney', N'Stokes', N'Sears', CAST(N'1968-05-22' AS Date), 78)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16430326 -3216', N'Trevor', N'Roberts', N'Spencer', CAST(N'1948-12-11' AS Date), 74)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16430404 -7345', N'Calista', N'Zamora', N'Gilliam', CAST(N'2002-08-04' AS Date), 161)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16430409 -8132', N'April', N'Church', N'Mack', CAST(N'1948-03-22' AS Date), 138)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16430601 -3352', N'Neville', N'Alston', N'Mckinney', CAST(N'1955-03-05' AS Date), 194)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16430619 -6702', N'Ezekiel', N'Rojas', N'Avery', CAST(N'1948-09-12' AS Date), 68)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16430804 -0973', N'Lillith', N'Pena', N'Keith', CAST(N'1963-11-20' AS Date), 62)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16430827 -2345', N'Lysandra', N'Compton', N'Price', CAST(N'1990-09-21' AS Date), 179)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16440421 -6683', N'Hasad', N'Burns', N'Gallagher', CAST(N'2011-05-13' AS Date), 126)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16440905 -2786', N'Ariana', N'Salinas', N'Francis', CAST(N'1959-01-15' AS Date), 9)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16441203 -4359', N'Brennan', N'Macdonald', N'Hodge', CAST(N'1929-09-10' AS Date), 45)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16450210 -4435', N'Aphrodite', N'Buckner', N'Hubbard', CAST(N'1977-08-12' AS Date), 67)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16450815 -2735', N'Conan', N'Velez', N'Bridges', CAST(N'1991-02-05' AS Date), 81)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16450825 -4820', N'Cathleen', N'Salinas', N'Mclaughlin', CAST(N'1997-10-20' AS Date), 180)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16451020 -8228', N'Hashim', N'Long', N'Chandler', CAST(N'1999-11-15' AS Date), 115)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16451105 -6741', N'Rosalyn', N'Valdez', N'Harrington', CAST(N'1977-06-17' AS Date), 53)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16460807 -4581', N'Quamar', N'Miller', N'Baldwin', CAST(N'1975-02-11' AS Date), 9)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16461019 -3676', N'Allen', N'Vance', N'Dillard', CAST(N'1976-11-01' AS Date), 106)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16470304 -9330', N'Todd', N'Hewitt', N'Gilliam', CAST(N'1961-10-19' AS Date), 21)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16470322 -3182', N'Freya', N'Woodward', N'Roberson', CAST(N'2012-08-16' AS Date), 162)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16470814 -0712', N'David', N'Carrillo', N'Sloan', CAST(N'1970-11-08' AS Date), 167)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16470907 -6675', N'Rhoda', N'Perkins', N'Lindsay', CAST(N'1986-05-18' AS Date), 194)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16470907 -9737', N'Ria', N'Wilkins', N'Edwards', CAST(N'1987-08-16' AS Date), 45)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16480305 -1509', N'John', N'Campos', N'Robbins', CAST(N'1943-09-28' AS Date), 69)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16480307 -4782', N'Ulla', N'Clemons', N'Combs', CAST(N'1996-10-27' AS Date), 180)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16480317 -1109', N'Morgan', N'Carr', N'Marshall', CAST(N'1977-01-05' AS Date), 35)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16480828 -8817', N'Kirby', N'Morgan', N'Mcdonald', CAST(N'2015-05-08' AS Date), 83)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16480923 -4042', N'Hope', N'Gentry', N'Arnold', CAST(N'1940-12-01' AS Date), 116)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16480924 -5196', N'Madaline', N'Chandler', N'Heath', CAST(N'2004-10-10' AS Date), 83)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16480930 -5974', N'Kathleen', N'Bradshaw', N'Velazquez', CAST(N'1953-01-29' AS Date), 107)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16490311 -2870', N'Haley', N'England', N'Mcdaniel', CAST(N'2009-05-23' AS Date), 112)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16490401 -6484', N'Malik', N'Nixon', N'Glover', CAST(N'1973-02-03' AS Date), 73)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16490508 -1354', N'Savannah', N'Obrien', N'Hurst', CAST(N'1948-07-10' AS Date), 112)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16490702 -1010', N'Faith', N'Pope', N'Robinson', CAST(N'2009-08-11' AS Date), 122)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16490814 -6873', N'Amber', N'Ward', N'Barr', CAST(N'1950-07-15' AS Date), 80)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16491015 -4535', N'Otto', N'Gaines', N'Valenzuela', CAST(N'1982-05-16' AS Date), 15)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16491022 -8073', N'Ezekiel', N'Mcgee', N'Atkinson', CAST(N'2014-01-12' AS Date), 143)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16491023 -0749', N'Karly', N'Cobb', N'Robbins', CAST(N'2000-10-11' AS Date), 116)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16491210 -0908', N'Edan', N'Franklin', N'Reese', CAST(N'2010-11-21' AS Date), 104)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16500203 -5888', N'Cole', N'Todd', N'Odom', CAST(N'1920-02-28' AS Date), 142)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16500317 -4330', N'Cedric', N'French', N'Workman', CAST(N'1963-04-14' AS Date), 34)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16501012 -1514', N'Quamar', N'Velez', N'Simon', CAST(N'1959-01-23' AS Date), 49)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16501112 -3543', N'Kato', N'Shannon', N'Hoover', CAST(N'1919-05-05' AS Date), 125)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16510203 -1332', N'Harlan', N'Donovan', N'Hopkins', CAST(N'1926-03-13' AS Date), 113)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16510829 -4322', N'Chloe', N'Carr', N'Byrd', CAST(N'1922-03-23' AS Date), 6)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16511018 -6920', N'Inga', N'Coleman', N'Haney', CAST(N'1972-11-11' AS Date), 152)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16511203 -7378', N'Alyssa', N'Terrell', N'Kane', CAST(N'1977-08-23' AS Date), 73)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16511229 -5075', N'Amanda', N'Buck', N'James', CAST(N'1948-09-18' AS Date), 121)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16520306 -3093', N'Peter', N'Flowers', N'Gutierrez', CAST(N'1953-06-11' AS Date), 109)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16520708 -9722', N'Iona', N'Valencia', N'Goodwin', CAST(N'1946-10-14' AS Date), 69)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16521016 -3738', N'Barry', N'Schultz', N'Dale', CAST(N'1971-10-06' AS Date), 192)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16521218 -3973', N'Colette', N'Nelson', N'Patel', CAST(N'2001-12-14' AS Date), 122)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16530122 -4738', N'Martena', N'Hunt', N'Howell', CAST(N'1930-08-01' AS Date), 192)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16530520 -0056', N'Yoshi', N'Watson', N'Martinez', CAST(N'1955-08-22' AS Date), 94)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16530605 -7372', N'Keane', N'Sherman', N'Villarreal', CAST(N'2005-05-10' AS Date), 140)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16531122 -8802', N'Quentin', N'Fernandez', N'Gamble', CAST(N'1990-04-13' AS Date), 129)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16541110 -1032', N'Guinevere', N'Reed', N'Juarez', CAST(N'1955-01-01' AS Date), 61)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16550311 -9298', N'Hillary', N'Mcintosh', N'Mckenzie', CAST(N'1990-05-07' AS Date), 165)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16550817 -2011', N'Sebastian', N'Knox', N'Gay', CAST(N'1955-05-11' AS Date), 1)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16550912 -1959', N'Quynn', N'Mcguire', N'Mccoy', CAST(N'1955-09-05' AS Date), 100)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16550923 -0354', N'Celeste', N'Graham', N'Little', CAST(N'1939-08-16' AS Date), 12)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16551030 -4065', N'Byron', N'Short', N'Stephenson', CAST(N'1987-06-16' AS Date), 29)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16560325 -2155', N'Naomi', N'Oneil', N'Duffy', CAST(N'1968-02-24' AS Date), 175)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16560419 -7086', N'Nita', N'Kinney', N'Richardson', CAST(N'1968-08-25' AS Date), 93)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16560505 -0961', N'Merrill', N'Rosales', N'Campos', CAST(N'1920-09-25' AS Date), 68)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16560529 -6630', N'Tanner', N'Bell', N'Hinton', CAST(N'1924-07-16' AS Date), 4)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16560723 -8226', N'Jack', N'Hays', N'Valencia', CAST(N'1924-11-09' AS Date), 89)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16561215 -2214', N'Preston', N'Calderon', N'Ware', CAST(N'2000-01-04' AS Date), 44)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16570209 -3575', N'Ciaran', N'Mcfarland', N'Barnes', CAST(N'2006-06-04' AS Date), 109)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16570301 -5460', N'Clementine', N'Robinson', N'Sweet', CAST(N'1947-10-10' AS Date), 120)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16570315 -5647', N'Alyssa', N'Hogan', N'Bolton', CAST(N'1935-07-31' AS Date), 172)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16570330 -4526', N'Audra', N'Alford', N'Franco', CAST(N'1950-08-02' AS Date), 17)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16570607 -2302', N'Lyle', N'Snow', N'Chambers', CAST(N'1929-09-22' AS Date), 70)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16570726 -8388', N'Amela', N'Fisher', N'Duran', CAST(N'1960-12-11' AS Date), 67)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16570927 -5894', N'Robin', N'Rosario', N'Montoya', CAST(N'1980-07-13' AS Date), 142)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16571204 -9849', N'Denton', N'Warner', N'Fernandez', CAST(N'2001-08-09' AS Date), 57)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16580209 -7625', N'Kameko', N'Barr', N'Fernandez', CAST(N'1937-11-01' AS Date), 183)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16580304 -0509', N'Wayne', N'Hernandez', N'Watkins', CAST(N'1943-10-24' AS Date), 81)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16580307 -6073', N'Chelsea', N'White', N'Schneider', CAST(N'1994-07-19' AS Date), 200)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16580325 -6592', N'Jeremy', N'Marshall', N'Russell', CAST(N'1924-07-08' AS Date), 77)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16580410 -1060', N'Hedda', N'Gay', N'Marks', CAST(N'2007-01-12' AS Date), 133)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16580520 -1034', N'Kyla', N'Mendoza', N'Whitaker', CAST(N'1922-01-24' AS Date), 105)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16580707 -2870', N'Daquan', N'Melendez', N'Bates', CAST(N'1961-08-26' AS Date), 89)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16590105 -7793', N'Carl', N'Rowland', N'Morin', CAST(N'1936-09-25' AS Date), 22)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16590201 -5030', N'Nomlanga', N'Walsh', N'Stephenson', CAST(N'1959-05-08' AS Date), 75)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16590210 -7605', N'Yuri', N'Dominguez', N'Ortiz', CAST(N'1955-02-11' AS Date), 36)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16590224 -7336', N'Clark', N'Welch', N'Mason', CAST(N'1985-11-25' AS Date), 143)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16590425 -0320', N'Cameran', N'Haney', N'Cochran', CAST(N'1922-04-13' AS Date), 156)
GO
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16590801 -7303', N'Acton', N'Newman', N'Weiss', CAST(N'1988-01-14' AS Date), 56)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16600229 -6413', N'Adam', N'Strong', N'Dyer', CAST(N'1992-07-17' AS Date), 100)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16600714 -8106', N'Yasir', N'Church', N'Rivas', CAST(N'2010-12-20' AS Date), 79)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16600902 -6649', N'Francis', N'Stephenson', N'Houston', CAST(N'1932-03-09' AS Date), 130)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16600925 -8101', N'Leila', N'Oliver', N'Christian', CAST(N'1980-11-26' AS Date), 151)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16600929 -0690', N'Ronan', N'Lindsay', N'Castillo', CAST(N'1922-09-05' AS Date), 132)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16601213 -3002', N'Abbot', N'Bauer', N'Hernandez', CAST(N'2000-12-28' AS Date), 35)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16610630 -0251', N'Yuli', N'Nolan', N'Macdonald', CAST(N'1973-04-30' AS Date), 87)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16611109 -7082', N'Samson', N'Nixon', N'Blankenship', CAST(N'2017-03-18' AS Date), 57)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16620105 -4258', N'Hayley', N'Frazier', N'Key', CAST(N'1971-05-29' AS Date), 115)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16620116 -9338', N'Xantha', N'Hughes', N'Farmer', CAST(N'1973-10-13' AS Date), 91)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16620222 -5774', N'Basia', N'Villarreal', N'Vincent', CAST(N'1977-09-27' AS Date), 89)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16620307 -7141', N'Ali', N'Ramsey', N'Maldonado', CAST(N'1952-04-14' AS Date), 165)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16620430 -8156', N'Harding', N'Winters', N'Odom', CAST(N'1922-10-05' AS Date), 42)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16620930 -6130', N'Martina', N'Phillips', N'Sharp', CAST(N'1981-05-05' AS Date), 27)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16621013 -7094', N'Duncan', N'Jones', N'Dyer', CAST(N'1920-10-15' AS Date), 153)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16621027 -0937', N'Breanna', N'Sellers', N'Watkins', CAST(N'1995-11-06' AS Date), 154)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16621029 -1099', N'Garrett', N'Carter', N'Peterson', CAST(N'1992-07-15' AS Date), 137)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16630306 -9725', N'Ora', N'Mcintosh', N'Burgess', CAST(N'1938-11-19' AS Date), 116)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16630315 -3214', N'Graiden', N'Pruitt', N'Erickson', CAST(N'1937-10-28' AS Date), 59)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16630812 -8013', N'Camille', N'Harding', N'Kelly', CAST(N'1953-09-09' AS Date), 59)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16630828 -4634', N'Hasad', N'Mercer', N'Kerr', CAST(N'1931-09-12' AS Date), 36)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16640616 -5933', N'Lacey', N'Tillman', N'Pickett', CAST(N'1963-09-20' AS Date), 3)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16641019 -7518', N'Ross', N'Jones', N'Moran', CAST(N'1967-10-29' AS Date), 170)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16641210 -6962', N'Sharon', N'Macdonald', N'Moran', CAST(N'2012-06-06' AS Date), 169)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16650419 -1229', N'Zephania', N'Fletcher', N'Parks', CAST(N'2005-03-27' AS Date), 112)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16650530 -9788', N'Martha', N'Espinoza', N'Hamilton', CAST(N'2011-09-15' AS Date), 52)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16650814 -8431', N'Otto', N'Tanner', N'Hayden', CAST(N'1968-03-22' AS Date), 149)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16651010 -1550', N'Montana', N'Duncan', N'Walton', CAST(N'1934-10-18' AS Date), 122)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16651022 -8494', N'David', N'Hanson', N'Foreman', CAST(N'1984-04-19' AS Date), 137)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16660221 -1465', N'Maxwell', N'Maynard', N'Mendez', CAST(N'1926-12-04' AS Date), 187)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16660408 -3094', N'Dante', N'Rojas', N'Frederick', CAST(N'1919-02-11' AS Date), 173)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16660823 -5955', N'Katell', N'Madden', N'Alford', CAST(N'1920-04-30' AS Date), 177)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16670120 -6887', N'Iola', N'Rivera', N'Kemp', CAST(N'1927-06-23' AS Date), 68)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16670206 -9698', N'Hunter', N'Stokes', N'Bishop', CAST(N'1945-05-02' AS Date), 133)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16670506 -9604', N'Luke', N'Holmes', N'Lara', CAST(N'1964-01-16' AS Date), 195)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16670523 -4588', N'Nevada', N'Horn', N'Arnold', CAST(N'1978-04-04' AS Date), 144)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16670527 -5003', N'Martena', N'Gay', N'Pratt', CAST(N'2002-03-04' AS Date), 8)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16670701 -0127', N'Carl', N'Ford', N'Young', CAST(N'1990-10-22' AS Date), 74)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16680128 -8066', N'Lavinia', N'Robertson', N'Clark', CAST(N'2012-06-13' AS Date), 148)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16680327 -0468', N'Octavia', N'Combs', N'Abbott', CAST(N'1921-06-22' AS Date), 100)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16690304 -7451', N'Burke', N'Anthony', N'Wilkerson', CAST(N'1996-09-28' AS Date), 170)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16690322 -4803', N'Omar', N'Sears', N'Chapman', CAST(N'1979-01-30' AS Date), 19)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16690506 -8042', N'Noble', N'Daniel', N'Peterson', CAST(N'2010-09-12' AS Date), 119)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16690809 -4144', N'Ishmael', N'Kelly', N'Bauer', CAST(N'1920-10-31' AS Date), 9)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16690815 -1142', N'Karly', N'Castro', N'Franco', CAST(N'1975-12-01' AS Date), 109)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16691126 -4536', N'Libby', N'Floyd', N'Butler', CAST(N'1924-07-15' AS Date), 17)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16691202 -4475', N'Avye', N'Welch', N'Cardenas', CAST(N'2001-11-27' AS Date), 21)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16700110 -6066', N'Bertha', N'Sullivan', N'Reyes', CAST(N'2006-02-09' AS Date), 2)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16700526 -2725', N'Amir', N'Glenn', N'Frederick', CAST(N'1951-11-18' AS Date), 165)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16700714 -6074', N'Keiko', N'Atkins', N'Harding', CAST(N'2004-04-16' AS Date), 110)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16700802 -9543', N'Casey', N'Frazier', N'Brooks', CAST(N'2020-03-01' AS Date), 77)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16701006 -4413', N'Mariam', N'Logan', N'Hinton', CAST(N'1968-10-09' AS Date), 101)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16701009 -2703', N'Cooper', N'Campos', N'Dorsey', CAST(N'1980-09-18' AS Date), 6)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16701221 -2812', N'Serina', N'Jacobson', N'Duke', CAST(N'1998-04-28' AS Date), 49)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16710416 -5530', N'Sophia', N'Carr', N'Mcguire', CAST(N'1943-07-14' AS Date), 52)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16710618 -9090', N'Hu', N'King', N'Hartman', CAST(N'1989-01-25' AS Date), 73)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16710817 -9719', N'Benedict', N'Reese', N'Hebert', CAST(N'1982-12-24' AS Date), 96)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16720212 -5741', N'Carlos', N'Rollins', N'Alvarez', CAST(N'1921-07-27' AS Date), 127)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16720310 -1642', N'Chaim', N'Santos', N'Richardson', CAST(N'1935-06-27' AS Date), 192)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16720602 -3835', N'Zenia', N'Velazquez', N'Levine', CAST(N'1990-08-04' AS Date), 39)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16720624 -9992', N'Florence', N'Brennan', N'Kaufman', CAST(N'1994-08-31' AS Date), 17)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16721224 -3013', N'Brenden', N'Greene', N'Rowland', CAST(N'2011-03-25' AS Date), 97)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16730109 -1596', N'Ethan', N'Mosley', N'Hayden', CAST(N'1951-05-30' AS Date), 35)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16730502 -0237', N'Brenna', N'Kinney', N'Joyce', CAST(N'1954-01-18' AS Date), 25)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16730503 -9559', N'Penelope', N'Cote', N'Kennedy', CAST(N'1994-11-06' AS Date), 137)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16730523 -5751', N'Stacy', N'Gibson', N'Grant', CAST(N'1978-08-02' AS Date), 51)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16730621 -3633', N'Lucas', N'Bell', N'Stout', CAST(N'1931-09-05' AS Date), 140)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16740112 -3430', N'Quon', N'Lawson', N'Lindsey', CAST(N'1966-07-25' AS Date), 106)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16740220 -9683', N'Harlan', N'Sosa', N'Wilcox', CAST(N'1946-07-08' AS Date), 59)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16740608 -2094', N'Quyn', N'House', N'Mcknight', CAST(N'1958-09-10' AS Date), 32)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16741120 -6522', N'Dexter', N'Huber', N'Humphrey', CAST(N'1981-09-15' AS Date), 22)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16750509 -7415', N'Charity', N'Mendez', N'Walker', CAST(N'1936-09-20' AS Date), 188)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16750604 -2360', N'Rooney', N'Richard', N'Andrews', CAST(N'2004-11-24' AS Date), 13)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16750729 -2238', N'David', N'Terrell', N'Bennett', CAST(N'1945-02-03' AS Date), 73)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16750820 -5478', N'Heidi', N'Lancaster', N'Velasquez', CAST(N'1952-09-16' AS Date), 122)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16750830 -1293', N'Raven', N'Zamora', N'Mckenzie', CAST(N'2003-05-22' AS Date), 155)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16751009 -5768', N'Fitzgerald', N'Stone', N'Simmons', CAST(N'1995-03-22' AS Date), 139)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16751019 -7044', N'Hanae', N'Hoover', N'Sloan', CAST(N'1942-06-10' AS Date), 50)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16760213 -3071', N'Rhoda', N'Haynes', N'Kirby', CAST(N'1968-08-28' AS Date), 30)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16760525 -4080', N'Elton', N'Castaneda', N'Burris', CAST(N'1945-05-13' AS Date), 149)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16760930 -7405', N'Lydia', N'Scott', N'Leon', CAST(N'1937-03-05' AS Date), 5)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16761122 -5488', N'Gray', N'Melton', N'Goodwin', CAST(N'2011-11-23' AS Date), 95)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16770114 -0118', N'Aline', N'Alford', N'Hebert', CAST(N'1994-11-25' AS Date), 183)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16770202 -7397', N'Abbot', N'Dorsey', N'Frank', CAST(N'1932-05-20' AS Date), 128)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16770326 -1490', N'Ori', N'Mason', N'Zamora', CAST(N'1962-08-25' AS Date), 150)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16771016 -2061', N'Lucy', N'Cote', N'Middleton', CAST(N'1930-03-22' AS Date), 91)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16771209 -2894', N'Russell', N'Maddox', N'Malone', CAST(N'1945-09-10' AS Date), 72)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16780330 -3572', N'Quentin', N'Norman', N'Pratt', CAST(N'1976-07-10' AS Date), 50)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16780706 -1069', N'Joelle', N'Allen', N'Casey', CAST(N'1977-09-30' AS Date), 101)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16780726 -5819', N'Maisie', N'Kirby', N'Conway', CAST(N'1987-03-15' AS Date), 193)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16780816 -7824', N'Mikayla', N'Chen', N'Blackburn', CAST(N'1987-12-28' AS Date), 180)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16780825 -0133', N'Petra', N'Pennington', N'Barber', CAST(N'1927-12-21' AS Date), 12)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16790206 -8712', N'Deacon', N'Santos', N'Myers', CAST(N'2000-08-12' AS Date), 117)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16790217 -6820', N'Fulton', N'Blevins', N'Andrews', CAST(N'1935-05-31' AS Date), 149)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16790617 -2965', N'Xandra', N'Fletcher', N'Macdonald', CAST(N'2019-04-10' AS Date), 125)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16790906 -6545', N'Brenden', N'Frazier', N'Morin', CAST(N'2003-06-20' AS Date), 188)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16790908 -7178', N'Quon', N'Britt', N'Phillips', CAST(N'1975-03-12' AS Date), 174)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16790928 -3678', N'Allistair', N'Ware', N'Allison', CAST(N'1967-08-29' AS Date), 33)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16791007 -6061', N'Shea', N'Dunn', N'Cline', CAST(N'2004-07-18' AS Date), 96)
GO
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16800230 -5632', N'Salvador', N'Carpenter', N'Alvarez', CAST(N'1990-02-04' AS Date), 15)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16800505 -4526', N'Flavia', N'Ingram', N'Robbins', CAST(N'1947-06-23' AS Date), 3)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16800714 -3897', N'Noelani', N'David', N'Bruce', CAST(N'1981-11-16' AS Date), 6)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16800920 -3376', N'Brian', N'Alford', N'Ashley', CAST(N'1951-03-27' AS Date), 35)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16800923 -3928', N'Kieran', N'Ramirez', N'Moody', CAST(N'1950-06-28' AS Date), 168)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16801128 -6914', N'Adam', N'Williams', N'Miles', CAST(N'1925-12-28' AS Date), 185)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16810424 -8862', N'Miriam', N'Burris', N'Charles', CAST(N'1921-05-09' AS Date), 49)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16810513 -1299', N'Moses', N'Wilkinson', N'Howell', CAST(N'1931-08-06' AS Date), 143)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16810622 -2519', N'John', N'Marquez', N'Pittman', CAST(N'1983-08-16' AS Date), 102)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16810829 -7063', N'Lenore', N'Glass', N'Levy', CAST(N'1980-01-06' AS Date), 46)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16811012 -9189', N'Alfonso', N'Ramos', N'Page', CAST(N'1936-11-15' AS Date), 166)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16811119 -7516', N'Grady', N'Leblanc', N'Larson', CAST(N'1954-04-15' AS Date), 128)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16820323 -1322', N'Angelica', N'Whitfield', N'Valenzuela', CAST(N'2018-11-23' AS Date), 182)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16820420 -2330', N'Whilemina', N'Maxwell', N'Herman', CAST(N'1998-03-22' AS Date), 118)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16820505 -2833', N'Amery', N'Kaufman', N'Mcmillan', CAST(N'2009-06-06' AS Date), 89)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16820610 -3510', N'Hedley', N'Foreman', N'Pennington', CAST(N'1973-01-29' AS Date), 42)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16821212 -5978', N'Ria', N'Hahn', N'Mcclain', CAST(N'1926-10-10' AS Date), 81)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16830106 -9335', N'Kimberly', N'Whitehead', N'Velez', CAST(N'1940-05-07' AS Date), 78)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16830614 -4364', N'Iona', N'Sargent', N'Mcclain', CAST(N'1926-04-21' AS Date), 29)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16830627 -8535', N'Nell', N'Henderson', N'Colon', CAST(N'1992-08-13' AS Date), 17)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16831108 -6329', N'Colt', N'Estrada', N'Barnett', CAST(N'2019-05-14' AS Date), 2)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16831112 -5689', N'Yoshio', N'Mooney', N'Ferrell', CAST(N'1942-08-31' AS Date), 173)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16831126 -7200', N'Keaton', N'Monroe', N'Hunter', CAST(N'1998-07-25' AS Date), 66)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16831212 -3618', N'Hedy', N'Foley', N'Blankenship', CAST(N'1920-11-08' AS Date), 14)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16840203 -3958', N'Beverly', N'Murphy', N'Reynolds', CAST(N'1972-11-28' AS Date), 49)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16841015 -7567', N'Benedict', N'Rosario', N'Townsend', CAST(N'1920-11-09' AS Date), 95)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16841126 -8371', N'Vladimir', N'Stark', N'Ferrell', CAST(N'1988-04-26' AS Date), 119)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16850515 -4768', N'Lavinia', N'Kennedy', N'Lamb', CAST(N'2009-07-13' AS Date), 115)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16850711 -2491', N'Kathleen', N'Chavez', N'Buchanan', CAST(N'1936-11-28' AS Date), 50)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16850911 -0477', N'Jorden', N'Finch', N'Rasmussen', CAST(N'2013-02-14' AS Date), 175)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16850916 -0258', N'Winifred', N'Wise', N'Barr', CAST(N'2008-05-30' AS Date), 13)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16860826 -2138', N'Odette', N'Petersen', N'Maynard', CAST(N'1920-08-03' AS Date), 72)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16870105 -9258', N'Amir', N'Chandler', N'Townsend', CAST(N'2006-06-08' AS Date), 125)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16870505 -0485', N'Olympia', N'Malone', N'Douglas', CAST(N'1929-03-05' AS Date), 31)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16870613 -2118', N'Deanna', N'Pugh', N'Nicholson', CAST(N'1946-07-29' AS Date), 16)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16871101 -2560', N'Hedy', N'Bentley', N'Mcdowell', CAST(N'2012-12-05' AS Date), 70)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16880220 -0397', N'Hedley', N'Michael', N'Greer', CAST(N'1949-11-29' AS Date), 138)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16880222 -2276', N'Orli', N'Mosley', N'Henry', CAST(N'1932-02-11' AS Date), 151)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16880418 -1678', N'Sheila', N'Justice', N'Wilson', CAST(N'1997-04-10' AS Date), 143)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16880425 -3543', N'Timon', N'Sellers', N'Bennett', CAST(N'1944-01-15' AS Date), 186)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16880501 -4027', N'Velma', N'Richard', N'Hickman', CAST(N'1937-01-03' AS Date), 35)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16880909 -9503', N'Abra', N'Mclean', N'Welch', CAST(N'1984-07-12' AS Date), 118)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16890115 -8256', N'Garth', N'Stuart', N'Rivera', CAST(N'1964-11-10' AS Date), 5)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16890213 -7820', N'Petra', N'Guzman', N'Kemp', CAST(N'1979-09-28' AS Date), 200)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16890415 -7818', N'James', N'Campbell', N'Stark', CAST(N'1985-12-05' AS Date), 24)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16890417 -6602', N'Madaline', N'Poole', N'Mcfadden', CAST(N'2002-01-05' AS Date), 3)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16890704 -2280', N'Merrill', N'Shannon', N'Brock', CAST(N'2006-06-12' AS Date), 64)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16890903 -9896', N'Marvin', N'Francis', N'Calhoun', CAST(N'1960-03-17' AS Date), 115)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16891130 -1664', N'Phelan', N'Gaines', N'Rodgers', CAST(N'2014-07-08' AS Date), 196)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16900113 -4098', N'Felicia', N'Robertson', N'Maddox', CAST(N'1933-06-05' AS Date), 9)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16900408 -0686', N'Samson', N'Marshall', N'Michael', CAST(N'1924-01-27' AS Date), 4)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16900524 -7284', N'Hammett', N'Prince', N'Poole', CAST(N'1935-09-07' AS Date), 89)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16900721 -4753', N'Teagan', N'Benson', N'Ray', CAST(N'2002-02-13' AS Date), 43)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16901028 -3480', N'Paki', N'Mathews', N'Bush', CAST(N'1989-10-15' AS Date), 4)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16901113 -3098', N'Bethany', N'Gillespie', N'Osborne', CAST(N'1978-01-31' AS Date), 27)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16910105 -6894', N'Anjolie', N'Mcguire', N'Gentry', CAST(N'1936-08-19' AS Date), 175)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16910130 -3676', N'Martin', N'Mccullough', N'Vazquez', CAST(N'1930-06-13' AS Date), 19)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16910916 -3585', N'Xyla', N'Bartlett', N'Reese', CAST(N'1996-09-14' AS Date), 189)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16910924 -4187', N'Berk', N'Fulton', N'Scott', CAST(N'1975-04-12' AS Date), 35)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16911005 -0920', N'Asher', N'Little', N'Key', CAST(N'2007-10-09' AS Date), 77)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16911108 -1932', N'Joan', N'Hyde', N'Lindsay', CAST(N'1945-07-12' AS Date), 51)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16911120 -4476', N'Clarke', N'Santana', N'Flowers', CAST(N'2006-06-12' AS Date), 68)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16911204 -3964', N'Ima', N'Morales', N'Gallagher', CAST(N'1981-07-16' AS Date), 104)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16911209 -4520', N'Maris', N'Lyons', N'Brennan', CAST(N'1948-05-08' AS Date), 53)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16920120 -4121', N'Katelyn', N'Key', N'Hahn', CAST(N'1986-12-31' AS Date), 142)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16920207 -7112', N'Gannon', N'Buck', N'Larson', CAST(N'1953-02-08' AS Date), 128)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16920506 -8464', N'Hakeem', N'Davenport', N'Sosa', CAST(N'1999-06-22' AS Date), 85)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16920814 -5756', N'Teegan', N'Hyde', N'Faulkner', CAST(N'2005-11-25' AS Date), 122)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16921016 -3391', N'TaShya', N'Hart', N'Carson', CAST(N'1964-09-27' AS Date), 142)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16930214 -0612', N'Brenda', N'Miles', N'Lancaster', CAST(N'1967-02-05' AS Date), 162)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16930311 -7551', N'Lamar', N'Wilcox', N'Porter', CAST(N'1990-12-04' AS Date), 167)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16930315 -3283', N'Ora', N'Oliver', N'Duffy', CAST(N'1949-05-05' AS Date), 133)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16930611 -0892', N'Tatum', N'Reed', N'Medina', CAST(N'1980-09-28' AS Date), 21)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16930816 -4020', N'Holly', N'Mcmillan', N'Wooten', CAST(N'1942-01-11' AS Date), 39)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16931025 -9784', N'Noah', N'Marsh', N'Stuart', CAST(N'1957-06-30' AS Date), 76)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16940329 -9754', N'Peter', N'Hoover', N'Cervantes', CAST(N'2008-11-10' AS Date), 92)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16940521 -9495', N'Priscilla', N'Shepard', N'Cervantes', CAST(N'1976-09-27' AS Date), 182)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16941123 -4264', N'Isabella', N'Mcgowan', N'Sharpe', CAST(N'1935-03-24' AS Date), 19)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16941219 -7767', N'Kadeem', N'Potts', N'Pope', CAST(N'2016-07-04' AS Date), 171)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16950227 -3171', N'Hiram', N'Jones', N'Dickson', CAST(N'1986-06-22' AS Date), 58)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16950527 -0943', N'Chantale', N'Ellis', N'Olsen', CAST(N'1990-03-24' AS Date), 107)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16950921 -1695', N'Sylvester', N'Cross', N'Harrell', CAST(N'1981-08-03' AS Date), 14)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16951229 -6584', N'Dorothy', N'Bowen', N'Juarez', CAST(N'1999-01-13' AS Date), 56)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16960211 -8151', N'Kerry', N'Orr', N'Emerson', CAST(N'1927-08-11' AS Date), 35)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16960223 -0493', N'Vernon', N'Moss', N'Reed', CAST(N'1941-09-05' AS Date), 59)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16960313 -4108', N'Nero', N'Fuller', N'Weber', CAST(N'1995-03-28' AS Date), 87)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16960624 -2890', N'Quyn', N'Alvarez', N'Maynard', CAST(N'1972-02-24' AS Date), 148)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16961005 -2194', N'Maia', N'Edwards', N'Tanner', CAST(N'2019-12-01' AS Date), 140)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16970102 -5521', N'Mallory', N'Dennis', N'Hale', CAST(N'1982-12-09' AS Date), 179)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16970121 -5726', N'Ahmed', N'Adams', N'Ayala', CAST(N'1929-02-10' AS Date), 164)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16970207 -0989', N'Candice', N'Hart', N'Warner', CAST(N'2012-04-21' AS Date), 6)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16970624 -8763', N'Sawyer', N'Mcmahon', N'Logan', CAST(N'1971-12-30' AS Date), 100)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16970716 -9984', N'Russell', N'Glenn', N'Leon', CAST(N'1955-01-15' AS Date), 200)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16970901 -7876', N'Britanni', N'Obrien', N'Garza', CAST(N'1989-05-17' AS Date), 108)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16971012 -3622', N'Maya', N'Casey', N'Coffey', CAST(N'1981-01-24' AS Date), 4)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16971017 -7503', N'Phelan', N'Higgins', N'Rogers', CAST(N'1984-01-15' AS Date), 132)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16980212 -5543', N'Camilla', N'Garza', N'Sanders', CAST(N'2009-10-10' AS Date), 192)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16980718 -2804', N'Philip', N'Dillard', N'Cooke', CAST(N'1930-09-14' AS Date), 89)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16981026 -2999', N'Adele', N'Mcbride', N'Yang', CAST(N'1962-08-09' AS Date), 87)
INSERT [dbo].[Persona] ([Cedula], [Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Id_Ubicacion]) VALUES (N'16990622 -0067', N'Merritt', N'Hicks', N'Oconnor', CAST(N'1938-11-02' AS Date), 124)
GO
INSERT [dbo].[Ubicacion] ([Id_Ubicacion], [Continente], [Pais], [Region]) VALUES (1, N'-44.45057, 75.57975', N'Slovenia', N'AB')
INSERT [dbo].[Ubicacion] ([Id_Ubicacion], [Continente], [Pais], [Region]) VALUES (2, N'-63.77845, 51.41111', N'Saudi Arabia', N'Utah')
INSERT [dbo].[Ubicacion] ([Id_Ubicacion], [Continente], [Pais], [Region]) VALUES (3, N'-85.17361, 66.66866', N'Israel', N'CE')
INSERT [dbo].[Ubicacion] ([Id_Ubicacion], [Continente], [Pais], [Region]) VALUES (4, N'-10.4404, -28.37098', N'Hong Kong', N'Magadan Oblast')
INSERT [dbo].[Ubicacion] ([Id_Ubicacion], [Continente], [Pais], [Region]) VALUES (5, N'16.42876, -121.441', N'Bonaire, Sint Eustatius and Saba', N'LOM')
INSERT [dbo].[Ubicacion] ([Id_Ubicacion], [Continente], [Pais], [Region]) VALUES (6, N'3.1271, -39.6485', N'Ghana', N'Noord Brabant')
INSERT [dbo].[Ubicacion] ([Id_Ubicacion], [Continente], [Pais], [Region]) VALUES (7, N'-7.95875, -2.53856', N'Croatia', N'TN')
INSERT [dbo].[Ubicacion] ([Id_Ubicacion], [Continente], [Pais], [Region]) VALUES (8, N'-6.30946, 31.15349', N'Guyana', N'MB')
INSERT [dbo].[Ubicacion] ([Id_Ubicacion], [Continente], [Pais], [Region]) VALUES (9, N'55.12961, 102.89259', N'Pakistan', N'North Island')
INSERT [dbo].[Ubicacion] ([Id_Ubicacion], [Continente], [Pais], [Region]) VALUES (10, N'-40.1791, 68.70712', N'Uganda', N'O')
INSERT [dbo].[Ubicacion] ([Id_Ubicacion], [Continente], [Pais], [Region]) VALUES (11, N'2.87483, -127.6481', N'Sint Maarten', N'Quebec')
INSERT [dbo].[Ubicacion] ([Id_Ubicacion], [Continente], [Pais], [Region]) VALUES (12, N'1.04582, -31.40672', N'Taiwan', N'PIU')
INSERT [dbo].[Ubicacion] ([Id_Ubicacion], [Continente], [Pais], [Region]) VALUES (13, N'58.40504, 102.48842', N'Qatar', N'L')
INSERT [dbo].[Ubicacion] ([Id_Ubicacion], [Continente], [Pais], [Region]) VALUES (14, N'-61.02206, -108.18547', N'Marshall Islands', N'Gilgit Baltistan')
INSERT [dbo].[Ubicacion] ([Id_Ubicacion], [Continente], [Pais], [Region]) VALUES (15, N'-68.45394, -167.23364', N'Bangladesh', N'Gto')
INSERT [dbo].[Ubicacion] ([Id_Ubicacion], [Continente], [Pais], [Region]) VALUES (16, N'-84.87873, 78.08479', N'Afghanistan', N'Munster')
INSERT [dbo].[Ubicacion] ([Id_Ubicacion], [Continente], [Pais], [Region]) VALUES (17, N'47.18396, -138.44599', N'Isle of Man', N'Gelderland')
INSERT [dbo].[Ubicacion] ([Id_Ubicacion], [Continente], [Pais], [Region]) VALUES (18, N'81.83818, -121.34621', N'Uzbekistan', N'Toscana')
INSERT [dbo].[Ubicacion] ([Id_Ubicacion], [Continente], [Pais], [Region]) VALUES (19, N'-69.29818, -54.27906', N'Cape Verde', N'San José')
INSERT [dbo].[Ubicacion] ([Id_Ubicacion], [Continente], [Pais], [Region]) VALUES (20, N'-68.58443, 147.29536', N'Jordan', N'SI')
INSERT [dbo].[Ubicacion] ([Id_Ubicacion], [Continente], [Pais], [Region]) VALUES (21, N'84.2796, -63.16656', N'Brazil', N'IL')
INSERT [dbo].[Ubicacion] ([Id_Ubicacion], [Continente], [Pais], [Region]) VALUES (22, N'80.40506, -1.24727', N'Cayman Islands', N'Ankara')
INSERT [dbo].[Ubicacion] ([Id_Ubicacion], [Continente], [Pais], [Region]) VALUES (23, N'22.22977, 141.17648', N'Turks and Caicos Islands', N'Special Region of Yogyakarta')
INSERT [dbo].[Ubicacion] ([Id_Ubicacion], [Continente], [Pais], [Region]) VALUES (24, N'52.48124, -130.26654', N'French Guiana', N'Bretagne')
INSERT [dbo].[Ubicacion] ([Id_Ubicacion], [Continente], [Pais], [Region]) VALUES (25, N'61.97607, 134.05379', N'Grenada', N'YK')
INSERT [dbo].[Ubicacion] ([Id_Ubicacion], [Continente], [Pais], [Region]) VALUES (26, N'27.6853, 122.88657', N'Anguilla', N'Manitoba')
INSERT [dbo].[Ubicacion] ([Id_Ubicacion], [Continente], [Pais], [Region]) VALUES (27, N'-16.72142, 176.69237', N'Palestine, State of', N'GJ')
INSERT [dbo].[Ubicacion] ([Id_Ubicacion], [Continente], [Pais], [Region]) VALUES (28, N'58.46697, -141.80169', N'Albania', N'CDM')
INSERT [dbo].[Ubicacion] ([Id_Ubicacion], [Continente], [Pais], [Region]) VALUES (29, N'-2.21358, -77.7799', N'Liechtenstein', N'Waals-Brabant')
INSERT [dbo].[Ubicacion] ([Id_Ubicacion], [Continente], [Pais], [Region]) VALUES (30, N'-54.2108, -118.35621', N'United States', N'M')
INSERT [dbo].[Ubicacion] ([Id_Ubicacion], [Continente], [Pais], [Region]) VALUES (31, N'28.71825, 162.12964', N'Iran', N'Son')
INSERT [dbo].[Ubicacion] ([Id_Ubicacion], [Continente], [Pais], [Region]) VALUES (32, N'-2.6467, 17.1805', N'Cambodia', N'FA')
INSERT [dbo].[Ubicacion] ([Id_Ubicacion], [Continente], [Pais], [Region]) VALUES (33, N'-11.60108, 17.02133', N'Belarus', N'Istanbul')
INSERT [dbo].[Ubicacion] ([Id_Ubicacion], [Continente], [Pais], [Region]) VALUES (34, N'58.29084, -120.91253', N'Georgia', N'SJ')
INSERT [dbo].[Ubicacion] ([Id_Ubicacion], [Continente], [Pais], [Region]) VALUES (35, N'-69.11773, 75.27265', N'Paraguay', N'Antioquia')
INSERT [dbo].[Ubicacion] ([Id_Ubicacion], [Continente], [Pais], [Region]) VALUES (36, N'-78.3573, -12.55799', N'Mayotte', N'Buckinghamshire')
INSERT [dbo].[Ubicacion] ([Id_Ubicacion], [Continente], [Pais], [Region]) VALUES (37, N'-24.95635, -45.58977', N'China', N'Pará')
INSERT [dbo].[Ubicacion] ([Id_Ubicacion], [Continente], [Pais], [Region]) VALUES (38, N'32.51857, 28.82079', N'Moldova', N'Niger')
INSERT [dbo].[Ubicacion] ([Id_Ubicacion], [Continente], [Pais], [Region]) VALUES (39, N'-52.86736, 176.12203', N'Niue', N'KN')
INSERT [dbo].[Ubicacion] ([Id_Ubicacion], [Continente], [Pais], [Region]) VALUES (40, N'10.60451, 169.23349', N'Malta', N'Zeeland')
INSERT [dbo].[Ubicacion] ([Id_Ubicacion], [Continente], [Pais], [Region]) VALUES (41, N'-82.67082, 65.16851', N'Italy', N'NI')
INSERT [dbo].[Ubicacion] ([Id_Ubicacion], [Continente], [Pais], [Region]) VALUES (42, N'14.03398, -108.5588', N'Mozambique', N'Florida')
INSERT [dbo].[Ubicacion] ([Id_Ubicacion], [Continente], [Pais], [Region]) VALUES (43, N'-86.55854, 32.64239', N'Kenya', N'West Java')
INSERT [dbo].[Ubicacion] ([Id_Ubicacion], [Continente], [Pais], [Region]) VALUES (44, N'-35.29774, 69.67462', N'Ukraine', N'Hatay')
INSERT [dbo].[Ubicacion] ([Id_Ubicacion], [Continente], [Pais], [Region]) VALUES (45, N'-66.36526, -166.71551', N'Timor-Leste', N'Man')
INSERT [dbo].[Ubicacion] ([Id_Ubicacion], [Continente], [Pais], [Region]) VALUES (46, N'-62.85662, -125.49006', N'Malaysia', N'Ontario')
INSERT [dbo].[Ubicacion] ([Id_Ubicacion], [Continente], [Pais], [Region]) VALUES (47, N'-2.68388, 53.47276', N'Antarctica', N'Gangwon')
INSERT [dbo].[Ubicacion] ([Id_Ubicacion], [Continente], [Pais], [Region]) VALUES (48, N'-85.64591, -108.49644', N'Malawi', N'New South Wales')
INSERT [dbo].[Ubicacion] ([Id_Ubicacion], [Continente], [Pais], [Region]) VALUES (49, N'71.72794, -26.52545', N'Mongolia', N'Queensland')
INSERT [dbo].[Ubicacion] ([Id_Ubicacion], [Continente], [Pais], [Region]) VALUES (50, N'-53.9932, 83.3063', N'Ukraine', N'Western Australia')
INSERT [dbo].[Ubicacion] ([Id_Ubicacion], [Continente], [Pais], [Region]) VALUES (51, N'38.17248, 48.55429', N'Uruguay', N'Connacht')
INSERT [dbo].[Ubicacion] ([Id_Ubicacion], [Continente], [Pais], [Region]) VALUES (52, N'23.39014, 150.87654', N'Cayman Islands', N'New Brunswick')
INSERT [dbo].[Ubicacion] ([Id_Ubicacion], [Continente], [Pais], [Region]) VALUES (53, N'-61.20046, -140.27807', N'Montenegro', N'Alajuela')
INSERT [dbo].[Ubicacion] ([Id_Ubicacion], [Continente], [Pais], [Region]) VALUES (54, N'57.65681, 2.96151', N'Pitcairn Islands', N'Vlaams-Brabant')
INSERT [dbo].[Ubicacion] ([Id_Ubicacion], [Continente], [Pais], [Region]) VALUES (55, N'-1.89798, -61.96034', N'Guinea', N'Sam')
INSERT [dbo].[Ubicacion] ([Id_Ubicacion], [Continente], [Pais], [Region]) VALUES (56, N'2.74126, 49.57304', N'Holy See (Vatican City State)', N'Catalunya')
INSERT [dbo].[Ubicacion] ([Id_Ubicacion], [Continente], [Pais], [Region]) VALUES (57, N'16.01107, 33.21117', N'Switzerland', N'Stockholms län')
INSERT [dbo].[Ubicacion] ([Id_Ubicacion], [Continente], [Pais], [Region]) VALUES (58, N'-1.94836, 101.97194', N'South Africa', N'ANT')
INSERT [dbo].[Ubicacion] ([Id_Ubicacion], [Continente], [Pais], [Region]) VALUES (59, N'50.11888, -6.56016', N'Guadeloupe', N'BE')
INSERT [dbo].[Ubicacion] ([Id_Ubicacion], [Continente], [Pais], [Region]) VALUES (60, N'-87.88911, 131.34561', N'Slovakia', N'JB')
INSERT [dbo].[Ubicacion] ([Id_Ubicacion], [Continente], [Pais], [Region]) VALUES (61, N'49.12431, 167.30365', N'Singapore', N'QC')
INSERT [dbo].[Ubicacion] ([Id_Ubicacion], [Continente], [Pais], [Region]) VALUES (62, N'16.67271, -30.78543', N'Philippines', N'Arkansas')
INSERT [dbo].[Ubicacion] ([Id_Ubicacion], [Continente], [Pais], [Region]) VALUES (63, N'3.72705, -142.15958', N'Holy See (Vatican City State)', N'Zeeland')
INSERT [dbo].[Ubicacion] ([Id_Ubicacion], [Continente], [Pais], [Region]) VALUES (64, N'-56.93513, 151.50698', N'Bulgaria', N'Overijssel')
INSERT [dbo].[Ubicacion] ([Id_Ubicacion], [Continente], [Pais], [Region]) VALUES (65, N'80.36651, 79.00534', N'Costa Rica', N'Leinster')
INSERT [dbo].[Ubicacion] ([Id_Ubicacion], [Continente], [Pais], [Region]) VALUES (66, N'-52.89224, -150.91666', N'Benin', N'Campania')
INSERT [dbo].[Ubicacion] ([Id_Ubicacion], [Continente], [Pais], [Region]) VALUES (67, N'48.34957, 13.63636', N'Russian Federation', N'O')
INSERT [dbo].[Ubicacion] ([Id_Ubicacion], [Continente], [Pais], [Region]) VALUES (68, N'-50.22185, 34.39942', N'Palau', N'São Paulo')
INSERT [dbo].[Ubicacion] ([Id_Ubicacion], [Continente], [Pais], [Region]) VALUES (69, N'-42.97599, 131.24477', N'Greenland', N'Michigan')
INSERT [dbo].[Ubicacion] ([Id_Ubicacion], [Continente], [Pais], [Region]) VALUES (70, N'-88.35896, -49.19783', N'Grenada', N'West Java')
INSERT [dbo].[Ubicacion] ([Id_Ubicacion], [Continente], [Pais], [Region]) VALUES (71, N'13.34546, -29.0095', N'Laos', N'Mer')
INSERT [dbo].[Ubicacion] ([Id_Ubicacion], [Continente], [Pais], [Region]) VALUES (72, N'-13.30354, -8.88648', N'Indonesia', N'Campania')
INSERT [dbo].[Ubicacion] ([Id_Ubicacion], [Continente], [Pais], [Region]) VALUES (73, N'-74.89601, -38.91975', N'Sint Maarten', N'Connacht')
INSERT [dbo].[Ubicacion] ([Id_Ubicacion], [Continente], [Pais], [Region]) VALUES (74, N'-47.36612, -147.48197', N'Jamaica', N'Westmorland')
INSERT [dbo].[Ubicacion] ([Id_Ubicacion], [Continente], [Pais], [Region]) VALUES (75, N'-21.69791, -16.4546', N'Gibraltar', N'BU')
INSERT [dbo].[Ubicacion] ([Id_Ubicacion], [Continente], [Pais], [Region]) VALUES (76, N'-68.92471, -7.57845', N'Saint Lucia', N'Sutherland')
INSERT [dbo].[Ubicacion] ([Id_Ubicacion], [Continente], [Pais], [Region]) VALUES (77, N'79.3426, 158.11047', N'Croatia', N'AN')
INSERT [dbo].[Ubicacion] ([Id_Ubicacion], [Continente], [Pais], [Region]) VALUES (78, N'66.3886, -68.72811', N'Suriname', N'Östergötlands län')
INSERT [dbo].[Ubicacion] ([Id_Ubicacion], [Continente], [Pais], [Region]) VALUES (79, N'10.25398, -11.71815', N'Puerto Rico', N'MA')
INSERT [dbo].[Ubicacion] ([Id_Ubicacion], [Continente], [Pais], [Region]) VALUES (80, N'-76.3516, 101.04177', N'Saint Helena, Ascension and Tristan da Cunha', N'Noord Brabant')
INSERT [dbo].[Ubicacion] ([Id_Ubicacion], [Continente], [Pais], [Region]) VALUES (81, N'-77.63577, -26.62246', N'Niger', N'DE')
INSERT [dbo].[Ubicacion] ([Id_Ubicacion], [Continente], [Pais], [Region]) VALUES (82, N'-20.96242, 40.16192', N'Ghana', N'BE')
INSERT [dbo].[Ubicacion] ([Id_Ubicacion], [Continente], [Pais], [Region]) VALUES (83, N'51.20335, 78.15288', N'Saint Pierre and Miquelon', N'Bur')
INSERT [dbo].[Ubicacion] ([Id_Ubicacion], [Continente], [Pais], [Region]) VALUES (84, N'-40.78935, -137.78808', N'Bulgaria', N'Île-de-France')
INSERT [dbo].[Ubicacion] ([Id_Ubicacion], [Continente], [Pais], [Region]) VALUES (85, N'23.06368, 41.0999', N'Israel', N'BE')
INSERT [dbo].[Ubicacion] ([Id_Ubicacion], [Continente], [Pais], [Region]) VALUES (86, N'-77.98469, -176.44604', N'Sri Lanka', N'IN')
INSERT [dbo].[Ubicacion] ([Id_Ubicacion], [Continente], [Pais], [Region]) VALUES (87, N'59.97646, -25.41103', N'Sint Maarten', N'MA')
INSERT [dbo].[Ubicacion] ([Id_Ubicacion], [Continente], [Pais], [Region]) VALUES (88, N'-77.7012, -100.22194', N'Chile', N'NSW')
INSERT [dbo].[Ubicacion] ([Id_Ubicacion], [Continente], [Pais], [Region]) VALUES (89, N'20.4713, 178.46902', N'Brazil', N'VLG')
INSERT [dbo].[Ubicacion] ([Id_Ubicacion], [Continente], [Pais], [Region]) VALUES (90, N'67.12583, -134.4849', N'Norway', N'JUN')
INSERT [dbo].[Ubicacion] ([Id_Ubicacion], [Continente], [Pais], [Region]) VALUES (91, N'83.04525, 31.41943', N'Northern Mariana Islands', N'ON')
INSERT [dbo].[Ubicacion] ([Id_Ubicacion], [Continente], [Pais], [Region]) VALUES (92, N'-30.25957, -169.26847', N'Azerbaijan', N'KI')
INSERT [dbo].[Ubicacion] ([Id_Ubicacion], [Continente], [Pais], [Region]) VALUES (93, N'-16.57874, 18.05885', N'Serbia', N'CAM')
INSERT [dbo].[Ubicacion] ([Id_Ubicacion], [Continente], [Pais], [Region]) VALUES (94, N'60.02471, -175.70478', N'Georgia', N'PA')
INSERT [dbo].[Ubicacion] ([Id_Ubicacion], [Continente], [Pais], [Region]) VALUES (95, N'-19.70466, -35.29189', N'Dominican Republic', N'Wie')
INSERT [dbo].[Ubicacion] ([Id_Ubicacion], [Continente], [Pais], [Region]) VALUES (96, N'-22.94091, -40.97904', N'Nepal', N'NI')
INSERT [dbo].[Ubicacion] ([Id_Ubicacion], [Continente], [Pais], [Region]) VALUES (97, N'29.08499, 139.07662', N'Virgin Islands, United States', N'Paraná')
INSERT [dbo].[Ubicacion] ([Id_Ubicacion], [Continente], [Pais], [Region]) VALUES (98, N'68.47906, -60.25921', N'Sint Maarten', N'KY')
INSERT [dbo].[Ubicacion] ([Id_Ubicacion], [Continente], [Pais], [Region]) VALUES (99, N'47.49372, -66.79377', N'American Samoa', N'Victoria')
INSERT [dbo].[Ubicacion] ([Id_Ubicacion], [Continente], [Pais], [Region]) VALUES (100, N'-28.15169, 11.28054', N'Australia', N'SO')
GO
INSERT [dbo].[Ubicacion] ([Id_Ubicacion], [Continente], [Pais], [Region]) VALUES (101, N'-3.93907, 68.18541', N'Angola', N'North Island')
INSERT [dbo].[Ubicacion] ([Id_Ubicacion], [Continente], [Pais], [Region]) VALUES (102, N'59.12286, -87.26702', N'Honduras', N'Gyeonggi')
INSERT [dbo].[Ubicacion] ([Id_Ubicacion], [Continente], [Pais], [Region]) VALUES (103, N'1.55929, 45.88736', N'Saint Vincent and The Grenadines', N'North Chungcheong')
INSERT [dbo].[Ubicacion] ([Id_Ubicacion], [Continente], [Pais], [Region]) VALUES (104, N'-73.21735, -70.13677', N'Rwanda', N'BEL')
INSERT [dbo].[Ubicacion] ([Id_Ubicacion], [Continente], [Pais], [Region]) VALUES (105, N'10.88389, -128.03346', N'Lesotho', N'Ontario')
INSERT [dbo].[Ubicacion] ([Id_Ubicacion], [Continente], [Pais], [Region]) VALUES (106, N'-19.59291, -40.52279', N'Chile', N'Coa')
INSERT [dbo].[Ubicacion] ([Id_Ubicacion], [Continente], [Pais], [Region]) VALUES (107, N'40.10245, -7.06558', N'Mayotte', N'Kano')
INSERT [dbo].[Ubicacion] ([Id_Ubicacion], [Continente], [Pais], [Region]) VALUES (108, N'76.68614, 138.78687', N'Congo (Brazzaville)', N'Central Java')
INSERT [dbo].[Ubicacion] ([Id_Ubicacion], [Continente], [Pais], [Region]) VALUES (109, N'-26.68148, 84.46792', N'Estonia', N'Gan')
INSERT [dbo].[Ubicacion] ([Id_Ubicacion], [Continente], [Pais], [Region]) VALUES (110, N'40.32214, -73.35428', N'Mauritania', N'NI')
INSERT [dbo].[Ubicacion] ([Id_Ubicacion], [Continente], [Pais], [Region]) VALUES (111, N'14.69142, 30.52494', N'Aruba', N'Tarapacá')
INSERT [dbo].[Ubicacion] ([Id_Ubicacion], [Continente], [Pais], [Region]) VALUES (112, N'30.79653, 71.55048', N'Solomon Islands', N'North Island')
INSERT [dbo].[Ubicacion] ([Id_Ubicacion], [Continente], [Pais], [Region]) VALUES (113, N'2.02551, -57.72134', N'Luxembourg', N'PIE')
INSERT [dbo].[Ubicacion] ([Id_Ubicacion], [Continente], [Pais], [Region]) VALUES (114, N'9.91954, 85.73437', N'French Guiana', N'Zl')
INSERT [dbo].[Ubicacion] ([Id_Ubicacion], [Continente], [Pais], [Region]) VALUES (115, N'-14.04609, 99.20607', N'Cambodia', N'HR')
INSERT [dbo].[Ubicacion] ([Id_Ubicacion], [Continente], [Pais], [Region]) VALUES (116, N'55.90805, 117.0918', N'Grenada', N'MS')
INSERT [dbo].[Ubicacion] ([Id_Ubicacion], [Continente], [Pais], [Region]) VALUES (117, N'88.96427, -5.98882', N'Puerto Rico', N'Maranhão')
INSERT [dbo].[Ubicacion] ([Id_Ubicacion], [Continente], [Pais], [Region]) VALUES (118, N'-49.69857, 74.33326', N'French Guiana', N'AK')
INSERT [dbo].[Ubicacion] ([Id_Ubicacion], [Continente], [Pais], [Region]) VALUES (119, N'21.44492, 114.75881', N'United Arab Emirates', N'Victoria')
INSERT [dbo].[Ubicacion] ([Id_Ubicacion], [Continente], [Pais], [Region]) VALUES (120, N'70.5901, 154.39152', N'Cook Islands', N'Valparaíso')
INSERT [dbo].[Ubicacion] ([Id_Ubicacion], [Continente], [Pais], [Region]) VALUES (121, N'38.01374, 84.0298', N'Honduras', N'Waals-Brabant')
INSERT [dbo].[Ubicacion] ([Id_Ubicacion], [Continente], [Pais], [Region]) VALUES (122, N'-79.25111, -155.13838', N'Sierra Leone', N'A')
INSERT [dbo].[Ubicacion] ([Id_Ubicacion], [Continente], [Pais], [Region]) VALUES (123, N'10.27253, 150.69931', N'Tunisia', N'Chi')
INSERT [dbo].[Ubicacion] ([Id_Ubicacion], [Continente], [Pais], [Region]) VALUES (124, N'89.80124, 158.589', N'Malawi', N'San José')
INSERT [dbo].[Ubicacion] ([Id_Ubicacion], [Continente], [Pais], [Region]) VALUES (125, N'-79.99679, 118.71295', N'Cyprus', N'Antioquia')
INSERT [dbo].[Ubicacion] ([Id_Ubicacion], [Continente], [Pais], [Region]) VALUES (126, N'-36.2608, 55.90665', N'Thailand', N'Stockholms län')
INSERT [dbo].[Ubicacion] ([Id_Ubicacion], [Continente], [Pais], [Region]) VALUES (127, N'87.77596, 174.87309', N'Bangladesh', N'Novosibirsk Oblast')
INSERT [dbo].[Ubicacion] ([Id_Ubicacion], [Continente], [Pais], [Region]) VALUES (128, N'-85.36635, -122.2424', N'Latvia', N'Berlin')
INSERT [dbo].[Ubicacion] ([Id_Ubicacion], [Continente], [Pais], [Region]) VALUES (129, N'-10.82355, -101.30928', N'Iceland', N'Mer')
INSERT [dbo].[Ubicacion] ([Id_Ubicacion], [Continente], [Pais], [Region]) VALUES (130, N'-14.54048, -100.27488', N'Togo', N'HB')
INSERT [dbo].[Ubicacion] ([Id_Ubicacion], [Continente], [Pais], [Region]) VALUES (131, N'-23.67248, -0.82427', N'Algeria', N'Wie')
INSERT [dbo].[Ubicacion] ([Id_Ubicacion], [Continente], [Pais], [Region]) VALUES (132, N'7.36133, 152.0955', N'Cocos (Keeling) Islands', N'Nebraska')
INSERT [dbo].[Ubicacion] ([Id_Ubicacion], [Continente], [Pais], [Region]) VALUES (133, N'55.75935, 67.19981', N'Niger', N'Sicilia')
INSERT [dbo].[Ubicacion] ([Id_Ubicacion], [Continente], [Pais], [Region]) VALUES (134, N'5.88703, -100.79509', N'Guam', N'LOM')
INSERT [dbo].[Ubicacion] ([Id_Ubicacion], [Continente], [Pais], [Region]) VALUES (135, N'86.60961, -110.61077', N'Somalia', N'N.')
INSERT [dbo].[Ubicacion] ([Id_Ubicacion], [Continente], [Pais], [Region]) VALUES (136, N'57.80011, 163.83319', N'Egypt', N'LU')
INSERT [dbo].[Ubicacion] ([Id_Ubicacion], [Continente], [Pais], [Region]) VALUES (137, N'61.94302, 95.69418', N'Isle of Man', N'Ayd')
INSERT [dbo].[Ubicacion] ([Id_Ubicacion], [Continente], [Pais], [Region]) VALUES (138, N'-49.67927, 53.09623', N'Armenia', N'Antioquia')
INSERT [dbo].[Ubicacion] ([Id_Ubicacion], [Continente], [Pais], [Region]) VALUES (139, N'-31.19766, -84.12771', N'Tokelau', N'São Paulo')
INSERT [dbo].[Ubicacion] ([Id_Ubicacion], [Continente], [Pais], [Region]) VALUES (140, N'65.7634, 60.11797', N'Cameroon', N'SIC')
INSERT [dbo].[Ubicacion] ([Id_Ubicacion], [Continente], [Pais], [Region]) VALUES (141, N'-48.39178, -0.07201', N'Finland', N'WV')
INSERT [dbo].[Ubicacion] ([Id_Ubicacion], [Continente], [Pais], [Region]) VALUES (142, N'81.15052, 122.68223', N'Dominica', N'LIP')
INSERT [dbo].[Ubicacion] ([Id_Ubicacion], [Continente], [Pais], [Region]) VALUES (143, N'-83.93554, 26.24452', N'Isle of Man', N'SJ')
INSERT [dbo].[Ubicacion] ([Id_Ubicacion], [Continente], [Pais], [Region]) VALUES (144, N'-6.14605, -64.34683', N'Singapore', N'Arequipa')
INSERT [dbo].[Ubicacion] ([Id_Ubicacion], [Continente], [Pais], [Region]) VALUES (145, N'77.30249, -38.57543', N'Montserrat', N'SI')
INSERT [dbo].[Ubicacion] ([Id_Ubicacion], [Continente], [Pais], [Region]) VALUES (146, N'81.6671, 47.05209', N'Bahamas', N'KS')
INSERT [dbo].[Ubicacion] ([Id_Ubicacion], [Continente], [Pais], [Region]) VALUES (147, N'13.88414, 158.64455', N'Bahamas', N'BE')
INSERT [dbo].[Ubicacion] ([Id_Ubicacion], [Continente], [Pais], [Region]) VALUES (148, N'19.7912, 1.35884', N'Thailand', N'Wie')
INSERT [dbo].[Ubicacion] ([Id_Ubicacion], [Continente], [Pais], [Region]) VALUES (149, N'-52.07426, 117.03448', N'Gabon', N'A')
INSERT [dbo].[Ubicacion] ([Id_Ubicacion], [Continente], [Pais], [Region]) VALUES (150, N'-89.34528, -124.90001', N'Singapore', N'Bauchi')
INSERT [dbo].[Ubicacion] ([Id_Ubicacion], [Continente], [Pais], [Region]) VALUES (151, N'54.94812, 116.20146', N'Rwanda', N'Brussels Hoofdstedelijk Gewest')
INSERT [dbo].[Ubicacion] ([Id_Ubicacion], [Continente], [Pais], [Region]) VALUES (152, N'17.58498, 65.34792', N'Martinique', N'ANT')
INSERT [dbo].[Ubicacion] ([Id_Ubicacion], [Continente], [Pais], [Region]) VALUES (153, N'25.51945, -169.92367', N'El Salvador', N'Pays de la Loire')
INSERT [dbo].[Ubicacion] ([Id_Ubicacion], [Continente], [Pais], [Region]) VALUES (154, N'73.60958, -2.89034', N'Croatia', N'BD')
INSERT [dbo].[Ubicacion] ([Id_Ubicacion], [Continente], [Pais], [Region]) VALUES (155, N'43.93358, 24.30774', N'Argentina', N'Liguria')
INSERT [dbo].[Ubicacion] ([Id_Ubicacion], [Continente], [Pais], [Region]) VALUES (156, N'4.03819, -140.81241', N'Congo (Brazzaville)', N'O')
INSERT [dbo].[Ubicacion] ([Id_Ubicacion], [Continente], [Pais], [Region]) VALUES (157, N'-13.7152, 73.20126', N'Ecuador', N'Maule')
INSERT [dbo].[Ubicacion] ([Id_Ubicacion], [Continente], [Pais], [Region]) VALUES (158, N'42.54205, -133.37977', N'Australia', N'AN')
INSERT [dbo].[Ubicacion] ([Id_Ubicacion], [Continente], [Pais], [Region]) VALUES (159, N'-82.99607, -47.79756', N'Iceland', N'Ulster')
INSERT [dbo].[Ubicacion] ([Id_Ubicacion], [Continente], [Pais], [Region]) VALUES (160, N'83.55079, -77.02494', N'Mongolia', N'Vienna')
INSERT [dbo].[Ubicacion] ([Id_Ubicacion], [Continente], [Pais], [Region]) VALUES (161, N'-22.63109, -167.64803', N'Mauritius', N'Cartago')
INSERT [dbo].[Ubicacion] ([Id_Ubicacion], [Continente], [Pais], [Region]) VALUES (162, N'69.73869, 174.88393', N'Cayman Islands', N'Vienna')
INSERT [dbo].[Ubicacion] ([Id_Ubicacion], [Continente], [Pais], [Region]) VALUES (163, N'-3.97525, 68.618', N'Gabon', N'Leinster')
INSERT [dbo].[Ubicacion] ([Id_Ubicacion], [Continente], [Pais], [Region]) VALUES (164, N'-36.96721, -174.5213', N'Mali', N'KP')
INSERT [dbo].[Ubicacion] ([Id_Ubicacion], [Continente], [Pais], [Region]) VALUES (165, N'-74.78819, 89.85366', N'Poland', N'Khyber Pakhtoonkhwa')
INSERT [dbo].[Ubicacion] ([Id_Ubicacion], [Continente], [Pais], [Region]) VALUES (166, N'-32.64945, 53.91699', N'Maldives', N'NSW')
INSERT [dbo].[Ubicacion] ([Id_Ubicacion], [Continente], [Pais], [Region]) VALUES (167, N'47.14147, 118.78055', N'Bangladesh', N'M')
INSERT [dbo].[Ubicacion] ([Id_Ubicacion], [Continente], [Pais], [Region]) VALUES (168, N'37.51263, -21.25786', N'British Indian Ocean Territory', N'NO')
INSERT [dbo].[Ubicacion] ([Id_Ubicacion], [Continente], [Pais], [Region]) VALUES (169, N'-61.45174, -40.2624', N'Tajikistan', N'Vorarlberg')
INSERT [dbo].[Ubicacion] ([Id_Ubicacion], [Continente], [Pais], [Region]) VALUES (170, N'29.85398, 79.02037', N'Saint Barthélemy', N'PB')
INSERT [dbo].[Ubicacion] ([Id_Ubicacion], [Continente], [Pais], [Region]) VALUES (171, N'-27.88945, 135.12553', N'Panama', N'Banffshire')
INSERT [dbo].[Ubicacion] ([Id_Ubicacion], [Continente], [Pais], [Region]) VALUES (172, N'81.06565, -36.90123', N'Seychelles', N'Mazowieckie')
INSERT [dbo].[Ubicacion] ([Id_Ubicacion], [Continente], [Pais], [Region]) VALUES (173, N'73.32465, 66.28911', N'French Southern Territories', N'OV')
INSERT [dbo].[Ubicacion] ([Id_Ubicacion], [Continente], [Pais], [Region]) VALUES (174, N'52.62365, -99.82781', N'New Caledonia', N'RM')
INSERT [dbo].[Ubicacion] ([Id_Ubicacion], [Continente], [Pais], [Region]) VALUES (175, N'-57.56642, 7.58946', N'Tunisia', N'KPK')
INSERT [dbo].[Ubicacion] ([Id_Ubicacion], [Continente], [Pais], [Region]) VALUES (176, N'43.71517, -178.31348', N'Botswana', N'Indiana')
INSERT [dbo].[Ubicacion] ([Id_Ubicacion], [Continente], [Pais], [Region]) VALUES (177, N'-65.20606, 5.50948', N'Guadeloupe', N'Provence-Alpes-Côte d''Azur')
INSERT [dbo].[Ubicacion] ([Id_Ubicacion], [Continente], [Pais], [Region]) VALUES (178, N'38.58942, -86.2045', N'Mauritania', N'Berlin')
INSERT [dbo].[Ubicacion] ([Id_Ubicacion], [Continente], [Pais], [Region]) VALUES (179, N'-69.93848, -160.46266', N'South Sudan', N'PA')
INSERT [dbo].[Ubicacion] ([Id_Ubicacion], [Continente], [Pais], [Region]) VALUES (180, N'29.9488, -88.99426', N'Brazil', N'DS')
INSERT [dbo].[Ubicacion] ([Id_Ubicacion], [Continente], [Pais], [Region]) VALUES (181, N'-60.5512, -98.87786', N'Philippines', N'ORE')
INSERT [dbo].[Ubicacion] ([Id_Ubicacion], [Continente], [Pais], [Region]) VALUES (182, N'59.62987, -92.04645', N'Finland', N'Valparaíso')
INSERT [dbo].[Ubicacion] ([Id_Ubicacion], [Continente], [Pais], [Region]) VALUES (183, N'66.58393, -38.90343', N'Mongolia', N'TN')
INSERT [dbo].[Ubicacion] ([Id_Ubicacion], [Continente], [Pais], [Region]) VALUES (184, N'-51.83796, 77.30179', N'Taiwan', N'PU')
INSERT [dbo].[Ubicacion] ([Id_Ubicacion], [Continente], [Pais], [Region]) VALUES (185, N'2.35539, -1.68836', N'Côte D''Ivoire (Ivory Coast)', N'LA')
INSERT [dbo].[Ubicacion] ([Id_Ubicacion], [Continente], [Pais], [Region]) VALUES (186, N'31.44977, 85.21815', N'Maldives', N'HA')
INSERT [dbo].[Ubicacion] ([Id_Ubicacion], [Continente], [Pais], [Region]) VALUES (187, N'-54.98697, -134.29885', N'United Arab Emirates', N'AST')
INSERT [dbo].[Ubicacion] ([Id_Ubicacion], [Continente], [Pais], [Region]) VALUES (188, N'82.45972, 174.65436', N'Serbia', N'AL')
INSERT [dbo].[Ubicacion] ([Id_Ubicacion], [Continente], [Pais], [Region]) VALUES (189, N'60.69161, 55.18175', N'Belarus', N'ON')
INSERT [dbo].[Ubicacion] ([Id_Ubicacion], [Continente], [Pais], [Region]) VALUES (190, N'-24.63355, 165.35549', N'Zambia', N'LU')
INSERT [dbo].[Ubicacion] ([Id_Ubicacion], [Continente], [Pais], [Region]) VALUES (191, N'-16.58572, -157.29201', N'Somalia', N'Gelderland')
INSERT [dbo].[Ubicacion] ([Id_Ubicacion], [Continente], [Pais], [Region]) VALUES (192, N'-85.62678, 63.20006', N'Madagascar', N'Gilgit Baltistan')
INSERT [dbo].[Ubicacion] ([Id_Ubicacion], [Continente], [Pais], [Region]) VALUES (193, N'1.63938, -144.68376', N'Kenya', N'San José')
INSERT [dbo].[Ubicacion] ([Id_Ubicacion], [Continente], [Pais], [Region]) VALUES (194, N'-57.56562, 158.72267', N'Turks and Caicos Islands', N'Tab')
INSERT [dbo].[Ubicacion] ([Id_Ubicacion], [Continente], [Pais], [Region]) VALUES (195, N'-0.40929, -47.40396', N'Djibouti', N'Provence-Alpes-Côte d''Azur')
INSERT [dbo].[Ubicacion] ([Id_Ubicacion], [Continente], [Pais], [Region]) VALUES (196, N'-79.6571, -56.69119', N'Seychelles', N'Gyeonggi')
INSERT [dbo].[Ubicacion] ([Id_Ubicacion], [Continente], [Pais], [Region]) VALUES (197, N'-57.06718, -128.68013', N'Syria', N'XIV')
INSERT [dbo].[Ubicacion] ([Id_Ubicacion], [Continente], [Pais], [Region]) VALUES (198, N'-18.66677, 9.17799', N'Netherlands', N'SI')
INSERT [dbo].[Ubicacion] ([Id_Ubicacion], [Continente], [Pais], [Region]) VALUES (199, N'26.52572, -19.2096', N'Cape Verde', N'VIC')
INSERT [dbo].[Ubicacion] ([Id_Ubicacion], [Continente], [Pais], [Region]) VALUES (200, N'-44.89445, 43.57755', N'Finland', N'JB')
GO
ALTER TABLE [dbo].[Centro_Hospitalario]  WITH CHECK ADD  CONSTRAINT [FK_Centro_Hospitalario_Ubicacion] FOREIGN KEY([Id_Ubicacion])
REFERENCES [dbo].[Ubicacion] ([Id_Ubicacion])
GO
ALTER TABLE [dbo].[Centro_Hospitalario] CHECK CONSTRAINT [FK_Centro_Hospitalario_Ubicacion]
GO
ALTER TABLE [dbo].[Contacto]  WITH CHECK ADD  CONSTRAINT [FK_Contacto_Paciente] FOREIGN KEY([Id_Paciente])
REFERENCES [dbo].[Paciente] ([Id_Paciente])
GO
ALTER TABLE [dbo].[Contacto] CHECK CONSTRAINT [FK_Contacto_Paciente]
GO
ALTER TABLE [dbo].[Contacto]  WITH CHECK ADD  CONSTRAINT [FK_Contacto_Persona] FOREIGN KEY([Cedula])
REFERENCES [dbo].[Persona] ([Cedula])
GO
ALTER TABLE [dbo].[Contacto] CHECK CONSTRAINT [FK_Contacto_Persona]
GO
ALTER TABLE [dbo].[Medicamento_Paciente]  WITH CHECK ADD  CONSTRAINT [FK_Medicamento_Paciente_Medicamento] FOREIGN KEY([Id_Medicamento])
REFERENCES [dbo].[Medicamento] ([Id_Medicamento])
GO
ALTER TABLE [dbo].[Medicamento_Paciente] CHECK CONSTRAINT [FK_Medicamento_Paciente_Medicamento]
GO
ALTER TABLE [dbo].[Medicamento_Paciente]  WITH CHECK ADD  CONSTRAINT [FK_Medicamento_Paciente_Paciente] FOREIGN KEY([Id_Paciente])
REFERENCES [dbo].[Paciente] ([Id_Paciente])
GO
ALTER TABLE [dbo].[Medicamento_Paciente] CHECK CONSTRAINT [FK_Medicamento_Paciente_Paciente]
GO
ALTER TABLE [dbo].[Paciente]  WITH CHECK ADD  CONSTRAINT [FK_Paciente_Persona] FOREIGN KEY([Cedula])
REFERENCES [dbo].[Persona] ([Cedula])
GO
ALTER TABLE [dbo].[Paciente] CHECK CONSTRAINT [FK_Paciente_Persona]
GO
ALTER TABLE [dbo].[Persona]  WITH CHECK ADD  CONSTRAINT [FK_Persona_Ubicacion] FOREIGN KEY([Id_Ubicacion])
REFERENCES [dbo].[Ubicacion] ([Id_Ubicacion])
GO
ALTER TABLE [dbo].[Persona] CHECK CONSTRAINT [FK_Persona_Ubicacion]
GO
ALTER TABLE [dbo].[Persona_Patologia]  WITH CHECK ADD  CONSTRAINT [FK_Persona_Patologia_Patologia] FOREIGN KEY([Id_Patologia])
REFERENCES [dbo].[Patologia] ([Id_Patologia])
GO
ALTER TABLE [dbo].[Persona_Patologia] CHECK CONSTRAINT [FK_Persona_Patologia_Patologia]
GO
ALTER TABLE [dbo].[Persona_Patologia]  WITH CHECK ADD  CONSTRAINT [FK_Persona_Patologia_Persona] FOREIGN KEY([Cedula])
REFERENCES [dbo].[Persona] ([Cedula])
GO
ALTER TABLE [dbo].[Persona_Patologia] CHECK CONSTRAINT [FK_Persona_Patologia_Persona]
GO
ALTER TABLE [dbo].[Ubicacion_Medida_Sanitaria]  WITH CHECK ADD  CONSTRAINT [FK_Ubicacion_Medida_Sanitaria_Medida_Sanitaria] FOREIGN KEY([Id_Medida_Sanitaria])
REFERENCES [dbo].[Medida_Sanitaria] ([Id_Medida_Sanitaria])
GO
ALTER TABLE [dbo].[Ubicacion_Medida_Sanitaria] CHECK CONSTRAINT [FK_Ubicacion_Medida_Sanitaria_Medida_Sanitaria]
GO
ALTER TABLE [dbo].[Ubicacion_Medida_Sanitaria]  WITH CHECK ADD  CONSTRAINT [FK_Ubicacion_Medida_Sanitaria_Ubicacion] FOREIGN KEY([Id_Ubicacion])
REFERENCES [dbo].[Ubicacion] ([Id_Ubicacion])
GO
ALTER TABLE [dbo].[Ubicacion_Medida_Sanitaria] CHECK CONSTRAINT [FK_Ubicacion_Medida_Sanitaria_Ubicacion]
GO
USE [master]
GO
ALTER DATABASE [CoTEC-2020] SET  READ_WRITE 
GO
