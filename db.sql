USE [master]
GO
/****** Object:  Database [dbShoppingForum]    Script Date: 2020/1/30 下午 04:20:43 ******/
CREATE DATABASE [dbShoppingForum]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'dbShoppingForum', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\dbShoppingForum.mdf' , SIZE = 512000KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'dbShoppingForum_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\dbShoppingForum_log.ldf' , SIZE = 65536KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [dbShoppingForum] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [dbShoppingForum].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [dbShoppingForum] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [dbShoppingForum] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [dbShoppingForum] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [dbShoppingForum] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [dbShoppingForum] SET ARITHABORT OFF 
GO
ALTER DATABASE [dbShoppingForum] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [dbShoppingForum] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [dbShoppingForum] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [dbShoppingForum] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [dbShoppingForum] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [dbShoppingForum] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [dbShoppingForum] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [dbShoppingForum] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [dbShoppingForum] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [dbShoppingForum] SET  DISABLE_BROKER 
GO
ALTER DATABASE [dbShoppingForum] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [dbShoppingForum] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [dbShoppingForum] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [dbShoppingForum] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [dbShoppingForum] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [dbShoppingForum] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [dbShoppingForum] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [dbShoppingForum] SET RECOVERY FULL 
GO
ALTER DATABASE [dbShoppingForum] SET  MULTI_USER 
GO
ALTER DATABASE [dbShoppingForum] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [dbShoppingForum] SET DB_CHAINING OFF 
GO
ALTER DATABASE [dbShoppingForum] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [dbShoppingForum] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [dbShoppingForum] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'dbShoppingForum', N'ON'
GO
ALTER DATABASE [dbShoppingForum] SET QUERY_STORE = OFF
GO
USE [dbShoppingForum]
GO
/****** Object:  Table [dbo].[tCategory]    Script Date: 2020/1/30 下午 04:20:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tCategory](
	[fCategoryID] [int] IDENTITY(1,1) NOT NULL,
	[fCategoryName] [nvarchar](50) NULL,
 CONSTRAINT [PK_tCategory] PRIMARY KEY CLUSTERED 
(
	[fCategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tEfficacy]    Script Date: 2020/1/30 下午 04:20:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tEfficacy](
	[fEfficacyID] [int] IDENTITY(1,1) NOT NULL,
	[fEfficacyName] [nvarchar](50) NULL,
 CONSTRAINT [PK_tEffcacy] PRIMARY KEY CLUSTERED 
(
	[fEfficacyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  討論區主表 ******/
/****** Object:  Table [dbo].[tForum]    Script Date: 2020/1/30 下午 04:20:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tForum](
	[fPostId] [int] IDENTITY(1,1) NOT NULL,
	[fUserId] [nvarchar](20) NOT NULL,
	[fPostTitle] [nvarchar](50) NOT NULL,
	[fPostContent] [nvarchar](max) NOT NULL,
	[fIsPost] [bit] NOT NULL,
	[fCreaTime] [datetime] NOT NULL,
	[fUpdateTime] [datetime] NOT NULL,
	[fEnableFlag] [bit] NOT NULL,
	[fEnableUserId] [nvarchar](20) NULL,
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
/****** Object:  Table [dbo].[tForumAnalysis]    Script Date: 2020/1/30 下午 04:20:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tForumAnalysis](
	[fPostId] [int] NOT NULL,
	[fUserId] [nvarchar](20) NOT NULL,
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
/****** Object:  Table [dbo].[tForumAuth]    Script Date: 2020/1/30 下午 04:20:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tForumAuth](
	[fUserId] [nvarchar](20) NOT NULL,
	[fAuthBlackList] [nvarchar](50) NULL,
	[fAuthPostFlag] [nvarchar](50) NULL,
	[fAuthReplyFlag] [nvarchar](50) NULL,
	[fAuthUpdatePostFlag] [nvarchar](50) NULL,
	[fAuthUpdateReplyFlag] [nvarchar](50) NULL,
	[fAuthDeletePostFlag] [nvarchar](50) NULL,
	[fAuthDeleteReplyFlag] [nvarchar](50) NULL,
 CONSTRAINT [PK_tForumAuth] PRIMARY KEY CLUSTERED 
(
	[fUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  討論區回覆表 ******/
