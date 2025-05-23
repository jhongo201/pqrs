USE [master]
GO
/****** Object:  Database [roles]    Script Date: 27/01/2025 9:35:48 a. m. ******/
CREATE DATABASE [roles]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'roles', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\roles.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'roles_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\roles_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [roles] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [roles].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [roles] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [roles] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [roles] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [roles] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [roles] SET ARITHABORT OFF 
GO
ALTER DATABASE [roles] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [roles] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [roles] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [roles] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [roles] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [roles] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [roles] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [roles] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [roles] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [roles] SET  DISABLE_BROKER 
GO
ALTER DATABASE [roles] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [roles] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [roles] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [roles] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [roles] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [roles] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [roles] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [roles] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [roles] SET  MULTI_USER 
GO
ALTER DATABASE [roles] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [roles] SET DB_CHAINING OFF 
GO
ALTER DATABASE [roles] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [roles] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [roles] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [roles] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [roles] SET QUERY_STORE = ON
GO
ALTER DATABASE [roles] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [roles]
GO
/****** Object:  Table [dbo].[areas]    Script Date: 27/01/2025 9:35:49 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[areas](
	[id_area] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](100) NOT NULL,
	[descripcion] [text] NULL,
	[estado] [bit] NULL,
	[fecha_creacion] [datetime] NULL,
	[id_direccion] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_area] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[direcciones]    Script Date: 27/01/2025 9:35:49 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[direcciones](
	[id_direccion] [int] IDENTITY(1,1) NOT NULL,
	[id_territorial] [int] NOT NULL,
	[nombre] [varchar](100) NOT NULL,
	[descripcion] [varchar](255) NULL,
	[estado] [bit] NULL,
	[fecha_creacion] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_direccion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[empresas]    Script Date: 27/01/2025 9:35:49 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[empresas](
	[id_empresa] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](100) NOT NULL,
	[nit] [varchar](20) NOT NULL,
	[direccion] [text] NULL,
	[telefono] [varchar](20) NULL,
	[email] [varchar](100) NULL,
	[estado] [bit] NULL,
	[fecha_creacion] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_empresa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[historial_asignaciones]    Script Date: 27/01/2025 9:35:49 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[historial_asignaciones](
	[id_historial] [int] IDENTITY(1,1) NOT NULL,
	[id_pqrs] [int] NULL,
	[id_usuario_anterior] [int] NULL,
	[id_usuario_nuevo] [int] NULL,
	[motivo_cambio] [text] NULL,
	[fecha_asignacion] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_historial] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[modulos]    Script Date: 27/01/2025 9:35:49 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[modulos](
	[id_modulo] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[descripcion] [text] NULL,
	[estado] [bit] NULL,
	[fecha_creacion] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_modulo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[permisos_rol]    Script Date: 27/01/2025 9:35:49 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[permisos_rol](
	[id_permiso] [int] IDENTITY(1,1) NOT NULL,
	[id_rol] [int] NULL,
	[id_ruta] [int] NULL,
	[puede_leer] [bit] NULL,
	[puede_escribir] [bit] NULL,
	[puede_eliminar] [bit] NULL,
	[estado] [bit] NULL,
	[fecha_creacion] [datetime] NULL,
	[puede_actualizar] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_permiso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[personas]    Script Date: 27/01/2025 9:35:49 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[personas](
	[id_persona] [int] IDENTITY(1,1) NOT NULL,
	[id_empresa] [int] NULL,
	[id_area] [int] NULL,
	[nombres] [varchar](100) NOT NULL,
	[apellidos] [varchar](100) NOT NULL,
	[tipo_documento] [varchar](20) NULL,
	[numero_documento] [varchar](20) NULL,
	[email] [varchar](100) NULL,
	[telefono] [varchar](20) NULL,
	[estado] [bit] NULL,
	[fecha_creacion] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_persona] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pqrs]    Script Date: 27/01/2025 9:35:49 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pqrs](
	[id_pqrs] [int] IDENTITY(1,1) NOT NULL,
	[id_tema] [int] NOT NULL,
	[id_usuario_asignado] [int] NULL,
	[nombre_solicitante] [varchar](200) NOT NULL,
	[email_solicitante] [varchar](100) NOT NULL,
	[telefono_solicitante] [varchar](20) NULL,
	[tipo_documento_solicitante] [varchar](20) NOT NULL,
	[numero_documento_solicitante] [varchar](20) NOT NULL,
	[titulo] [varchar](200) NOT NULL,
	[descripcion] [text] NULL,
	[prioridad] [varchar](20) NULL,
	[estado_pqrs] [varchar](20) NULL,
	[fecha_creacion] [datetime2](7) NULL,
	[fecha_ultima_actualizacion] [datetime2](7) NULL,
	[numero_radicado] [varchar](20) NULL,
	[usuario_creador] [varchar](100) NULL,
	[token_consulta] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_pqrs] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[roles]    Script Date: 27/01/2025 9:35:49 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[roles](
	[id_rol] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[descripcion] [text] NULL,
	[estado] [bit] NULL,
	[fecha_creacion] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_rol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[rutas]    Script Date: 27/01/2025 9:35:49 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rutas](
	[id_ruta] [int] IDENTITY(1,1) NOT NULL,
	[id_modulo] [int] NULL,
	[ruta] [varchar](200) NOT NULL,
	[descripcion] [text] NULL,
	[estado] [bit] NULL,
	[fecha_creacion] [datetime] NULL,
	[es_publica] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_ruta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[seguimiento_pqrs]    Script Date: 27/01/2025 9:35:49 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[seguimiento_pqrs](
	[id_seguimiento] [int] IDENTITY(1,1) NOT NULL,
	[id_pqrs] [int] NULL,
	[id_usuario] [int] NULL,
	[comentario] [text] NOT NULL,
	[archivo_adjunto] [varchar](255) NULL,
	[es_respuesta_final] [bit] NULL,
	[fecha_creacion] [datetime] NULL,
	[tipo_seguimiento] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_seguimiento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[temas_pqrs]    Script Date: 27/01/2025 9:35:49 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[temas_pqrs](
	[id_tema] [int] IDENTITY(1,1) NOT NULL,
	[id_area] [int] NULL,
	[nombre] [varchar](100) NOT NULL,
	[descripcion] [text] NULL,
	[estado] [bit] NULL,
	[fecha_creacion] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_tema] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[temas_pqrs_responsables]    Script Date: 27/01/2025 9:35:49 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[temas_pqrs_responsables](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_tema] [int] NOT NULL,
	[id_usuario] [int] NOT NULL,
	[estado] [bit] NULL,
	[fecha_asignacion] [datetime2](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[territoriales]    Script Date: 27/01/2025 9:35:49 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[territoriales](
	[id_territorial] [int] IDENTITY(1,1) NOT NULL,
	[id_empresa] [int] NOT NULL,
	[nombre] [varchar](100) NOT NULL,
	[codigo] [varchar](20) NULL,
	[descripcion] [varchar](255) NULL,
	[estado] [bit] NULL,
	[fecha_creacion] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_territorial] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tokens_activacion]    Script Date: 27/01/2025 9:35:49 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tokens_activacion](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[token] [varchar](255) NOT NULL,
	[codigo_activacion] [varchar](6) NOT NULL,
	[id_usuario] [int] NOT NULL,
	[fecha_expiracion] [datetime] NOT NULL,
	[fecha_creacion] [datetime] NULL,
	[estado] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[usuarios]    Script Date: 27/01/2025 9:35:49 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usuarios](
	[id_usuario] [int] IDENTITY(1,1) NOT NULL,
	[id_persona] [int] NULL,
	[id_rol] [int] NULL,
	[username] [varchar](50) NOT NULL,
	[password] [varchar](255) NOT NULL,
	[ultimo_login] [datetime] NULL,
	[estado] [bit] NULL,
	[fecha_creacion] [datetime] NULL,
	[token_sesion] [varchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[areas] ON 

INSERT [dbo].[areas] ([id_area], [nombre], [descripcion], [estado], [fecha_creacion], [id_direccion]) VALUES (1, N'Área de TI', N'Actualizada', 1, CAST(N'2024-12-28T13:48:50.980' AS DateTime), 1)
INSERT [dbo].[areas] ([id_area], [nombre], [descripcion], [estado], [fecha_creacion], [id_direccion]) VALUES (2, N'Recursos Humanos', N'Área encargada de gestionar personal', 1, CAST(N'2024-12-29T15:55:45.967' AS DateTime), NULL)
INSERT [dbo].[areas] ([id_area], [nombre], [descripcion], [estado], [fecha_creacion], [id_direccion]) VALUES (3, N'Tecnología', N'Área encargada de la infraestructura tecnológica', 1, CAST(N'2024-12-29T15:55:45.970' AS DateTime), NULL)
INSERT [dbo].[areas] ([id_area], [nombre], [descripcion], [estado], [fecha_creacion], [id_direccion]) VALUES (4, N'Área de Sistemas', N'Área de tecnología', 1, CAST(N'2024-12-31T11:04:12.983' AS DateTime), 1)
INSERT [dbo].[areas] ([id_area], [nombre], [descripcion], [estado], [fecha_creacion], [id_direccion]) VALUES (6, N'Riesgos Laborales', N'Área de Riesgos Laborales', 1, CAST(N'2025-01-02T16:57:29.717' AS DateTime), 1)
INSERT [dbo].[areas] ([id_area], [nombre], [descripcion], [estado], [fecha_creacion], [id_direccion]) VALUES (1006, N'Área Externa', N'Área para usuarios externos', 1, CAST(N'2025-01-09T20:12:03.180' AS DateTime), 5)
SET IDENTITY_INSERT [dbo].[areas] OFF
GO
SET IDENTITY_INSERT [dbo].[direcciones] ON 

INSERT [dbo].[direcciones] ([id_direccion], [id_territorial], [nombre], [descripcion], [estado], [fecha_creacion]) VALUES (1, 1, N'Dirección de inspección, vigilancia, control y gestión territorial - IVC', N'Supervisar la implementación de las estrategias de prevención, inspección y vigilancia', 1, CAST(N'2024-12-31T10:32:55.013' AS DateTime))
INSERT [dbo].[direcciones] ([id_direccion], [id_territorial], [nombre], [descripcion], [estado], [fecha_creacion]) VALUES (2, 1, N'Dirección de Riesgos Laborales', N'Proponer y diseñar las políticas, normas, estrategias, programas y proyectos para el desarrollo del Sistema General de Riesgos Laborales, en lo de su competencia.', 1, CAST(N'2024-12-31T10:34:55.833' AS DateTime))
INSERT [dbo].[direcciones] ([id_direccion], [id_territorial], [nombre], [descripcion], [estado], [fecha_creacion]) VALUES (4, 3, N'Dirección Central', N'Dirección principal', 1, CAST(N'2025-01-01T14:23:12.737' AS DateTime))
INSERT [dbo].[direcciones] ([id_direccion], [id_territorial], [nombre], [descripcion], [estado], [fecha_creacion]) VALUES (5, 4, N'Dirección Externa', N'Dirección para usuarios externos', 1, CAST(N'2025-01-09T20:10:15.320' AS DateTime))
SET IDENTITY_INSERT [dbo].[direcciones] OFF
GO
SET IDENTITY_INSERT [dbo].[empresas] ON 

INSERT [dbo].[empresas] ([id_empresa], [nombre], [nit], [direccion], [telefono], [email], [estado], [fecha_creacion]) VALUES (1, N'Ministerio del Trabajo', N'830115226-3', N'Carrera 7 # 31 – 10 Edificio Worktech Center II P. H. – WTC pisos 5, 8, 9, 10, 12, 17, 18, 19, 20, 21, 22, 23, 24 y25. Bogotá, Colombia', N'6015185830', N'solucionesdocumental@mintrabajo.gov.co', 1, CAST(N'2024-12-28T13:48:48.010' AS DateTime))
INSERT [dbo].[empresas] ([id_empresa], [nombre], [nit], [direccion], [telefono], [email], [estado], [fecha_creacion]) VALUES (5, N'Empresa ABC', N'900123456-7', NULL, N'3001234567', N'contacto@empresaabc.com', 0, CAST(N'2025-01-01T14:21:35.530' AS DateTime))
INSERT [dbo].[empresas] ([id_empresa], [nombre], [nit], [direccion], [telefono], [email], [estado], [fecha_creacion]) VALUES (6, N'Empresa Externa', N'900000000-1', NULL, N'3001234567', N'contacto@empresaexterna.com', 1, CAST(N'2025-01-09T20:07:34.597' AS DateTime))
SET IDENTITY_INSERT [dbo].[empresas] OFF
GO
SET IDENTITY_INSERT [dbo].[historial_asignaciones] ON 

INSERT [dbo].[historial_asignaciones] ([id_historial], [id_pqrs], [id_usuario_anterior], [id_usuario_nuevo], [motivo_cambio], [fecha_asignacion]) VALUES (1, 1, NULL, 1030, N'Asignación inicial', CAST(N'2025-01-03T12:38:51.313' AS DateTime))
INSERT [dbo].[historial_asignaciones] ([id_historial], [id_pqrs], [id_usuario_anterior], [id_usuario_nuevo], [motivo_cambio], [fecha_asignacion]) VALUES (2, 6, NULL, 1030, N'Asignación inicial', CAST(N'2025-01-05T12:04:25.057' AS DateTime))
INSERT [dbo].[historial_asignaciones] ([id_historial], [id_pqrs], [id_usuario_anterior], [id_usuario_nuevo], [motivo_cambio], [fecha_asignacion]) VALUES (3, 6, 1030, 1030, N'Asignación inicial', CAST(N'2025-01-05T12:05:47.943' AS DateTime))
INSERT [dbo].[historial_asignaciones] ([id_historial], [id_pqrs], [id_usuario_anterior], [id_usuario_nuevo], [motivo_cambio], [fecha_asignacion]) VALUES (4, 6, 1030, 1031, N'Asignación inicial', CAST(N'2025-01-05T12:06:22.087' AS DateTime))
INSERT [dbo].[historial_asignaciones] ([id_historial], [id_pqrs], [id_usuario_anterior], [id_usuario_nuevo], [motivo_cambio], [fecha_asignacion]) VALUES (1003, 2, NULL, 1, N'Asignación inicial', CAST(N'2025-01-13T09:29:10.430' AS DateTime))
INSERT [dbo].[historial_asignaciones] ([id_historial], [id_pqrs], [id_usuario_anterior], [id_usuario_nuevo], [motivo_cambio], [fecha_asignacion]) VALUES (1004, 8, NULL, 16, N'cambio para probar funcionalidad', CAST(N'2025-01-14T16:32:47.517' AS DateTime))
INSERT [dbo].[historial_asignaciones] ([id_historial], [id_pqrs], [id_usuario_anterior], [id_usuario_nuevo], [motivo_cambio], [fecha_asignacion]) VALUES (1005, 6, 1031, 16, N'jhon haciendo cambios', CAST(N'2025-01-14T16:46:28.480' AS DateTime))
INSERT [dbo].[historial_asignaciones] ([id_historial], [id_pqrs], [id_usuario_anterior], [id_usuario_nuevo], [motivo_cambio], [fecha_asignacion]) VALUES (1006, 2, 1, 4, N'testteando ', CAST(N'2025-01-14T16:47:17.463' AS DateTime))
INSERT [dbo].[historial_asignaciones] ([id_historial], [id_pqrs], [id_usuario_anterior], [id_usuario_nuevo], [motivo_cambio], [fecha_asignacion]) VALUES (1007, 8, 16, 9, N'nuevo responsable', CAST(N'2025-01-14T18:52:35.207' AS DateTime))
INSERT [dbo].[historial_asignaciones] ([id_historial], [id_pqrs], [id_usuario_anterior], [id_usuario_nuevo], [motivo_cambio], [fecha_asignacion]) VALUES (1008, 8, 9, 16, N'vuelve a kata', CAST(N'2025-01-14T19:21:49.937' AS DateTime))
INSERT [dbo].[historial_asignaciones] ([id_historial], [id_pqrs], [id_usuario_anterior], [id_usuario_nuevo], [motivo_cambio], [fecha_asignacion]) VALUES (1013, 8, 16, 9, N'asignanod a juliana', CAST(N'2025-01-14T19:31:39.020' AS DateTime))
INSERT [dbo].[historial_asignaciones] ([id_historial], [id_pqrs], [id_usuario_anterior], [id_usuario_nuevo], [motivo_cambio], [fecha_asignacion]) VALUES (1014, 8, 9, 4, N'movinedo al user', CAST(N'2025-01-14T19:32:49.977' AS DateTime))
INSERT [dbo].[historial_asignaciones] ([id_historial], [id_pqrs], [id_usuario_anterior], [id_usuario_nuevo], [motivo_cambio], [fecha_asignacion]) VALUES (1015, 8, 4, 5, N'carlos perez', CAST(N'2025-01-14T19:39:42.203' AS DateTime))
INSERT [dbo].[historial_asignaciones] ([id_historial], [id_pqrs], [id_usuario_anterior], [id_usuario_nuevo], [motivo_cambio], [fecha_asignacion]) VALUES (1016, 8, 5, 4, N'probanod que ahora si funciona', CAST(N'2025-01-14T19:56:38.060' AS DateTime))
INSERT [dbo].[historial_asignaciones] ([id_historial], [id_pqrs], [id_usuario_anterior], [id_usuario_nuevo], [motivo_cambio], [fecha_asignacion]) VALUES (1017, 8, 4, 6, N'probando a pepito', CAST(N'2025-01-14T20:28:19.133' AS DateTime))
INSERT [dbo].[historial_asignaciones] ([id_historial], [id_pqrs], [id_usuario_anterior], [id_usuario_nuevo], [motivo_cambio], [fecha_asignacion]) VALUES (1018, 8, 6, 4, N'el mcambio se hace por joneder', CAST(N'2025-01-15T09:49:29.963' AS DateTime))
INSERT [dbo].[historial_asignaciones] ([id_historial], [id_pqrs], [id_usuario_anterior], [id_usuario_nuevo], [motivo_cambio], [fecha_asignacion]) VALUES (1019, 8, 4, 5, N'priobando que paso', CAST(N'2025-01-15T10:09:17.380' AS DateTime))
INSERT [dbo].[historial_asignaciones] ([id_historial], [id_pqrs], [id_usuario_anterior], [id_usuario_nuevo], [motivo_cambio], [fecha_asignacion]) VALUES (1020, 8, 5, 4, N'probando refresh', CAST(N'2025-01-15T14:04:50.887' AS DateTime))
INSERT [dbo].[historial_asignaciones] ([id_historial], [id_pqrs], [id_usuario_anterior], [id_usuario_nuevo], [motivo_cambio], [fecha_asignacion]) VALUES (1021, 8, 4, 4, N'cambiando a juan', CAST(N'2025-01-15T14:05:13.910' AS DateTime))
INSERT [dbo].[historial_asignaciones] ([id_historial], [id_pqrs], [id_usuario_anterior], [id_usuario_nuevo], [motivo_cambio], [fecha_asignacion]) VALUES (1022, 8, 4, 6, N'cambiando a pepito', CAST(N'2025-01-15T14:08:17.227' AS DateTime))
INSERT [dbo].[historial_asignaciones] ([id_historial], [id_pqrs], [id_usuario_anterior], [id_usuario_nuevo], [motivo_cambio], [fecha_asignacion]) VALUES (1023, 8, 6, 4, N'cambaido a juan', CAST(N'2025-01-15T14:10:00.563' AS DateTime))
INSERT [dbo].[historial_asignaciones] ([id_historial], [id_pqrs], [id_usuario_anterior], [id_usuario_nuevo], [motivo_cambio], [fecha_asignacion]) VALUES (1024, 8, 4, 5, N'probando carlos', CAST(N'2025-01-15T14:19:35.913' AS DateTime))
INSERT [dbo].[historial_asignaciones] ([id_historial], [id_pqrs], [id_usuario_anterior], [id_usuario_nuevo], [motivo_cambio], [fecha_asignacion]) VALUES (1025, 8, 5, 3, N'probando otra area', CAST(N'2025-01-15T14:26:46.407' AS DateTime))
INSERT [dbo].[historial_asignaciones] ([id_historial], [id_pqrs], [id_usuario_anterior], [id_usuario_nuevo], [motivo_cambio], [fecha_asignacion]) VALUES (1026, 8, 3, 15, N'colocando a yuli doe', CAST(N'2025-01-15T14:55:41.563' AS DateTime))
INSERT [dbo].[historial_asignaciones] ([id_historial], [id_pqrs], [id_usuario_anterior], [id_usuario_nuevo], [motivo_cambio], [fecha_asignacion]) VALUES (1027, 8, 15, 4, N'nuevo cambio', CAST(N'2025-01-15T14:58:24.063' AS DateTime))
INSERT [dbo].[historial_asignaciones] ([id_historial], [id_pqrs], [id_usuario_anterior], [id_usuario_nuevo], [motivo_cambio], [fecha_asignacion]) VALUES (1028, 8, 4, 5, N'nuevo cambio', CAST(N'2025-01-15T15:00:20.237' AS DateTime))
INSERT [dbo].[historial_asignaciones] ([id_historial], [id_pqrs], [id_usuario_anterior], [id_usuario_nuevo], [motivo_cambio], [fecha_asignacion]) VALUES (1029, 8, 5, 10, N'poniendo  a ana', CAST(N'2025-01-15T15:00:57.410' AS DateTime))
INSERT [dbo].[historial_asignaciones] ([id_historial], [id_pqrs], [id_usuario_anterior], [id_usuario_nuevo], [motivo_cambio], [fecha_asignacion]) VALUES (1030, 8, 10, 5, N'otro cambio', CAST(N'2025-01-15T15:03:19.200' AS DateTime))
INSERT [dbo].[historial_asignaciones] ([id_historial], [id_pqrs], [id_usuario_anterior], [id_usuario_nuevo], [motivo_cambio], [fecha_asignacion]) VALUES (1031, 8, 5, 9, N'otro cambhio', CAST(N'2025-01-15T15:03:36.523' AS DateTime))
INSERT [dbo].[historial_asignaciones] ([id_historial], [id_pqrs], [id_usuario_anterior], [id_usuario_nuevo], [motivo_cambio], [fecha_asignacion]) VALUES (1032, 8, 9, 4, N'nuevo cambio', CAST(N'2025-01-15T15:06:25.973' AS DateTime))
INSERT [dbo].[historial_asignaciones] ([id_historial], [id_pqrs], [id_usuario_anterior], [id_usuario_nuevo], [motivo_cambio], [fecha_asignacion]) VALUES (1033, 8, 4, 5, N'nuevo cambio', CAST(N'2025-01-15T15:06:36.373' AS DateTime))
INSERT [dbo].[historial_asignaciones] ([id_historial], [id_pqrs], [id_usuario_anterior], [id_usuario_nuevo], [motivo_cambio], [fecha_asignacion]) VALUES (1034, 8, 5, 9, N'nuevo cambio', CAST(N'2025-01-15T15:11:12.797' AS DateTime))
INSERT [dbo].[historial_asignaciones] ([id_historial], [id_pqrs], [id_usuario_anterior], [id_usuario_nuevo], [motivo_cambio], [fecha_asignacion]) VALUES (1035, 8, 9, 4, N'nuevo cambio', CAST(N'2025-01-15T15:11:26.083' AS DateTime))
INSERT [dbo].[historial_asignaciones] ([id_historial], [id_pqrs], [id_usuario_anterior], [id_usuario_nuevo], [motivo_cambio], [fecha_asignacion]) VALUES (1036, 8, 4, 4, N'otro cambio', CAST(N'2025-01-15T15:11:37.713' AS DateTime))
INSERT [dbo].[historial_asignaciones] ([id_historial], [id_pqrs], [id_usuario_anterior], [id_usuario_nuevo], [motivo_cambio], [fecha_asignacion]) VALUES (1037, 8, 4, 5, N'proabdnoeeee', CAST(N'2025-01-15T15:21:29.603' AS DateTime))
INSERT [dbo].[historial_asignaciones] ([id_historial], [id_pqrs], [id_usuario_anterior], [id_usuario_nuevo], [motivo_cambio], [fecha_asignacion]) VALUES (1040, 2, 4, 4, N'probanod cambio', CAST(N'2025-01-15T15:48:59.833' AS DateTime))
INSERT [dbo].[historial_asignaciones] ([id_historial], [id_pqrs], [id_usuario_anterior], [id_usuario_nuevo], [motivo_cambio], [fecha_asignacion]) VALUES (1041, 1, 1030, 4, N'erthytytyrtyrtyrty', CAST(N'2025-01-15T16:05:37.473' AS DateTime))
INSERT [dbo].[historial_asignaciones] ([id_historial], [id_pqrs], [id_usuario_anterior], [id_usuario_nuevo], [motivo_cambio], [fecha_asignacion]) VALUES (1042, 2, 4, 9, N'asignacion a juli', CAST(N'2025-01-15T16:16:42.630' AS DateTime))
INSERT [dbo].[historial_asignaciones] ([id_historial], [id_pqrs], [id_usuario_anterior], [id_usuario_nuevo], [motivo_cambio], [fecha_asignacion]) VALUES (1043, 1, 4, 5, N'probando el histoprial', CAST(N'2025-01-17T11:28:23.667' AS DateTime))
INSERT [dbo].[historial_asignaciones] ([id_historial], [id_pqrs], [id_usuario_anterior], [id_usuario_nuevo], [motivo_cambio], [fecha_asignacion]) VALUES (1044, 1030, NULL, 1, N'probando que cargue el filtro', CAST(N'2025-01-22T09:16:05.873' AS DateTime))
SET IDENTITY_INSERT [dbo].[historial_asignaciones] OFF
GO
SET IDENTITY_INSERT [dbo].[modulos] ON 

INSERT [dbo].[modulos] ([id_modulo], [nombre], [descripcion], [estado], [fecha_creacion]) VALUES (1, N'Usuarios', N'Gestión de usuarios', 1, CAST(N'2024-12-28T20:14:56.010' AS DateTime))
INSERT [dbo].[modulos] ([id_modulo], [nombre], [descripcion], [estado], [fecha_creacion]) VALUES (2, N'Roles', N'Gestión de roles', 1, CAST(N'2024-12-28T20:14:56.010' AS DateTime))
INSERT [dbo].[modulos] ([id_modulo], [nombre], [descripcion], [estado], [fecha_creacion]) VALUES (3, N'PQRS', N'Gestión de PQRS', 1, CAST(N'2024-12-28T20:14:56.010' AS DateTime))
INSERT [dbo].[modulos] ([id_modulo], [nombre], [descripcion], [estado], [fecha_creacion]) VALUES (4, N'Seguridad', N'Módulo de gestión de seguridad', 1, CAST(N'2024-12-30T19:40:03.330' AS DateTime))
INSERT [dbo].[modulos] ([id_modulo], [nombre], [descripcion], [estado], [fecha_creacion]) VALUES (5, N'Administración', N'Módulo de administración general', 1, CAST(N'2024-12-30T19:40:03.330' AS DateTime))
INSERT [dbo].[modulos] ([id_modulo], [nombre], [descripcion], [estado], [fecha_creacion]) VALUES (6, N'Reportes', N'Módulo de reportes y estadísticas', 1, NULL)
INSERT [dbo].[modulos] ([id_modulo], [nombre], [descripcion], [estado], [fecha_creacion]) VALUES (1004, N'Empresas', N'Módulo para administrar las Empresas del sistema', 1, CAST(N'2024-12-31T10:00:05.713' AS DateTime))
INSERT [dbo].[modulos] ([id_modulo], [nombre], [descripcion], [estado], [fecha_creacion]) VALUES (1005, N'Territoriales', N'Módulo para manejar las territoriales de la empresa', 1, CAST(N'2024-12-31T10:00:05.713' AS DateTime))
INSERT [dbo].[modulos] ([id_modulo], [nombre], [descripcion], [estado], [fecha_creacion]) VALUES (1006, N'Direcciones', N'Módulo para administrar las direcciones de las territoriales', 1, CAST(N'2024-12-31T10:00:05.713' AS DateTime))
INSERT [dbo].[modulos] ([id_modulo], [nombre], [descripcion], [estado], [fecha_creacion]) VALUES (1007, N'Areas', N'Módulo para administrar las areas de las direcciones', 1, CAST(N'2024-12-31T10:00:05.713' AS DateTime))
INSERT [dbo].[modulos] ([id_modulo], [nombre], [descripcion], [estado], [fecha_creacion]) VALUES (1008, N'Rutas', N'Módulo de administracionde rutas', 1, NULL)
SET IDENTITY_INSERT [dbo].[modulos] OFF
GO
SET IDENTITY_INSERT [dbo].[permisos_rol] ON 

INSERT [dbo].[permisos_rol] ([id_permiso], [id_rol], [id_ruta], [puede_leer], [puede_escribir], [puede_eliminar], [estado], [fecha_creacion], [puede_actualizar]) VALUES (1, 1, 1, 1, 1, 1, 1, CAST(N'2024-12-28T20:15:08.437' AS DateTime), 1)
INSERT [dbo].[permisos_rol] ([id_permiso], [id_rol], [id_ruta], [puede_leer], [puede_escribir], [puede_eliminar], [estado], [fecha_creacion], [puede_actualizar]) VALUES (3, 1, 3, 1, 1, 1, 1, CAST(N'2024-12-28T20:15:08.437' AS DateTime), 1)
INSERT [dbo].[permisos_rol] ([id_permiso], [id_rol], [id_ruta], [puede_leer], [puede_escribir], [puede_eliminar], [estado], [fecha_creacion], [puede_actualizar]) VALUES (5, 2, 1, 1, 0, 0, 1, CAST(N'2024-12-28T20:17:26.070' AS DateTime), 0)
INSERT [dbo].[permisos_rol] ([id_permiso], [id_rol], [id_ruta], [puede_leer], [puede_escribir], [puede_eliminar], [estado], [fecha_creacion], [puede_actualizar]) VALUES (7, 2, 3, 1, 1, 0, 1, CAST(N'2024-12-28T20:17:26.070' AS DateTime), 0)
INSERT [dbo].[permisos_rol] ([id_permiso], [id_rol], [id_ruta], [puede_leer], [puede_escribir], [puede_eliminar], [estado], [fecha_creacion], [puede_actualizar]) VALUES (9, 1, 7, 1, 1, 1, 1, CAST(N'2024-12-30T20:20:33.767' AS DateTime), 1)
INSERT [dbo].[permisos_rol] ([id_permiso], [id_rol], [id_ruta], [puede_leer], [puede_escribir], [puede_eliminar], [estado], [fecha_creacion], [puede_actualizar]) VALUES (10, 1, 8, 1, 1, 1, 1, CAST(N'2024-12-30T20:20:33.767' AS DateTime), 1)
INSERT [dbo].[permisos_rol] ([id_permiso], [id_rol], [id_ruta], [puede_leer], [puede_escribir], [puede_eliminar], [estado], [fecha_creacion], [puede_actualizar]) VALUES (13, 1, 11, 1, 1, 1, 1, CAST(N'2024-12-30T20:20:33.767' AS DateTime), 1)
INSERT [dbo].[permisos_rol] ([id_permiso], [id_rol], [id_ruta], [puede_leer], [puede_escribir], [puede_eliminar], [estado], [fecha_creacion], [puede_actualizar]) VALUES (14, 1, 12, 1, 1, 1, 1, CAST(N'2024-12-30T20:20:33.767' AS DateTime), 1)
INSERT [dbo].[permisos_rol] ([id_permiso], [id_rol], [id_ruta], [puede_leer], [puede_escribir], [puede_eliminar], [estado], [fecha_creacion], [puede_actualizar]) VALUES (15, 1, 13, 1, 1, 1, 1, CAST(N'2024-12-30T21:20:32.510' AS DateTime), 1)
INSERT [dbo].[permisos_rol] ([id_permiso], [id_rol], [id_ruta], [puede_leer], [puede_escribir], [puede_eliminar], [estado], [fecha_creacion], [puede_actualizar]) VALUES (16, 1, 14, 1, 1, 1, 1, CAST(N'2024-12-30T21:20:32.510' AS DateTime), 1)
INSERT [dbo].[permisos_rol] ([id_permiso], [id_rol], [id_ruta], [puede_leer], [puede_escribir], [puede_eliminar], [estado], [fecha_creacion], [puede_actualizar]) VALUES (1008, 1, 1004, 1, 1, 1, 1, CAST(N'2024-12-31T10:03:54.560' AS DateTime), 1)
INSERT [dbo].[permisos_rol] ([id_permiso], [id_rol], [id_ruta], [puede_leer], [puede_escribir], [puede_eliminar], [estado], [fecha_creacion], [puede_actualizar]) VALUES (1009, 1, 1005, 1, 1, 1, 1, CAST(N'2024-12-31T10:03:54.560' AS DateTime), 1)
INSERT [dbo].[permisos_rol] ([id_permiso], [id_rol], [id_ruta], [puede_leer], [puede_escribir], [puede_eliminar], [estado], [fecha_creacion], [puede_actualizar]) VALUES (1010, 1, 1006, 1, 1, 1, 1, CAST(N'2024-12-31T10:03:54.560' AS DateTime), 1)
INSERT [dbo].[permisos_rol] ([id_permiso], [id_rol], [id_ruta], [puede_leer], [puede_escribir], [puede_eliminar], [estado], [fecha_creacion], [puede_actualizar]) VALUES (1011, 1, 1007, 1, 1, 1, 1, CAST(N'2024-12-31T10:03:54.560' AS DateTime), 1)
INSERT [dbo].[permisos_rol] ([id_permiso], [id_rol], [id_ruta], [puede_leer], [puede_escribir], [puede_eliminar], [estado], [fecha_creacion], [puede_actualizar]) VALUES (1012, 1, 1008, 1, 1, 1, 1, CAST(N'2024-12-31T10:03:54.560' AS DateTime), 1)
INSERT [dbo].[permisos_rol] ([id_permiso], [id_rol], [id_ruta], [puede_leer], [puede_escribir], [puede_eliminar], [estado], [fecha_creacion], [puede_actualizar]) VALUES (1013, 1, 1009, 1, 1, 1, 1, CAST(N'2024-12-31T10:03:54.560' AS DateTime), 1)
INSERT [dbo].[permisos_rol] ([id_permiso], [id_rol], [id_ruta], [puede_leer], [puede_escribir], [puede_eliminar], [estado], [fecha_creacion], [puede_actualizar]) VALUES (1014, 1, 1010, 1, 1, 1, 1, CAST(N'2024-12-31T10:03:54.560' AS DateTime), 1)
INSERT [dbo].[permisos_rol] ([id_permiso], [id_rol], [id_ruta], [puede_leer], [puede_escribir], [puede_eliminar], [estado], [fecha_creacion], [puede_actualizar]) VALUES (1015, 1, 1011, 1, 1, 1, 1, CAST(N'2024-12-31T10:03:54.560' AS DateTime), 1)
INSERT [dbo].[permisos_rol] ([id_permiso], [id_rol], [id_ruta], [puede_leer], [puede_escribir], [puede_eliminar], [estado], [fecha_creacion], [puede_actualizar]) VALUES (1017, 1, 1013, 1, 1, 1, 1, CAST(N'2025-01-01T16:18:55.420' AS DateTime), 1)
INSERT [dbo].[permisos_rol] ([id_permiso], [id_rol], [id_ruta], [puede_leer], [puede_escribir], [puede_eliminar], [estado], [fecha_creacion], [puede_actualizar]) VALUES (1022, 1, 1016, 1, 1, 0, 1, CAST(N'2025-01-01T16:29:06.737' AS DateTime), 1)
INSERT [dbo].[permisos_rol] ([id_permiso], [id_rol], [id_ruta], [puede_leer], [puede_escribir], [puede_eliminar], [estado], [fecha_creacion], [puede_actualizar]) VALUES (1023, 2, 1016, 1, 0, 0, 1, CAST(N'2025-01-01T16:29:06.743' AS DateTime), 0)
INSERT [dbo].[permisos_rol] ([id_permiso], [id_rol], [id_ruta], [puede_leer], [puede_escribir], [puede_eliminar], [estado], [fecha_creacion], [puede_actualizar]) VALUES (1029, 1, 1017, 1, 1, 0, 1, CAST(N'2025-01-01T17:03:56.230' AS DateTime), 1)
INSERT [dbo].[permisos_rol] ([id_permiso], [id_rol], [id_ruta], [puede_leer], [puede_escribir], [puede_eliminar], [estado], [fecha_creacion], [puede_actualizar]) VALUES (1031, 1, 1014, 1, 1, 0, 1, CAST(N'2025-01-01T17:04:41.033' AS DateTime), 1)
INSERT [dbo].[permisos_rol] ([id_permiso], [id_rol], [id_ruta], [puede_leer], [puede_escribir], [puede_eliminar], [estado], [fecha_creacion], [puede_actualizar]) VALUES (1032, 1, 1015, 1, 1, 0, 1, CAST(N'2025-01-01T17:05:27.930' AS DateTime), 1)
INSERT [dbo].[permisos_rol] ([id_permiso], [id_rol], [id_ruta], [puede_leer], [puede_escribir], [puede_eliminar], [estado], [fecha_creacion], [puede_actualizar]) VALUES (1033, 1, 1018, 1, 1, 1, 1, CAST(N'2025-01-02T15:15:40.627' AS DateTime), 1)
INSERT [dbo].[permisos_rol] ([id_permiso], [id_rol], [id_ruta], [puede_leer], [puede_escribir], [puede_eliminar], [estado], [fecha_creacion], [puede_actualizar]) VALUES (1034, 1, 1019, 1, 1, 1, 1, CAST(N'2025-01-02T16:42:01.767' AS DateTime), 1)
INSERT [dbo].[permisos_rol] ([id_permiso], [id_rol], [id_ruta], [puede_leer], [puede_escribir], [puede_eliminar], [estado], [fecha_creacion], [puede_actualizar]) VALUES (2026, 1, 2020, 1, 1, 1, 1, CAST(N'2025-01-10T13:46:17.240' AS DateTime), 1)
INSERT [dbo].[permisos_rol] ([id_permiso], [id_rol], [id_ruta], [puede_leer], [puede_escribir], [puede_eliminar], [estado], [fecha_creacion], [puede_actualizar]) VALUES (2027, 1, 2021, 1, 1, 1, 1, CAST(N'2025-01-10T13:46:17.240' AS DateTime), 1)
INSERT [dbo].[permisos_rol] ([id_permiso], [id_rol], [id_ruta], [puede_leer], [puede_escribir], [puede_eliminar], [estado], [fecha_creacion], [puede_actualizar]) VALUES (2028, 1, 2019, 1, 1, 1, 1, CAST(N'2025-01-10T14:32:07.487' AS DateTime), 1)
INSERT [dbo].[permisos_rol] ([id_permiso], [id_rol], [id_ruta], [puede_leer], [puede_escribir], [puede_eliminar], [estado], [fecha_creacion], [puede_actualizar]) VALUES (2029, 1, 3018, 1, 1, 1, 1, CAST(N'2025-01-10T22:42:35.760' AS DateTime), 1)
INSERT [dbo].[permisos_rol] ([id_permiso], [id_rol], [id_ruta], [puede_leer], [puede_escribir], [puede_eliminar], [estado], [fecha_creacion], [puede_actualizar]) VALUES (2030, 1, 3019, 1, 1, 1, 1, CAST(N'2025-01-10T22:42:35.760' AS DateTime), 1)
INSERT [dbo].[permisos_rol] ([id_permiso], [id_rol], [id_ruta], [puede_leer], [puede_escribir], [puede_eliminar], [estado], [fecha_creacion], [puede_actualizar]) VALUES (2031, 1, 3020, 1, 1, 1, 1, CAST(N'2025-01-10T22:42:35.760' AS DateTime), 1)
INSERT [dbo].[permisos_rol] ([id_permiso], [id_rol], [id_ruta], [puede_leer], [puede_escribir], [puede_eliminar], [estado], [fecha_creacion], [puede_actualizar]) VALUES (2032, 1, 3021, 1, 1, 1, 1, CAST(N'2025-01-10T22:42:35.760' AS DateTime), 1)
INSERT [dbo].[permisos_rol] ([id_permiso], [id_rol], [id_ruta], [puede_leer], [puede_escribir], [puede_eliminar], [estado], [fecha_creacion], [puede_actualizar]) VALUES (2033, 1, 3022, 1, 1, 1, 1, CAST(N'2025-01-10T22:42:35.760' AS DateTime), 1)
INSERT [dbo].[permisos_rol] ([id_permiso], [id_rol], [id_ruta], [puede_leer], [puede_escribir], [puede_eliminar], [estado], [fecha_creacion], [puede_actualizar]) VALUES (2034, 1, 3023, 1, 1, 1, 1, CAST(N'2025-01-10T22:42:35.760' AS DateTime), 1)
INSERT [dbo].[permisos_rol] ([id_permiso], [id_rol], [id_ruta], [puede_leer], [puede_escribir], [puede_eliminar], [estado], [fecha_creacion], [puede_actualizar]) VALUES (2035, 1, 3024, 1, 1, 1, 1, CAST(N'2025-01-11T11:50:34.567' AS DateTime), 1)
INSERT [dbo].[permisos_rol] ([id_permiso], [id_rol], [id_ruta], [puede_leer], [puede_escribir], [puede_eliminar], [estado], [fecha_creacion], [puede_actualizar]) VALUES (2036, 1, 3027, 1, 1, 1, 1, CAST(N'2025-01-12T22:19:15.360' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[permisos_rol] OFF
GO
SET IDENTITY_INSERT [dbo].[personas] ON 

INSERT [dbo].[personas] ([id_persona], [id_empresa], [id_area], [nombres], [apellidos], [tipo_documento], [numero_documento], [email], [telefono], [estado], [fecha_creacion]) VALUES (1, 1, 1, N'Usuario', N'Prueba', N'CC', N'985236', N'jhon16_39@hotmail.com', NULL, 1, CAST(N'2024-12-28T13:48:56.820' AS DateTime))
INSERT [dbo].[personas] ([id_persona], [id_empresa], [id_area], [nombres], [apellidos], [tipo_documento], [numero_documento], [email], [telefono], [estado], [fecha_creacion]) VALUES (4, 1, 2, N'Jhon Jairo', N'Perez', NULL, NULL, N'jhon@test.com', NULL, 1, CAST(N'2024-12-29T15:55:56.203' AS DateTime))
INSERT [dbo].[personas] ([id_persona], [id_empresa], [id_area], [nombres], [apellidos], [tipo_documento], [numero_documento], [email], [telefono], [estado], [fecha_creacion]) VALUES (5, 1, 1, N'Juan', N'Perez', NULL, NULL, N'juan@test.com', NULL, 1, CAST(N'2024-12-29T16:43:41.377' AS DateTime))
INSERT [dbo].[personas] ([id_persona], [id_empresa], [id_area], [nombres], [apellidos], [tipo_documento], [numero_documento], [email], [telefono], [estado], [fecha_creacion]) VALUES (6, 1, 1, N'Carlos', N'Perez', NULL, NULL, N'carlos@test.com', NULL, 1, CAST(N'2024-12-29T22:21:56.067' AS DateTime))
INSERT [dbo].[personas] ([id_persona], [id_empresa], [id_area], [nombres], [apellidos], [tipo_documento], [numero_documento], [email], [telefono], [estado], [fecha_creacion]) VALUES (7, NULL, 1, N'Pepito', N'Pérez', N'DNI', N'12345678', N'juan.perez@ejemplo.com', N'123456789', 1, CAST(N'2024-12-29T23:05:51.537' AS DateTime))
INSERT [dbo].[personas] ([id_persona], [id_empresa], [id_area], [nombres], [apellidos], [tipo_documento], [numero_documento], [email], [telefono], [estado], [fecha_creacion]) VALUES (11, 1, 1, N'Juliana', N'Roa', N'CC', N'123456789', N'juliana@yopmail.com', N'123456789', 1, CAST(N'2024-12-30T10:04:47.073' AS DateTime))
INSERT [dbo].[personas] ([id_persona], [id_empresa], [id_area], [nombres], [apellidos], [tipo_documento], [numero_documento], [email], [telefono], [estado], [fecha_creacion]) VALUES (12, 1, 1, N'Ana', N'Calderon', N'CC', N'1234567890', N'ana@yopmail.com', N'123456789', 1, CAST(N'2024-12-30T10:06:27.747' AS DateTime))
INSERT [dbo].[personas] ([id_persona], [id_empresa], [id_area], [nombres], [apellidos], [tipo_documento], [numero_documento], [email], [telefono], [estado], [fecha_creacion]) VALUES (13, 1, 1, N'Antonio', N'Calderamayaon', N'CC', N'13456789', N'antonio@yopmail.com', N'123456789', 1, CAST(N'2024-12-30T10:28:58.700' AS DateTime))
INSERT [dbo].[personas] ([id_persona], [id_empresa], [id_area], [nombres], [apellidos], [tipo_documento], [numero_documento], [email], [telefono], [estado], [fecha_creacion]) VALUES (14, 1, 1, N'tonito', N'Calderon amaya', N'CC', N'12456789', N'tonito@yopmail.com', N'12456789', 1, CAST(N'2024-12-30T10:38:29.733' AS DateTime))
INSERT [dbo].[personas] ([id_persona], [id_empresa], [id_area], [nombres], [apellidos], [tipo_documento], [numero_documento], [email], [telefono], [estado], [fecha_creacion]) VALUES (15, 1, 1, N'pepe', N'doe', N'CC', N'132456789', N'tonito1@yopmail.com', N'12456789', 1, CAST(N'2024-12-30T10:44:38.397' AS DateTime))
INSERT [dbo].[personas] ([id_persona], [id_empresa], [id_area], [nombres], [apellidos], [tipo_documento], [numero_documento], [email], [telefono], [estado], [fecha_creacion]) VALUES (16, 1, 1, N'juancito', N'doe', N'CC', N'112456789', N'tonito11@yopmail.com', N'12456789', 1, CAST(N'2024-12-30T11:24:31.547' AS DateTime))
INSERT [dbo].[personas] ([id_persona], [id_empresa], [id_area], [nombres], [apellidos], [tipo_documento], [numero_documento], [email], [telefono], [estado], [fecha_creacion]) VALUES (17, 1, 1, N'yuli', N'doe', N'CC', N'192456789', N'tonito111@yopmail.com', N'12456789', 1, CAST(N'2024-12-30T11:38:23.887' AS DateTime))
INSERT [dbo].[personas] ([id_persona], [id_empresa], [id_area], [nombres], [apellidos], [tipo_documento], [numero_documento], [email], [telefono], [estado], [fecha_creacion]) VALUES (18, 1, 1, N'Katalina', N'doe', N'CC', N'182456789', N'jhongopruebas@gmail.com', N'12456789', 1, CAST(N'2024-12-30T11:48:15.910' AS DateTime))
INSERT [dbo].[personas] ([id_persona], [id_empresa], [id_area], [nombres], [apellidos], [tipo_documento], [numero_documento], [email], [telefono], [estado], [fecha_creacion]) VALUES (1007, 1, 1, N'pipe', N'doe', N'CC', N'172456789', N'PIPE@YOPMAIL.COM', N'12456789', 1, CAST(N'2024-12-31T17:35:05.193' AS DateTime))
INSERT [dbo].[personas] ([id_persona], [id_empresa], [id_area], [nombres], [apellidos], [tipo_documento], [numero_documento], [email], [telefono], [estado], [fecha_creacion]) VALUES (1008, 1, 1, N'juan', N'doe', N'CC', N'16456789', N'juan@yopmail.com', N'12456789', 1, CAST(N'2025-01-01T14:24:52.870' AS DateTime))
INSERT [dbo].[personas] ([id_persona], [id_empresa], [id_area], [nombres], [apellidos], [tipo_documento], [numero_documento], [email], [telefono], [estado], [fecha_creacion]) VALUES (1009, 1, 1, N'juan jose', N'doe', N'CC', N'14456789', N'juan1@yopmail.com', N'12456789', 1, CAST(N'2025-01-01T14:35:00.850' AS DateTime))
INSERT [dbo].[personas] ([id_persona], [id_empresa], [id_area], [nombres], [apellidos], [tipo_documento], [numero_documento], [email], [telefono], [estado], [fecha_creacion]) VALUES (1010, 1, 4, N'ana', N'pallarez', N'CC', N'1090395220', N'anapallarez@yopmail.com', N'3202848563', 1, CAST(N'2025-01-07T22:29:55.450' AS DateTime))
INSERT [dbo].[personas] ([id_persona], [id_empresa], [id_area], [nombres], [apellidos], [tipo_documento], [numero_documento], [email], [telefono], [estado], [fecha_creacion]) VALUES (1011, 6, 1006, N'tatiana', N'perez', N'CC', N'1090909090', N'tatiana@yopmail.com', N'3202848563', 1, CAST(N'2025-01-09T20:29:26.830' AS DateTime))
INSERT [dbo].[personas] ([id_persona], [id_empresa], [id_area], [nombres], [apellidos], [tipo_documento], [numero_documento], [email], [telefono], [estado], [fecha_creacion]) VALUES (1012, 1, 4, N'tatiana', N'pallarez', N'CC', N'1090909000', N'tatiana1@yopmail.com', N'3202848563', 1, CAST(N'2025-01-09T20:30:49.850' AS DateTime))
INSERT [dbo].[personas] ([id_persona], [id_empresa], [id_area], [nombres], [apellidos], [tipo_documento], [numero_documento], [email], [telefono], [estado], [fecha_creacion]) VALUES (1013, 6, 4, N'jose', N'capote', N'CC', N'1090000000', N'jose12@yopmail.com', N'3202848563', 1, CAST(N'2025-01-09T20:39:52.247' AS DateTime))
INSERT [dbo].[personas] ([id_persona], [id_empresa], [id_area], [nombres], [apellidos], [tipo_documento], [numero_documento], [email], [telefono], [estado], [fecha_creacion]) VALUES (2011, 1, 4, N'Juan', N'Pérez', N'C.C.', N'123456789', N'juan.perez@yopmail.com', N'3001234567', 1, CAST(N'2025-01-14T00:00:00.000' AS DateTime))
INSERT [dbo].[personas] ([id_persona], [id_empresa], [id_area], [nombres], [apellidos], [tipo_documento], [numero_documento], [email], [telefono], [estado], [fecha_creacion]) VALUES (2012, 1, 2, N'María', N'Gómez', N'C.C.', N'987654321', N'maria.gomez@yopmail.com', N'3007654321', 1, CAST(N'2025-01-15T00:00:00.000' AS DateTime))
INSERT [dbo].[personas] ([id_persona], [id_empresa], [id_area], [nombres], [apellidos], [tipo_documento], [numero_documento], [email], [telefono], [estado], [fecha_creacion]) VALUES (2013, 1, 6, N'Carlos', N'López', N'C.C.', N'112233445', N'carlos.lopez@yopmail.com', N'3009988776', 1, CAST(N'2025-01-16T00:00:00.000' AS DateTime))
INSERT [dbo].[personas] ([id_persona], [id_empresa], [id_area], [nombres], [apellidos], [tipo_documento], [numero_documento], [email], [telefono], [estado], [fecha_creacion]) VALUES (2014, 1, 1006, N'Ana', N'Martínez', N'C.C.', N'556677889', N'ana.martinez@yopmail.com', N'3003344556', 1, CAST(N'2025-01-17T00:00:00.000' AS DateTime))
INSERT [dbo].[personas] ([id_persona], [id_empresa], [id_area], [nombres], [apellidos], [tipo_documento], [numero_documento], [email], [telefono], [estado], [fecha_creacion]) VALUES (2015, 6, 1006, N'Kakaroto', N'Sayayin', N'CC', N'1090879461', N'vegueta@yopmail.com', N'3202848563', 1, CAST(N'2025-01-18T11:53:58.630' AS DateTime))
INSERT [dbo].[personas] ([id_persona], [id_empresa], [id_area], [nombres], [apellidos], [tipo_documento], [numero_documento], [email], [telefono], [estado], [fecha_creacion]) VALUES (2016, 6, 1006, N'vegueta', N'sayayin', N'CC', N'87984654', N'vegueta1@yopmail.com', N'3202848563', 1, CAST(N'2025-01-18T12:03:12.560' AS DateTime))
INSERT [dbo].[personas] ([id_persona], [id_empresa], [id_area], [nombres], [apellidos], [tipo_documento], [numero_documento], [email], [telefono], [estado], [fecha_creacion]) VALUES (2017, 6, 1006, N'bulma', N'terricola', N'CC', N'12365478', N'bulma@yopmail.com', N'12365478', 1, CAST(N'2025-01-18T12:13:42.123' AS DateTime))
INSERT [dbo].[personas] ([id_persona], [id_empresa], [id_area], [nombres], [apellidos], [tipo_documento], [numero_documento], [email], [telefono], [estado], [fecha_creacion]) VALUES (2018, 6, 1006, N'tatiana', N'capote', N'CC', N'12345678901', N'vegueta2@yopmail.com', N'3202848563', 1, CAST(N'2025-01-18T17:14:39.520' AS DateTime))
INSERT [dbo].[personas] ([id_persona], [id_empresa], [id_area], [nombres], [apellidos], [tipo_documento], [numero_documento], [email], [telefono], [estado], [fecha_creacion]) VALUES (2019, 6, 1006, N'tatiana', N'caPORE', N'CC', N'123456788', N'jhon16_39@yopmail.com', N'3202848563', 1, CAST(N'2025-01-21T17:01:20.627' AS DateTime))
INSERT [dbo].[personas] ([id_persona], [id_empresa], [id_area], [nombres], [apellidos], [tipo_documento], [numero_documento], [email], [telefono], [estado], [fecha_creacion]) VALUES (2020, 6, 1006, N'tatiana', N'capote', N'CC', N'1234567889', N'tatiana2@yopmail.com', N'3202848563', 1, CAST(N'2025-01-21T17:02:26.533' AS DateTime))
INSERT [dbo].[personas] ([id_persona], [id_empresa], [id_area], [nombres], [apellidos], [tipo_documento], [numero_documento], [email], [telefono], [estado], [fecha_creacion]) VALUES (2021, 6, 1006, N'tatiana', N'caPOTE', N'CC', N'123456787', N'tatiana11@yopmail.com', N'3202848563', 1, CAST(N'2025-01-21T17:09:49.630' AS DateTime))
INSERT [dbo].[personas] ([id_persona], [id_empresa], [id_area], [nombres], [apellidos], [tipo_documento], [numero_documento], [email], [telefono], [estado], [fecha_creacion]) VALUES (2022, 6, 1006, N'tatiana', N'Capote', N'CC', N'123456786', N'tatiana12@yopmail.com', N'3202848563', 1, CAST(N'2025-01-21T17:10:58.460' AS DateTime))
INSERT [dbo].[personas] ([id_persona], [id_empresa], [id_area], [nombres], [apellidos], [tipo_documento], [numero_documento], [email], [telefono], [estado], [fecha_creacion]) VALUES (2023, 6, 1006, N'tatiana', N'capote', N'CC', N'123456785', N'tatiana13@yopmail.com', N'3202848563', 1, CAST(N'2025-01-21T17:15:20.393' AS DateTime))
SET IDENTITY_INSERT [dbo].[personas] OFF
GO
SET IDENTITY_INSERT [dbo].[pqrs] ON 

INSERT [dbo].[pqrs] ([id_pqrs], [id_tema], [id_usuario_asignado], [nombre_solicitante], [email_solicitante], [telefono_solicitante], [tipo_documento_solicitante], [numero_documento_solicitante], [titulo], [descripcion], [prioridad], [estado_pqrs], [fecha_creacion], [fecha_ultima_actualizacion], [numero_radicado], [usuario_creador], [token_consulta]) VALUES (1, 1003, 5, N'John Doe', N'john@example.com', N'1234567890', N'CC', N'123456789', N'Consulta sobre servicio', N'Descripción detallada de la consulta', N'MEDIA', N'PENDIENTE', CAST(N'2024-12-23T10:00:00.0000000' AS DateTime2), CAST(N'2024-12-23T10:00:00.0000000' AS DateTime2), N'PQRS-2025-01-0006', NULL, N'19F7692D-51E6-4E62-B268-21DFE0710235')
INSERT [dbo].[pqrs] ([id_pqrs], [id_tema], [id_usuario_asignado], [nombre_solicitante], [email_solicitante], [telefono_solicitante], [tipo_documento_solicitante], [numero_documento_solicitante], [titulo], [descripcion], [prioridad], [estado_pqrs], [fecha_creacion], [fecha_ultima_actualizacion], [numero_radicado], [usuario_creador], [token_consulta]) VALUES (2, 3, 9, N'Goku perez', N'john@example.com', N'3001234567', N'CC', N'123456789', N'Solicitud de información', N'Necesito información sobre el proceso X', N'MEDIA', N'EN_PROCESO', CAST(N'2025-01-03T17:49:54.8668288' AS DateTime2), CAST(N'2025-01-15T16:16:42.6369017' AS DateTime2), N'PQRS-2025-01-0001', N'admin', N'AD45DA17-7027-45C9-8FDA-C54D8F0062C8')
INSERT [dbo].[pqrs] ([id_pqrs], [id_tema], [id_usuario_asignado], [nombre_solicitante], [email_solicitante], [telefono_solicitante], [tipo_documento_solicitante], [numero_documento_solicitante], [titulo], [descripcion], [prioridad], [estado_pqrs], [fecha_creacion], [fecha_ultima_actualizacion], [numero_radicado], [usuario_creador], [token_consulta]) VALUES (5, 3, NULL, N'John perez calderon ', N'jhonjapeca@gmail.com', N'3001234567', N'CC', N'123456789', N'Solicitud nueva de información', N'Necesito información sobre el proceso X', N'MEDIA', N'PENDIENTE', CAST(N'2025-01-03T18:34:41.5974655' AS DateTime2), CAST(N'2025-01-03T18:34:41.5974655' AS DateTime2), N'PQRS-2025-01-0002', N'admin', N'896611d3-1807-433a-9697-4cf2f27c9f4d')
INSERT [dbo].[pqrs] ([id_pqrs], [id_tema], [id_usuario_asignado], [nombre_solicitante], [email_solicitante], [telefono_solicitante], [tipo_documento_solicitante], [numero_documento_solicitante], [titulo], [descripcion], [prioridad], [estado_pqrs], [fecha_creacion], [fecha_ultima_actualizacion], [numero_radicado], [usuario_creador], [token_consulta]) VALUES (6, 3, 16, N'John perez calderon ', N'jhonjapeca@gmail.com', N'3001234567', N'CC', N'123456789', N'Solicitud nueva de información', N'Necesito información sobre el proceso X', N'MEDIA', N'RESUELTO', CAST(N'2025-01-03T18:39:58.4548402' AS DateTime2), CAST(N'2024-01-15T10:00:00.0000000' AS DateTime2), N'PQRS-2025-01-0003', N'admin', N'381a30de-763e-42a4-a8dd-ae71b25021a0')
INSERT [dbo].[pqrs] ([id_pqrs], [id_tema], [id_usuario_asignado], [nombre_solicitante], [email_solicitante], [telefono_solicitante], [tipo_documento_solicitante], [numero_documento_solicitante], [titulo], [descripcion], [prioridad], [estado_pqrs], [fecha_creacion], [fecha_ultima_actualizacion], [numero_radicado], [usuario_creador], [token_consulta]) VALUES (7, 1003, NULL, N'Ana Calderon', N'ana@yopmail.com', N'123456789', N'CC', N'1234567890', N'Consulta interna', N'Descripción de la consulta', N'ALTA', N'PENDIENTE', CAST(N'2025-01-05T15:05:54.1103043' AS DateTime2), CAST(N'2025-01-15T15:37:36.6760211' AS DateTime2), N'PQRS-2025-01-0004', N'anahc31', N'6bc8a297-d3bc-47c3-8709-eeac669bcd79')
INSERT [dbo].[pqrs] ([id_pqrs], [id_tema], [id_usuario_asignado], [nombre_solicitante], [email_solicitante], [telefono_solicitante], [tipo_documento_solicitante], [numero_documento_solicitante], [titulo], [descripcion], [prioridad], [estado_pqrs], [fecha_creacion], [fecha_ultima_actualizacion], [numero_radicado], [usuario_creador], [token_consulta]) VALUES (8, 3, 5, N'yemile perez', N'ana@yopmail.com', N'123456789', N'CC', N'1234567890', N'Consulta interna 2', N'Descripción de la consulta', N'ALTA', N'PENDIENTE', CAST(N'2025-01-05T16:34:33.4473647' AS DateTime2), CAST(N'2025-01-15T15:21:29.6187644' AS DateTime2), N'PQRS-2025-01-0005', N'anahc31', N'37ad9776-68f5-45dd-8751-953ae9af5a00')
INSERT [dbo].[pqrs] ([id_pqrs], [id_tema], [id_usuario_asignado], [nombre_solicitante], [email_solicitante], [telefono_solicitante], [tipo_documento_solicitante], [numero_documento_solicitante], [titulo], [descripcion], [prioridad], [estado_pqrs], [fecha_creacion], [fecha_ultima_actualizacion], [numero_radicado], [usuario_creador], [token_consulta]) VALUES (1005, 3, NULL, N'Usuario Prueba', N'jhon16_39@hotmail.com', NULL, N'CC', N'985236', N'Creando Pqrsd in house', N'pruebaaaaaa', N'MEDIA', N'PENDIENTE', CAST(N'2025-01-15T16:55:37.5871542' AS DateTime2), CAST(N'2025-01-15T16:55:37.5871542' AS DateTime2), N'PQRS-2025-01-0007', N'admin', N'66eb2005-17ee-4109-afbc-9f3e4fc49e3c')
INSERT [dbo].[pqrs] ([id_pqrs], [id_tema], [id_usuario_asignado], [nombre_solicitante], [email_solicitante], [telefono_solicitante], [tipo_documento_solicitante], [numero_documento_solicitante], [titulo], [descripcion], [prioridad], [estado_pqrs], [fecha_creacion], [fecha_ultima_actualizacion], [numero_radicado], [usuario_creador], [token_consulta]) VALUES (1007, 3, NULL, N'Usuario Prueba', N'jhon16_39@hotmail.com', NULL, N'CC', N'985236', N'Creando Pqrsd en prioridad baja', N'esta es una descripcion de prueba del pqrsd', N'BAJA', N'PENDIENTE', CAST(N'2025-01-15T16:58:52.1865257' AS DateTime2), CAST(N'2025-01-15T16:58:52.1865257' AS DateTime2), N'PQRS-2025-01-0008', N'admin', N'b29120d5-bab1-41a8-b204-77aa78061a69')
INSERT [dbo].[pqrs] ([id_pqrs], [id_tema], [id_usuario_asignado], [nombre_solicitante], [email_solicitante], [telefono_solicitante], [tipo_documento_solicitante], [numero_documento_solicitante], [titulo], [descripcion], [prioridad], [estado_pqrs], [fecha_creacion], [fecha_ultima_actualizacion], [numero_radicado], [usuario_creador], [token_consulta]) VALUES (1008, 3, NULL, N'Usuario Prueba', N'jhon16_39@hotmail.com', NULL, N'CC', N'985236', N'Creando Pqrsd en prioridad baja 2', N'esta es una descripcion de prueba del pqrsd', N'BAJA', N'PENDIENTE', CAST(N'2025-01-15T17:00:11.7157890' AS DateTime2), CAST(N'2025-01-15T17:00:11.7157890' AS DateTime2), N'PQRS-2025-01-0009', N'admin', N'b3555fd1-9eee-401e-a00f-7278c604f86e')
INSERT [dbo].[pqrs] ([id_pqrs], [id_tema], [id_usuario_asignado], [nombre_solicitante], [email_solicitante], [telefono_solicitante], [tipo_documento_solicitante], [numero_documento_solicitante], [titulo], [descripcion], [prioridad], [estado_pqrs], [fecha_creacion], [fecha_ultima_actualizacion], [numero_radicado], [usuario_creador], [token_consulta]) VALUES (1009, 3, NULL, N'Usuario Prueba', N'jhon16_39@hotmail.com', NULL, N'CC', N'985236', N'Creando Pqrsd en prioridad baja 3', N' Mensajes de estado prueba

', N'BAJA', N'PENDIENTE', CAST(N'2025-01-15T17:05:14.8932745' AS DateTime2), CAST(N'2025-01-15T17:05:14.8932745' AS DateTime2), N'PQRS-2025-01-0010', N'admin', N'5e414b79-aeef-476b-b83b-84465d525d16')
INSERT [dbo].[pqrs] ([id_pqrs], [id_tema], [id_usuario_asignado], [nombre_solicitante], [email_solicitante], [telefono_solicitante], [tipo_documento_solicitante], [numero_documento_solicitante], [titulo], [descripcion], [prioridad], [estado_pqrs], [fecha_creacion], [fecha_ultima_actualizacion], [numero_radicado], [usuario_creador], [token_consulta]) VALUES (1013, 3, NULL, N'Usuario Prueba', N'jhon16_39@hotmail.com', NULL, N'CC', N'985236', N'pqrs con adjunto', N'rtytuytuj', N'MEDIA', N'PENDIENTE', CAST(N'2025-01-15T20:41:15.6788259' AS DateTime2), CAST(N'2025-01-15T20:41:15.6788259' AS DateTime2), N'PQRS-2025-01-0011', N'admin', N'bb86566c-b76a-4fa4-a9d7-5a68fe8052ce')
INSERT [dbo].[pqrs] ([id_pqrs], [id_tema], [id_usuario_asignado], [nombre_solicitante], [email_solicitante], [telefono_solicitante], [tipo_documento_solicitante], [numero_documento_solicitante], [titulo], [descripcion], [prioridad], [estado_pqrs], [fecha_creacion], [fecha_ultima_actualizacion], [numero_radicado], [usuario_creador], [token_consulta]) VALUES (1014, 3, NULL, N'Usuario Prueba', N'jhon16_39@hotmail.com', NULL, N'CC', N'985236', N'pqrs con sin adjunto', N'probando sin adjunto', N'MEDIA', N'PENDIENTE', CAST(N'2025-01-15T20:42:50.2844194' AS DateTime2), CAST(N'2025-01-15T20:42:50.2844194' AS DateTime2), N'PQRS-2025-01-0012', N'admin', N'dcc49160-f6d9-4c48-a991-70f6e20e3f06')
INSERT [dbo].[pqrs] ([id_pqrs], [id_tema], [id_usuario_asignado], [nombre_solicitante], [email_solicitante], [telefono_solicitante], [tipo_documento_solicitante], [numero_documento_solicitante], [titulo], [descripcion], [prioridad], [estado_pqrs], [fecha_creacion], [fecha_ultima_actualizacion], [numero_radicado], [usuario_creador], [token_consulta]) VALUES (1015, 3, NULL, N'Usuario Prueba', N'jhon16_39@hotmail.com', NULL, N'CC', N'985236', N'error d elogin', N'fghrtgyhjj', N'MEDIA', N'PENDIENTE', CAST(N'2025-01-15T20:43:38.8743734' AS DateTime2), CAST(N'2025-01-15T20:43:38.8743734' AS DateTime2), N'PQRS-2025-01-0013', N'admin', N'4d1c2ce7-5c81-425f-beb7-ed42183809cd')
INSERT [dbo].[pqrs] ([id_pqrs], [id_tema], [id_usuario_asignado], [nombre_solicitante], [email_solicitante], [telefono_solicitante], [tipo_documento_solicitante], [numero_documento_solicitante], [titulo], [descripcion], [prioridad], [estado_pqrs], [fecha_creacion], [fecha_ultima_actualizacion], [numero_radicado], [usuario_creador], [token_consulta]) VALUES (1016, 3, NULL, N'Usuario Prueba', N'jhon16_39@hotmail.com', NULL, N'CC', N'985236', N'probando pqrs que no tenga adjunto', N'probando pqrs que no tenga adjunto', N'MEDIA', N'PENDIENTE', CAST(N'2025-01-15T20:52:38.9233428' AS DateTime2), CAST(N'2025-01-15T20:52:38.9233428' AS DateTime2), N'PQRS-2025-01-0014', N'admin', N'265c2fe5-f763-40d3-88c5-24f53966f206')
INSERT [dbo].[pqrs] ([id_pqrs], [id_tema], [id_usuario_asignado], [nombre_solicitante], [email_solicitante], [telefono_solicitante], [tipo_documento_solicitante], [numero_documento_solicitante], [titulo], [descripcion], [prioridad], [estado_pqrs], [fecha_creacion], [fecha_ultima_actualizacion], [numero_radicado], [usuario_creador], [token_consulta]) VALUES (1017, 3, NULL, N'Usuario Prueba', N'jhon16_39@hotmail.com', NULL, N'CC', N'985236', N'probando nuevo estilo de adjuntos', N'probando nuevo estilo de adjuntos', N'BAJA', N'PENDIENTE', CAST(N'2025-01-17T20:47:38.5709057' AS DateTime2), CAST(N'2025-01-17T21:50:39.3869431' AS DateTime2), N'PQRS-2025-01-0015', N'admin', N'3984593a-6933-4007-93ec-979353dfe787')
INSERT [dbo].[pqrs] ([id_pqrs], [id_tema], [id_usuario_asignado], [nombre_solicitante], [email_solicitante], [telefono_solicitante], [tipo_documento_solicitante], [numero_documento_solicitante], [titulo], [descripcion], [prioridad], [estado_pqrs], [fecha_creacion], [fecha_ultima_actualizacion], [numero_radicado], [usuario_creador], [token_consulta]) VALUES (1018, 3, NULL, N'Usuario Prueba', N'jhon16_39@hotmail.com', NULL, N'CC', N'985236', N'probanodo template de correos', N'probanodo template de correos', N'ALTA', N'PENDIENTE', CAST(N'2025-01-17T22:00:53.3127709' AS DateTime2), CAST(N'2025-01-17T22:00:53.3127709' AS DateTime2), N'PQRS-2025-01-0016', N'admin', N'b1a1f616-4097-4c99-afff-32270b4e913d')
INSERT [dbo].[pqrs] ([id_pqrs], [id_tema], [id_usuario_asignado], [nombre_solicitante], [email_solicitante], [telefono_solicitante], [tipo_documento_solicitante], [numero_documento_solicitante], [titulo], [descripcion], [prioridad], [estado_pqrs], [fecha_creacion], [fecha_ultima_actualizacion], [numero_radicado], [usuario_creador], [token_consulta]) VALUES (1019, 3, NULL, N'Usuario Prueba', N'jhon16_39@hotmail.com', NULL, N'CC', N'985236', N'probanodo nuevamnete template de correos', N'probanodo template de correos', N'MEDIA', N'PENDIENTE', CAST(N'2025-01-17T22:03:30.4992266' AS DateTime2), CAST(N'2025-01-17T22:03:30.4992266' AS DateTime2), N'PQRS-2025-01-0017', N'admin', N'f8787f73-32f8-4eed-93a3-5c37539f2750')
INSERT [dbo].[pqrs] ([id_pqrs], [id_tema], [id_usuario_asignado], [nombre_solicitante], [email_solicitante], [telefono_solicitante], [tipo_documento_solicitante], [numero_documento_solicitante], [titulo], [descripcion], [prioridad], [estado_pqrs], [fecha_creacion], [fecha_ultima_actualizacion], [numero_radicado], [usuario_creador], [token_consulta]) VALUES (1020, 3, NULL, N'Usuario Prueba', N'jhon16_39@hotmail.com', NULL, N'CC', N'985236', N'probando template confirmacion', N'probando template confirmacion', N'MEDIA', N'PENDIENTE', CAST(N'2025-01-17T22:11:45.8688781' AS DateTime2), CAST(N'2025-01-17T22:15:25.2171657' AS DateTime2), N'PQRS-2025-01-0018', N'admin', N'41f60302-7b34-42d9-96d4-70f585f05bec')
INSERT [dbo].[pqrs] ([id_pqrs], [id_tema], [id_usuario_asignado], [nombre_solicitante], [email_solicitante], [telefono_solicitante], [tipo_documento_solicitante], [numero_documento_solicitante], [titulo], [descripcion], [prioridad], [estado_pqrs], [fecha_creacion], [fecha_ultima_actualizacion], [numero_radicado], [usuario_creador], [token_consulta]) VALUES (1021, 3, NULL, N'Usuario Prueba', N'jhon16_39@hotmail.com', NULL, N'CC', N'985236', N'probanod que no deje registrar', N'probanod que no deje registrar pqrs', N'MEDIA', N'PENDIENTE', CAST(N'2025-01-21T16:23:01.8802825' AS DateTime2), CAST(N'2025-01-21T16:23:01.8802825' AS DateTime2), N'PQRS-2025-01-0019', N'admin', N'4c27914e-16da-4d67-9b18-6cc2dd5cb146')
INSERT [dbo].[pqrs] ([id_pqrs], [id_tema], [id_usuario_asignado], [nombre_solicitante], [email_solicitante], [telefono_solicitante], [tipo_documento_solicitante], [numero_documento_solicitante], [titulo], [descripcion], [prioridad], [estado_pqrs], [fecha_creacion], [fecha_ultima_actualizacion], [numero_radicado], [usuario_creador], [token_consulta]) VALUES (1022, 3, NULL, N'Usuario Prueba', N'jhon16_39@hotmail.com', NULL, N'CC', N'985236', N'pqrs para probar nuevamente la validacion de no duplicar pqrs', N'pqrs para probar nuevamente la validacion de no duplicar pqrs', N'MEDIA', N'PENDIENTE', CAST(N'2025-01-21T16:30:50.2170991' AS DateTime2), CAST(N'2025-01-21T16:30:50.2170991' AS DateTime2), N'PQRS-2025-01-0020', N'admin', N'9309083d-f959-4e0c-9614-f2e7f6eeef61')
INSERT [dbo].[pqrs] ([id_pqrs], [id_tema], [id_usuario_asignado], [nombre_solicitante], [email_solicitante], [telefono_solicitante], [tipo_documento_solicitante], [numero_documento_solicitante], [titulo], [descripcion], [prioridad], [estado_pqrs], [fecha_creacion], [fecha_ultima_actualizacion], [numero_radicado], [usuario_creador], [token_consulta]) VALUES (1023, 3, NULL, N'Usuario Prueba', N'jhon16_39@hotmail.com', NULL, N'CC', N'985236', N'pqrs para probar', N'pqrs para probar', N'MEDIA', N'PENDIENTE', CAST(N'2025-01-21T16:34:40.7920767' AS DateTime2), CAST(N'2025-01-21T16:34:40.7920767' AS DateTime2), N'PQRS-2025-01-0021', N'admin', N'b4a3b5c2-5f69-4b8b-b15d-4eb704c5bc6a')
INSERT [dbo].[pqrs] ([id_pqrs], [id_tema], [id_usuario_asignado], [nombre_solicitante], [email_solicitante], [telefono_solicitante], [tipo_documento_solicitante], [numero_documento_solicitante], [titulo], [descripcion], [prioridad], [estado_pqrs], [fecha_creacion], [fecha_ultima_actualizacion], [numero_radicado], [usuario_creador], [token_consulta]) VALUES (1024, 3, NULL, N'Usuario Prueba', N'jhon16_39@hotmail.com', NULL, N'CC', N'985236', N'prueba un millon', N'prueba un millon de validacion pqrs', N'MEDIA', N'PENDIENTE', CAST(N'2025-01-21T16:38:37.7607320' AS DateTime2), CAST(N'2025-01-21T16:38:37.7607320' AS DateTime2), N'PQRS-2025-01-0022', N'admin', N'69847bbb-c108-4c00-aa9f-9169b51fa264')
INSERT [dbo].[pqrs] ([id_pqrs], [id_tema], [id_usuario_asignado], [nombre_solicitante], [email_solicitante], [telefono_solicitante], [tipo_documento_solicitante], [numero_documento_solicitante], [titulo], [descripcion], [prioridad], [estado_pqrs], [fecha_creacion], [fecha_ultima_actualizacion], [numero_radicado], [usuario_creador], [token_consulta]) VALUES (1025, 3, NULL, N'Usuario Prueba', N'jhon16_39@hotmail.com', NULL, N'CC', N'985236', N'pqrs nueva del mismo tema', N'pqrs nueva del mismo tema', N'MEDIA', N'PENDIENTE', CAST(N'2025-01-21T16:40:55.2699715' AS DateTime2), CAST(N'2025-01-21T16:40:55.2699715' AS DateTime2), N'PQRS-2025-01-0023', N'admin', N'23fdfbba-9032-4b12-8696-46badeafcec2')
INSERT [dbo].[pqrs] ([id_pqrs], [id_tema], [id_usuario_asignado], [nombre_solicitante], [email_solicitante], [telefono_solicitante], [tipo_documento_solicitante], [numero_documento_solicitante], [titulo], [descripcion], [prioridad], [estado_pqrs], [fecha_creacion], [fecha_ultima_actualizacion], [numero_radicado], [usuario_creador], [token_consulta]) VALUES (1026, 3, NULL, N'Usuario Prueba', N'jhon16_39@hotmail.com', NULL, N'CC', N'985236', N'otro intento', N'otro intento', N'MEDIA', N'PENDIENTE', CAST(N'2025-01-21T16:42:23.2274425' AS DateTime2), CAST(N'2025-01-21T16:42:23.2274425' AS DateTime2), N'PQRS-2025-01-0024', N'admin', N'3576498b-020d-4080-9f50-3cc5e4ed7647')
INSERT [dbo].[pqrs] ([id_pqrs], [id_tema], [id_usuario_asignado], [nombre_solicitante], [email_solicitante], [telefono_solicitante], [tipo_documento_solicitante], [numero_documento_solicitante], [titulo], [descripcion], [prioridad], [estado_pqrs], [fecha_creacion], [fecha_ultima_actualizacion], [numero_radicado], [usuario_creador], [token_consulta]) VALUES (1027, 1003, NULL, N'Usuario Prueba', N'jhon16_39@hotmail.com', NULL, N'CC', N'985236', N'ojala funcione', N'async onSubmit() {
', N'BAJA', N'RESUELTO', CAST(N'2025-01-21T19:54:40.6430312' AS DateTime2), CAST(N'2025-01-21T19:54:40.6430312' AS DateTime2), N'PQRS-2025-01-0025', N'admin', N'20badb25-2a3b-4caf-992f-ff9cdfc140b8')
INSERT [dbo].[pqrs] ([id_pqrs], [id_tema], [id_usuario_asignado], [nombre_solicitante], [email_solicitante], [telefono_solicitante], [tipo_documento_solicitante], [numero_documento_solicitante], [titulo], [descripcion], [prioridad], [estado_pqrs], [fecha_creacion], [fecha_ultima_actualizacion], [numero_radicado], [usuario_creador], [token_consulta]) VALUES (1028, 1003, NULL, N'Usuario Prueba', N'jhon16_39@hotmail.com', NULL, N'CC', N'985236', N'pqrs con adjunto', N'wertrtyy', N'MEDIA', N'RESUELTO', CAST(N'2025-01-21T20:01:40.5607532' AS DateTime2), CAST(N'2025-01-21T20:01:40.5607532' AS DateTime2), N'PQRS-2025-01-0026', N'admin', N'd2391e91-93bb-49bb-b810-98579d72f68c')
INSERT [dbo].[pqrs] ([id_pqrs], [id_tema], [id_usuario_asignado], [nombre_solicitante], [email_solicitante], [telefono_solicitante], [tipo_documento_solicitante], [numero_documento_solicitante], [titulo], [descripcion], [prioridad], [estado_pqrs], [fecha_creacion], [fecha_ultima_actualizacion], [numero_radicado], [usuario_creador], [token_consulta]) VALUES (1029, 1003, NULL, N'Usuario Prueba', N'jhon16_39@hotmail.com', NULL, N'CC', N'985236', N'ojala funcione', N'frgdfgfdhgfhg', N'MEDIA', N'CERRADO', CAST(N'2025-01-21T20:40:35.9048250' AS DateTime2), CAST(N'2025-01-21T20:40:35.9048250' AS DateTime2), N'PQRS-2025-01-0027', N'admin', N'4774b90f-5fb0-4823-be8c-100d09cbf2cd')
INSERT [dbo].[pqrs] ([id_pqrs], [id_tema], [id_usuario_asignado], [nombre_solicitante], [email_solicitante], [telefono_solicitante], [tipo_documento_solicitante], [numero_documento_solicitante], [titulo], [descripcion], [prioridad], [estado_pqrs], [fecha_creacion], [fecha_ultima_actualizacion], [numero_radicado], [usuario_creador], [token_consulta]) VALUES (1030, 1003, 1, N'Usuario Prueba', N'jhon16_39@hotmail.com', NULL, N'CC', N'985236', N'probando nuevamente', N'dfergrtghthg', N'MEDIA', N'CERRADO', CAST(N'2025-01-21T20:43:42.2188726' AS DateTime2), CAST(N'2025-01-22T09:16:05.9351367' AS DateTime2), N'PQRS-2025-01-0028', N'admin', N'0b42e79d-df54-4ea5-a156-f706665be250')
INSERT [dbo].[pqrs] ([id_pqrs], [id_tema], [id_usuario_asignado], [nombre_solicitante], [email_solicitante], [telefono_solicitante], [tipo_documento_solicitante], [numero_documento_solicitante], [titulo], [descripcion], [prioridad], [estado_pqrs], [fecha_creacion], [fecha_ultima_actualizacion], [numero_radicado], [usuario_creador], [token_consulta]) VALUES (1031, 1003, NULL, N'Usuario Prueba', N'jhon16_39@hotmail.com', NULL, N'CC', N'985236', N'pqrs con adjunto 2023', N'nuevo pqrs ', N'MEDIA', N'RESUELTO', CAST(N'2025-01-23T09:28:39.9056285' AS DateTime2), CAST(N'2025-01-24T11:02:33.4021611' AS DateTime2), N'PQRS-2025-01-0029', N'admin', N'41ea36fb-9812-4812-ba45-98139e77a6c7')
SET IDENTITY_INSERT [dbo].[pqrs] OFF
GO
SET IDENTITY_INSERT [dbo].[roles] ON 

INSERT [dbo].[roles] ([id_rol], [nombre], [descripcion], [estado], [fecha_creacion]) VALUES (1, N'ADMIN', N'Administrador del Sistema', 1, CAST(N'2024-12-28T13:48:53.813' AS DateTime))
INSERT [dbo].[roles] ([id_rol], [nombre], [descripcion], [estado], [fecha_creacion]) VALUES (2, N'USUARIO', N'Usuario del Sistema', 1, CAST(N'2024-12-28T20:17:00.307' AS DateTime))
INSERT [dbo].[roles] ([id_rol], [nombre], [descripcion], [estado], [fecha_creacion]) VALUES (3, N'OPERADOR', N'Rol para operadores del sistema', 1, CAST(N'2024-12-30T21:56:34.603' AS DateTime))
INSERT [dbo].[roles] ([id_rol], [nombre], [descripcion], [estado], [fecha_creacion]) VALUES (1003, N'FUNCIONARIO', N'Rol para Funcionarios del Ministerio del Trabajo dentro del sistema', 1, CAST(N'2025-01-02T15:43:40.637' AS DateTime))
SET IDENTITY_INSERT [dbo].[roles] OFF
GO
SET IDENTITY_INSERT [dbo].[rutas] ON 

INSERT [dbo].[rutas] ([id_ruta], [id_modulo], [ruta], [descripcion], [estado], [fecha_creacion], [es_publica]) VALUES (1, 1, N'/api/usuarios', N'Gestión de usuarios', 1, CAST(N'2024-12-28T20:15:02.590' AS DateTime), 0)
INSERT [dbo].[rutas] ([id_ruta], [id_modulo], [ruta], [descripcion], [estado], [fecha_creacion], [es_publica]) VALUES (3, 3, N'/api/pqrss', N'Gestión de PQRS', 1, CAST(N'2024-12-28T20:15:02.590' AS DateTime), 1)
INSERT [dbo].[rutas] ([id_ruta], [id_modulo], [ruta], [descripcion], [estado], [fecha_creacion], [es_publica]) VALUES (4, 1, N'/api/usuarios/activar/**', N'Ruta para activar los usuarios', 1, CAST(N'2024-12-30T14:57:58.100' AS DateTime), 1)
INSERT [dbo].[rutas] ([id_ruta], [id_modulo], [ruta], [descripcion], [estado], [fecha_creacion], [es_publica]) VALUES (5, 1, N'/api/usuarios/**', N'Ruta para consultar un usuario específico', 1, CAST(N'2024-12-30T15:04:51.820' AS DateTime), 0)
INSERT [dbo].[rutas] ([id_ruta], [id_modulo], [ruta], [descripcion], [estado], [fecha_creacion], [es_publica]) VALUES (6, 1, N'/api/usuarios/reenviar-activacion/**', N'Ruta para reenviar correo de activacion', 1, CAST(N'2024-12-30T18:25:33.733' AS DateTime), 1)
INSERT [dbo].[rutas] ([id_ruta], [id_modulo], [ruta], [descripcion], [estado], [fecha_creacion], [es_publica]) VALUES (7, 1, N'/api/modulos', N'Gestión de módulos', 1, CAST(N'2024-12-30T19:40:40.093' AS DateTime), 1)
INSERT [dbo].[rutas] ([id_ruta], [id_modulo], [ruta], [descripcion], [estado], [fecha_creacion], [es_publica]) VALUES (8, 1, N'/api/modulos/**', N'Operaciones específicas de módulos', 1, CAST(N'2024-12-30T19:40:40.093' AS DateTime), 1)
INSERT [dbo].[rutas] ([id_ruta], [id_modulo], [ruta], [descripcion], [estado], [fecha_creacion], [es_publica]) VALUES (11, 1, N'/api/permisorols', N'Gestión de permisos por rol', 1, CAST(N'2024-12-30T19:40:40.093' AS DateTime), 1)
INSERT [dbo].[rutas] ([id_ruta], [id_modulo], [ruta], [descripcion], [estado], [fecha_creacion], [es_publica]) VALUES (12, 1, N'/api/permisorols', N'Operaciones específicas de permisos', 1, CAST(N'2024-12-30T19:40:40.093' AS DateTime), 1)
INSERT [dbo].[rutas] ([id_ruta], [id_modulo], [ruta], [descripcion], [estado], [fecha_creacion], [es_publica]) VALUES (13, 1, N'/api/rols', N'Gestión de roles', 1, CAST(N'2024-12-30T21:15:12.033' AS DateTime), 1)
INSERT [dbo].[rutas] ([id_ruta], [id_modulo], [ruta], [descripcion], [estado], [fecha_creacion], [es_publica]) VALUES (14, 1, N'/api/rols/**', N'Operaciones específicas de roles', 1, CAST(N'2024-12-30T21:15:12.033' AS DateTime), 1)
INSERT [dbo].[rutas] ([id_ruta], [id_modulo], [ruta], [descripcion], [estado], [fecha_creacion], [es_publica]) VALUES (1004, 1004, N'/api/empresas', N'Gestión de empresas', 1, CAST(N'2024-12-31T10:03:06.263' AS DateTime), 1)
INSERT [dbo].[rutas] ([id_ruta], [id_modulo], [ruta], [descripcion], [estado], [fecha_creacion], [es_publica]) VALUES (1005, 1004, N'/api/empresas/**', N'Operaciones específicas de empresas', 1, CAST(N'2024-12-31T10:03:06.263' AS DateTime), 1)
INSERT [dbo].[rutas] ([id_ruta], [id_modulo], [ruta], [descripcion], [estado], [fecha_creacion], [es_publica]) VALUES (1006, 1005, N'/api/territorials', N'Gestión de territoriales', 1, CAST(N'2024-12-31T10:03:06.263' AS DateTime), 1)
INSERT [dbo].[rutas] ([id_ruta], [id_modulo], [ruta], [descripcion], [estado], [fecha_creacion], [es_publica]) VALUES (1007, 1005, N'/api/territorials', N'Operaciones específicas de territoriales', 1, CAST(N'2024-12-31T10:03:06.263' AS DateTime), 1)
INSERT [dbo].[rutas] ([id_ruta], [id_modulo], [ruta], [descripcion], [estado], [fecha_creacion], [es_publica]) VALUES (1008, 1006, N'/api/direccions', N'Gestión de direcciones', 1, CAST(N'2024-12-31T10:03:06.263' AS DateTime), 1)
INSERT [dbo].[rutas] ([id_ruta], [id_modulo], [ruta], [descripcion], [estado], [fecha_creacion], [es_publica]) VALUES (1009, 1006, N'/api/direccions', N'Operaciones específicas de direcciones', 1, CAST(N'2024-12-31T10:03:06.263' AS DateTime), 1)
INSERT [dbo].[rutas] ([id_ruta], [id_modulo], [ruta], [descripcion], [estado], [fecha_creacion], [es_publica]) VALUES (1010, 1007, N'/api/areas', N'Gestión de áreas', 1, CAST(N'2024-12-31T10:03:06.263' AS DateTime), 1)
INSERT [dbo].[rutas] ([id_ruta], [id_modulo], [ruta], [descripcion], [estado], [fecha_creacion], [es_publica]) VALUES (1011, 1007, N'/api/areas/**', N'Operaciones específicas de áreas', 1, CAST(N'2024-12-31T10:03:06.263' AS DateTime), 1)
INSERT [dbo].[rutas] ([id_ruta], [id_modulo], [ruta], [descripcion], [estado], [fecha_creacion], [es_publica]) VALUES (1012, 1, N'/api/usuarios/{id}/info-completa', N'Endpoint para consultar información completa del usuario incluyendo datos de persona, área, dirección, territorial y empresa', 1, CAST(N'2025-01-01T15:10:55.740' AS DateTime), 1)
INSERT [dbo].[rutas] ([id_ruta], [id_modulo], [ruta], [descripcion], [estado], [fecha_creacion], [es_publica]) VALUES (1013, 1008, N'/api/rutas', N'Endpoint para consultar rutas', 1, CAST(N'2025-01-01T16:06:34.790' AS DateTime), 1)
INSERT [dbo].[rutas] ([id_ruta], [id_modulo], [ruta], [descripcion], [estado], [fecha_creacion], [es_publica]) VALUES (1014, 1, N'/api/public/example3', N'Endpoint privado de ejemplo', 1, CAST(N'2025-01-01T16:24:26.853' AS DateTime), 1)
INSERT [dbo].[rutas] ([id_ruta], [id_modulo], [ruta], [descripcion], [estado], [fecha_creacion], [es_publica]) VALUES (1015, 1, N'/api/public/example4', N'Endpoint privado de ejemplo', 1, CAST(N'2025-01-01T16:24:44.407' AS DateTime), 1)
INSERT [dbo].[rutas] ([id_ruta], [id_modulo], [ruta], [descripcion], [estado], [fecha_creacion], [es_publica]) VALUES (1016, 1, N'/api/private/example', N'Endpoint privado de ejemplo', 1, CAST(N'2025-01-01T16:29:06.703' AS DateTime), 1)
INSERT [dbo].[rutas] ([id_ruta], [id_modulo], [ruta], [descripcion], [estado], [fecha_creacion], [es_publica]) VALUES (1017, 1, N'/api/public/example2', N'Endpoint privado de ejemplo', 1, CAST(N'2025-01-01T16:44:21.180' AS DateTime), 1)
INSERT [dbo].[rutas] ([id_ruta], [id_modulo], [ruta], [descripcion], [estado], [fecha_creacion], [es_publica]) VALUES (1018, 1, N'/api/usuarios/ldap', N'Endpoint para registrar usuarios del LDAP', 1, CAST(N'2025-01-02T15:15:40.573' AS DateTime), 1)
INSERT [dbo].[rutas] ([id_ruta], [id_modulo], [ruta], [descripcion], [estado], [fecha_creacion], [es_publica]) VALUES (1019, 3, N'/api/temaspqrss', N'Endpoint para temas que contendran pqrs', 1, CAST(N'2025-01-02T16:42:01.720' AS DateTime), 1)
INSERT [dbo].[rutas] ([id_ruta], [id_modulo], [ruta], [descripcion], [estado], [fecha_creacion], [es_publica]) VALUES (2019, 1, N'/api/usuarios/registro', N'Endpoint público registro de usuarios', 1, CAST(N'2025-01-09T20:26:32.290' AS DateTime), 1)
INSERT [dbo].[rutas] ([id_ruta], [id_modulo], [ruta], [descripcion], [estado], [fecha_creacion], [es_publica]) VALUES (2020, 1, N'/api/auth/login', N'Ruta para login', 1, CAST(N'2025-01-10T11:06:43.797' AS DateTime), 1)
INSERT [dbo].[rutas] ([id_ruta], [id_modulo], [ruta], [descripcion], [estado], [fecha_creacion], [es_publica]) VALUES (2021, 1, N'/dashboard', N'Ruta para panel', 1, CAST(N'2025-01-10T11:12:42.670' AS DateTime), 0)
INSERT [dbo].[rutas] ([id_ruta], [id_modulo], [ruta], [descripcion], [estado], [fecha_creacion], [es_publica]) VALUES (3018, 1, N'/api/pqrs', N'Listado de PQRS', 1, CAST(N'2025-01-10T22:37:21.577' AS DateTime), 0)
INSERT [dbo].[rutas] ([id_ruta], [id_modulo], [ruta], [descripcion], [estado], [fecha_creacion], [es_publica]) VALUES (3019, 1, N'/api/pqrs/nuevo', N'Crear nueva PQRS', 1, CAST(N'2025-01-10T22:37:21.577' AS DateTime), 0)
INSERT [dbo].[rutas] ([id_ruta], [id_modulo], [ruta], [descripcion], [estado], [fecha_creacion], [es_publica]) VALUES (3020, 1, N'/api/pqrs/sin-asignar', N'PQRS sin asignar', 1, CAST(N'2025-01-10T22:37:21.577' AS DateTime), 0)
INSERT [dbo].[rutas] ([id_ruta], [id_modulo], [ruta], [descripcion], [estado], [fecha_creacion], [es_publica]) VALUES (3021, 1, N'/api/pqrs/mis-pqrs', N'Mis PQRS asignadas', 1, CAST(N'2025-01-10T22:37:21.577' AS DateTime), 0)
INSERT [dbo].[rutas] ([id_ruta], [id_modulo], [ruta], [descripcion], [estado], [fecha_creacion], [es_publica]) VALUES (3022, 1, N'/api/pqrs/reportes', N'Reportes y estadísticas de PQRS', 1, CAST(N'2025-01-10T22:37:21.577' AS DateTime), 0)
INSERT [dbo].[rutas] ([id_ruta], [id_modulo], [ruta], [descripcion], [estado], [fecha_creacion], [es_publica]) VALUES (3023, 1, N'/api/pqrs/{id}', N'Detalle de PQRS', 1, CAST(N'2025-01-10T22:37:21.577' AS DateTime), 0)
INSERT [dbo].[rutas] ([id_ruta], [id_modulo], [ruta], [descripcion], [estado], [fecha_creacion], [es_publica]) VALUES (3024, 1, N'/api/pqrs/nuevo-pqrs', N'Crear PQRS pública', 1, CAST(N'2025-01-10T22:37:21.577' AS DateTime), 1)
INSERT [dbo].[rutas] ([id_ruta], [id_modulo], [ruta], [descripcion], [estado], [fecha_creacion], [es_publica]) VALUES (3025, 1, N'/api/pqrs/publico/consulta', N'Consultar PQRS pública', 1, CAST(N'2025-01-10T22:37:21.577' AS DateTime), 1)
INSERT [dbo].[rutas] ([id_ruta], [id_modulo], [ruta], [descripcion], [estado], [fecha_creacion], [es_publica]) VALUES (3026, 1, N'/api/temas-pqrs', N'Listado de Temas', 1, CAST(N'2025-01-11T13:09:59.040' AS DateTime), 1)
INSERT [dbo].[rutas] ([id_ruta], [id_modulo], [ruta], [descripcion], [estado], [fecha_creacion], [es_publica]) VALUES (3027, 1, N'/api/files', N'Archivos de pqrs', 1, CAST(N'2025-01-12T21:25:55.633' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[rutas] OFF
GO
SET IDENTITY_INSERT [dbo].[seguimiento_pqrs] ON 

INSERT [dbo].[seguimiento_pqrs] ([id_seguimiento], [id_pqrs], [id_usuario], [comentario], [archivo_adjunto], [es_respuesta_final], [fecha_creacion], [tipo_seguimiento]) VALUES (10, 1, 1, N'Se realizó la revisión inicial', N'archivo.pdf', 0, CAST(N'2025-01-03T17:08:48.277' AS DateTime), NULL)
INSERT [dbo].[seguimiento_pqrs] ([id_seguimiento], [id_pqrs], [id_usuario], [comentario], [archivo_adjunto], [es_respuesta_final], [fecha_creacion], [tipo_seguimiento]) VALUES (11, 6, 1, N'Se realizó la revisión inicial', N'archivo.pdf', 0, CAST(N'2025-01-05T12:02:50.027' AS DateTime), N'FUNCIONARIO')
INSERT [dbo].[seguimiento_pqrs] ([id_seguimiento], [id_pqrs], [id_usuario], [comentario], [archivo_adjunto], [es_respuesta_final], [fecha_creacion], [tipo_seguimiento]) VALUES (12, 7, 10, N'Archivo adjunto en la creación del PQRS', N'base64-del-archivo', 0, CAST(N'2025-01-05T15:05:54.127' AS DateTime), N'RESPUESTA_USUARIO')
INSERT [dbo].[seguimiento_pqrs] ([id_seguimiento], [id_pqrs], [id_usuario], [comentario], [archivo_adjunto], [es_respuesta_final], [fecha_creacion], [tipo_seguimiento]) VALUES (13, 7, 10, N'Mi respuesta como usuario registrado', N'archivo.pdf', 0, CAST(N'2025-01-05T15:09:22.637' AS DateTime), N'RESPUESTA_USUARIO')
INSERT [dbo].[seguimiento_pqrs] ([id_seguimiento], [id_pqrs], [id_usuario], [comentario], [archivo_adjunto], [es_respuesta_final], [fecha_creacion], [tipo_seguimiento]) VALUES (14, 8, 10, N'Archivo adjunto en la creación del PQRS', N'base64-del-archivo', 0, CAST(N'2025-01-05T16:34:33.477' AS DateTime), N'RESPUESTA_USUARIO')
INSERT [dbo].[seguimiento_pqrs] ([id_seguimiento], [id_pqrs], [id_usuario], [comentario], [archivo_adjunto], [es_respuesta_final], [fecha_creacion], [tipo_seguimiento]) VALUES (1011, 1, 1, N'Seguimienmto port parte del ing jhon', NULL, 0, CAST(N'2025-01-11T16:39:37.120' AS DateTime), N'FUNCIONARIO')
INSERT [dbo].[seguimiento_pqrs] ([id_seguimiento], [id_pqrs], [id_usuario], [comentario], [archivo_adjunto], [es_respuesta_final], [fecha_creacion], [tipo_seguimiento]) VALUES (1012, 1, 1, N'prueba', NULL, 0, CAST(N'2025-01-11T16:40:17.050' AS DateTime), N'FUNCIONARIO')
INSERT [dbo].[seguimiento_pqrs] ([id_seguimiento], [id_pqrs], [id_usuario], [comentario], [archivo_adjunto], [es_respuesta_final], [fecha_creacion], [tipo_seguimiento]) VALUES (1013, 1, 1, N'test', NULL, 0, CAST(N'2025-01-11T19:56:51.620' AS DateTime), N'FUNCIONARIO')
INSERT [dbo].[seguimiento_pqrs] ([id_seguimiento], [id_pqrs], [id_usuario], [comentario], [archivo_adjunto], [es_respuesta_final], [fecha_creacion], [tipo_seguimiento]) VALUES (1014, 1, 1, N'pruebaaaa', NULL, 0, CAST(N'2025-01-11T19:57:03.557' AS DateTime), N'FUNCIONARIO')
INSERT [dbo].[seguimiento_pqrs] ([id_seguimiento], [id_pqrs], [id_usuario], [comentario], [archivo_adjunto], [es_respuesta_final], [fecha_creacion], [tipo_seguimiento]) VALUES (1015, 1, 1, N'jota', NULL, 0, CAST(N'2025-01-11T20:01:30.663' AS DateTime), N'FUNCIONARIO')
INSERT [dbo].[seguimiento_pqrs] ([id_seguimiento], [id_pqrs], [id_usuario], [comentario], [archivo_adjunto], [es_respuesta_final], [fecha_creacion], [tipo_seguimiento]) VALUES (1016, 1, 1, N'perezzz', NULL, 0, CAST(N'2025-01-12T08:17:31.117' AS DateTime), N'FUNCIONARIO')
INSERT [dbo].[seguimiento_pqrs] ([id_seguimiento], [id_pqrs], [id_usuario], [comentario], [archivo_adjunto], [es_respuesta_final], [fecha_creacion], [tipo_seguimiento]) VALUES (1017, 1, 1, N'33333333333', NULL, 0, CAST(N'2025-01-12T08:24:22.770' AS DateTime), N'FUNCIONARIO')
INSERT [dbo].[seguimiento_pqrs] ([id_seguimiento], [id_pqrs], [id_usuario], [comentario], [archivo_adjunto], [es_respuesta_final], [fecha_creacion], [tipo_seguimiento]) VALUES (1020, 1, 1, N'11111111111', NULL, 0, CAST(N'2025-01-12T10:22:09.463' AS DateTime), N'FUNCIONARIO')
INSERT [dbo].[seguimiento_pqrs] ([id_seguimiento], [id_pqrs], [id_usuario], [comentario], [archivo_adjunto], [es_respuesta_final], [fecha_creacion], [tipo_seguimiento]) VALUES (1021, 1, 1, N'10101010', NULL, 0, CAST(N'2025-01-12T10:22:17.667' AS DateTime), N'FUNCIONARIO')
INSERT [dbo].[seguimiento_pqrs] ([id_seguimiento], [id_pqrs], [id_usuario], [comentario], [archivo_adjunto], [es_respuesta_final], [fecha_creacion], [tipo_seguimiento]) VALUES (1022, 1, 1, N'101010101', NULL, 0, CAST(N'2025-01-12T10:22:31.557' AS DateTime), N'FUNCIONARIO')
INSERT [dbo].[seguimiento_pqrs] ([id_seguimiento], [id_pqrs], [id_usuario], [comentario], [archivo_adjunto], [es_respuesta_final], [fecha_creacion], [tipo_seguimiento]) VALUES (1024, 1, 1, N'jhon', NULL, 0, CAST(N'2025-01-12T10:27:13.810' AS DateTime), N'FUNCIONARIO')
INSERT [dbo].[seguimiento_pqrs] ([id_seguimiento], [id_pqrs], [id_usuario], [comentario], [archivo_adjunto], [es_respuesta_final], [fecha_creacion], [tipo_seguimiento]) VALUES (1025, 1, 1, N'xxxxxxxxxx', NULL, 0, CAST(N'2025-01-12T10:28:59.417' AS DateTime), N'FUNCIONARIO')
INSERT [dbo].[seguimiento_pqrs] ([id_seguimiento], [id_pqrs], [id_usuario], [comentario], [archivo_adjunto], [es_respuesta_final], [fecha_creacion], [tipo_seguimiento]) VALUES (1026, 1, 1, N'2586633', NULL, 0, CAST(N'2025-01-12T10:41:58.240' AS DateTime), N'FUNCIONARIO')
INSERT [dbo].[seguimiento_pqrs] ([id_seguimiento], [id_pqrs], [id_usuario], [comentario], [archivo_adjunto], [es_respuesta_final], [fecha_creacion], [tipo_seguimiento]) VALUES (1027, 1, 1031, N'juan', NULL, 0, CAST(N'2025-01-12T10:45:10.827' AS DateTime), N'FUNCIONARIO')
INSERT [dbo].[seguimiento_pqrs] ([id_seguimiento], [id_pqrs], [id_usuario], [comentario], [archivo_adjunto], [es_respuesta_final], [fecha_creacion], [tipo_seguimiento]) VALUES (1028, 1, 3, N'ttoyioyuo', NULL, 0, CAST(N'2025-01-12T11:16:17.220' AS DateTime), N'FUNCIONARIO')
INSERT [dbo].[seguimiento_pqrs] ([id_seguimiento], [id_pqrs], [id_usuario], [comentario], [archivo_adjunto], [es_respuesta_final], [fecha_creacion], [tipo_seguimiento]) VALUES (1030, 1, 1, N'572585', NULL, 0, CAST(N'2025-01-12T17:23:05.533' AS DateTime), N'FUNCIONARIO')
INSERT [dbo].[seguimiento_pqrs] ([id_seguimiento], [id_pqrs], [id_usuario], [comentario], [archivo_adjunto], [es_respuesta_final], [fecha_creacion], [tipo_seguimiento]) VALUES (1031, 1, 1, N'1235', NULL, 0, CAST(N'2025-01-12T17:43:25.760' AS DateTime), N'FUNCIONARIO')
INSERT [dbo].[seguimiento_pqrs] ([id_seguimiento], [id_pqrs], [id_usuario], [comentario], [archivo_adjunto], [es_respuesta_final], [fecha_creacion], [tipo_seguimiento]) VALUES (1032, 1, 1, N'adjunto', N'2025\01\12\366c10c4-5d35-4c6b-9071-0f2d6c3e31f6.pdf', 0, CAST(N'2025-01-12T18:25:49.277' AS DateTime), N'FUNCIONARIO')
INSERT [dbo].[seguimiento_pqrs] ([id_seguimiento], [id_pqrs], [id_usuario], [comentario], [archivo_adjunto], [es_respuesta_final], [fecha_creacion], [tipo_seguimiento]) VALUES (1033, 1, 1, N'jop', N'2025\01\12\41bcaa0b-7710-4443-b736-7ddc05169dcd.pdf', 0, CAST(N'2025-01-12T18:37:01.740' AS DateTime), N'FUNCIONARIO')
INSERT [dbo].[seguimiento_pqrs] ([id_seguimiento], [id_pqrs], [id_usuario], [comentario], [archivo_adjunto], [es_respuesta_final], [fecha_creacion], [tipo_seguimiento]) VALUES (1034, 1, 1, N'archivo 3', N'2025\01\12\578f16d1-9f24-4026-89ee-c6805facaa42.pdf', 0, CAST(N'2025-01-12T18:46:23.090' AS DateTime), N'FUNCIONARIO')
INSERT [dbo].[seguimiento_pqrs] ([id_seguimiento], [id_pqrs], [id_usuario], [comentario], [archivo_adjunto], [es_respuesta_final], [fecha_creacion], [tipo_seguimiento]) VALUES (1035, 1, 1, N'123555', N'2025\01\12\4f037c65-d6b0-4abe-8bed-463ee1057991.pdf', 0, CAST(N'2025-01-12T19:07:51.263' AS DateTime), N'FUNCIONARIO')
INSERT [dbo].[seguimiento_pqrs] ([id_seguimiento], [id_pqrs], [id_usuario], [comentario], [archivo_adjunto], [es_respuesta_final], [fecha_creacion], [tipo_seguimiento]) VALUES (1036, 1, 1, N'holaaa', N'2025\01\12\9bae6d8a-35b8-42a4-8019-a67840cf21e3.pdf', 0, CAST(N'2025-01-12T19:12:58.647' AS DateTime), N'FUNCIONARIO')
INSERT [dbo].[seguimiento_pqrs] ([id_seguimiento], [id_pqrs], [id_usuario], [comentario], [archivo_adjunto], [es_respuesta_final], [fecha_creacion], [tipo_seguimiento]) VALUES (1037, 1, 1, N'425252', N'2025\01\12\676b5ae9-c05f-43d3-aa57-6b1f845efa09.pdf', 0, CAST(N'2025-01-12T19:16:34.473' AS DateTime), N'FUNCIONARIO')
INSERT [dbo].[seguimiento_pqrs] ([id_seguimiento], [id_pqrs], [id_usuario], [comentario], [archivo_adjunto], [es_respuesta_final], [fecha_creacion], [tipo_seguimiento]) VALUES (1038, 1, 1, N'nuevo', N'2025\01\12\c0830538-4035-4aea-85c5-06ee03126149.pdf', 0, CAST(N'2025-01-12T19:48:13.113' AS DateTime), N'FUNCIONARIO')
INSERT [dbo].[seguimiento_pqrs] ([id_seguimiento], [id_pqrs], [id_usuario], [comentario], [archivo_adjunto], [es_respuesta_final], [fecha_creacion], [tipo_seguimiento]) VALUES (1039, 1, 1, N'huuuhuhhuuh', N'2025\01\12\c90a7e1a-bc88-456e-988a-67ae1ae52b3e.pdf', 0, CAST(N'2025-01-12T20:02:25.340' AS DateTime), N'FUNCIONARIO')
INSERT [dbo].[seguimiento_pqrs] ([id_seguimiento], [id_pqrs], [id_usuario], [comentario], [archivo_adjunto], [es_respuesta_final], [fecha_creacion], [tipo_seguimiento]) VALUES (1040, 1, 1, N'imagen', NULL, 0, CAST(N'2025-01-13T08:52:14.270' AS DateTime), N'FUNCIONARIO')
INSERT [dbo].[seguimiento_pqrs] ([id_seguimiento], [id_pqrs], [id_usuario], [comentario], [archivo_adjunto], [es_respuesta_final], [fecha_creacion], [tipo_seguimiento]) VALUES (1041, 1, 1, N'dsfdgfdgfdg', NULL, 0, CAST(N'2025-01-13T09:07:05.650' AS DateTime), N'FUNCIONARIO')
INSERT [dbo].[seguimiento_pqrs] ([id_seguimiento], [id_pqrs], [id_usuario], [comentario], [archivo_adjunto], [es_respuesta_final], [fecha_creacion], [tipo_seguimiento]) VALUES (1042, 1, 1, N'testenaod prueba', N'2025\01\13\a6ad70cb-fea7-4e20-9e21-feb448e1f6c3.jpg', 0, CAST(N'2025-01-13T09:26:19.187' AS DateTime), N'FUNCIONARIO')
INSERT [dbo].[seguimiento_pqrs] ([id_seguimiento], [id_pqrs], [id_usuario], [comentario], [archivo_adjunto], [es_respuesta_final], [fecha_creacion], [tipo_seguimiento]) VALUES (1043, 1, 1, N'jhon', NULL, 0, CAST(N'2025-01-13T10:49:08.093' AS DateTime), N'FUNCIONARIO')
INSERT [dbo].[seguimiento_pqrs] ([id_seguimiento], [id_pqrs], [id_usuario], [comentario], [archivo_adjunto], [es_respuesta_final], [fecha_creacion], [tipo_seguimiento]) VALUES (1044, 1, 1, N'hhhhh', NULL, 0, CAST(N'2025-01-13T10:50:23.877' AS DateTime), N'FUNCIONARIO')
INSERT [dbo].[seguimiento_pqrs] ([id_seguimiento], [id_pqrs], [id_usuario], [comentario], [archivo_adjunto], [es_respuesta_final], [fecha_creacion], [tipo_seguimiento]) VALUES (1045, 1, 1, N'12365', NULL, 0, CAST(N'2025-01-13T10:52:22.507' AS DateTime), N'FUNCIONARIO')
INSERT [dbo].[seguimiento_pqrs] ([id_seguimiento], [id_pqrs], [id_usuario], [comentario], [archivo_adjunto], [es_respuesta_final], [fecha_creacion], [tipo_seguimiento]) VALUES (1046, 1, 1, N'36987454', NULL, 0, CAST(N'2025-01-13T10:53:09.130' AS DateTime), N'FUNCIONARIO')
INSERT [dbo].[seguimiento_pqrs] ([id_seguimiento], [id_pqrs], [id_usuario], [comentario], [archivo_adjunto], [es_respuesta_final], [fecha_creacion], [tipo_seguimiento]) VALUES (1047, 1, 1, N'seguimiento', NULL, 0, CAST(N'2025-01-13T11:19:50.980' AS DateTime), N'FUNCIONARIO')
INSERT [dbo].[seguimiento_pqrs] ([id_seguimiento], [id_pqrs], [id_usuario], [comentario], [archivo_adjunto], [es_respuesta_final], [fecha_creacion], [tipo_seguimiento]) VALUES (1048, 1, 1, N'1266544444', NULL, 0, CAST(N'2025-01-13T11:29:01.280' AS DateTime), N'FUNCIONARIO')
INSERT [dbo].[seguimiento_pqrs] ([id_seguimiento], [id_pqrs], [id_usuario], [comentario], [archivo_adjunto], [es_respuesta_final], [fecha_creacion], [tipo_seguimiento]) VALUES (1049, 1, 1, N'23432', N'2025\01\13\52fe004e-a54b-4811-b41e-7570b9155272.jpg', 0, CAST(N'2025-01-13T11:30:26.777' AS DateTime), N'FUNCIONARIO')
INSERT [dbo].[seguimiento_pqrs] ([id_seguimiento], [id_pqrs], [id_usuario], [comentario], [archivo_adjunto], [es_respuesta_final], [fecha_creacion], [tipo_seguimiento]) VALUES (1050, 1, 1, N'holll', NULL, 0, CAST(N'2025-01-14T09:16:01.480' AS DateTime), N'RESPUESTA_USUARIO')
INSERT [dbo].[seguimiento_pqrs] ([id_seguimiento], [id_pqrs], [id_usuario], [comentario], [archivo_adjunto], [es_respuesta_final], [fecha_creacion], [tipo_seguimiento]) VALUES (1051, 1, 1, N'seguimiento', NULL, 0, CAST(N'2025-01-14T09:16:23.187' AS DateTime), N'FUNCIONARIO')
INSERT [dbo].[seguimiento_pqrs] ([id_seguimiento], [id_pqrs], [id_usuario], [comentario], [archivo_adjunto], [es_respuesta_final], [fecha_creacion], [tipo_seguimiento]) VALUES (1052, 1, 1, N'respuesta con adjunto', N'2025\01\14\d7ff6c57-691c-48eb-9f2c-2dbaab1ae158.pdf', 0, CAST(N'2025-01-14T09:20:35.230' AS DateTime), N'RESPUESTA_USUARIO')
INSERT [dbo].[seguimiento_pqrs] ([id_seguimiento], [id_pqrs], [id_usuario], [comentario], [archivo_adjunto], [es_respuesta_final], [fecha_creacion], [tipo_seguimiento]) VALUES (1053, 1, 1, N'nueva respuesta', NULL, 0, CAST(N'2025-01-14T10:35:16.367' AS DateTime), N'RESPUESTA_USUARIO')
INSERT [dbo].[seguimiento_pqrs] ([id_seguimiento], [id_pqrs], [id_usuario], [comentario], [archivo_adjunto], [es_respuesta_final], [fecha_creacion], [tipo_seguimiento]) VALUES (1054, 1, 1, N'tttt', N'2025\01\14\50d5daf0-ed21-448b-87de-868473001687.pdf', 0, CAST(N'2025-01-14T10:36:34.853' AS DateTime), N'RESPUESTA_USUARIO')
INSERT [dbo].[seguimiento_pqrs] ([id_seguimiento], [id_pqrs], [id_usuario], [comentario], [archivo_adjunto], [es_respuesta_final], [fecha_creacion], [tipo_seguimiento]) VALUES (1055, 1, 1, N'rtyghytrgh', NULL, 0, CAST(N'2025-01-14T10:39:16.143' AS DateTime), N'FUNCIONARIO')
INSERT [dbo].[seguimiento_pqrs] ([id_seguimiento], [id_pqrs], [id_usuario], [comentario], [archivo_adjunto], [es_respuesta_final], [fecha_creacion], [tipo_seguimiento]) VALUES (1056, 1, 1, N'ppppp', N'2025\01\14\07e84ece-7808-4b14-b70d-865b2d1ebaa1.pdf', 0, CAST(N'2025-01-14T10:42:08.360' AS DateTime), N'FUNCIONARIO')
INSERT [dbo].[seguimiento_pqrs] ([id_seguimiento], [id_pqrs], [id_usuario], [comentario], [archivo_adjunto], [es_respuesta_final], [fecha_creacion], [tipo_seguimiento]) VALUES (1057, 1, 1, N'pppp', N'2025\01\14\054615f9-7ca2-43d0-b727-8ea0417c6a63.jpg', 0, CAST(N'2025-01-14T10:42:37.533' AS DateTime), N'RESPUESTA_USUARIO')
INSERT [dbo].[seguimiento_pqrs] ([id_seguimiento], [id_pqrs], [id_usuario], [comentario], [archivo_adjunto], [es_respuesta_final], [fecha_creacion], [tipo_seguimiento]) VALUES (1063, 5, 1, N'seguimiento inicial con archivo adjunto', N'2025\01\15\ecf63755-9864-468c-9c62-dbdf6ddc4fea.pdf', 0, CAST(N'2025-01-15T20:06:13.963' AS DateTime), N'FUNCIONARIO')
INSERT [dbo].[seguimiento_pqrs] ([id_seguimiento], [id_pqrs], [id_usuario], [comentario], [archivo_adjunto], [es_respuesta_final], [fecha_creacion], [tipo_seguimiento]) VALUES (1065, 1013, 1, N'Archivo adjunto en la creación del PQRS', N'2025\01\15\b84769ee-24c3-4f2b-92fc-899913d228df.pdf', 0, CAST(N'2025-01-15T20:41:15.713' AS DateTime), N'ADJUNTO_INICIAL')
INSERT [dbo].[seguimiento_pqrs] ([id_seguimiento], [id_pqrs], [id_usuario], [comentario], [archivo_adjunto], [es_respuesta_final], [fecha_creacion], [tipo_seguimiento]) VALUES (1066, 1014, 1, N'Archivo adjunto en la creación del PQRS', N'2025\01\15\36cd411f-b36a-479c-9ae3-b48e9157256e.pdf', 0, CAST(N'2025-01-15T20:42:50.293' AS DateTime), N'RESPUESTA_USUARIO')
INSERT [dbo].[seguimiento_pqrs] ([id_seguimiento], [id_pqrs], [id_usuario], [comentario], [archivo_adjunto], [es_respuesta_final], [fecha_creacion], [tipo_seguimiento]) VALUES (1067, 1017, 1, N'Archivo adjunto en la creación del PQRS', N'2025\01\17\8c96bded-85da-48e2-9b69-8fb3bb3436b6.pdf', 0, CAST(N'2025-01-17T20:47:38.613' AS DateTime), N'ADJUNTO_INICIAL')
INSERT [dbo].[seguimiento_pqrs] ([id_seguimiento], [id_pqrs], [id_usuario], [comentario], [archivo_adjunto], [es_respuesta_final], [fecha_creacion], [tipo_seguimiento]) VALUES (1068, 1017, 1, N'probando seguimiento con adjunto', N'2025\01\17\db7ce736-85e9-489e-ae93-2c44a5f960c4.pdf', 0, CAST(N'2025-01-17T21:32:07.317' AS DateTime), N'FUNCIONARIO')
INSERT [dbo].[seguimiento_pqrs] ([id_seguimiento], [id_pqrs], [id_usuario], [comentario], [archivo_adjunto], [es_respuesta_final], [fecha_creacion], [tipo_seguimiento]) VALUES (1069, 1017, 1, N'probando respuesta con adjunto', N'2025\01\17\ea18db18-23ad-4898-9b18-435f1fcb3d7c.jpg', 0, CAST(N'2025-01-17T21:32:28.350' AS DateTime), N'RESPUESTA_USUARIO')
INSERT [dbo].[seguimiento_pqrs] ([id_seguimiento], [id_pqrs], [id_usuario], [comentario], [archivo_adjunto], [es_respuesta_final], [fecha_creacion], [tipo_seguimiento]) VALUES (1070, 1017, 1, N'probando correo', NULL, 0, CAST(N'2025-01-17T21:50:37.083' AS DateTime), N'FUNCIONARIO')
INSERT [dbo].[seguimiento_pqrs] ([id_seguimiento], [id_pqrs], [id_usuario], [comentario], [archivo_adjunto], [es_respuesta_final], [fecha_creacion], [tipo_seguimiento]) VALUES (1071, 1018, 1, N'Archivo adjunto en la creación del PQRS', N'2025\01\17\147852fc-ee7b-4120-9e18-dd8c356895c1.png', 0, CAST(N'2025-01-17T22:00:53.347' AS DateTime), N'ADJUNTO_INICIAL')
INSERT [dbo].[seguimiento_pqrs] ([id_seguimiento], [id_pqrs], [id_usuario], [comentario], [archivo_adjunto], [es_respuesta_final], [fecha_creacion], [tipo_seguimiento]) VALUES (1072, 1019, 1, N'Archivo adjunto en la creación del PQRS', N'2025\01\17\5194a0a3-bd2f-460f-b2c9-8eff09a5f7ef.pdf', 0, CAST(N'2025-01-17T22:03:30.530' AS DateTime), N'ADJUNTO_INICIAL')
INSERT [dbo].[seguimiento_pqrs] ([id_seguimiento], [id_pqrs], [id_usuario], [comentario], [archivo_adjunto], [es_respuesta_final], [fecha_creacion], [tipo_seguimiento]) VALUES (1073, 1020, 1, N'probando envio correo templaate seguimiento', NULL, 0, CAST(N'2025-01-17T22:15:22.880' AS DateTime), N'FUNCIONARIO')
INSERT [dbo].[seguimiento_pqrs] ([id_seguimiento], [id_pqrs], [id_usuario], [comentario], [archivo_adjunto], [es_respuesta_final], [fecha_creacion], [tipo_seguimiento]) VALUES (1074, 1029, 1, N'Archivo adjunto en la creación del PQRS', N'2025\01\21\d9b5cef5-63b0-4208-95eb-4269322dc06e.pdf', 0, CAST(N'2025-01-21T20:42:33.080' AS DateTime), N'ADJUNTO_INICIAL')
INSERT [dbo].[seguimiento_pqrs] ([id_seguimiento], [id_pqrs], [id_usuario], [comentario], [archivo_adjunto], [es_respuesta_final], [fecha_creacion], [tipo_seguimiento]) VALUES (1075, 1030, 1, N'Archivo adjunto en la creación del PQRS', N'2025\01\21\9da7d3d5-7819-4c5a-8776-effc4475c34e.pdf', 0, CAST(N'2025-01-21T20:43:58.393' AS DateTime), N'ADJUNTO_INICIAL')
SET IDENTITY_INSERT [dbo].[seguimiento_pqrs] OFF
GO
SET IDENTITY_INSERT [dbo].[temas_pqrs] ON 

INSERT [dbo].[temas_pqrs] ([id_tema], [id_area], [nombre], [descripcion], [estado], [fecha_creacion]) VALUES (3, 6, N'Sistema de Informacions de Riesgo Psicosocial - SIRPSI', N'Sistema de informacion creado para Riesgos Laborales', 1, CAST(N'2025-01-02T16:52:10.270' AS DateTime))
INSERT [dbo].[temas_pqrs] ([id_tema], [id_area], [nombre], [descripcion], [estado], [fecha_creacion]) VALUES (1003, 2, N'Sistema de pruebas actualizado', N'Sistema de pruebas text', 1, CAST(N'2025-01-03T10:55:03.927' AS DateTime))
SET IDENTITY_INSERT [dbo].[temas_pqrs] OFF
GO
SET IDENTITY_INSERT [dbo].[temas_pqrs_responsables] ON 

INSERT [dbo].[temas_pqrs_responsables] ([id], [id_tema], [id_usuario], [estado], [fecha_asignacion]) VALUES (1, 3, 1031, 0, CAST(N'2025-01-02T17:03:29.1491192' AS DateTime2))
INSERT [dbo].[temas_pqrs_responsables] ([id], [id_tema], [id_usuario], [estado], [fecha_asignacion]) VALUES (2, 3, 1030, 0, CAST(N'2025-01-02T17:15:39.6063650' AS DateTime2))
INSERT [dbo].[temas_pqrs_responsables] ([id], [id_tema], [id_usuario], [estado], [fecha_asignacion]) VALUES (3, 3, 1031, 1, CAST(N'2025-01-02T17:24:51.1090820' AS DateTime2))
INSERT [dbo].[temas_pqrs_responsables] ([id], [id_tema], [id_usuario], [estado], [fecha_asignacion]) VALUES (1002, 1003, 1031, 0, CAST(N'2025-01-03T11:09:27.2955699' AS DateTime2))
INSERT [dbo].[temas_pqrs_responsables] ([id], [id_tema], [id_usuario], [estado], [fecha_asignacion]) VALUES (1003, 1003, 1030, 0, CAST(N'2025-01-03T11:10:33.0116020' AS DateTime2))
INSERT [dbo].[temas_pqrs_responsables] ([id], [id_tema], [id_usuario], [estado], [fecha_asignacion]) VALUES (1004, 1003, 1030, 1, CAST(N'2025-01-03T11:30:30.5346295' AS DateTime2))
INSERT [dbo].[temas_pqrs_responsables] ([id], [id_tema], [id_usuario], [estado], [fecha_asignacion]) VALUES (1005, 1003, 1031, 1, CAST(N'2025-01-03T11:34:43.4248105' AS DateTime2))
SET IDENTITY_INSERT [dbo].[temas_pqrs_responsables] OFF
GO
SET IDENTITY_INSERT [dbo].[territoriales] ON 

INSERT [dbo].[territoriales] ([id_territorial], [id_empresa], [nombre], [codigo], [descripcion], [estado], [fecha_creacion]) VALUES (1, 1, N'Central DT', N'TN001', N'Dirección Central', 1, CAST(N'2024-12-31T10:22:15.933' AS DateTime))
INSERT [dbo].[territoriales] ([id_territorial], [id_empresa], [nombre], [codigo], [descripcion], [estado], [fecha_creacion]) VALUES (3, 5, N'Territorial prueba de empresa ABC', N'TN001', N'Territorial zona norte', 1, CAST(N'2025-01-01T14:22:34.090' AS DateTime))
INSERT [dbo].[territoriales] ([id_territorial], [id_empresa], [nombre], [codigo], [descripcion], [estado], [fecha_creacion]) VALUES (4, 1, N'Territorial Externa', N'TE001', N'Territorial para usuarios externos', 1, CAST(N'2025-01-09T20:09:20.887' AS DateTime))
SET IDENTITY_INSERT [dbo].[territoriales] OFF
GO
SET IDENTITY_INSERT [dbo].[tokens_activacion] ON 

INSERT [dbo].[tokens_activacion] ([id], [token], [codigo_activacion], [id_usuario], [fecha_expiracion], [fecha_creacion], [estado]) VALUES (2, N'861224f0-1014-4df3-b44e-5387d9c15bdd', N'677313', 9, CAST(N'2024-12-31T10:04:47.150' AS DateTime), CAST(N'2024-12-30T10:04:47.150' AS DateTime), 0)
INSERT [dbo].[tokens_activacion] ([id], [token], [codigo_activacion], [id_usuario], [fecha_expiracion], [fecha_creacion], [estado]) VALUES (3, N'1b91ab4e-9a41-42c8-bcda-9eff65d8c01c', N'099543', 10, CAST(N'2024-12-31T10:06:27.807' AS DateTime), CAST(N'2024-12-30T10:06:27.807' AS DateTime), 1)
INSERT [dbo].[tokens_activacion] ([id], [token], [codigo_activacion], [id_usuario], [fecha_expiracion], [fecha_creacion], [estado]) VALUES (4, N'db04eb1b-4bf5-47cd-80c4-e7386983e674', N'364998', 11, CAST(N'2024-12-31T10:28:58.780' AS DateTime), CAST(N'2024-12-30T10:28:58.780' AS DateTime), 1)
INSERT [dbo].[tokens_activacion] ([id], [token], [codigo_activacion], [id_usuario], [fecha_expiracion], [fecha_creacion], [estado]) VALUES (5, N'4c3608d3-a769-4359-baf0-8dc375b15424', N'626551', 12, CAST(N'2024-12-31T10:38:29.817' AS DateTime), CAST(N'2024-12-30T10:38:29.817' AS DateTime), 0)
INSERT [dbo].[tokens_activacion] ([id], [token], [codigo_activacion], [id_usuario], [fecha_expiracion], [fecha_creacion], [estado]) VALUES (6, N'6a0c07d7-362e-43aa-a480-c91634e7e9a9', N'296647', 13, CAST(N'2024-12-31T10:44:38.480' AS DateTime), CAST(N'2024-12-30T10:44:38.480' AS DateTime), 1)
INSERT [dbo].[tokens_activacion] ([id], [token], [codigo_activacion], [id_usuario], [fecha_expiracion], [fecha_creacion], [estado]) VALUES (7, N'd6db9149-1205-43e9-84dc-a375e36cfd5a', N'770367', 14, CAST(N'2024-12-31T11:24:31.627' AS DateTime), CAST(N'2024-12-30T11:24:31.627' AS DateTime), 0)
INSERT [dbo].[tokens_activacion] ([id], [token], [codigo_activacion], [id_usuario], [fecha_expiracion], [fecha_creacion], [estado]) VALUES (8, N'26671867-2418-4cb8-bcc5-669b781b61f0', N'485812', 15, CAST(N'2024-12-31T11:38:23.963' AS DateTime), CAST(N'2024-12-30T11:38:23.963' AS DateTime), 1)
INSERT [dbo].[tokens_activacion] ([id], [token], [codigo_activacion], [id_usuario], [fecha_expiracion], [fecha_creacion], [estado]) VALUES (9, N'364b3d11-4570-4832-ba62-fed6a4629ad2', N'305626', 16, CAST(N'2024-12-31T11:48:15.980' AS DateTime), CAST(N'2024-12-30T11:48:15.980' AS DateTime), 1)
INSERT [dbo].[tokens_activacion] ([id], [token], [codigo_activacion], [id_usuario], [fecha_expiracion], [fecha_creacion], [estado]) VALUES (11, N'e147e97a-a9dd-4820-99b3-b7460d21c786', N'604665', 9, CAST(N'2024-12-31T19:54:34.230' AS DateTime), CAST(N'2024-12-30T19:54:34.230' AS DateTime), 0)
INSERT [dbo].[tokens_activacion] ([id], [token], [codigo_activacion], [id_usuario], [fecha_expiracion], [fecha_creacion], [estado]) VALUES (10002, N'913a015e-2200-458e-bd38-9840348397cc', N'869660', 1009, CAST(N'2025-01-01T17:35:05.280' AS DateTime), CAST(N'2024-12-31T17:35:05.280' AS DateTime), 0)
INSERT [dbo].[tokens_activacion] ([id], [token], [codigo_activacion], [id_usuario], [fecha_expiracion], [fecha_creacion], [estado]) VALUES (10003, N'69e302c8-cdd5-41e9-8c94-a04e724a57f8', N'438150', 1, CAST(N'2025-01-01T18:00:51.377' AS DateTime), CAST(N'2024-12-31T18:00:51.377' AS DateTime), 0)
INSERT [dbo].[tokens_activacion] ([id], [token], [codigo_activacion], [id_usuario], [fecha_expiracion], [fecha_creacion], [estado]) VALUES (10004, N'd2e8cc84-2dd4-4e85-b81f-416d48dddcc8', N'576303', 1, CAST(N'2025-01-01T18:01:22.080' AS DateTime), CAST(N'2024-12-31T18:01:22.080' AS DateTime), 0)
INSERT [dbo].[tokens_activacion] ([id], [token], [codigo_activacion], [id_usuario], [fecha_expiracion], [fecha_creacion], [estado]) VALUES (10005, N'58b2f1be-ceab-4a3f-be74-c59835dcfb1c', N'876023', 1, CAST(N'2025-01-01T18:12:27.733' AS DateTime), CAST(N'2024-12-31T18:12:27.733' AS DateTime), 0)
INSERT [dbo].[tokens_activacion] ([id], [token], [codigo_activacion], [id_usuario], [fecha_expiracion], [fecha_creacion], [estado]) VALUES (10006, N'98b19059-59ce-4557-8a66-e2c69ed27076', N'456278', 14, CAST(N'2025-01-01T18:13:40.217' AS DateTime), CAST(N'2024-12-31T18:13:40.217' AS DateTime), 0)
INSERT [dbo].[tokens_activacion] ([id], [token], [codigo_activacion], [id_usuario], [fecha_expiracion], [fecha_creacion], [estado]) VALUES (10007, N'0d6c33c2-a6f7-4a6f-9518-50fecdbdb820', N'272178', 14, CAST(N'2025-01-01T18:16:23.340' AS DateTime), CAST(N'2024-12-31T18:16:23.340' AS DateTime), 1)
INSERT [dbo].[tokens_activacion] ([id], [token], [codigo_activacion], [id_usuario], [fecha_expiracion], [fecha_creacion], [estado]) VALUES (10008, N'7f45fb11-1f23-4c79-a389-0f0dc79c9050', N'119771', 1010, CAST(N'2025-01-02T14:24:52.937' AS DateTime), CAST(N'2025-01-01T14:24:52.937' AS DateTime), 1)
INSERT [dbo].[tokens_activacion] ([id], [token], [codigo_activacion], [id_usuario], [fecha_expiracion], [fecha_creacion], [estado]) VALUES (10009, N'0a10788e-cfaf-4a3b-8950-30fbc0155451', N'299936', 1011, CAST(N'2025-01-02T14:35:00.937' AS DateTime), CAST(N'2025-01-01T14:35:00.937' AS DateTime), 1)
INSERT [dbo].[tokens_activacion] ([id], [token], [codigo_activacion], [id_usuario], [fecha_expiracion], [fecha_creacion], [estado]) VALUES (10010, N'bb2f114e-cf7a-4758-b5a9-f8f2f46db22f', N'917267', 1032, CAST(N'2025-01-08T22:29:55.527' AS DateTime), CAST(N'2025-01-07T22:29:55.527' AS DateTime), 0)
INSERT [dbo].[tokens_activacion] ([id], [token], [codigo_activacion], [id_usuario], [fecha_expiracion], [fecha_creacion], [estado]) VALUES (10011, N'718fbb09-39de-405e-852c-ff57a377051c', N'780608', 1032, CAST(N'2025-01-10T11:59:59.393' AS DateTime), CAST(N'2025-01-09T11:59:59.393' AS DateTime), 0)
INSERT [dbo].[tokens_activacion] ([id], [token], [codigo_activacion], [id_usuario], [fecha_expiracion], [fecha_creacion], [estado]) VALUES (10012, N'e48082f0-1343-443d-a284-90acf3005190', N'324115', 1032, CAST(N'2025-01-10T13:19:47.477' AS DateTime), CAST(N'2025-01-09T13:19:47.477' AS DateTime), 0)
INSERT [dbo].[tokens_activacion] ([id], [token], [codigo_activacion], [id_usuario], [fecha_expiracion], [fecha_creacion], [estado]) VALUES (10013, N'2ddfafb0-f7cb-405a-847e-b4569de51c50', N'566642', 1032, CAST(N'2025-01-10T13:33:30.460' AS DateTime), CAST(N'2025-01-09T13:33:30.460' AS DateTime), 0)
INSERT [dbo].[tokens_activacion] ([id], [token], [codigo_activacion], [id_usuario], [fecha_expiracion], [fecha_creacion], [estado]) VALUES (10014, N'6b6553fc-0182-4548-8674-4fa7cceed83a', N'476687', 1032, CAST(N'2025-01-10T13:42:21.490' AS DateTime), CAST(N'2025-01-09T13:42:21.490' AS DateTime), 0)
INSERT [dbo].[tokens_activacion] ([id], [token], [codigo_activacion], [id_usuario], [fecha_expiracion], [fecha_creacion], [estado]) VALUES (10015, N'0d791eca-1165-4490-9036-69b6d47c187f', N'823370', 1032, CAST(N'2025-01-10T13:53:00.623' AS DateTime), CAST(N'2025-01-09T13:53:00.623' AS DateTime), 0)
INSERT [dbo].[tokens_activacion] ([id], [token], [codigo_activacion], [id_usuario], [fecha_expiracion], [fecha_creacion], [estado]) VALUES (10016, N'78d9556f-3959-48e8-9dd5-b2d322f420f1', N'213044', 1037, CAST(N'2025-01-10T20:29:26.897' AS DateTime), CAST(N'2025-01-09T20:29:26.897' AS DateTime), 1)
INSERT [dbo].[tokens_activacion] ([id], [token], [codigo_activacion], [id_usuario], [fecha_expiracion], [fecha_creacion], [estado]) VALUES (10017, N'4422ab15-bd47-46a7-85c6-b2a8a0ea4e58', N'077839', 1038, CAST(N'2025-01-10T20:30:49.913' AS DateTime), CAST(N'2025-01-09T20:30:49.913' AS DateTime), 1)
INSERT [dbo].[tokens_activacion] ([id], [token], [codigo_activacion], [id_usuario], [fecha_expiracion], [fecha_creacion], [estado]) VALUES (10018, N'cfe479cc-efde-4a91-bbec-3ea8031e813d', N'593148', 1039, CAST(N'2025-01-10T20:39:52.303' AS DateTime), CAST(N'2025-01-09T20:39:52.303' AS DateTime), 0)
INSERT [dbo].[tokens_activacion] ([id], [token], [codigo_activacion], [id_usuario], [fecha_expiracion], [fecha_creacion], [estado]) VALUES (20012, N'9327eaab-eee8-4d65-a503-16dc669eac56', N'938498', 12, CAST(N'2025-01-11T14:37:45.393' AS DateTime), CAST(N'2025-01-10T14:37:45.393' AS DateTime), 1)
INSERT [dbo].[tokens_activacion] ([id], [token], [codigo_activacion], [id_usuario], [fecha_expiracion], [fecha_creacion], [estado]) VALUES (20013, N'af729064-3aa9-4a5a-b028-0dea002463c8', N'557409', 2035, CAST(N'2025-01-19T11:53:58.743' AS DateTime), CAST(N'2025-01-18T11:53:58.743' AS DateTime), 1)
INSERT [dbo].[tokens_activacion] ([id], [token], [codigo_activacion], [id_usuario], [fecha_expiracion], [fecha_creacion], [estado]) VALUES (20014, N'a73cc6ad-3607-4f1d-82f5-80300a3c0977', N'780644', 2036, CAST(N'2025-01-19T12:03:12.617' AS DateTime), CAST(N'2025-01-18T12:03:12.617' AS DateTime), 0)
INSERT [dbo].[tokens_activacion] ([id], [token], [codigo_activacion], [id_usuario], [fecha_expiracion], [fecha_creacion], [estado]) VALUES (20015, N'01f6017d-89af-4ace-be29-1673d2a5dcd1', N'716018', 2037, CAST(N'2025-01-19T12:13:42.180' AS DateTime), CAST(N'2025-01-18T12:13:42.180' AS DateTime), 1)
INSERT [dbo].[tokens_activacion] ([id], [token], [codigo_activacion], [id_usuario], [fecha_expiracion], [fecha_creacion], [estado]) VALUES (20016, N'4f11e745-9a6c-4063-b7b5-5dc4ebc35238', N'499710', 2038, CAST(N'2025-01-19T17:14:39.600' AS DateTime), CAST(N'2025-01-18T17:14:39.600' AS DateTime), 1)
INSERT [dbo].[tokens_activacion] ([id], [token], [codigo_activacion], [id_usuario], [fecha_expiracion], [fecha_creacion], [estado]) VALUES (20017, N'fc3258b2-e6d8-4fee-92c2-85ee995d7396', N'097777', 2039, CAST(N'2025-01-22T17:01:20.717' AS DateTime), CAST(N'2025-01-21T17:01:20.717' AS DateTime), 1)
INSERT [dbo].[tokens_activacion] ([id], [token], [codigo_activacion], [id_usuario], [fecha_expiracion], [fecha_creacion], [estado]) VALUES (20018, N'dacc25b3-95ba-4ec7-9924-a51f651b1c15', N'415425', 2040, CAST(N'2025-01-22T17:02:26.590' AS DateTime), CAST(N'2025-01-21T17:02:26.590' AS DateTime), 1)
INSERT [dbo].[tokens_activacion] ([id], [token], [codigo_activacion], [id_usuario], [fecha_expiracion], [fecha_creacion], [estado]) VALUES (20019, N'451c6376-5b10-4b22-aea7-051c883a46ce', N'095386', 2041, CAST(N'2025-01-22T17:09:49.710' AS DateTime), CAST(N'2025-01-21T17:09:49.710' AS DateTime), 1)
INSERT [dbo].[tokens_activacion] ([id], [token], [codigo_activacion], [id_usuario], [fecha_expiracion], [fecha_creacion], [estado]) VALUES (20020, N'87228d48-eddf-478c-8573-2c9d69d80d04', N'619107', 2042, CAST(N'2025-01-22T17:10:58.520' AS DateTime), CAST(N'2025-01-21T17:10:58.520' AS DateTime), 1)
INSERT [dbo].[tokens_activacion] ([id], [token], [codigo_activacion], [id_usuario], [fecha_expiracion], [fecha_creacion], [estado]) VALUES (20021, N'ec431bb7-1c85-4ccd-81c3-598c622beb68', N'017384', 2043, CAST(N'2025-01-22T17:15:20.450' AS DateTime), CAST(N'2025-01-21T17:15:20.450' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[tokens_activacion] OFF
GO
SET IDENTITY_INSERT [dbo].[usuarios] ON 

INSERT [dbo].[usuarios] ([id_usuario], [id_persona], [id_rol], [username], [password], [ultimo_login], [estado], [fecha_creacion], [token_sesion]) VALUES (1, 1, 1, N'admin', N'$2a$10$f75KZ0Y1PF.BrKuY6yD/XOkM5l.9Zz6g1AT/4ce3en7UZahCwIUmi', CAST(N'2025-01-25T18:39:48.017' AS DateTime), 1, CAST(N'2024-12-28T15:13:39.850' AS DateTime), N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhZG1pbiIsImlhdCI6MTczNzg0ODM4OCwiZXhwIjoxNzM3OTM0Nzg4fQ.RMe3MqBMuaCKqQMHLg8-qPSejYHfmYmkYswVr5LnaXU')
INSERT [dbo].[usuarios] ([id_usuario], [id_persona], [id_rol], [username], [password], [ultimo_login], [estado], [fecha_creacion], [token_sesion]) VALUES (2, 2011, 2, N'jhon', N'$2a$10$lCaIzExmVm60U2uu/dFtc.3VSoGSsPPfKqpeozPMsvjLoGh/g0RPu', CAST(N'2024-12-30T10:59:31.187' AS DateTime), 1, CAST(N'2024-12-28T15:15:47.330' AS DateTime), N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJqaG9uIiwiaWF0IjoxNzM1NTc0MzcxLCJleHAiOjE3MzU2NjA3NzF9.ixTE2CzvQofjmDHkuRKICJFPqOc-qly5RYq7YGzb3Z0')
INSERT [dbo].[usuarios] ([id_usuario], [id_persona], [id_rol], [username], [password], [ultimo_login], [estado], [fecha_creacion], [token_sesion]) VALUES (3, 4, 1, N'jairo', N'$2a$10$c3hOmk4cZ6EVnaXH2LP/2.gzIzeAl5eQZEHCo/GSYFlTw3v.LiUye', NULL, 1, CAST(N'2024-12-29T16:00:07.563' AS DateTime), NULL)
INSERT [dbo].[usuarios] ([id_usuario], [id_persona], [id_rol], [username], [password], [ultimo_login], [estado], [fecha_creacion], [token_sesion]) VALUES (4, 5, 1, N'juan', N'$2a$10$b0WZzOAQwWe2qhX3sRkyROp9usFAwSKkQI0lCyFrcSWRFw5U.xdIm', CAST(N'2024-12-29T21:43:00.113' AS DateTime), 1, CAST(N'2024-12-29T16:44:00.107' AS DateTime), N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJqdWFuIiwiaWF0IjoxNzM1NTI2NTgwLCJleHAiOjE3MzU2MTI5ODB9.1PSF7sYcOBZVL9jp6kY9p6ugx0DPG2QKLfRkPW50SP4')
INSERT [dbo].[usuarios] ([id_usuario], [id_persona], [id_rol], [username], [password], [ultimo_login], [estado], [fecha_creacion], [token_sesion]) VALUES (5, 6, 1, N'carlos', N'$2a$10$tYvFo5KvYACrFBERUvNBWO/EGi2rBoBGnU/MHq3Z2Pi2Jfn1G2zQW', NULL, 1, CAST(N'2024-12-29T22:23:55.310' AS DateTime), NULL)
INSERT [dbo].[usuarios] ([id_usuario], [id_persona], [id_rol], [username], [password], [ultimo_login], [estado], [fecha_creacion], [token_sesion]) VALUES (6, 7, 1, N'jperez', N'$2a$10$6bpsmjB7Gst6KqOkOTSk3uyGs.NCtUrafa3A/MC7.5jtPRq.Me3dq', NULL, 1, CAST(N'2024-12-29T23:05:51.610' AS DateTime), NULL)
INSERT [dbo].[usuarios] ([id_usuario], [id_persona], [id_rol], [username], [password], [ultimo_login], [estado], [fecha_creacion], [token_sesion]) VALUES (9, 11, 1, N'jroa', N'$2a$10$b0WZzOAQwWe2qhX3sRkyROp9usFAwSKkQI0lCyFrcSWRFw5U.xdIm', CAST(N'2025-01-02T14:53:28.570' AS DateTime), 1, CAST(N'2024-12-30T10:04:47.143' AS DateTime), N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJqcm9hIiwiaWF0IjoxNzM1ODQ3NjA4LCJleHAiOjE3MzU5MzQwMDh9.fEKv5QEuE-3YjXLXbZ07P4KEf5o9hzrB4a0_VozIweA')
INSERT [dbo].[usuarios] ([id_usuario], [id_persona], [id_rol], [username], [password], [ultimo_login], [estado], [fecha_creacion], [token_sesion]) VALUES (10, 12, 2, N'anahc31', N'$2a$10$VeZSbonrUyyexaaOjSlFhOAooP3U1D8bwzWbwRewuWf6RWurCK1Wi', CAST(N'2025-01-07T18:02:49.130' AS DateTime), 1, CAST(N'2024-12-30T10:06:27.800' AS DateTime), N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhbmFoYzMxIiwiaWF0IjoxNzM2MjkwOTY5LCJleHAiOjE3MzYzNzczNjl9.NhbX7vTSSBN6VoVSsZSvK6Z6Kk39mZ70L-1tqo9e1Qo')
INSERT [dbo].[usuarios] ([id_usuario], [id_persona], [id_rol], [username], [password], [ultimo_login], [estado], [fecha_creacion], [token_sesion]) VALUES (11, 13, 2, N'antonio13', N'$2a$10$SL1xupPp3jHFPyuFjD5/FeiUhzzIvR3vz9rbC/brEmU8Tnq6ByQn6', CAST(N'2024-12-30T10:29:41.563' AS DateTime), 0, CAST(N'2024-12-30T10:28:58.773' AS DateTime), N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhbnRvbmlvMTMiLCJpYXQiOjE3MzU1NzI1ODEsImV4cCI6MTczNTY1ODk4MX0.A4uzsUDolT3T2ISJaGcMEfFr3WO77PgAbyxgHkEVlRY')
INSERT [dbo].[usuarios] ([id_usuario], [id_persona], [id_rol], [username], [password], [ultimo_login], [estado], [fecha_creacion], [token_sesion]) VALUES (12, 14, 2, N'antonio1', N'$2a$10$km6fAr0lXR8iOHYLXhMraOHIYE5c/nrdUL.JgiC3XZ5KA40M1AGnG', CAST(N'2024-12-30T11:09:26.797' AS DateTime), 0, CAST(N'2024-12-30T10:38:29.810' AS DateTime), N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhbnRvbmlvMSIsImlhdCI6MTczNTU3NDk2NiwiZXhwIjoxNzM1NjYxMzY2fQ.s-pUanggf4ZnXY2Q7r-uA3iopMpd8zteTfVstkcmSu4')
INSERT [dbo].[usuarios] ([id_usuario], [id_persona], [id_rol], [username], [password], [ultimo_login], [estado], [fecha_creacion], [token_sesion]) VALUES (13, 15, 2, N'pepito', N'$2a$10$Sd1d9gwANUEtlXe69zuE2elwyv3T1OUygrNawWpDGIlVxS6orq.me', CAST(N'2024-12-30T10:47:05.350' AS DateTime), 0, CAST(N'2024-12-30T10:44:38.473' AS DateTime), N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJwZXBpdG8iLCJpYXQiOjE3MzU1NzM2MjUsImV4cCI6MTczNTY2MDAyNX0.GhcpCkYGENqck-V3eB5o3jSCVCipoKnDjqgH98SgjkU')
INSERT [dbo].[usuarios] ([id_usuario], [id_persona], [id_rol], [username], [password], [ultimo_login], [estado], [fecha_creacion], [token_sesion]) VALUES (14, 16, 2, N'juancito', N'$2a$10$Lo0mEnzubr7HDuBEvRlBo.8K/uQRwh1bYhvINZi.wCCQzt7xg.x1i', NULL, 0, CAST(N'2024-12-30T11:24:31.620' AS DateTime), NULL)
INSERT [dbo].[usuarios] ([id_usuario], [id_persona], [id_rol], [username], [password], [ultimo_login], [estado], [fecha_creacion], [token_sesion]) VALUES (15, 17, 2, N'yuli', N'$2a$10$PVGlyjrPHyJd4jOU.SyWIeoXdkXAUM/yZ1hJ0.9VUbCDvoDnHEWDe', NULL, 1, CAST(N'2024-12-30T11:38:23.957' AS DateTime), NULL)
INSERT [dbo].[usuarios] ([id_usuario], [id_persona], [id_rol], [username], [password], [ultimo_login], [estado], [fecha_creacion], [token_sesion]) VALUES (16, 18, 2, N'pipe', N'$2a$10$cdiwjEtr0h.rOUIVei30SO0WxpK7XCeN1SeU387Iq8dDWL4NxqRoe', NULL, 1, CAST(N'2024-12-30T11:48:15.973' AS DateTime), NULL)
INSERT [dbo].[usuarios] ([id_usuario], [id_persona], [id_rol], [username], [password], [ultimo_login], [estado], [fecha_creacion], [token_sesion]) VALUES (1009, 1007, 2, N'jhon.perez', N'$2a$10$gzFQ5KLfqkewJMMDYNwcaueZ3kC1fbI50E3rNcV5qfQpmsh1elM8e', NULL, 1, CAST(N'2024-12-31T17:35:05.273' AS DateTime), NULL)
INSERT [dbo].[usuarios] ([id_usuario], [id_persona], [id_rol], [username], [password], [ultimo_login], [estado], [fecha_creacion], [token_sesion]) VALUES (1010, 1008, 2, N'juan.perez', N'$2a$10$0d4Hi79SskRIjUnCcJKb4e5ViIqL1dRVTxA33aZoBZSW8HcGZo2rW', NULL, 0, CAST(N'2025-01-01T14:24:52.927' AS DateTime), NULL)
INSERT [dbo].[usuarios] ([id_usuario], [id_persona], [id_rol], [username], [password], [ultimo_login], [estado], [fecha_creacion], [token_sesion]) VALUES (1011, 1009, 1, N'juan.jose.perez', N'$2a$10$.KSwsOPjQsJFPUIfDecMOOetfd73szhacJxHCy6B1l/dbdXesRFTu', NULL, 0, CAST(N'2025-01-01T14:35:00.930' AS DateTime), NULL)
INSERT [dbo].[usuarios] ([id_usuario], [id_persona], [id_rol], [username], [password], [ultimo_login], [estado], [fecha_creacion], [token_sesion]) VALUES (1030, NULL, 2, N'sirpsi_aviso@mintrabajo.loc', N'', CAST(N'2025-01-03T09:56:24.143' AS DateTime), 0, CAST(N'2025-01-02T15:20:09.577' AS DateTime), N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJzaXJwc2lfYXZpc29AbWludHJhYmFqby5sb2MiLCJpYXQiOjE3MzU5MTYxODQsImV4cCI6MTczNjAwMjU4NH0.u0Wu-WrLlYRUm-eS06DpH7DGTcjvj270a9YKDPl16So')
INSERT [dbo].[usuarios] ([id_usuario], [id_persona], [id_rol], [username], [password], [ultimo_login], [estado], [fecha_creacion], [token_sesion]) VALUES (1031, NULL, 1, N'jperezc', N'', NULL, 1, CAST(N'2025-01-02T15:34:52.170' AS DateTime), NULL)
INSERT [dbo].[usuarios] ([id_usuario], [id_persona], [id_rol], [username], [password], [ultimo_login], [estado], [fecha_creacion], [token_sesion]) VALUES (1032, 1010, 2, N'ana.pallarez', N'$2a$10$ZhOLjjNLGuzwVsry6b.uvuzVf60x6DI7dm1eRcwQI5wE7/IaNOJ2S', NULL, 1, CAST(N'2025-01-07T22:29:55.523' AS DateTime), NULL)
INSERT [dbo].[usuarios] ([id_usuario], [id_persona], [id_rol], [username], [password], [ultimo_login], [estado], [fecha_creacion], [token_sesion]) VALUES (1035, NULL, 2, N'gmartinez@mintrabajo.loc', N'', NULL, 0, CAST(N'2025-01-09T16:18:14.237' AS DateTime), NULL)
INSERT [dbo].[usuarios] ([id_usuario], [id_persona], [id_rol], [username], [password], [ultimo_login], [estado], [fecha_creacion], [token_sesion]) VALUES (1036, NULL, 2, N'glmartinez@mintrabajo.loc', N'', NULL, 1, CAST(N'2025-01-09T18:45:19.167' AS DateTime), NULL)
INSERT [dbo].[usuarios] ([id_usuario], [id_persona], [id_rol], [username], [password], [ultimo_login], [estado], [fecha_creacion], [token_sesion]) VALUES (1037, 1011, 2, N'tatisp.cc', N'$2a$10$qPLy2QSdxub3fBZFhKxumOX5uMZndWgaw27m8E7xuNv7MpBUuLRca', NULL, 0, CAST(N'2025-01-09T20:29:26.890' AS DateTime), NULL)
INSERT [dbo].[usuarios] ([id_usuario], [id_persona], [id_rol], [username], [password], [ultimo_login], [estado], [fecha_creacion], [token_sesion]) VALUES (1038, 1012, 2, N'tatis', N'$2a$10$IBxMjDC9sRzjgsT8mjZZWuARKVe1exUjIxznEWSlB/akNxmUcuoUm', NULL, 0, CAST(N'2025-01-09T20:30:49.910' AS DateTime), NULL)
INSERT [dbo].[usuarios] ([id_usuario], [id_persona], [id_rol], [username], [password], [ultimo_login], [estado], [fecha_creacion], [token_sesion]) VALUES (1039, 1013, 2, N'jose.pp', N'$2a$10$TGP17swKyEAp204vswVH0.bwuOItnAm7lOrYj3uqn/ATYqrRDr6T6', CAST(N'2025-01-09T20:41:21.307' AS DateTime), 1, CAST(N'2025-01-09T20:39:52.300' AS DateTime), N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJqb3NlLnBwIiwiaWF0IjoxNzM2NDczMjgxLCJleHAiOjE3MzY1NTk2ODF9.9tAdAiouCzdSMwsieAcrtVohMYJUHkpKNlWLN-Bu3rk')
INSERT [dbo].[usuarios] ([id_usuario], [id_persona], [id_rol], [username], [password], [ultimo_login], [estado], [fecha_creacion], [token_sesion]) VALUES (2033, NULL, 1, N'gcardenas', N'', NULL, 1, CAST(N'2025-01-12T13:26:11.243' AS DateTime), NULL)
INSERT [dbo].[usuarios] ([id_usuario], [id_persona], [id_rol], [username], [password], [ultimo_login], [estado], [fecha_creacion], [token_sesion]) VALUES (2034, NULL, 2, N'jperezc@mintrabajo.loc', N'$2a$10$IlgpfZcbXlc1SgmAzuK97OWfv6.lujMJwUbSSCFVt1uypRMmAaUpC', CAST(N'2025-01-13T10:02:58.407' AS DateTime), 1, CAST(N'2025-01-12T13:30:04.723' AS DateTime), N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJqcGVyZXpjQG1pbnRyYWJham8ubG9jIiwiaWF0IjoxNzM2NzgwNTc4LCJleHAiOjE3MzY4NjY5Nzh9._rM-gouZu9M0yzUUHEXPZ_Tz-xaOVQB4uTfYnpiHMSs')
INSERT [dbo].[usuarios] ([id_usuario], [id_persona], [id_rol], [username], [password], [ultimo_login], [estado], [fecha_creacion], [token_sesion]) VALUES (2035, 2015, 2, N'kakarot', N'$2a$10$q9uLWYnAEpn5pOx8TpgWc.yBd6I0x1qV7KTPXbx/XSm8zFPXr5y6C', NULL, 0, CAST(N'2025-01-18T11:53:58.737' AS DateTime), NULL)
INSERT [dbo].[usuarios] ([id_usuario], [id_persona], [id_rol], [username], [password], [ultimo_login], [estado], [fecha_creacion], [token_sesion]) VALUES (2036, 2016, 2, N'vegueta', N'$2a$10$hsh3FOGiKgzCdBe9JEMNGeHLQaoHCB6x3yirlRkPN0dgeL/.qMKn.', CAST(N'2025-01-18T12:10:11.640' AS DateTime), 1, CAST(N'2025-01-18T12:03:12.613' AS DateTime), N'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ2ZWd1ZXRhIiwiaWF0IjoxNzM3MjIwMjExLCJleHAiOjE3MzczMDY2MTF9.iduULz_7z5Begxg_GWQr6ynY88AIPBGiolyLkD9fRdg')
INSERT [dbo].[usuarios] ([id_usuario], [id_persona], [id_rol], [username], [password], [ultimo_login], [estado], [fecha_creacion], [token_sesion]) VALUES (2037, 2017, 2, N'bulma', N'$2a$10$VfKGctTLiTZ08HbLcqux3.6bgDfci2RAM0CdWSwuQYN5Z8PIoCOYO', NULL, 0, CAST(N'2025-01-18T12:13:42.177' AS DateTime), NULL)
INSERT [dbo].[usuarios] ([id_usuario], [id_persona], [id_rol], [username], [password], [ultimo_login], [estado], [fecha_creacion], [token_sesion]) VALUES (2038, 2018, 2, N'vegueta1', N'$2a$10$7w4GXEio8Gs4ITsNiboiFuOTg/98ESNIrF3yJXKvikphqoS4KKm8i', NULL, 0, CAST(N'2025-01-18T17:14:39.593' AS DateTime), NULL)
INSERT [dbo].[usuarios] ([id_usuario], [id_persona], [id_rol], [username], [password], [ultimo_login], [estado], [fecha_creacion], [token_sesion]) VALUES (2039, 2019, 2, N'tetsing', N'$2a$10$pcxn8fcGRXzYsongGEX/OeG4ExkJqx4TFqZP8cm94R6MNhzPDQ8CO', NULL, 0, CAST(N'2025-01-21T17:01:20.713' AS DateTime), NULL)
INSERT [dbo].[usuarios] ([id_usuario], [id_persona], [id_rol], [username], [password], [ultimo_login], [estado], [fecha_creacion], [token_sesion]) VALUES (2040, 2020, 2, N'tatisp', N'$2a$10$S1r/pfG6s8WqZXvJIio4d.rjcm8LfFY4B1nrb.f2J9OXIh/pn4jCa', NULL, 0, CAST(N'2025-01-21T17:02:26.587' AS DateTime), NULL)
INSERT [dbo].[usuarios] ([id_usuario], [id_persona], [id_rol], [username], [password], [ultimo_login], [estado], [fecha_creacion], [token_sesion]) VALUES (2041, 2021, 2, N'tatisp.c', N'$2a$10$yKyQQKIN61SwuqlUhnsFS.2O6kAm31rj/h9N49dC42ftqtP3BRgK6', NULL, 0, CAST(N'2025-01-21T17:09:49.707' AS DateTime), NULL)
INSERT [dbo].[usuarios] ([id_usuario], [id_persona], [id_rol], [username], [password], [ultimo_login], [estado], [fecha_creacion], [token_sesion]) VALUES (2042, 2022, 2, N'tatisp.cc1', N'$2a$10$EXtaW2t3i.3Jhxe27YKIZeIBAJ1SngJ4UWhoILBu.uXVfEd6tBZky', NULL, 0, CAST(N'2025-01-21T17:10:58.517' AS DateTime), NULL)
INSERT [dbo].[usuarios] ([id_usuario], [id_persona], [id_rol], [username], [password], [ultimo_login], [estado], [fecha_creacion], [token_sesion]) VALUES (2043, 2023, 2, N'tatisp.cc2', N'$2a$10$XCaSr.ZtESCDr1yVwlIfO.4p1UAxiDwxxovvugGz/1r7KFvYaZ6Vy', NULL, 0, CAST(N'2025-01-21T17:15:20.450' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[usuarios] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__empresas__DF97D0E45D6EF75F]    Script Date: 27/01/2025 9:35:49 a. m. ******/
ALTER TABLE [dbo].[empresas] ADD UNIQUE NONCLUSTERED 
(
	[nit] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__personas__AB6E6164E19BFEA5]    Script Date: 27/01/2025 9:35:49 a. m. ******/
