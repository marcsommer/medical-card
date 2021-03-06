USE [master]
GO
/****** Object:  Database [MedicalCard]    Script Date: 05/26/2011 00:50:47 ******/
CREATE DATABASE [MedicalCard] ON  PRIMARY 
( NAME = N'MedicalCard', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS\MSSQL\Data\MedicalCard.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'MedicalCard_log', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS\MSSQL\Data\MedicalCard_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [MedicalCard] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MedicalCard].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MedicalCard] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [MedicalCard] SET ANSI_NULLS OFF
GO
ALTER DATABASE [MedicalCard] SET ANSI_PADDING OFF
GO
ALTER DATABASE [MedicalCard] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [MedicalCard] SET ARITHABORT OFF
GO
ALTER DATABASE [MedicalCard] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [MedicalCard] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [MedicalCard] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [MedicalCard] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [MedicalCard] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [MedicalCard] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [MedicalCard] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [MedicalCard] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [MedicalCard] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [MedicalCard] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [MedicalCard] SET  DISABLE_BROKER
GO
ALTER DATABASE [MedicalCard] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [MedicalCard] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [MedicalCard] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [MedicalCard] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [MedicalCard] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [MedicalCard] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [MedicalCard] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [MedicalCard] SET  READ_WRITE
GO
ALTER DATABASE [MedicalCard] SET RECOVERY SIMPLE
GO
ALTER DATABASE [MedicalCard] SET  MULTI_USER
GO
ALTER DATABASE [MedicalCard] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [MedicalCard] SET DB_CHAINING OFF
GO
USE [MedicalCard]
GO
/****** Object:  Table [dbo].[Patients]    Script Date: 05/26/2011 00:50:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Patients](
	[PatientId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Number] [nvarchar](12) NOT NULL,
	[Address] [nvarchar](255) NULL,
	[Phone] [nvarchar](32) NULL,
	[Birthdate] [date] NULL,
 CONSTRAINT [PK_Patients] PRIMARY KEY CLUSTERED 
(
	[PatientId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Doctors]    Script Date: 05/26/2011 00:50:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Doctors](
	[DoctorId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Skils] [nvarchar](255) NULL,
	[Phone] [nvarchar](32) NULL,
	[Address] [nvarchar](255) NULL,
 CONSTRAINT [PK_Doctors] PRIMARY KEY CLUSTERED 
(
	[DoctorId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 05/26/2011 00:50:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NULL,
	[Password] [nvarchar](128) NULL,
	[DoctorId] [int] NULL,
	[RoleId] [smallint] NULL,
	[PatientId] [int] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Diagnoses]    Script Date: 05/26/2011 00:50:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Diagnoses](
	[DiagnoseId] [int] IDENTITY(1,1) NOT NULL,
	[PatientId] [int] NULL,
	[DoctorId] [int] NULL,
	[Subect] [nvarchar](255) NULL,
	[Notes] [nvarchar](512) NULL,
	[DiagnosticationDate] [date] NULL,
	[Prescription] [nvarchar](255) NULL,
 CONSTRAINT [PK_Diagnoses] PRIMARY KEY CLUSTERED 
(
	[DiagnoseId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Consultations]    Script Date: 05/26/2011 00:50:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Consultations](
	[ConsultationId] [int] IDENTITY(1,1) NOT NULL,
	[ScheduleDate] [date] NULL,
	[ScheduleTime] [time](7) NULL,
	[PatientId] [int] NULL,
	[DoctorId] [int] NULL,
	[Reason] [nvarchar](512) NULL,
	[Notes] [nvarchar](512) NULL,
	[Conclusion] [nvarchar](512) NULL,
 CONSTRAINT [PK_Consultations] PRIMARY KEY CLUSTERED 
(
	[ConsultationId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  ForeignKey [FK_Users_Doctors]    Script Date: 05/26/2011 00:50:50 ******/
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Doctors] FOREIGN KEY([DoctorId])
REFERENCES [dbo].[Doctors] ([DoctorId])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Doctors]
GO
/****** Object:  ForeignKey [FK_Users_Patients]    Script Date: 05/26/2011 00:50:50 ******/
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Patients] FOREIGN KEY([PatientId])
REFERENCES [dbo].[Patients] ([PatientId])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Patients]
GO
/****** Object:  ForeignKey [FK_Diagnoses_Doctors]    Script Date: 05/26/2011 00:50:50 ******/
ALTER TABLE [dbo].[Diagnoses]  WITH CHECK ADD  CONSTRAINT [FK_Diagnoses_Doctors] FOREIGN KEY([DoctorId])
REFERENCES [dbo].[Doctors] ([DoctorId])
GO
ALTER TABLE [dbo].[Diagnoses] CHECK CONSTRAINT [FK_Diagnoses_Doctors]
GO
/****** Object:  ForeignKey [FK_Diagnoses_Patients]    Script Date: 05/26/2011 00:50:50 ******/
ALTER TABLE [dbo].[Diagnoses]  WITH CHECK ADD  CONSTRAINT [FK_Diagnoses_Patients] FOREIGN KEY([PatientId])
REFERENCES [dbo].[Patients] ([PatientId])
GO
ALTER TABLE [dbo].[Diagnoses] CHECK CONSTRAINT [FK_Diagnoses_Patients]
GO
/****** Object:  ForeignKey [FK_Consultations_Doctors]    Script Date: 05/26/2011 00:50:50 ******/
ALTER TABLE [dbo].[Consultations]  WITH CHECK ADD  CONSTRAINT [FK_Consultations_Doctors] FOREIGN KEY([DoctorId])
REFERENCES [dbo].[Doctors] ([DoctorId])
GO
ALTER TABLE [dbo].[Consultations] CHECK CONSTRAINT [FK_Consultations_Doctors]
GO
/****** Object:  ForeignKey [FK_Consultations_Patients]    Script Date: 05/26/2011 00:50:50 ******/
ALTER TABLE [dbo].[Consultations]  WITH CHECK ADD  CONSTRAINT [FK_Consultations_Patients] FOREIGN KEY([PatientId])
REFERENCES [dbo].[Patients] ([PatientId])
GO
ALTER TABLE [dbo].[Consultations] CHECK CONSTRAINT [FK_Consultations_Patients]
GO
