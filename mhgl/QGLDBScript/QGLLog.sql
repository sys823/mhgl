USE [QGLLog]
GO
/****** 对象:  Table [dbo].[LogYuanBao]    脚本日期: 12/02/2011 12:05:37 ******/
DROP TABLE [dbo].[LogYuanBao]
GO
/****** 对象:  Table [dbo].[LogCharExp]    脚本日期: 12/02/2011 12:05:37 ******/
DROP TABLE [dbo].[LogCharExp]
GO
/****** 对象:  Table [dbo].[LogMoney1]    脚本日期: 12/02/2011 12:05:37 ******/
DROP TABLE [dbo].[LogMoney1]
GO
/****** 对象:  Table [dbo].[LogSMoney]    脚本日期: 12/02/2011 12:05:38 ******/
DROP TABLE [dbo].[LogSMoney]
GO
/****** 对象:  Table [dbo].[LogMix]    脚本日期: 12/02/2011 12:05:40 ******/
DROP TABLE [dbo].[LogMix]
GO
/****** 对象:  Table [dbo].[LogGoodness]    脚本日期: 12/02/2011 12:05:40 ******/
DROP TABLE [dbo].[LogGoodness]
GO
/****** 对象:  Table [dbo].[LogHack]    脚本日期: 12/02/2011 12:05:41 ******/
DROP TABLE [dbo].[LogHack]
GO
/****** 对象:  Table [dbo].[LogSellYuanBao]    脚本日期: 12/02/2011 12:05:42 ******/
DROP TABLE [dbo].[LogSellYuanBao]
GO
/****** 对象:  Table [dbo].[LogHonor]    脚本日期: 12/02/2011 12:05:42 ******/
DROP TABLE [dbo].[LogHonor]
GO
/****** 对象:  Table [dbo].[LogPartner]    脚本日期: 12/02/2011 12:05:43 ******/
DROP TABLE [dbo].[LogPartner]
GO
/****** 对象:  Table [dbo].[LogManor]    脚本日期: 12/02/2011 12:05:43 ******/
DROP TABLE [dbo].[LogManor]
GO
/****** 对象:  Table [dbo].[LogGenerationAcc]    脚本日期: 12/02/2011 12:05:44 ******/
DROP TABLE [dbo].[LogGenerationAcc]
GO
/****** 对象:  Table [dbo].[LogGuildDonate]    脚本日期: 12/02/2011 12:05:44 ******/
DROP TABLE [dbo].[LogGuildDonate]
GO
/****** 对象:  Table [dbo].[LogMoney]    脚本日期: 12/02/2011 12:05:45 ******/
DROP TABLE [dbo].[LogMoney]
GO
/****** 对象:  Table [dbo].[LogAccount]    脚本日期: 12/02/2011 12:05:45 ******/
DROP TABLE [dbo].[LogAccount]
GO
/****** 对象:  Table [dbo].[LogCharacter]    脚本日期: 12/02/2011 12:05:46 ******/
DROP TABLE [dbo].[LogCharacter]
GO
/****** 对象:  Table [dbo].[LogItem]    脚本日期: 12/02/2011 12:05:46 ******/
DROP TABLE [dbo].[LogItem]
GO
/****** 对象:  Table [dbo].[LogQuest]    脚本日期: 12/02/2011 12:05:47 ******/
DROP TABLE [dbo].[LogQuest]
GO
/****** 对象:  Table [dbo].[LogPlayerCount]    脚本日期: 12/02/2011 12:05:47 ******/
DROP TABLE [dbo].[LogPlayerCount]
GO
/****** 对象:  Table [dbo].[LogGiftBox]    脚本日期: 12/02/2011 12:05:48 ******/
DROP TABLE [dbo].[LogGiftBox]
GO
/****** 对象:  Table [dbo].[LogChargeShop]    脚本日期: 12/02/2011 12:05:48 ******/
DROP TABLE [dbo].[LogChargeShop]
GO
/****** 对象:  Table [dbo].[LogExchange]    脚本日期: 12/02/2011 12:05:49 ******/
DROP TABLE [dbo].[LogExchange]
GO
/****** 对象:  Table [dbo].[LogCheat]    脚本日期: 12/02/2011 12:05:50 ******/
DROP TABLE [dbo].[LogCheat]
GO
/****** 对象:  User [gmtools]    脚本日期: 12/02/2011 12:05:36 ******/
DROP USER [gmtools]
GO
/****** 对象:  User [check]    脚本日期: 12/02/2011 12:05:36 ******/
DROP USER [check]
GO
/****** 对象:  User [boss]    脚本日期: 12/02/2011 12:05:36 ******/
DROP USER [boss]
GO
/****** 对象:  User [gmtools]    脚本日期: 12/02/2011 12:05:36 ******/
CREATE USER [gmtools] FOR LOGIN [gmtools] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** 对象:  User [check]    脚本日期: 12/02/2011 12:05:36 ******/
CREATE USER [check] FOR LOGIN [check] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** 对象:  User [boss]    脚本日期: 12/02/2011 12:05:36 ******/
CREATE USER [boss] FOR LOGIN [boss] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** 对象:  Table [dbo].[LogYuanBao]    脚本日期: 12/02/2011 12:05:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LogYuanBao](
	[log_id] [bigint] IDENTITY(1,1) NOT NULL,
	[sess_id] [nchar](12) COLLATE Chinese_PRC_CI_AS NOT NULL,
	[acct_id] [bigint] NOT NULL,
	[char_id] [bigint] NOT NULL,
	[useplace] [tinyint] NOT NULL,
	[yuanbao] [int] NOT NULL,
	[create_time] [datetime] NOT NULL,
 CONSTRAINT [PK_LogYuanBao] PRIMARY KEY CLUSTERED 
(
	[log_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** 对象:  Table [dbo].[LogCharExp]    脚本日期: 12/02/2011 12:05:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LogCharExp](
	[log_id] [bigint] IDENTITY(1,1) NOT NULL,
	[exp_type] [int] NOT NULL,
	[exp_value] [bigint] NOT NULL,
	[acct_id] [bigint] NOT NULL,
	[char_id] [bigint] NOT NULL,
	[create_time] [datetime] NOT NULL,
 CONSTRAINT [PK_LogCharExp] PRIMARY KEY CLUSTERED 
(
	[log_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** 对象:  Table [dbo].[LogMoney1]    脚本日期: 12/02/2011 12:05:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LogMoney1](
	[log_id] [bigint] IDENTITY(1,1) NOT NULL,
	[acct_id] [bigint] NOT NULL,
	[char_id] [bigint] NOT NULL,
	[source] [smallint] NOT NULL,
	[money] [int] NOT NULL,
	[create_time] [datetime] NOT NULL,
	[totalMoney] [bigint] NOT NULL CONSTRAINT [DF_LogMoney_totalMoney]  DEFAULT ((0)),
 CONSTRAINT [PK_LogMoney] PRIMARY KEY CLUSTERED 
(
	[log_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** 对象:  Table [dbo].[LogSMoney]    脚本日期: 12/02/2011 12:05:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LogSMoney](
	[log_id] [bigint] IDENTITY(1,1) NOT NULL,
	[acct_id] [bigint] NOT NULL,
	[char_id] [bigint] NOT NULL,
	[source] [smallint] NOT NULL,
	[smoney] [int] NOT NULL,
	[create_time] [datetime] NOT NULL,
 CONSTRAINT [PK_LogSMoney] PRIMARY KEY CLUSTERED 
(
	[log_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** 对象:  Table [dbo].[LogMix]    脚本日期: 12/02/2011 12:05:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LogMix](
	[log_id] [bigint] IDENTITY(1,1) NOT NULL,
	[sess_id] [nchar](12) COLLATE Chinese_PRC_CI_AS NOT NULL,
	[char_id] [bigint] NOT NULL,
	[process_type] [tinyint] NOT NULL,
	[result_item_id] [bigint] NOT NULL,
	[result_item_count] [smallint] NOT NULL,
	[source_item_uid1] [bigint] NOT NULL,
	[source_item_id1] [int] NOT NULL,
	[source_item_count1] [smallint] NOT NULL,
	[source_item_uid2] [bigint] NOT NULL,
	[source_item_id2] [int] NOT NULL,
	[source_item_count2] [smallint] NOT NULL,
	[source_item_uid3] [bigint] NOT NULL,
	[source_item_id3] [int] NOT NULL,
	[source_item_count3] [smallint] NOT NULL,
	[source_item_uid4] [bigint] NOT NULL,
	[source_item_id4] [int] NOT NULL,
	[source_item_count4] [smallint] NOT NULL,
	[source_item_uid5] [bigint] NOT NULL,
	[source_item_id5] [int] NOT NULL,
	[source_item_count5] [smallint] NOT NULL,
	[source_item_uid6] [bigint] NOT NULL,
	[source_item_id6] [int] NOT NULL,
	[source_item_count6] [smallint] NOT NULL,
	[source_item_uid7] [bigint] NOT NULL,
	[source_item_id7] [int] NOT NULL,
	[source_item_count7] [smallint] NOT NULL,
	[source_item_uid8] [bigint] NOT NULL,
	[source_item_id8] [int] NOT NULL,
	[source_item_count8] [smallint] NOT NULL,
	[create_time] [datetime] NOT NULL,
 CONSTRAINT [PK_LogMix] PRIMARY KEY CLUSTERED 
(
	[log_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** 对象:  Table [dbo].[LogGoodness]    脚本日期: 12/02/2011 12:05:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LogGoodness](
	[log_id] [bigint] IDENTITY(1,1) NOT NULL,
	[acct_id] [bigint] NOT NULL,
	[char_id] [bigint] NOT NULL,
	[source] [smallint] NOT NULL,
	[goodness] [int] NOT NULL,
	[create_time] [datetime] NOT NULL,
 CONSTRAINT [PK_LogGoodness] PRIMARY KEY CLUSTERED 
(
	[log_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** 对象:  Table [dbo].[LogHack]    脚本日期: 12/02/2011 12:05:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LogHack](
	[log_id] [bigint] IDENTITY(1,1) NOT NULL,
	[Accounts] [varchar](32) COLLATE Chinese_PRC_CI_AS NULL,
	[CharacterName] [varchar](64) COLLATE Chinese_PRC_CI_AS NULL,
	[Time] [bigint] NULL,
	[Type] [int] NULL,
	[Typename] [varchar](32) COLLATE Chinese_PRC_CI_AS NULL,
	[ServerGroup] [varchar](32) COLLATE Chinese_PRC_CI_AS NULL,
	[ServerName] [varchar](32) COLLATE Chinese_PRC_CI_AS NULL,
	[LogInfo] [varchar](260) COLLATE Chinese_PRC_CI_AS NULL,
	[logtime] [datetime] NULL,
 CONSTRAINT [PK_LogHack] PRIMARY KEY CLUSTERED 
(
	[log_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** 对象:  Table [dbo].[LogSellYuanBao]    脚本日期: 12/02/2011 12:05:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LogSellYuanBao](
	[log_id] [bigint] IDENTITY(1,1) NOT NULL,
	[sess_id] [nchar](12) COLLATE Chinese_PRC_CI_AS NOT NULL,
	[acct_id] [bigint] NOT NULL,
	[char_id] [bigint] NOT NULL,
	[process_type] [tinyint] NOT NULL,
	[target_id] [bigint] NOT NULL,
	[YB] [bigint] NOT NULL,
	[YBT] [bigint] NOT NULL,
	[moneyPerUnit] [bigint] NOT NULL,
	[totalMoney] [bigint] NOT NULL,
	[tax] [bigint] NOT NULL,
	[expireDate] [datetime] NOT NULL,
	[create_time] [datetime] NOT NULL,
 CONSTRAINT [PK_LogSellYuanBao] PRIMARY KEY CLUSTERED 
(
	[log_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** 对象:  Table [dbo].[LogHonor]    脚本日期: 12/02/2011 12:05:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LogHonor](
	[log_id] [bigint] IDENTITY(1,1) NOT NULL,
	[sess_id] [nchar](12) COLLATE Chinese_PRC_CI_AS NOT NULL,
	[char_id] [bigint] NOT NULL,
	[change] [int] NOT NULL,
	[create_time] [datetime] NOT NULL,
 CONSTRAINT [PK_LogHonor] PRIMARY KEY CLUSTERED 
(
	[log_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** 对象:  Table [dbo].[LogPartner]    脚本日期: 12/02/2011 12:05:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LogPartner](
	[log_id] [bigint] IDENTITY(1,1) NOT NULL,
	[sess_id] [nchar](12) COLLATE Chinese_PRC_CI_AS NOT NULL,
	[partner_id] [bigint] NOT NULL,
	[mob_id] [bigint] NOT NULL,
	[char_id] [bigint] NOT NULL,
	[process_type] [tinyint] NOT NULL,
	[create_time] [datetime] NOT NULL,
 CONSTRAINT [PK_LogPartner] PRIMARY KEY CLUSTERED 
(
	[log_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** 对象:  Table [dbo].[LogManor]    脚本日期: 12/02/2011 12:05:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LogManor](
	[log_id] [bigint] IDENTITY(1,1) NOT NULL,
	[guild_uid] [bigint] NOT NULL,
	[guild_fund] [bigint] NOT NULL,
	[guild_prosper] [bigint] NOT NULL,
	[manor_scale] [smallint] NOT NULL,
	[fund_source] [smallint] NOT NULL,
	[prosper_source] [smallint] NOT NULL,
	[create_time] [datetime] NOT NULL,
 CONSTRAINT [PK_LogManor] PRIMARY KEY CLUSTERED 
(
	[log_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** 对象:  Table [dbo].[LogGenerationAcc]    脚本日期: 12/02/2011 12:05:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LogGenerationAcc](
	[log_id] [bigint] IDENTITY(1,1) NOT NULL,
	[target_id] [bigint] NOT NULL,
	[related_id] [bigint] NULL CONSTRAINT [DF__LogGenera__relat__1920BF5C]  DEFAULT ((0)),
	[accumulation] [bigint] NOT NULL,
	[target_level] [int] NOT NULL,
	[related_level] [int] NULL CONSTRAINT [DF__LogGenera__relat__1A14E395]  DEFAULT ((0)),
	[item_uid] [bigint] NULL CONSTRAINT [DF__LogGenera__item___1B0907CE]  DEFAULT ((0)),
	[item_id] [bigint] NULL CONSTRAINT [DF__LogGenera__item___1BFD2C07]  DEFAULT ((0)),
	[create_time] [datetime] NOT NULL,
 CONSTRAINT [PK_LogGenerationAcc] PRIMARY KEY CLUSTERED 
(
	[log_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** 对象:  Table [dbo].[LogGuildDonate]    脚本日期: 12/02/2011 12:05:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LogGuildDonate](
	[log_id] [bigint] IDENTITY(1,1) NOT NULL,
	[guild_uid] [bigint] NOT NULL,
	[char_uid] [bigint] NOT NULL,
	[donate] [bigint] NOT NULL,
	[total_donate] [bigint] NOT NULL,
	[source] [smallint] NOT NULL,
	[create_time] [datetime] NOT NULL,
 CONSTRAINT [PK_LogGuildDonate] PRIMARY KEY CLUSTERED 
(
	[log_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** 对象:  Table [dbo].[LogMoney]    脚本日期: 12/02/2011 12:05:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LogMoney](
	[log_id] [bigint] IDENTITY(1,1) NOT NULL,
	[acct_id] [bigint] NOT NULL,
	[char_id] [bigint] NOT NULL,
	[source] [int] NOT NULL,
	[money] [bigint] NOT NULL,
	[create_time] [datetime] NOT NULL,
	[totalMoney] [bigint] NOT NULL CONSTRAINT [DF__LogMoney__totalM__20C1E124]  DEFAULT ((0)),
 CONSTRAINT [PK_LogMoney_1] PRIMARY KEY CLUSTERED 
(
	[log_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** 对象:  Table [dbo].[LogAccount]    脚本日期: 12/02/2011 12:05:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LogAccount](
	[log_id] [bigint] IDENTITY(1,1) NOT NULL,
	[sess_id] [nchar](12) COLLATE Chinese_PRC_CI_AS NOT NULL,
	[acct_id] [bigint] NOT NULL,
	[ip] [nchar](15) COLLATE Chinese_PRC_CI_AS NOT NULL,
	[action_type] [smallint] NOT NULL,
	[create_time] [datetime] NOT NULL,
 CONSTRAINT [PK_LogAccount] PRIMARY KEY CLUSTERED 
(
	[log_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** 对象:  Table [dbo].[LogCharacter]    脚本日期: 12/02/2011 12:05:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LogCharacter](
	[log_id] [bigint] IDENTITY(1,1) NOT NULL,
	[sess_id] [nchar](12) COLLATE Chinese_PRC_CI_AS NOT NULL,
	[acct_id] [bigint] NOT NULL,
	[char_id] [bigint] NOT NULL,
	[line_id] [smallint] NOT NULL,
	[action_type] [smallint] NOT NULL,
	[create_time] [datetime] NOT NULL,
 CONSTRAINT [PK_LogCharacter] PRIMARY KEY CLUSTERED 
(
	[log_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** 对象:  Table [dbo].[LogItem]    脚本日期: 12/02/2011 12:05:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LogItem](
	[log_id] [bigint] IDENTITY(1,1) NOT NULL,
	[sess_id] [nchar](12) COLLATE Chinese_PRC_CI_AS NOT NULL,
	[char_id] [bigint] NOT NULL,
	[target_type] [smallint] NOT NULL,
	[target_id] [bigint] NULL,
	[item_uid] [bigint] NOT NULL,
	[item_id] [bigint] NOT NULL,
	[item_count] [int] NOT NULL,
	[action_type] [smallint] NOT NULL,
	[create_time] [datetime] NOT NULL,
 CONSTRAINT [PK_LogItem] PRIMARY KEY CLUSTERED 
(
	[log_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** 对象:  Table [dbo].[LogQuest]    脚本日期: 12/02/2011 12:05:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LogQuest](
	[log_id] [bigint] IDENTITY(1,1) NOT NULL,
	[sess_id] [nchar](12) COLLATE Chinese_PRC_CI_AS NOT NULL,
	[char_id] [bigint] NOT NULL,
	[line_id] [smallint] NOT NULL,
	[source_type] [smallint] NOT NULL,
	[source_id] [bigint] NOT NULL,
	[quest_id] [int] NOT NULL,
	[action_type] [smallint] NOT NULL,
	[create_time] [datetime] NOT NULL,
 CONSTRAINT [PK_LogQuest] PRIMARY KEY CLUSTERED 
(
	[log_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** 对象:  Table [dbo].[LogPlayerCount]    脚本日期: 12/02/2011 12:05:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LogPlayerCount](
	[log_id] [bigint] IDENTITY(1,1) NOT NULL,
	[line_id] [smallint] NOT NULL,
	[player_count] [int] NOT NULL,
	[create_time] [datetime] NOT NULL,
 CONSTRAINT [PK_LogPlayerCount] PRIMARY KEY CLUSTERED 
(
	[log_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** 对象:  Table [dbo].[LogGiftBox]    脚本日期: 12/02/2011 12:05:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LogGiftBox](
	[log_id] [bigint] IDENTITY(1,1) NOT NULL,
	[acct_id] [bigint] NOT NULL,
	[char_id] [bigint] NOT NULL,
	[item_id] [int] NOT NULL,
	[itemType] [smallint] NOT NULL,
	[quantity] [smallint] NOT NULL,
	[serialNo] [char](16) COLLATE Chinese_PRC_CI_AS NOT NULL,
	[create_time] [datetime] NOT NULL,
 CONSTRAINT [PK_LogGiftBox] PRIMARY KEY CLUSTERED 
(
	[log_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** 对象:  Table [dbo].[LogChargeShop]    脚本日期: 12/02/2011 12:05:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LogChargeShop](
	[log_id] [bigint] IDENTITY(1,1) NOT NULL,
	[sess_id] [nchar](12) COLLATE Chinese_PRC_CI_AS NOT NULL,
	[acct_id] [bigint] NOT NULL,
	[char_id] [bigint] NOT NULL,
	[item_id] [int] NOT NULL,
	[item_count] [smallint] NOT NULL,
	[item_type] [tinyint] NOT NULL,
	[yuanbao] [int] NOT NULL,
	[create_time] [datetime] NOT NULL,
 CONSTRAINT [PK_LogChargeShop] PRIMARY KEY CLUSTERED 
(
	[log_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** 对象:  Table [dbo].[LogExchange]    脚本日期: 12/02/2011 12:05:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LogExchange](
	[log_id] [bigint] IDENTITY(1,1) NOT NULL,
	[sess_id] [nchar](12) COLLATE Chinese_PRC_CI_AS NOT NULL,
	[char_id] [bigint] NOT NULL,
	[target_char_id] [bigint] NOT NULL,
	[process_type] [tinyint] NOT NULL,
	[item_type] [tinyint] NOT NULL,
	[item_uid] [bigint] NOT NULL,
	[item_id] [int] NOT NULL,
	[item_count] [smallint] NOT NULL,
	[money] [bigint] NOT NULL,
	[tax] [bigint] NOT NULL,
	[create_time] [datetime] NOT NULL,
 CONSTRAINT [PK_LogExchange] PRIMARY KEY CLUSTERED 
(
	[log_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** 对象:  Table [dbo].[LogCheat]    脚本日期: 12/02/2011 12:05:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LogCheat](
	[log_id] [bigint] IDENTITY(1,1) NOT NULL,
	[exe_id] [int] NOT NULL,
	[source_acct_id] [bigint] NOT NULL,
	[target_acct_id] [bigint] NOT NULL,
	[target_char_id] [bigint] NOT NULL,
	[command] [nvarchar](255) COLLATE Chinese_PRC_CI_AS NOT NULL,
	[result] [smallint] NOT NULL,
	[create_time] [datetime] NOT NULL,
 CONSTRAINT [PK_LogCheat] PRIMARY KEY CLUSTERED 
(
	[log_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