ALTER TABLE [dbo].[personas] ADD UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__pqrs__ACE33EA48A54002B]    Script Date: 27/01/2025 9:35:49 a. m. ******/
ALTER TABLE [dbo].[pqrs] ADD UNIQUE NONCLUSTERED 
(
	[numero_radicado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK_pqrs_token_consulta]    Script Date: 27/01/2025 9:35:49 a. m. ******/
CREATE UNIQUE NONCLUSTERED INDEX [UK_pqrs_token_consulta] ON [dbo].[pqrs]
(
	[token_consulta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_TemasPqrsResponsables_Estado]    Script Date: 27/01/2025 9:35:49 a. m. ******/
CREATE NONCLUSTERED INDEX [IX_TemasPqrsResponsables_Estado] ON [dbo].[temas_pqrs_responsables]
(
	[estado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_TemasPqrsResponsables_Tema]    Script Date: 27/01/2025 9:35:49 a. m. ******/
CREATE NONCLUSTERED INDEX [IX_TemasPqrsResponsables_Tema] ON [dbo].[temas_pqrs_responsables]
(
	[id_tema] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_TemasPqrsResponsables_Usuario]    Script Date: 27/01/2025 9:35:49 a. m. ******/
CREATE NONCLUSTERED INDEX [IX_TemasPqrsResponsables_Usuario] ON [dbo].[temas_pqrs_responsables]
(
	[id_usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_codigo_activacion]    Script Date: 27/01/2025 9:35:49 a. m. ******/
ALTER TABLE [dbo].[tokens_activacion] ADD  CONSTRAINT [UQ_codigo_activacion] UNIQUE NONCLUSTERED 
(
	[codigo_activacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_token]    Script Date: 27/01/2025 9:35:49 a. m. ******/
ALTER TABLE [dbo].[tokens_activacion] ADD  CONSTRAINT [UQ_token] UNIQUE NONCLUSTERED 
(
	[token] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__usuarios__F3DBC57281ABFA10]    Script Date: 27/01/2025 9:35:49 a. m. ******/
ALTER TABLE [dbo].[usuarios] ADD UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[areas] ADD  DEFAULT ((1)) FOR [estado]
GO
ALTER TABLE [dbo].[areas] ADD  DEFAULT (getdate()) FOR [fecha_creacion]
GO
ALTER TABLE [dbo].[direcciones] ADD  DEFAULT ((1)) FOR [estado]
GO
ALTER TABLE [dbo].[direcciones] ADD  DEFAULT (getdate()) FOR [fecha_creacion]
GO
ALTER TABLE [dbo].[empresas] ADD  DEFAULT ((1)) FOR [estado]
GO
ALTER TABLE [dbo].[empresas] ADD  DEFAULT (getdate()) FOR [fecha_creacion]
GO
ALTER TABLE [dbo].[historial_asignaciones] ADD  DEFAULT (getdate()) FOR [fecha_asignacion]
GO
ALTER TABLE [dbo].[modulos] ADD  DEFAULT ((1)) FOR [estado]
GO
ALTER TABLE [dbo].[modulos] ADD  DEFAULT (getdate()) FOR [fecha_creacion]
GO
ALTER TABLE [dbo].[permisos_rol] ADD  DEFAULT ((0)) FOR [puede_leer]
GO
ALTER TABLE [dbo].[permisos_rol] ADD  DEFAULT ((0)) FOR [puede_escribir]
GO
ALTER TABLE [dbo].[permisos_rol] ADD  DEFAULT ((0)) FOR [puede_eliminar]
GO
ALTER TABLE [dbo].[permisos_rol] ADD  DEFAULT ((1)) FOR [estado]
GO
ALTER TABLE [dbo].[permisos_rol] ADD  DEFAULT (getdate()) FOR [fecha_creacion]
GO
ALTER TABLE [dbo].[permisos_rol] ADD  DEFAULT ((0)) FOR [puede_actualizar]
GO
ALTER TABLE [dbo].[personas] ADD  DEFAULT ((1)) FOR [estado]
GO
ALTER TABLE [dbo].[personas] ADD  DEFAULT (getdate()) FOR [fecha_creacion]
GO
ALTER TABLE [dbo].[pqrs] ADD  DEFAULT (getdate()) FOR [fecha_creacion]
GO
ALTER TABLE [dbo].[roles] ADD  DEFAULT ((1)) FOR [estado]
GO
ALTER TABLE [dbo].[roles] ADD  DEFAULT (getdate()) FOR [fecha_creacion]
GO
ALTER TABLE [dbo].[rutas] ADD  DEFAULT ((1)) FOR [estado]
GO
ALTER TABLE [dbo].[rutas] ADD  DEFAULT (getdate()) FOR [fecha_creacion]
GO
ALTER TABLE [dbo].[rutas] ADD  DEFAULT ((0)) FOR [es_publica]
GO
ALTER TABLE [dbo].[seguimiento_pqrs] ADD  DEFAULT ((0)) FOR [es_respuesta_final]
GO
ALTER TABLE [dbo].[seguimiento_pqrs] ADD  DEFAULT (getdate()) FOR [fecha_creacion]
GO
ALTER TABLE [dbo].[temas_pqrs] ADD  DEFAULT ((1)) FOR [estado]
GO
ALTER TABLE [dbo].[temas_pqrs] ADD  DEFAULT (getdate()) FOR [fecha_creacion]
GO
ALTER TABLE [dbo].[temas_pqrs_responsables] ADD  DEFAULT ((1)) FOR [estado]
GO
ALTER TABLE [dbo].[temas_pqrs_responsables] ADD  DEFAULT (getdate()) FOR [fecha_asignacion]
GO
ALTER TABLE [dbo].[territoriales] ADD  DEFAULT ((1)) FOR [estado]
GO
ALTER TABLE [dbo].[territoriales] ADD  DEFAULT (getdate()) FOR [fecha_creacion]
GO
ALTER TABLE [dbo].[tokens_activacion] ADD  DEFAULT (getdate()) FOR [fecha_creacion]
GO
ALTER TABLE [dbo].[tokens_activacion] ADD  DEFAULT ((1)) FOR [estado]
GO
ALTER TABLE [dbo].[usuarios] ADD  DEFAULT ((1)) FOR [estado]
GO
ALTER TABLE [dbo].[usuarios] ADD  DEFAULT (getdate()) FOR [fecha_creacion]
GO
ALTER TABLE [dbo].[areas]  WITH CHECK ADD  CONSTRAINT [FK_area_direccion] FOREIGN KEY([id_direccion])
REFERENCES [dbo].[direcciones] ([id_direccion])
GO
ALTER TABLE [dbo].[areas] CHECK CONSTRAINT [FK_area_direccion]
GO
ALTER TABLE [dbo].[direcciones]  WITH CHECK ADD  CONSTRAINT [FK_direccion_territorial] FOREIGN KEY([id_territorial])
REFERENCES [dbo].[territoriales] ([id_territorial])
GO
ALTER TABLE [dbo].[direcciones] CHECK CONSTRAINT [FK_direccion_territorial]
GO
ALTER TABLE [dbo].[permisos_rol]  WITH CHECK ADD FOREIGN KEY([id_rol])
REFERENCES [dbo].[roles] ([id_rol])
GO
ALTER TABLE [dbo].[permisos_rol]  WITH CHECK ADD FOREIGN KEY([id_ruta])
REFERENCES [dbo].[rutas] ([id_ruta])
GO
ALTER TABLE [dbo].[personas]  WITH CHECK ADD FOREIGN KEY([id_area])
REFERENCES [dbo].[areas] ([id_area])
GO
ALTER TABLE [dbo].[personas]  WITH CHECK ADD FOREIGN KEY([id_empresa])
REFERENCES [dbo].[empresas] ([id_empresa])
GO
ALTER TABLE [dbo].[pqrs]  WITH CHECK ADD  CONSTRAINT [FK_pqrs_temas] FOREIGN KEY([id_tema])
REFERENCES [dbo].[temas_pqrs] ([id_tema])
GO
ALTER TABLE [dbo].[pqrs] CHECK CONSTRAINT [FK_pqrs_temas]
GO
ALTER TABLE [dbo].[pqrs]  WITH CHECK ADD  CONSTRAINT [FK_pqrs_usuarios] FOREIGN KEY([id_usuario_asignado])
REFERENCES [dbo].[usuarios] ([id_usuario])
GO
ALTER TABLE [dbo].[pqrs] CHECK CONSTRAINT [FK_pqrs_usuarios]
GO
ALTER TABLE [dbo].[rutas]  WITH CHECK ADD FOREIGN KEY([id_modulo])
REFERENCES [dbo].[modulos] ([id_modulo])
GO
ALTER TABLE [dbo].[temas_pqrs]  WITH CHECK ADD FOREIGN KEY([id_area])
REFERENCES [dbo].[areas] ([id_area])
GO
ALTER TABLE [dbo].[temas_pqrs_responsables]  WITH CHECK ADD  CONSTRAINT [FK_TemasPqrsResponsables_Temas] FOREIGN KEY([id_tema])
REFERENCES [dbo].[temas_pqrs] ([id_tema])
GO
ALTER TABLE [dbo].[temas_pqrs_responsables] CHECK CONSTRAINT [FK_TemasPqrsResponsables_Temas]
GO
ALTER TABLE [dbo].[temas_pqrs_responsables]  WITH CHECK ADD  CONSTRAINT [FK_TemasPqrsResponsables_Usuarios] FOREIGN KEY([id_usuario])
REFERENCES [dbo].[usuarios] ([id_usuario])
GO
ALTER TABLE [dbo].[temas_pqrs_responsables] CHECK CONSTRAINT [FK_TemasPqrsResponsables_Usuarios]
GO
ALTER TABLE [dbo].[territoriales]  WITH CHECK ADD  CONSTRAINT [FK_territorial_empresa] FOREIGN KEY([id_empresa])
REFERENCES [dbo].[empresas] ([id_empresa])
GO
ALTER TABLE [dbo].[territoriales] CHECK CONSTRAINT [FK_territorial_empresa]
GO
ALTER TABLE [dbo].[tokens_activacion]  WITH CHECK ADD  CONSTRAINT [FK_token_usuario] FOREIGN KEY([id_usuario])
REFERENCES [dbo].[usuarios] ([id_usuario])
GO
ALTER TABLE [dbo].[tokens_activacion] CHECK CONSTRAINT [FK_token_usuario]
GO
ALTER TABLE [dbo].[usuarios]  WITH CHECK ADD FOREIGN KEY([id_persona])
REFERENCES [dbo].[personas] ([id_persona])
GO
ALTER TABLE [dbo].[usuarios]  WITH CHECK ADD FOREIGN KEY([id_rol])
REFERENCES [dbo].[roles] ([id_rol])
GO
USE [master]
GO
ALTER DATABASE [roles] SET  READ_WRITE 
GO
