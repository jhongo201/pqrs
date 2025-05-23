USE [master]
GO
/****** Object:  Database [roles]    Script Date: 27/01/2025 9:39:37 a. m. ******/
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
/****** Object:  Table [dbo].[areas]    Script Date: 27/01/2025 9:39:37 a. m. ******/
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
/****** Object:  Table [dbo].[direcciones]    Script Date: 27/01/2025 9:39:37 a. m. ******/
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
/****** Object:  Table [dbo].[empresas]    Script Date: 27/01/2025 9:39:37 a. m. ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[nit] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[historial_asignaciones]    Script Date: 27/01/2025 9:39:37 a. m. ******/
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
/****** Object:  Table [dbo].[modulos]    Script Date: 27/01/2025 9:39:37 a. m. ******/
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
/****** Object:  Table [dbo].[permisos_rol]    Script Date: 27/01/2025 9:39:37 a. m. ******/
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
/****** Object:  Table [dbo].[personas]    Script Date: 27/01/2025 9:39:37 a. m. ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pqrs]    Script Date: 27/01/2025 9:39:37 a. m. ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[numero_radicado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[roles]    Script Date: 27/01/2025 9:39:37 a. m. ******/
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
/****** Object:  Table [dbo].[rutas]    Script Date: 27/01/2025 9:39:37 a. m. ******/
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
/****** Object:  Table [dbo].[seguimiento_pqrs]    Script Date: 27/01/2025 9:39:37 a. m. ******/
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
/****** Object:  Table [dbo].[temas_pqrs]    Script Date: 27/01/2025 9:39:37 a. m. ******/
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
/****** Object:  Table [dbo].[temas_pqrs_responsables]    Script Date: 27/01/2025 9:39:37 a. m. ******/
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
/****** Object:  Table [dbo].[territoriales]    Script Date: 27/01/2025 9:39:37 a. m. ******/
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
/****** Object:  Table [dbo].[tokens_activacion]    Script Date: 27/01/2025 9:39:37 a. m. ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_codigo_activacion] UNIQUE NONCLUSTERED 
(
	[codigo_activacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_token] UNIQUE NONCLUSTERED 
(
	[token] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[usuarios]    Script Date: 27/01/2025 9:39:37 a. m. ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK_pqrs_token_consulta]    Script Date: 27/01/2025 9:39:37 a. m. ******/
CREATE UNIQUE NONCLUSTERED INDEX [UK_pqrs_token_consulta] ON [dbo].[pqrs]
(
	[token_consulta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_TemasPqrsResponsables_Estado]    Script Date: 27/01/2025 9:39:37 a. m. ******/
CREATE NONCLUSTERED INDEX [IX_TemasPqrsResponsables_Estado] ON [dbo].[temas_pqrs_responsables]
(
	[estado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_TemasPqrsResponsables_Tema]    Script Date: 27/01/2025 9:39:37 a. m. ******/
CREATE NONCLUSTERED INDEX [IX_TemasPqrsResponsables_Tema] ON [dbo].[temas_pqrs_responsables]
(
	[id_tema] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_TemasPqrsResponsables_Usuario]    Script Date: 27/01/2025 9:39:37 a. m. ******/
CREATE NONCLUSTERED INDEX [IX_TemasPqrsResponsables_Usuario] ON [dbo].[temas_pqrs_responsables]
(
	[id_usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
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
