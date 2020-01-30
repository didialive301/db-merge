/****** [USE]不用填寫 ******/
USE [dbShoppingForum]
GO

/****** Object:  討論區主表 ******/
/****** Object:  Table [dbo].[tForum]    Script Date: 2020/1/28 下午 08:23:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tForum](
	[fPostId] [int] IDENTITY(1,1) NOT NULL,
	[fUserId] [nvarchar](50) NOT NULL,
	[fPostTitle] [nvarchar](50) NOT NULL,
	[fPostContent] [nvarchar](max) NOT NULL,
	[fIsPost] [bit] NOT NULL,
	[fCreaTime] [datetime] NOT NULL,
	[fUpdateTime] [datetime] NOT NULL,
	[fEnableFlag] [bit] NOT NULL,
	[fEnableUserId] [nvarchar](50) NULL,
	[fDisableTime] [datetime] NULL,
	[fTopSeq] [int] NOT NULL,
	[fTotalViewCount] [int] NOT NULL,
	[fTotalReplyCount] [int] NOT NULL,
 CONSTRAINT [PK_tForum] PRIMARY KEY CLUSTERED 
(
	[fPostId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

/****** Object:  討論區數據表 ******/
/****** Object:  Table [dbo].[tForumAnalysis]    Script Date: 2020/1/28 下午 08:23:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tForumAnalysis](
	[fPostId] [int] NOT NULL,
	[fUserId] [nvarchar](50) NOT NULL,
	[fLikeHate] [bit] NULL,
	[fShareCount] [int] NOT NULL,
 CONSTRAINT [PK_tForumAnalysis] PRIMARY KEY CLUSTERED 
(
	[fPostId] ASC,
	[fUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  討論區權限表 ******/
/****** Object:  Table [dbo].[tForumAuth]    Script Date: 2020/1/28 下午 08:23:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tForumAuth](
	[fAccountId] [nvarchar](50) NOT NULL,
	[fAuthBlackList] [nvarchar](50) NULL,
	[fAuthPostFlag] [nvarchar](50) NULL,
	[fAuthReplyFlag] [nvarchar](50) NULL,
	[fAuthUpdatePostFlag] [nvarchar](50) NULL,
	[fAuthUpdateReplyFlag] [nvarchar](50) NULL,
	[fAuthDeletePostFlag] [nvarchar](50) NULL,
	[fAuthDeleteReplyFlag] [nvarchar](50) NULL
) ON [PRIMARY]
GO

/****** Object:  討論區回覆表 ******/
/****** Object:  Table [dbo].[tForumReply]    Script Date: 2020/1/28 下午 08:23:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tForumReply](
	[fPostId] [int] NOT NULL,
	[fReplyId] [nvarchar](50) NOT NULL,
	[fReplyTargetId] [nvarchar](50) NOT NULL,
	[fReplySeqNo] [int] NOT NULL,
	[fUserId] [nvarchar](50) NOT NULL,
	[fReplyTime] [datetime] NOT NULL,
	[fEnableFlag] [bit] NOT NULL,
	[fDeleteUserId] [nvarchar](50) NULL,
	[fContent] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_tForumReply] PRIMARY KEY CLUSTERED 
(
	[fPostId] ASC,
	[fReplyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

/****** Object:  討論區回覆分析表 ******/
/****** Object:  Table [dbo].[tForumReplyAnalysis]    Script Date: 2020/1/28 下午 08:23:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tForumReplyAnalysis](
	[fPostId] [int] NOT NULL,
	[fReplyId] [nvarchar](50) NOT NULL,
	[fUserId] [nvarchar](50) NOT NULL,
	[fLikeHate] [bit] NOT NULL,
 CONSTRAINT [PK_tForumReplyAnalysis] PRIMARY KEY CLUSTERED 
(
	[fPostId] ASC,
	[fReplyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** ---------------------------------------------------------------------------------------------------------- ******/
/****** table關聯設定 ******/
ALTER TABLE [dbo].[tForumAnalysis]  WITH CHECK ADD  CONSTRAINT [FK_tForumAnalysis_tForum] FOREIGN KEY([fPostId])
REFERENCES [dbo].[tForum] ([fPostId])
GO
ALTER TABLE [dbo].[tForumAnalysis] CHECK CONSTRAINT [FK_tForumAnalysis_tForum]
GO
ALTER TABLE [dbo].[tForumReply]  WITH CHECK ADD  CONSTRAINT [FK_tForumReply_tForum] FOREIGN KEY([fPostId])
REFERENCES [dbo].[tForum] ([fPostId])
GO
ALTER TABLE [dbo].[tForumReply] CHECK CONSTRAINT [FK_tForumReply_tForum]
GO
ALTER TABLE [dbo].[tForumReplyAnalysis]  WITH CHECK ADD  CONSTRAINT [FK_tForumReplyAnalysis_tForumReply] FOREIGN KEY([fPostId], [fReplyId])
REFERENCES [dbo].[tForumReply] ([fPostId], [fReplyId])
GO
ALTER TABLE [dbo].[tForumReplyAnalysis] CHECK CONSTRAINT [FK_tForumReplyAnalysis_tForumReply]
GO
