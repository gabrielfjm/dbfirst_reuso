USE [master]
GO
/****** Object:  Database [reusoDbFirst]    Script Date: 22/10/2024 20:33:00 ******/
CREATE DATABASE [reusoDbFirst]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'reusoDbFirst', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\reusoDbFirst.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'reusoDbFirst_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\reusoDbFirst_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [reusoDbFirst] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [reusoDbFirst].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [reusoDbFirst] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [reusoDbFirst] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [reusoDbFirst] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [reusoDbFirst] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [reusoDbFirst] SET ARITHABORT OFF 
GO
ALTER DATABASE [reusoDbFirst] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [reusoDbFirst] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [reusoDbFirst] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [reusoDbFirst] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [reusoDbFirst] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [reusoDbFirst] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [reusoDbFirst] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [reusoDbFirst] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [reusoDbFirst] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [reusoDbFirst] SET  DISABLE_BROKER 
GO
ALTER DATABASE [reusoDbFirst] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [reusoDbFirst] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [reusoDbFirst] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [reusoDbFirst] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [reusoDbFirst] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [reusoDbFirst] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [reusoDbFirst] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [reusoDbFirst] SET RECOVERY FULL 
GO
ALTER DATABASE [reusoDbFirst] SET  MULTI_USER 
GO
ALTER DATABASE [reusoDbFirst] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [reusoDbFirst] SET DB_CHAINING OFF 
GO
ALTER DATABASE [reusoDbFirst] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [reusoDbFirst] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [reusoDbFirst] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [reusoDbFirst] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'reusoDbFirst', N'ON'
GO
ALTER DATABASE [reusoDbFirst] SET QUERY_STORE = ON
GO
ALTER DATABASE [reusoDbFirst] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [reusoDbFirst]
GO
/****** Object:  Schema [reuso]    Script Date: 22/10/2024 20:33:00 ******/
CREATE SCHEMA [reuso]
GO
/****** Object:  Table [reuso].[estado_anuncio_base]    Script Date: 22/10/2024 20:33:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [reuso].[estado_anuncio_base](
	[tipo_estado_anuncio] [nvarchar](31) NOT NULL,
	[id] [bigint] IDENTITY(4,1) NOT NULL,
 CONSTRAINT [PK_estado_anuncio_base_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [reuso].[estado_venda_base]    Script Date: 22/10/2024 20:33:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [reuso].[estado_venda_base](
	[tipo_estado_venda] [nvarchar](31) NOT NULL,
	[id] [bigint] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_estado_venda_base_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [reuso].[tb_anuncio]    Script Date: 22/10/2024 20:33:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [reuso].[tb_anuncio](
	[id] [bigint] IDENTITY(11,1) NOT NULL,
	[descricao] [nvarchar](255) NULL,
	[titulo] [nvarchar](255) NULL,
	[estado_anuncio_id] [bigint] NULL,
	[pf_a_id] [bigint] NULL,
	[pj_a_id] [bigint] NULL,
 CONSTRAINT [PK_tb_anuncio_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [reuso].[tb_evento]    Script Date: 22/10/2024 20:33:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [reuso].[tb_evento](
	[id] [bigint] IDENTITY(11,1) NOT NULL,
	[data] [date] NULL,
	[descricao] [nvarchar](255) NULL,
	[horario] [time](6) NULL,
	[tipo_evento_id] [bigint] NULL,
 CONSTRAINT [PK_tb_evento_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [reuso].[tb_ingresso]    Script Date: 22/10/2024 20:33:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [reuso].[tb_ingresso](
	[id] [bigint] IDENTITY(10,1) NOT NULL,
	[descricao] [nvarchar](255) NULL,
	[inteiro] [binary](1) NOT NULL,
	[quantidade] [int] NOT NULL,
	[titulo] [nvarchar](255) NULL,
	[valor] [real] NOT NULL,
	[anuncio_id] [bigint] NULL,
	[evento_id] [bigint] NULL,
	[pf_i_id] [bigint] NULL,
	[pj_i_id] [bigint] NULL,
 CONSTRAINT [PK_tb_ingresso_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [reuso].[tb_pessoa_fisica]    Script Date: 22/10/2024 20:33:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [reuso].[tb_pessoa_fisica](
	[id] [bigint] IDENTITY(6,1) NOT NULL,
	[email] [nvarchar](255) NULL,
	[senha] [nvarchar](255) NULL,
	[cpf] [nvarchar](255) NULL,
	[data_nascimento] [date] NULL,
	[nome_completo] [nvarchar](255) NULL,
 CONSTRAINT [PK_tb_pessoa_fisica_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [reuso].[tb_pessoa_juridica]    Script Date: 22/10/2024 20:33:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [reuso].[tb_pessoa_juridica](
	[id] [bigint] IDENTITY(2,1) NOT NULL,
	[email] [nvarchar](255) NULL,
	[senha] [nvarchar](255) NULL,
	[cnpj] [nvarchar](255) NULL,
	[fantasia] [nvarchar](255) NULL,
 CONSTRAINT [PK_tb_pessoa_juridica_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [reuso].[tb_telefone]    Script Date: 22/10/2024 20:33:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [reuso].[tb_telefone](
	[id] [bigint] IDENTITY(3,1) NOT NULL,
	[ddd] [nvarchar](255) NULL,
	[ddi] [nvarchar](255) NULL,
	[numero] [nvarchar](255) NULL,
	[pf_t_id] [bigint] NULL,
	[pj_t_id] [bigint] NULL,
 CONSTRAINT [PK_tb_telefone_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [reuso].[tb_tipo_evento]    Script Date: 22/10/2024 20:33:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [reuso].[tb_tipo_evento](
	[id] [bigint] IDENTITY(11,1) NOT NULL,
	[descricao] [nvarchar](255) NULL,
 CONSTRAINT [PK_tb_tipo_evento_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [reuso].[tb_venda]    Script Date: 22/10/2024 20:33:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [reuso].[tb_venda](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[anuncio_id] [bigint] NULL,
	[estado_venda_id] [bigint] NULL,
	[pf_v_id] [bigint] NULL,
	[pj_v_id] [bigint] NULL,
 CONSTRAINT [PK_tb_venda_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Index [FK5y9hef04ntxsgpi3mf5o5lw4b]    Script Date: 22/10/2024 20:33:00 ******/
