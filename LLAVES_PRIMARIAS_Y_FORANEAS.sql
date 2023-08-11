USE [CONOCIMIENTO]
GO

/****** Object:  Table [dbo].[empleados.Departamentos]    Script Date: 11-08-2023 13:50:27 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[empleados.Departamentos](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](250) NULL,
 CONSTRAINT [PK_departamentyo] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO



CREATE TABLE [dbo].[empleados.Empleados](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](250) NULL,
	[salario] [decimal](18, 2) NULL,
	[IdDepartamento] [int] NULL,
 CONSTRAINT [PK_Empelados] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[empleados.Empleados]  WITH CHECK ADD FOREIGN KEY([IdDepartamento])
REFERENCES [dbo].[empleados.Departamentos] ([id])
GO

