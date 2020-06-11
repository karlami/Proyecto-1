USE [master]
GO
/****** Object:  Database [CoTEC-2020]    Script Date: 6/10/2020 7:58:08 PM ******/
CREATE DATABASE [CoTEC-2020]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CoTEC-2020', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQL2019\MSSQL\DATA\CoTEC-2020.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CoTEC-2020_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQL2019\MSSQL\DATA\CoTEC-2020_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
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
/****** Object:  Schema [CoTEC-2020 Schema I]    Script Date: 6/10/2020 7:58:09 PM ******/
CREATE SCHEMA [CoTEC-2020 Schema I]
GO
/****** Object:  Table [dbo].[Centro_Hospitalario]    Script Date: 6/10/2020 7:58:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Centro_Hospitalario](
	[Id_Centro_Hospitalario] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](100) NULL,
	[Capacidad] [int] NULL,
	[Capacidad_UCI] [int] NULL,
	[Director] [nvarchar](30) NULL,
	[Contacto] [nvarchar](50) NULL,
	[Id_Ubicacion] [int] NOT NULL,
 CONSTRAINT [PK_Centro_Hospitalario] PRIMARY KEY CLUSTERED 
(
	[Id_Centro_Hospitalario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contacto]    Script Date: 6/10/2020 7:58:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contacto](
	[Id_Contacto] [int] IDENTITY(1,1) NOT NULL,
	[Correo] [nvarchar](100) NULL,
	[Id_Paciente] [int] NULL,
	[Cedula] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_Contacto] PRIMARY KEY CLUSTERED 
(
	[Id_Contacto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Medicamento]    Script Date: 6/10/2020 7:58:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Medicamento](
	[Id_Medicamento] [int] NOT NULL,
	[Nombre] [nvarchar](100) NULL,
	[Descripcion] [nvarchar](300) NULL,
	[Casa_Farmaceutica] [nvarchar](100) NULL,
 CONSTRAINT [PK_Medicamento] PRIMARY KEY CLUSTERED 
(
	[Id_Medicamento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Medida_Sanitaria]    Script Date: 6/10/2020 7:58:10 PM ******/
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
/****** Object:  Table [dbo].[Paciente]    Script Date: 6/10/2020 7:58:10 PM ******/
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
	[Id_Centro_Hospitalario] [int] NOT NULL,
	[Cedula] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_Paciente] PRIMARY KEY CLUSTERED 
(
	[Id_Paciente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Paciente_Medicamento]    Script Date: 6/10/2020 7:58:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Paciente_Medicamento](
	[Id_Paciente_Medicamento] [int] NOT NULL,
	[Id_Medicamento] [int] NOT NULL,
	[Id_Paciente] [int] NOT NULL,
 CONSTRAINT [PK_Paciente_Medicamento] PRIMARY KEY CLUSTERED 
(
	[Id_Paciente_Medicamento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Patologia]    Script Date: 6/10/2020 7:58:10 PM ******/
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
/****** Object:  Table [dbo].[Persona]    Script Date: 6/10/2020 7:58:10 PM ******/
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
	[Id_Ubicacion] [int] NOT NULL,
 CONSTRAINT [PK_Persona] PRIMARY KEY CLUSTERED 
(
	[Cedula] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Persona_Patologia]    Script Date: 6/10/2020 7:58:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Persona_Patologia](
	[Id_Persona_Patologia] [int] NOT NULL,
	[Cedula] [nvarchar](30) NOT NULL,
	[Id_Patologia] [int] NOT NULL,
 CONSTRAINT [PK_Persona_Patologia] PRIMARY KEY CLUSTERED 
(
	[Id_Persona_Patologia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ubicacion]    Script Date: 6/10/2020 7:58:10 PM ******/
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
/****** Object:  Table [dbo].[Ubicacion_Medida_Sanitaria]    Script Date: 6/10/2020 7:58:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ubicacion_Medida_Sanitaria](
	[Id_Ubicacion_Medida_Sanitaria] [int] NOT NULL,
	[Id_Ubicacion] [int] NOT NULL,
	[Id_Medida_Sanitaria] [int] NOT NULL,
 CONSTRAINT [PK_Ubicacion_Medida_Sanitaria] PRIMARY KEY CLUSTERED 
(
	[Id_Ubicacion_Medida_Sanitaria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
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
ALTER TABLE [dbo].[Paciente]  WITH CHECK ADD  CONSTRAINT [FK_Paciente_Centro_Hospitalario] FOREIGN KEY([Id_Centro_Hospitalario])
REFERENCES [dbo].[Centro_Hospitalario] ([Id_Centro_Hospitalario])
GO
ALTER TABLE [dbo].[Paciente] CHECK CONSTRAINT [FK_Paciente_Centro_Hospitalario]
GO
ALTER TABLE [dbo].[Paciente]  WITH CHECK ADD  CONSTRAINT [FK_Paciente_Persona] FOREIGN KEY([Cedula])
REFERENCES [dbo].[Persona] ([Cedula])
GO
ALTER TABLE [dbo].[Paciente] CHECK CONSTRAINT [FK_Paciente_Persona]
GO
ALTER TABLE [dbo].[Paciente_Medicamento]  WITH CHECK ADD  CONSTRAINT [FK_Medicamento_Paciente_Medicamento] FOREIGN KEY([Id_Medicamento])
REFERENCES [dbo].[Medicamento] ([Id_Medicamento])
GO
ALTER TABLE [dbo].[Paciente_Medicamento] CHECK CONSTRAINT [FK_Medicamento_Paciente_Medicamento]
GO
ALTER TABLE [dbo].[Paciente_Medicamento]  WITH CHECK ADD  CONSTRAINT [FK_Medicamento_Paciente_Paciente] FOREIGN KEY([Id_Paciente])
REFERENCES [dbo].[Paciente] ([Id_Paciente])
GO
ALTER TABLE [dbo].[Paciente_Medicamento] CHECK CONSTRAINT [FK_Medicamento_Paciente_Paciente]
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