CREATE NONCLUSTERED INDEX [FK5y9hef04ntxsgpi3mf5o5lw4b] ON [reuso].[tb_anuncio]
(
	[pj_a_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [FKdn03rmffuvm411rfer3c2fc49]    Script Date: 22/10/2024 20:33:00 ******/
CREATE NONCLUSTERED INDEX [FKdn03rmffuvm411rfer3c2fc49] ON [reuso].[tb_anuncio]
(
	[estado_anuncio_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [FKofc513vl3f57vk2j0n10bn2i9]    Script Date: 22/10/2024 20:33:00 ******/
CREATE NONCLUSTERED INDEX [FKofc513vl3f57vk2j0n10bn2i9] ON [reuso].[tb_anuncio]
(
	[pf_a_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [FKm34l73e4301nedj8xmwbf97mj]    Script Date: 22/10/2024 20:33:00 ******/
CREATE NONCLUSTERED INDEX [FKm34l73e4301nedj8xmwbf97mj] ON [reuso].[tb_evento]
(
	[tipo_evento_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [FK2i610oxfrhcmbkveb1qjoym0t]    Script Date: 22/10/2024 20:33:00 ******/
CREATE NONCLUSTERED INDEX [FK2i610oxfrhcmbkveb1qjoym0t] ON [reuso].[tb_ingresso]
(
	[evento_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [FK3b5ru7fjad4up8xr5wx6v3y6r]    Script Date: 22/10/2024 20:33:00 ******/
CREATE NONCLUSTERED INDEX [FK3b5ru7fjad4up8xr5wx6v3y6r] ON [reuso].[tb_ingresso]
(
	[anuncio_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [FK3lhl6uudmrxy2ubp1l43c1lso]    Script Date: 22/10/2024 20:33:00 ******/
CREATE NONCLUSTERED INDEX [FK3lhl6uudmrxy2ubp1l43c1lso] ON [reuso].[tb_ingresso]
(
	[pf_i_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [FKa1asystgecdcqe9jtjf6y1hw1]    Script Date: 22/10/2024 20:33:00 ******/
CREATE NONCLUSTERED INDEX [FKa1asystgecdcqe9jtjf6y1hw1] ON [reuso].[tb_ingresso]
(
	[pj_i_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [FKelpxi3jcvulvb8vfpsxhf8rhn]    Script Date: 22/10/2024 20:33:00 ******/
CREATE NONCLUSTERED INDEX [FKelpxi3jcvulvb8vfpsxhf8rhn] ON [reuso].[tb_telefone]
(
	[pf_t_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [FKp255ldtv0cbwphvxw21uk27nv]    Script Date: 22/10/2024 20:33:00 ******/
CREATE NONCLUSTERED INDEX [FKp255ldtv0cbwphvxw21uk27nv] ON [reuso].[tb_telefone]
(
	[pj_t_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [FKf78kauqgo8agebqxcgvdxq31s]    Script Date: 22/10/2024 20:33:00 ******/
CREATE NONCLUSTERED INDEX [FKf78kauqgo8agebqxcgvdxq31s] ON [reuso].[tb_venda]
(
	[estado_venda_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [FKhss4uig6h02jy87kew7kgltqk]    Script Date: 22/10/2024 20:33:00 ******/
CREATE NONCLUSTERED INDEX [FKhss4uig6h02jy87kew7kgltqk] ON [reuso].[tb_venda]
(
	[pf_v_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [FKjlitfff4rqhuw1ap22vqgon3m]    Script Date: 22/10/2024 20:33:00 ******/
CREATE NONCLUSTERED INDEX [FKjlitfff4rqhuw1ap22vqgon3m] ON [reuso].[tb_venda]
(
	[pj_v_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [FKo7udal8yipfaugrtfwgyujuig]    Script Date: 22/10/2024 20:33:00 ******/
CREATE NONCLUSTERED INDEX [FKo7udal8yipfaugrtfwgyujuig] ON [reuso].[tb_venda]
(
	[anuncio_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [reuso].[tb_anuncio] ADD  DEFAULT (NULL) FOR [descricao]
GO
ALTER TABLE [reuso].[tb_anuncio] ADD  DEFAULT (NULL) FOR [titulo]
GO
ALTER TABLE [reuso].[tb_anuncio] ADD  DEFAULT (NULL) FOR [estado_anuncio_id]
GO
ALTER TABLE [reuso].[tb_anuncio] ADD  DEFAULT (NULL) FOR [pf_a_id]
GO
ALTER TABLE [reuso].[tb_anuncio] ADD  DEFAULT (NULL) FOR [pj_a_id]
GO
ALTER TABLE [reuso].[tb_evento] ADD  DEFAULT (NULL) FOR [data]
GO
ALTER TABLE [reuso].[tb_evento] ADD  DEFAULT (NULL) FOR [descricao]
GO
ALTER TABLE [reuso].[tb_evento] ADD  DEFAULT (NULL) FOR [horario]
GO
ALTER TABLE [reuso].[tb_evento] ADD  DEFAULT (NULL) FOR [tipo_evento_id]
GO
ALTER TABLE [reuso].[tb_ingresso] ADD  DEFAULT (NULL) FOR [descricao]
GO
ALTER TABLE [reuso].[tb_ingresso] ADD  DEFAULT (NULL) FOR [titulo]
GO
ALTER TABLE [reuso].[tb_ingresso] ADD  DEFAULT (NULL) FOR [anuncio_id]
GO
ALTER TABLE [reuso].[tb_ingresso] ADD  DEFAULT (NULL) FOR [evento_id]
GO
ALTER TABLE [reuso].[tb_ingresso] ADD  DEFAULT (NULL) FOR [pf_i_id]
GO
ALTER TABLE [reuso].[tb_ingresso] ADD  DEFAULT (NULL) FOR [pj_i_id]
GO
ALTER TABLE [reuso].[tb_pessoa_fisica] ADD  DEFAULT (NULL) FOR [email]
GO
ALTER TABLE [reuso].[tb_pessoa_fisica] ADD  DEFAULT (NULL) FOR [senha]
GO
ALTER TABLE [reuso].[tb_pessoa_fisica] ADD  DEFAULT (NULL) FOR [cpf]
GO
ALTER TABLE [reuso].[tb_pessoa_fisica] ADD  DEFAULT (NULL) FOR [data_nascimento]
GO
ALTER TABLE [reuso].[tb_pessoa_fisica] ADD  DEFAULT (NULL) FOR [nome_completo]
GO
ALTER TABLE [reuso].[tb_pessoa_juridica] ADD  DEFAULT (NULL) FOR [email]
GO
ALTER TABLE [reuso].[tb_pessoa_juridica] ADD  DEFAULT (NULL) FOR [senha]
GO
ALTER TABLE [reuso].[tb_pessoa_juridica] ADD  DEFAULT (NULL) FOR [cnpj]
GO
ALTER TABLE [reuso].[tb_pessoa_juridica] ADD  DEFAULT (NULL) FOR [fantasia]
GO
ALTER TABLE [reuso].[tb_telefone] ADD  DEFAULT (NULL) FOR [ddd]
GO
ALTER TABLE [reuso].[tb_telefone] ADD  DEFAULT (NULL) FOR [ddi]
GO
ALTER TABLE [reuso].[tb_telefone] ADD  DEFAULT (NULL) FOR [numero]
GO
ALTER TABLE [reuso].[tb_telefone] ADD  DEFAULT (NULL) FOR [pf_t_id]
GO
ALTER TABLE [reuso].[tb_telefone] ADD  DEFAULT (NULL) FOR [pj_t_id]
GO
ALTER TABLE [reuso].[tb_tipo_evento] ADD  DEFAULT (NULL) FOR [descricao]
GO
ALTER TABLE [reuso].[tb_venda] ADD  DEFAULT (NULL) FOR [anuncio_id]
GO
ALTER TABLE [reuso].[tb_venda] ADD  DEFAULT (NULL) FOR [estado_venda_id]
GO
ALTER TABLE [reuso].[tb_venda] ADD  DEFAULT (NULL) FOR [pf_v_id]
GO
ALTER TABLE [reuso].[tb_venda] ADD  DEFAULT (NULL) FOR [pj_v_id]
GO
ALTER TABLE [reuso].[tb_anuncio]  WITH NOCHECK ADD  CONSTRAINT [tb_anuncio$FK5y9hef04ntxsgpi3mf5o5lw4b] FOREIGN KEY([pj_a_id])
REFERENCES [reuso].[tb_pessoa_juridica] ([id])
GO
ALTER TABLE [reuso].[tb_anuncio] CHECK CONSTRAINT [tb_anuncio$FK5y9hef04ntxsgpi3mf5o5lw4b]
GO
ALTER TABLE [reuso].[tb_anuncio]  WITH NOCHECK ADD  CONSTRAINT [tb_anuncio$FKdn03rmffuvm411rfer3c2fc49] FOREIGN KEY([estado_anuncio_id])
REFERENCES [reuso].[estado_anuncio_base] ([id])
GO
ALTER TABLE [reuso].[tb_anuncio] CHECK CONSTRAINT [tb_anuncio$FKdn03rmffuvm411rfer3c2fc49]
GO
ALTER TABLE [reuso].[tb_anuncio]  WITH NOCHECK ADD  CONSTRAINT [tb_anuncio$FKofc513vl3f57vk2j0n10bn2i9] FOREIGN KEY([pf_a_id])
REFERENCES [reuso].[tb_pessoa_fisica] ([id])
GO
ALTER TABLE [reuso].[tb_anuncio] CHECK CONSTRAINT [tb_anuncio$FKofc513vl3f57vk2j0n10bn2i9]
GO
ALTER TABLE [reuso].[tb_evento]  WITH NOCHECK ADD  CONSTRAINT [tb_evento$FKm34l73e4301nedj8xmwbf97mj] FOREIGN KEY([tipo_evento_id])
REFERENCES [reuso].[tb_tipo_evento] ([id])
GO
ALTER TABLE [reuso].[tb_evento] CHECK CONSTRAINT [tb_evento$FKm34l73e4301nedj8xmwbf97mj]
GO
ALTER TABLE [reuso].[tb_ingresso]  WITH NOCHECK ADD  CONSTRAINT [tb_ingresso$FK2i610oxfrhcmbkveb1qjoym0t] FOREIGN KEY([evento_id])
REFERENCES [reuso].[tb_evento] ([id])
GO
ALTER TABLE [reuso].[tb_ingresso] CHECK CONSTRAINT [tb_ingresso$FK2i610oxfrhcmbkveb1qjoym0t]
GO
ALTER TABLE [reuso].[tb_ingresso]  WITH NOCHECK ADD  CONSTRAINT [tb_ingresso$FK3b5ru7fjad4up8xr5wx6v3y6r] FOREIGN KEY([anuncio_id])
REFERENCES [reuso].[tb_anuncio] ([id])
GO
ALTER TABLE [reuso].[tb_ingresso] CHECK CONSTRAINT [tb_ingresso$FK3b5ru7fjad4up8xr5wx6v3y6r]
GO
ALTER TABLE [reuso].[tb_ingresso]  WITH NOCHECK ADD  CONSTRAINT [tb_ingresso$FK3lhl6uudmrxy2ubp1l43c1lso] FOREIGN KEY([pf_i_id])
REFERENCES [reuso].[tb_pessoa_fisica] ([id])
GO
ALTER TABLE [reuso].[tb_ingresso] CHECK CONSTRAINT [tb_ingresso$FK3lhl6uudmrxy2ubp1l43c1lso]
GO
ALTER TABLE [reuso].[tb_ingresso]  WITH NOCHECK ADD  CONSTRAINT [tb_ingresso$FKa1asystgecdcqe9jtjf6y1hw1] FOREIGN KEY([pj_i_id])
REFERENCES [reuso].[tb_pessoa_juridica] ([id])
GO
ALTER TABLE [reuso].[tb_ingresso] CHECK CONSTRAINT [tb_ingresso$FKa1asystgecdcqe9jtjf6y1hw1]
GO
ALTER TABLE [reuso].[tb_telefone]  WITH NOCHECK ADD  CONSTRAINT [tb_telefone$FKelpxi3jcvulvb8vfpsxhf8rhn] FOREIGN KEY([pf_t_id])
REFERENCES [reuso].[tb_pessoa_fisica] ([id])
GO
ALTER TABLE [reuso].[tb_telefone] CHECK CONSTRAINT [tb_telefone$FKelpxi3jcvulvb8vfpsxhf8rhn]
GO
ALTER TABLE [reuso].[tb_telefone]  WITH NOCHECK ADD  CONSTRAINT [tb_telefone$FKp255ldtv0cbwphvxw21uk27nv] FOREIGN KEY([pj_t_id])
REFERENCES [reuso].[tb_pessoa_juridica] ([id])
GO
ALTER TABLE [reuso].[tb_telefone] CHECK CONSTRAINT [tb_telefone$FKp255ldtv0cbwphvxw21uk27nv]
GO
ALTER TABLE [reuso].[tb_venda]  WITH NOCHECK ADD  CONSTRAINT [tb_venda$FKf78kauqgo8agebqxcgvdxq31s] FOREIGN KEY([estado_venda_id])
REFERENCES [reuso].[estado_venda_base] ([id])
GO
ALTER TABLE [reuso].[tb_venda] CHECK CONSTRAINT [tb_venda$FKf78kauqgo8agebqxcgvdxq31s]
GO
ALTER TABLE [reuso].[tb_venda]  WITH NOCHECK ADD  CONSTRAINT [tb_venda$FKhss4uig6h02jy87kew7kgltqk] FOREIGN KEY([pf_v_id])
REFERENCES [reuso].[tb_pessoa_fisica] ([id])
GO
ALTER TABLE [reuso].[tb_venda] CHECK CONSTRAINT [tb_venda$FKhss4uig6h02jy87kew7kgltqk]
GO
ALTER TABLE [reuso].[tb_venda]  WITH NOCHECK ADD  CONSTRAINT [tb_venda$FKjlitfff4rqhuw1ap22vqgon3m] FOREIGN KEY([pj_v_id])
REFERENCES [reuso].[tb_pessoa_juridica] ([id])
GO
ALTER TABLE [reuso].[tb_venda] CHECK CONSTRAINT [tb_venda$FKjlitfff4rqhuw1ap22vqgon3m]
GO
ALTER TABLE [reuso].[tb_venda]  WITH NOCHECK ADD  CONSTRAINT [tb_venda$FKo7udal8yipfaugrtfwgyujuig] FOREIGN KEY([anuncio_id])
REFERENCES [reuso].[tb_anuncio] ([id])
GO
ALTER TABLE [reuso].[tb_venda] CHECK CONSTRAINT [tb_venda$FKo7udal8yipfaugrtfwgyujuig]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'reuso.estado_anuncio_base' , @level0type=N'SCHEMA',@level0name=N'reuso', @level1type=N'TABLE',@level1name=N'estado_anuncio_base'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'reuso.estado_venda_base' , @level0type=N'SCHEMA',@level0name=N'reuso', @level1type=N'TABLE',@level1name=N'estado_venda_base'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'reuso.tb_anuncio' , @level0type=N'SCHEMA',@level0name=N'reuso', @level1type=N'TABLE',@level1name=N'tb_anuncio'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'reuso.tb_evento' , @level0type=N'SCHEMA',@level0name=N'reuso', @level1type=N'TABLE',@level1name=N'tb_evento'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'reuso.tb_ingresso' , @level0type=N'SCHEMA',@level0name=N'reuso', @level1type=N'TABLE',@level1name=N'tb_ingresso'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'reuso.tb_pessoa_fisica' , @level0type=N'SCHEMA',@level0name=N'reuso', @level1type=N'TABLE',@level1name=N'tb_pessoa_fisica'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'reuso.tb_pessoa_juridica' , @level0type=N'SCHEMA',@level0name=N'reuso', @level1type=N'TABLE',@level1name=N'tb_pessoa_juridica'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'reuso.tb_telefone' , @level0type=N'SCHEMA',@level0name=N'reuso', @level1type=N'TABLE',@level1name=N'tb_telefone'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'reuso.tb_tipo_evento' , @level0type=N'SCHEMA',@level0name=N'reuso', @level1type=N'TABLE',@level1name=N'tb_tipo_evento'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'reuso.tb_venda' , @level0type=N'SCHEMA',@level0name=N'reuso', @level1type=N'TABLE',@level1name=N'tb_venda'
GO
USE [master]
GO
ALTER DATABASE [reusoDbFirst] SET  READ_WRITE 
GO