/****** Object:  Table [dbo].[tForumReply]    Script Date: 2020/1/30 下午 04:20:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tForumReply](
	[fPostId] [int] NOT NULL,
	[fReplyId] [nvarchar](50) NOT NULL,
	[fReplyTargetId] [nvarchar](50) NOT NULL,
	[fReplySeqNo] [int] NOT NULL,
	[fUserId] [nvarchar](20) NOT NULL,
	[fReplyTime] [datetime] NOT NULL,
	[fEnableFlag] [bit] NOT NULL,
	[fDeleteUserId] [nvarchar](20) NULL,
	[fContent] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_tForumReply] PRIMARY KEY CLUSTERED 
(
	[fPostId] ASC,
	[fReplyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

/****** Object:  討論區回覆分析表 ******/
/****** Object:  Table [dbo].[tForumReplyAnalysis]    Script Date: 2020/1/30 下午 04:20:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tForumReplyAnalysis](
	[fPostId] [int] NOT NULL,
	[fReplyId] [nvarchar](50) NOT NULL,
	[fUserId] [nvarchar](20) NOT NULL,
	[fLikeHate] [bit] NOT NULL,
 CONSTRAINT [PK_tForumReplyAnalysis] PRIMARY KEY CLUSTERED 
(
	[fPostId] ASC,
	[fReplyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tNote]    Script Date: 2020/1/30 下午 04:20:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tNote](
	[fNoteID] [int] IDENTITY(1,1) NOT NULL,
	[fNoteName] [nvarchar](50) NULL,
 CONSTRAINT [PK_tNote] PRIMARY KEY CLUSTERED 
(
	[fNoteID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tOrder]    Script Date: 2020/1/30 下午 04:20:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tOrder](
	[fOrderId] [bigint] NOT NULL,
	[fUserId] [nvarchar](20) NOT NULL,
	[fOrderDate] [datetimeoffset](7) NOT NULL,
	[fShippedDate] [datetimeoffset](7) NULL,
	[fRequiredDate] [datetimeoffset](7) NULL,
	[fScore] [int] NULL,
	[fOrderCheck] [bit] NULL,
	[fConsigneeName] [nchar](10) NULL,
	[fConsigneeTelephone] [nvarchar](50) NULL,
	[fConsigneeCellPhone] [nvarchar](50) NULL,
	[fConsigneeAddress] [nvarchar](50) NULL,
	[fOrderCompanyTitle] [nvarchar](50) NULL,
	[fOrderTaxIdDNumber] [int] NULL,
	[fOrderPostScript] [nvarchar](50) NULL,
 CONSTRAINT [PK_tOrder] PRIMARY KEY CLUSTERED 
(
	[fOrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tOrderDetail]    Script Date: 2020/1/30 下午 04:20:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tOrderDetail](
	[fOrderDetailId] [int] IDENTITY(1,1) NOT NULL,
	[fOrderId] [bigint] NOT NULL,
	[fProductId] [int] NOT NULL,
	[fOrderQuantity] [int] NULL,
	[fPayment] [nvarchar](50) NULL,
	[fOrderDetailCheck] [bit] NULL,
 CONSTRAINT [PK_tOrderDetail] PRIMARY KEY CLUSTERED 
(
	[fOrderDetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tPart]    Script Date: 2020/1/30 下午 04:20:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tPart](
	[fPartID] [int] IDENTITY(1,1) NOT NULL,
	[fPartName] [nvarchar](50) NULL,
 CONSTRAINT [PK_tPart] PRIMARY KEY CLUSTERED 
(
	[fPartID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tProdEfficacyRelation]    Script Date: 2020/1/30 下午 04:20:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tProdEfficacyRelation](
	[fProductID] [int] NOT NULL,
	[fEfficacyID] [int] NOT NULL,
 CONSTRAINT [PK_tEfficacy] PRIMARY KEY CLUSTERED 
(
	[fProductID] ASC,
	[fEfficacyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tProduct]    Script Date: 2020/1/30 下午 04:20:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tProduct](
	[fProductID] [int] IDENTITY(1,1) NOT NULL,
	[fProductChName] [nvarchar](50) NOT NULL,
	[fProductDesc] [nvarchar](max) NULL,
	[fUnitPrice] [int] NULL,
	[fQuantityPerUnit] [nvarchar](50) NULL,
	[fUnitsInStock] [int] NULL,
	[fUnitsOnOrder] [int] NULL,
	[fReorderLevel] [int] NULL,
	[fDiscontinued] [bit] NULL,
	[fPartID] [int] NOT NULL,
	[fNoteID] [int] NOT NULL,
	[fCategoryID] [int] NOT NULL,
 CONSTRAINT [PK_tProduct] PRIMARY KEY CLUSTERED 
(
	[fProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tProductImage]    Script Date: 2020/1/30 下午 04:20:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tProductImage](
	[fProductID] [int] NOT NULL,
	[fProductImageId] [int] NOT NULL,
	[fProductImagePath] [nvarchar](max) NULL,
 CONSTRAINT [PK_tProductImage] PRIMARY KEY CLUSTERED 
(
	[fProductID] ASC,
	[fProductImageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tQuestion]    Script Date: 2020/1/30 下午 04:20:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tQuestion](
	[fQuestionId] [int] IDENTITY(1,1) NOT NULL,
	[fQuestionName] [nvarchar](50) NULL,
	[fQuestion] [nvarchar](max) NULL,
	[fAnswer] [nvarchar](50) NOT NULL,
	[fItemA] [nvarchar](50) NULL,
	[fItemB] [nvarchar](50) NULL,
	[fItemC] [nvarchar](50) NULL,
	[fItemD] [nvarchar](50) NULL,
	[fItemE] [nvarchar](50) NULL,
 CONSTRAINT [PK_tQuestion] PRIMARY KEY CLUSTERED 
(
	[fQuestionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tScore]    Script Date: 2020/1/30 下午 04:20:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tScore](
	[fUserId] [nvarchar](20) NOT NULL,
	[fScore] [int] NULL,
	[fActiveScore] [int] NULL,
	[fQuestionScore] [int] NULL,
	[fScoreDate] [datetime] NULL,
	[fAuthTestFlag] [bit] NULL,
 CONSTRAINT [PK_tScore] PRIMARY KEY CLUSTERED 
(
	[fUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tShoppingCart]    Script Date: 2020/1/30 下午 04:20:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tShoppingCart](
	[fBasketId] [int] NOT NULL,
	[fUserId] [nvarchar](20) NOT NULL,
	[fProductID] [int] NOT NULL,
	[fQuantity] [smallint] NOT NULL,
	[fAddTime] [datetime] NOT NULL,
	[fStatus] [int] NOT NULL,
 CONSTRAINT [PK_tShoppingCart] PRIMARY KEY CLUSTERED 
(
	[fBasketId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tShoppingStatus]    Script Date: 2020/1/30 下午 04:20:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tShoppingStatus](
	[fStatus] [int] IDENTITY(1,1) NOT NULL,
	[fStatusName] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_tShoppingStatus] PRIMARY KEY CLUSTERED 
(
	[fStatus] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tTest]    Script Date: 2020/1/30 下午 04:20:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tTest](
	[fTestId] [int] IDENTITY(1,1) NOT NULL,
	[fUserId] [nvarchar](20) NOT NULL,
	[fQuestionId] [int] NOT NULL,
	[fTestStar] [datetime] NULL,
	[fTestEnd] [datetime] NULL,
	[fTestCost] [datetime] NULL,
	[fQuestionCount] [int] NULL,
	[fCorrectCount] [int] NULL,
	[fScoreDate] [datetime] NULL,
	[fQuestionScore] [int] NULL,
 CONSTRAINT [PK_tTest] PRIMARY KEY CLUSTERED 
(
	[fTestId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tUser]    Script Date: 2020/1/30 下午 04:20:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tUser](
	[fUserId] [nvarchar](20) NOT NULL,
	[fPassword] [nvarchar](50) NOT NULL,
	[fPasswordSalt] [nvarchar](max) NOT NULL,
	[fChkNum] [nvarchar](50) NOT NULL,
	[fResetPwCode] [nvarchar](50) NOT NULL,
	[fLoginTime] [datetimeoffset](7) NOT NULL,
	[fLogoutTime] [datetimeoffset](7) NOT NULL,
 CONSTRAINT [PK_tUser] PRIMARY KEY CLUSTERED 
(
	[fUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tUserAuth]    Script Date: 2020/1/30 下午 04:20:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tUserAuth](
	[fUserId] [nvarchar](20) NOT NULL,
	[fAuth] [nvarchar](50) NOT NULL,
	[fAuthPost] [bit] NOT NULL,
	[fAuthReply] [bit] NOT NULL,
 CONSTRAINT [PK_tUserAuth] PRIMARY KEY CLUSTERED 
(
	[fUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tUserFavorite]    Script Date: 2020/1/30 下午 04:20:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tUserFavorite](
	[fUserId] [nvarchar](20) NOT NULL,
	[fPostId] [int] NOT NULL,
 CONSTRAINT [PK_tUserFavorite] PRIMARY KEY CLUSTERED 
(
	[fUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tUserProfile]    Script Date: 2020/1/30 下午 04:20:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tUserProfile](
	[fUserId] [nvarchar](20) NOT NULL,
	[fName] [nvarchar](50) NOT NULL,
	[fGender] [nvarchar](50) NULL,
	[fBirthday] [datetimeoffset](7) NOT NULL,
	[fTel] [nvarchar](50) NULL,
	[fPhone] [nvarchar](50) NOT NULL,
	[fEmail] [nvarchar](50) NOT NULL,
	[fCity] [nvarchar](50) NOT NULL,
	[fAddress] [nvarchar](50) NOT NULL,
	[fPhoto] [nvarchar](max) NULL,
	[fCreateDate] [datetime] NULL,
	[fScore] [int] NULL,
 CONSTRAINT [PK_tUserProfile] PRIMARY KEY CLUSTERED 
(
	[fUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

/****** table關聯設定 ******/
ALTER TABLE [dbo].[tForum]  WITH CHECK ADD  CONSTRAINT [FK_tForum_tUserProfile] FOREIGN KEY([fUserId])
REFERENCES [dbo].[tUserProfile] ([fUserId])
GO
ALTER TABLE [dbo].[tForum] CHECK CONSTRAINT [FK_tForum_tUserProfile]
GO
ALTER TABLE [dbo].[tForum]  WITH CHECK ADD  CONSTRAINT [FK_tForum_tUserProfile1] FOREIGN KEY([fEnableUserId])
REFERENCES [dbo].[tUserProfile] ([fUserId])
GO
ALTER TABLE [dbo].[tForum] CHECK CONSTRAINT [FK_tForum_tUserProfile1]
GO
ALTER TABLE [dbo].[tForumAnalysis]  WITH CHECK ADD  CONSTRAINT [FK_tForumAnalysis_tForum] FOREIGN KEY([fPostId])
REFERENCES [dbo].[tForum] ([fPostId])
GO
ALTER TABLE [dbo].[tForumAnalysis] CHECK CONSTRAINT [FK_tForumAnalysis_tForum]
GO
ALTER TABLE [dbo].[tForumAnalysis]  WITH CHECK ADD  CONSTRAINT [FK_tForumAnalysis_tUserProfile] FOREIGN KEY([fUserId])
REFERENCES [dbo].[tUserProfile] ([fUserId])
GO
ALTER TABLE [dbo].[tForumAnalysis] CHECK CONSTRAINT [FK_tForumAnalysis_tUserProfile]
GO
ALTER TABLE [dbo].[tForumAuth]  WITH CHECK ADD  CONSTRAINT [FK_tForumAuth_tUserProfile] FOREIGN KEY([fUserId])
REFERENCES [dbo].[tUserProfile] ([fUserId])
GO
ALTER TABLE [dbo].[tForumAuth] CHECK CONSTRAINT [FK_tForumAuth_tUserProfile]
GO
ALTER TABLE [dbo].[tForumReply]  WITH CHECK ADD  CONSTRAINT [FK_tForumReply_tForum] FOREIGN KEY([fPostId])
REFERENCES [dbo].[tForum] ([fPostId])
GO
ALTER TABLE [dbo].[tForumReply] CHECK CONSTRAINT [FK_tForumReply_tForum]
GO
ALTER TABLE [dbo].[tForumReply]  WITH CHECK ADD  CONSTRAINT [FK_tForumReply_tUserProfile] FOREIGN KEY([fUserId])
REFERENCES [dbo].[tUserProfile] ([fUserId])
GO
ALTER TABLE [dbo].[tForumReply] CHECK CONSTRAINT [FK_tForumReply_tUserProfile]
GO
ALTER TABLE [dbo].[tForumReply]  WITH CHECK ADD  CONSTRAINT [FK_tForumReply_tUserProfile1] FOREIGN KEY([fDeleteUserId])
REFERENCES [dbo].[tUserProfile] ([fUserId])
GO
ALTER TABLE [dbo].[tForumReply] CHECK CONSTRAINT [FK_tForumReply_tUserProfile1]
GO
ALTER TABLE [dbo].[tForumReplyAnalysis]  WITH CHECK ADD  CONSTRAINT [FK_tForumReplyAnalysis_tForumReply] FOREIGN KEY([fPostId], [fReplyId])
REFERENCES [dbo].[tForumReply] ([fPostId], [fReplyId])
GO
ALTER TABLE [dbo].[tForumReplyAnalysis] CHECK CONSTRAINT [FK_tForumReplyAnalysis_tForumReply]
GO
ALTER TABLE [dbo].[tForumReplyAnalysis]  WITH CHECK ADD  CONSTRAINT [FK_tForumReplyAnalysis_tUserProfile] FOREIGN KEY([fUserId])
REFERENCES [dbo].[tUserProfile] ([fUserId])
GO
ALTER TABLE [dbo].[tForumReplyAnalysis] CHECK CONSTRAINT [FK_tForumReplyAnalysis_tUserProfile]
GO
ALTER TABLE [dbo].[tOrder]  WITH CHECK ADD  CONSTRAINT [FK_tOrder_tUser] FOREIGN KEY([fUserId])
REFERENCES [dbo].[tUserProfile] ([fUserId])
GO
ALTER TABLE [dbo].[tOrder] CHECK CONSTRAINT [FK_tOrder_tUser]
GO
ALTER TABLE [dbo].[tOrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_tOrderDetail_tOrder] FOREIGN KEY([fOrderId])
REFERENCES [dbo].[tOrder] ([fOrderId])
GO
ALTER TABLE [dbo].[tOrderDetail] CHECK CONSTRAINT [FK_tOrderDetail_tOrder]
GO
ALTER TABLE [dbo].[tOrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_tOrderDetail_tProduct] FOREIGN KEY([fProductId])
REFERENCES [dbo].[tProduct] ([fProductID])
GO
ALTER TABLE [dbo].[tOrderDetail] CHECK CONSTRAINT [FK_tOrderDetail_tProduct]
GO
ALTER TABLE [dbo].[tProdEfficacyRelation]  WITH CHECK ADD  CONSTRAINT [FK_tProdEfficacyRelation_tEffcacy] FOREIGN KEY([fEfficacyID])
REFERENCES [dbo].[tEfficacy] ([fEfficacyID])
GO
ALTER TABLE [dbo].[tProdEfficacyRelation] CHECK CONSTRAINT [FK_tProdEfficacyRelation_tEffcacy]
GO
ALTER TABLE [dbo].[tProdEfficacyRelation]  WITH CHECK ADD  CONSTRAINT [FK_tProdEfficacyRelation_tProduct] FOREIGN KEY([fProductID])
REFERENCES [dbo].[tProduct] ([fProductID])
GO
ALTER TABLE [dbo].[tProdEfficacyRelation] CHECK CONSTRAINT [FK_tProdEfficacyRelation_tProduct]
GO
ALTER TABLE [dbo].[tProduct]  WITH CHECK ADD  CONSTRAINT [FK_tProduct_tCategory] FOREIGN KEY([fCategoryID])
REFERENCES [dbo].[tCategory] ([fCategoryID])
GO
ALTER TABLE [dbo].[tProduct] CHECK CONSTRAINT [FK_tProduct_tCategory]
GO
ALTER TABLE [dbo].[tProduct]  WITH CHECK ADD  CONSTRAINT [FK_tProduct_tNote] FOREIGN KEY([fNoteID])
REFERENCES [dbo].[tNote] ([fNoteID])
GO
ALTER TABLE [dbo].[tProduct] CHECK CONSTRAINT [FK_tProduct_tNote]
GO
ALTER TABLE [dbo].[tProduct]  WITH CHECK ADD  CONSTRAINT [FK_tProduct_tPart] FOREIGN KEY([fPartID])
REFERENCES [dbo].[tPart] ([fPartID])
GO
ALTER TABLE [dbo].[tProduct] CHECK CONSTRAINT [FK_tProduct_tPart]
GO
ALTER TABLE [dbo].[tProductImage]  WITH CHECK ADD  CONSTRAINT [FK_tProductImage_tProduct] FOREIGN KEY([fProductID])
REFERENCES [dbo].[tProduct] ([fProductID])
GO
ALTER TABLE [dbo].[tProductImage] CHECK CONSTRAINT [FK_tProductImage_tProduct]
GO
ALTER TABLE [dbo].[tScore]  WITH CHECK ADD  CONSTRAINT [FK_tScore_tUserProfile] FOREIGN KEY([fUserId])
REFERENCES [dbo].[tUserProfile] ([fUserId])
GO
ALTER TABLE [dbo].[tScore] CHECK CONSTRAINT [FK_tScore_tUserProfile]
GO
ALTER TABLE [dbo].[tShoppingCart]  WITH CHECK ADD  CONSTRAINT [FK_tShoppingCart_tProduct] FOREIGN KEY([fProductID])
REFERENCES [dbo].[tProduct] ([fProductID])
GO
ALTER TABLE [dbo].[tShoppingCart] CHECK CONSTRAINT [FK_tShoppingCart_tProduct]
GO
ALTER TABLE [dbo].[tShoppingCart]  WITH CHECK ADD  CONSTRAINT [FK_tShoppingCart_tShoppingStatus] FOREIGN KEY([fStatus])
REFERENCES [dbo].[tShoppingStatus] ([fStatus])
GO
ALTER TABLE [dbo].[tShoppingCart] CHECK CONSTRAINT [FK_tShoppingCart_tShoppingStatus]
GO
ALTER TABLE [dbo].[tShoppingCart]  WITH CHECK ADD  CONSTRAINT [FK_tShoppingCart_tUserProfile] FOREIGN KEY([fUserId])
REFERENCES [dbo].[tUserProfile] ([fUserId])
GO
ALTER TABLE [dbo].[tShoppingCart] CHECK CONSTRAINT [FK_tShoppingCart_tUserProfile]
GO
ALTER TABLE [dbo].[tTest]  WITH CHECK ADD  CONSTRAINT [FK_tTest_fQuestionId] FOREIGN KEY([fQuestionId])
REFERENCES [dbo].[tQuestion] ([fQuestionId])
GO
ALTER TABLE [dbo].[tTest] CHECK CONSTRAINT [FK_tTest_fQuestionId]
GO
ALTER TABLE [dbo].[tTest]  WITH CHECK ADD  CONSTRAINT [FK_tTest_fUserId] FOREIGN KEY([fUserId])
REFERENCES [dbo].[tScore] ([fUserId])
GO
ALTER TABLE [dbo].[tTest] CHECK CONSTRAINT [FK_tTest_fUserId]
GO
ALTER TABLE [dbo].[tTest]  WITH CHECK ADD  CONSTRAINT [FK_tTest_tUserProfile] FOREIGN KEY([fUserId])
REFERENCES [dbo].[tUserProfile] ([fUserId])
GO
ALTER TABLE [dbo].[tTest] CHECK CONSTRAINT [FK_tTest_tUserProfile]
GO
ALTER TABLE [dbo].[tUser]  WITH CHECK ADD  CONSTRAINT [FK_tUser_tUserProfile] FOREIGN KEY([fUserId])
REFERENCES [dbo].[tUserProfile] ([fUserId])
GO
ALTER TABLE [dbo].[tUser] CHECK CONSTRAINT [FK_tUser_tUserProfile]
GO
ALTER TABLE [dbo].[tUserAuth]  WITH CHECK ADD  CONSTRAINT [FK_tUserAuth_tUser] FOREIGN KEY([fUserId])
REFERENCES [dbo].[tUser] ([fUserId])
GO
ALTER TABLE [dbo].[tUserAuth] CHECK CONSTRAINT [FK_tUserAuth_tUser]
GO
ALTER TABLE [dbo].[tUserFavorite]  WITH CHECK ADD  CONSTRAINT [FK_tUserFavorite_tUser] FOREIGN KEY([fUserId])
REFERENCES [dbo].[tUser] ([fUserId])
GO
ALTER TABLE [dbo].[tUserFavorite] CHECK CONSTRAINT [FK_tUserFavorite_tUser]
GO
ALTER TABLE [dbo].[tUserFavorite]  WITH CHECK ADD  CONSTRAINT [FK_tUserFavorite_tUserFavorite] FOREIGN KEY([fPostId])
REFERENCES [dbo].[tForum] ([fPostId])
GO
ALTER TABLE [dbo].[tUserFavorite] CHECK CONSTRAINT [FK_tUserFavorite_tUserFavorite]
GO
USE [master]
GO
ALTER DATABASE [dbShoppingForum] SET  READ_WRITE 
GO
