USE [News]
GO
/****** Object:  Table [dbo].[News]    Script Date: 21.04.2024 17:17:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[News](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](max) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[Date] [datetime] NOT NULL,
 CONSTRAINT [PK_News] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[News] ON 
GO
INSERT [dbo].[News] ([id], [Title], [Description], [Date]) VALUES (1, N'Время ожидания поездов на станциях БКЛ в метро Москвы сократилось почти вдвое', N'Основа парка БКЛ - новейшие российские поезда «Москва-2020», одни из самых удобных в мире: с широкими дверьми, со сквозным проходом
между вагонами, с USB-разъемами для зарядки гаджетов, тише предыдущих моделей.', CAST(N'2024-04-18T20:01:22.463' AS DateTime))
GO
INSERT [dbo].[News] ([id], [Title], [Description], [Date]) VALUES (2, N'2 новых участка «Парка Яуза» начали обустраивать в Москве', N'Сотрудники комплекса городского хозяйства Москвы начали обустройство двух новых участков будущего «Парка Яуза» на северо-востоке города, заявил заммэра столицы по вопросам ЖКХ и благоустройства Петр Бирюков', CAST(N'2024-04-18T20:01:46.147' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[News] OFF
GO
ALTER TABLE [dbo].[News] ADD  CONSTRAINT [DF_News_Date]  DEFAULT (getdate()) FOR [Date]
GO
