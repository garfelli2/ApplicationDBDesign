/****** Object:  Table [dbo].[Application]    Script Date: 11/20/2022 3:11:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Application](
	[UserID] [int] NOT NULL,
	[JobID] [int] NOT NULL,
	[Viewed] [int] NOT NULL,
	[Downloaded] [int] NOT NULL,
	[Interview] [int] NOT NULL,
	[Rejected] [int] NOT NULL,
	[Ghosted] [int] NOT NULL,
	[Offer] [int] NOT NULL,
 CONSTRAINT [PK_Application] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC,
	[JobID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Company]    Script Date: 11/20/2022 3:11:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Company](
	[CompanyID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Street] [nvarchar](50) NULL,
	[State] [nvarchar](2) NULL,
	[Zip] [nvarchar](10) NULL,
 CONSTRAINT [PK_Company] PRIMARY KEY CLUSTERED 
(
	[CompanyID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Job]    Script Date: 11/20/2022 3:11:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Job](
	[JobID] [int] NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[CompanyID] [int] NOT NULL,
 CONSTRAINT [PK_Job] PRIMARY KEY CLUSTERED 
(
	[JobID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Referral]    Script Date: 11/20/2022 3:11:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Referral](
	[ReferralID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[UserID] [int] NULL,
 CONSTRAINT [PK_Referral] PRIMARY KEY CLUSTERED 
(
	[ReferralID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 11/20/2022 3:11:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Application] ADD  CONSTRAINT [DF_Application_Viewed]  DEFAULT ((0)) FOR [Viewed]
GO
ALTER TABLE [dbo].[Application] ADD  CONSTRAINT [DF_Application_Downloaded]  DEFAULT ((0)) FOR [Downloaded]
GO
ALTER TABLE [dbo].[Application] ADD  CONSTRAINT [DF_Application_Interview]  DEFAULT ((0)) FOR [Interview]
GO
ALTER TABLE [dbo].[Application] ADD  CONSTRAINT [DF_Application_Rejected]  DEFAULT ((0)) FOR [Rejected]
GO
ALTER TABLE [dbo].[Application] ADD  CONSTRAINT [DF_Application_Ghosted]  DEFAULT ((0)) FOR [Ghosted]
GO
ALTER TABLE [dbo].[Application] ADD  CONSTRAINT [DF_Application_Offer]  DEFAULT ((0)) FOR [Offer]
GO
ALTER TABLE [dbo].[Application]  WITH CHECK ADD  CONSTRAINT [FK_Job_Application] FOREIGN KEY([JobID])
REFERENCES [dbo].[Job] ([JobID])
GO
ALTER TABLE [dbo].[Application] CHECK CONSTRAINT [FK_Job_Application]
GO
ALTER TABLE [dbo].[Application]  WITH CHECK ADD  CONSTRAINT [FK_User_Application] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Application] CHECK CONSTRAINT [FK_User_Application]
GO
ALTER TABLE [dbo].[Job]  WITH CHECK ADD  CONSTRAINT [FK_Job_Company] FOREIGN KEY([CompanyID])
REFERENCES [dbo].[Company] ([CompanyID])
GO
ALTER TABLE [dbo].[Job] CHECK CONSTRAINT [FK_Job_Company]
GO
ALTER TABLE [dbo].[Referral]  WITH CHECK ADD  CONSTRAINT [FK_User_Referral] FOREIGN KEY([ReferralID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Referral] CHECK CONSTRAINT [FK_User_Referral]
GO
