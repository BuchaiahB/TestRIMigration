Test
USE [ROCKMIS]
GO
/****** Object:  Table [dbo].[ActivityLog]    Script Date: 7/7/2017 11:21:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ActivityLog](
	[ActivityLogId] [int] NOT NULL,
	[MethodName] [varchar](20) NULL,
	[Request] [text] NULL,
	[Response] [text] NULL,
	[CreatedDateStamp] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AdminUser]    Script Date: 7/7/2017 11:21:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AdminUser](
	[AdminUserId] [int] NOT NULL,
	[UserName] [varchar](20) NOT NULL,
	[Password] [varchar](20) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[HasAccessAdminUsers] [bit] NOT NULL,
	[HasAccessWebServiceUsers] [bit] NOT NULL,
	[HasAccessAgents] [bit] NOT NULL,
	[HasAccessCertificateTemplates] [bit] NOT NULL,
	[HasAccessMedicalScreening] [bit] NOT NULL,
	[HasAccessUnderwriters] [bit] NOT NULL,
	[HasAccessAgeLoadings] [bit] NOT NULL,
	[HasAccessBaseRate] [bit] NOT NULL,
	[HasAccessReports] [bit] NOT NULL,
	[CreatedDateStamp] [datetime] NOT NULL,
	[LastModified] [datetime] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Agent]    Script Date: 7/7/2017 11:21:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Agent](
	[Agentname] [varchar](50) NOT NULL,
	[Addresslineone] [varchar](50) NULL,
	[Addresslinetwo] [varchar](50) NULL,
	[country] [varchar](50) NULL,
	[Postcode] [varchar](50) NULL,
	[Maincontactmail] [varchar](50) NULL,
	[MaincontactTel] [varchar](50) NULL,
	[DateCreated] [datetime] NULL,
	[Lastmodified] [datetime] NULL,
	[agentid] [int] IDENTITY(1,1) NOT NULL,
	[AgentidLIVE] [varchar](20) NULL,
	[AgentidOLD] [varchar](20) NULL,
	[AgentidMRL] [varchar](20) NULL,
	[Addresslinethree] [varchar](50) NULL,
	[Addresslinefour] [varchar](50) NULL,
	[agentversion] [varchar](50) NULL,
	[RockList_Agentname] [varchar](255) NULL,
	[PrismAgent] [varchar](255) NULL,
	[Prism_Channel] [varchar](255) NULL,
	[Prism_Brand] [varchar](255) NULL,
	[Prism_Brand_Code] [varchar](25) NULL,
	[Prism_Channel_Code] [varchar](25) NULL,
 CONSTRAINT [Agent_Agentid] PRIMARY KEY CLUSTERED 
(
	[agentid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AgentCommision]    Script Date: 7/7/2017 11:21:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AgentCommision](
	[AgentCommissionId] [int] NOT NULL,
	[QuoteId] [int] NOT NULL,
	[AgentId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[IsBaseProduct] [bit] NOT NULL,
	[CommissionAmount] [decimal](18, 6) NOT NULL,
	[Deleted] [nchar](10) NULL,
	[DateCreated] [datetime] NOT NULL,
	[LastModified] [datetime] NOT NULL,
	[AgentLevel] [int] NOT NULL,
	[Notes] [text] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AgentCommissionTemp]    Script Date: 7/7/2017 11:21:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AgentCommissionTemp](
	[AgentCommissionId] [int] NOT NULL,
	[QuoteId] [int] NOT NULL,
	[AgentId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[IsBaseProduct] [bit] NOT NULL,
	[CommissionAmount] [numeric](18, 6) NOT NULL,
	[Deleted] [nchar](10) NULL,
	[DateCreated] [datetime] NOT NULL,
	[LastModified] [datetime] NOT NULL,
	[AgentLevel] [int] NOT NULL,
	[Notes] [text] NULL,
	[policyid] [varchar](20) NULL,
	[rock_margin] [varchar](20) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AgentProduct]    Script Date: 7/7/2017 11:21:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AgentProduct](
	[AgentProductId] [int] NOT NULL,
	[AgentId] [int] NOT NULL,
	[ParentProductId] [int] NOT NULL,
	[BaseProductId] [int] NOT NULL,
	[CommissionSetId] [int] NOT NULL,
	[ProductLevel] [int] NOT NULL,
	[ProductName] [varchar](50) NOT NULL,
	[Description] [varchar](50) NULL,
	[SummaryOfCover] [varchar](1000) NULL,
	[HasAreaOne] [bit] NULL,
	[HasAreaTwo] [bit] NULL,
	[HasAreaThree] [bit] NULL,
	[HasAreaFour] [bit] NULL,
	[HasAreaFive] [bit] NULL,
	[Deleted] [bit] NULL,
	[Active] [bit] NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[LastModified] [datetime] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AllCancelled]    Script Date: 7/7/2017 11:21:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AllCancelled](
	[PolicyNumber] [nvarchar](255) NULL,
	[IsCancelled] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AllSalesData]    Script Date: 7/7/2017 11:21:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AllSalesData](
	[Sales] [int] NULL,
	[Amount] [decimal](38, 6) NULL,
	[rockmargin] [decimal](38, 6) NOT NULL,
	[AgentCommission] [decimal](38, 6) NOT NULL,
	[agentname] [varchar](50) NULL,
	[UCost] [decimal](38, 6) NULL,
	[TAmnt] [decimal](38, 6) NULL,
	[NoOFT] [int] NULL,
	[ProductName] [varchar](50) NULL,
	[UName] [varchar](30) NULL,
	[ttName] [varchar](13) NOT NULL,
	[Relationshiptype] [varchar](50) NULL,
	[datecreated] [datetime] NOT NULL,
	[Destination] [varchar](48) NOT NULL,
	[EndorsementCodes] [varchar](100) NULL,
	[IsPaid] [varchar](10) NOT NULL,
	[IsCancelled] [varchar](10) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AllSalesDataNew]    Script Date: 7/7/2017 11:21:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AllSalesDataNew](
	[Sales] [int] NULL,
	[Amount] [decimal](38, 6) NULL,
	[rockmargin] [decimal](38, 6) NOT NULL,
	[AgentCommission] [decimal](38, 6) NOT NULL,
	[agentname] [varchar](50) NULL,
	[UCost] [decimal](38, 6) NULL,
	[TAmnt] [decimal](38, 6) NULL,
	[NoOFT] [int] NULL,
	[ProductName] [varchar](50) NULL,
	[UName] [varchar](30) NULL,
	[ttName] [varchar](13) NOT NULL,
	[Relationshiptype] [varchar](50) NULL,
	[datecreated] [datetime] NOT NULL,
	[Destination] [varchar](48) NOT NULL,
	[EndorsementCodes] [varchar](100) NULL,
	[IsPaid] [varchar](10) NOT NULL,
	[IsCancelled] [varchar](10) NULL,
	[Ec1] [varchar](10) NULL,
	[Ec2] [varchar](10) NULL,
	[Ec3] [varchar](10) NULL,
	[Ec4] [varchar](10) NULL,
	[Ec5] [varchar](10) NULL,
	[Ec6] [varchar](10) NULL,
	[Ec7] [varchar](10) NULL,
	[Ec8] [varchar](10) NULL,
	[Ec9] [varchar](10) NULL,
	[Ec10] [varchar](10) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Area]    Script Date: 7/7/2017 11:21:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Area](
	[Countryname] [varchar](255) NULL,
	[Areacode] [varchar](255) NULL,
	[areanameOLD] [varchar](50) NULL,
	[areaIdOLD] [varchar](50) NULL,
	[AreanameLIVE] [varchar](255) NULL,
	[AreacodeLIVE] [varchar](255) NULL,
	[areaIdMRL] [varchar](50) NULL,
	[areaNameMRL] [varchar](255) NULL,
	[Destination] [varchar](255) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AutoRenewalStaging_emailIssue]    Script Date: 7/7/2017 11:21:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AutoRenewalStaging_emailIssue](
	[Policyid] [int] NOT NULL,
	[PolicyNumber] [varchar](15) NOT NULL,
	[QuoteId] [int] NOT NULL,
	[PolicyStartDate] [datetime] NULL,
	[PolicyEndDate] [datetime] NULL,
	[EmailAddress] [varchar](255) NULL,
	[AgentId] [int] NULL,
	[AgentName] [varchar](50) NULL,
	[DestinationId] [int] NULL,
	[ProcessedDate] [datetime] NOT NULL,
	[Active] [bit] NULL,
	[TravelPrice] [numeric](18, 2) NULL,
	[GadgetPrice] [numeric](18, 2) NULL,
	[CDWPrice] [numeric](18, 2) NULL,
	[NetToUnderwriter] [numeric](18, 2) NULL,
	[NetToUnderwriterGadget] [numeric](18, 2) NULL,
	[NetToUnderwriterCDW] [numeric](18, 2) NULL,
	[Tax] [numeric](18, 2) NULL,
	[TotalPrice] [numeric](18, 2) NULL,
	[Lists] [varchar](50) NULL,
	[Exception] [varchar](50) NULL,
	[QuoteActive] [bit] NULL,
	[IsAged64] [bit] NULL,
	[Endorsements] [varchar](50) NULL,
	[QuoteDate] [datetime] NULL,
	[RenewalDate] [datetime] NULL,
	[InitialemailDate] [datetime] NULL,
	[PaymentDate] [datetime] NULL,
	[Finaloptoutdate] [datetime] NULL,
	[FirstName] [varchar](255) NULL,
	[LastName] [varchar](255) NULL,
	[Title] [varchar](25) NULL,
	[ProductId] [int] NULL,
	[OldPrice] [numeric](18, 2) NULL,
	[Expirydate] [datetime] NULL,
	[PolicyHolderId] [int] NULL,
	[PostcodeZip] [varchar](25) NULL,
	[NewQuoteId] [int] NULL,
	[NewPaymentDate] [datetime] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BaseProduct]    Script Date: 7/7/2017 11:21:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BaseProduct](
	[BaseProductId] [int] NOT NULL,
	[AgentId] [int] NOT NULL,
	[RatesetId] [int] NOT NULL,
	[CommissionSetId] [int] NOT NULL,
	[TaxCodeId] [int] NOT NULL,
	[ProductName] [varchar](50) NULL,
	[Description] [varchar](50) NULL,
	[HasAreaOne] [bit] NOT NULL,
	[HasAreaTwo] [bit] NOT NULL,
	[HasAreaThree] [bit] NOT NULL,
	[HasAreaFour] [bit] NOT NULL,
	[HasAreaFive] [bit] NOT NULL,
	[Deleted] [bit] NULL,
	[Active] [bit] NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[LastModified] [datetime] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CertificateTemplate]    Script Date: 7/7/2017 11:21:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CertificateTemplate](
	[CertificateTemplateId] [int] NOT NULL,
	[StatusId] [int] NOT NULL,
	[DocumentId] [int] NULL,
	[TemplateBody] [text] NOT NULL,
	[TemplateConditions] [text] NOT NULL,
	[IsActive] [bit] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Claimstoday]    Script Date: 7/7/2017 11:21:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Claimstoday](
	[Date created] [datetime] NULL,
	[Claim no] [nvarchar](255) NULL,
	[Title] [nvarchar](255) NULL,
	[Firstname] [nvarchar](255) NULL,
	[Surname] [nvarchar](255) NULL,
	[Status] [nvarchar](255) NULL,
	[Op Scheme] [nvarchar](255) NULL,
	[Dateofbirth] [datetime] NULL,
	[Incident Date] [datetime] NULL,
	[Incident Country] [nvarchar](255) NULL,
	[postcode] [nvarchar](255) NULL,
	[Settled Date] [nvarchar](255) NULL,
	[Diagnosis] [nvarchar](255) NULL,
	[Decline Desc] [nvarchar](255) NULL,
	[Cover Start] [datetime] NULL,
	[Cover End] [datetime] NULL,
	[Travel Start] [datetime] NULL,
	[Travel End] [datetime] NULL,
	[PolicyNumber1] [nvarchar](255) NULL,
	[PolicyNumber2] [nvarchar](255) NULL,
	[Issue Date] [datetime] NULL,
	[Reserve] [float] NULL,
	[Paid] [float] NULL,
	[Incurred] [float] NULL,
	[Issue Date1] [nvarchar](255) NULL,
	[polnumdup] [nvarchar](255) NULL,
	[Datecreated] [datetime] NULL,
	[Agentname] [nvarchar](255) NULL,
	[ProductName] [nvarchar](255) NULL,
	[Section] [nvarchar](255) NULL,
	[Recoveries] [nvarchar](255) NULL,
	[Potential] [nvarchar](255) NULL,
	[Actual] [nvarchar](255) NULL,
	[Blank] [nvarchar](255) NULL,
	[Claim/Case type] [nvarchar](255) NULL,
	[Blank1] [nvarchar](255) NULL,
	[F37] [nvarchar](255) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DebEmailRes]    Script Date: 7/7/2017 11:21:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DebEmailRes](
	[EmailAddress] [varchar](255) NULL,
	[Phonedaytime] [varchar](3) NOT NULL,
	[PolicyNumber] [varchar](15) NOT NULL,
	[Expirydate] [varchar](10) NULL,
	[Title] [decimal](18, 2) NULL,
	[FirstName] [varchar](255) NULL,
	[LastName] [varchar](255) NULL,
	[Agentid] [nvarchar](255) NULL,
	[DestinationCode] [nvarchar](255) NULL,
	[AgentName] [nvarchar](255) NULL,
	[Value1] [varchar](10) NULL,
	[Value2] [varchar](10) NULL,
	[InitialemailDate] [datetime] NULL,
	[DateProduced] [datetime] NULL,
	[ProcessedDate] [datetime] NOT NULL,
	[Lists] [varchar](50) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Endorsemnt]    Script Date: 7/7/2017 11:21:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Endorsemnt](
	[EndorsemntCode] [varchar](50) NULL,
	[NameOverride] [varchar](50) NULL,
	[DateCreated] [datetime] NULL,
	[LastModified] [datetime] NULL,
	[Endorsemntid] [int] IDENTITY(1,1) NOT NULL,
	[endorsementidOLD] [int] NULL,
 CONSTRAINT [Endorsemnt_EndorsemntId] PRIMARY KEY CLUSTERED 
(
	[Endorsemntid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[IAgentData]    Script Date: 7/7/2017 11:21:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IAgentData](
	[Sales] [int] NULL,
	[Amount] [numeric](38, 6) NULL,
	[RockMargin] [numeric](38, 6) NULL,
	[AgentCommission] [numeric](20, 8) NULL,
	[agentname] [varchar](50) NULL,
	[Agents] [varchar](1) NOT NULL,
	[UCost] [numeric](38, 6) NULL,
	[TAmnt] [numeric](38, 6) NULL,
	[NoOFT] [int] NULL,
	[ProductName] [varchar](50) NULL,
	[UName] [varchar](30) NULL,
	[ttName] [varchar](13) NOT NULL,
	[Relationshiptype] [varchar](50) NULL,
	[DestinationCode] [varchar](50) NULL,
	[datecreated] [datetime] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[IAgentDataNew]    Script Date: 7/7/2017 11:21:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IAgentDataNew](
	[Sales] [int] NULL,
	[Amount] [numeric](38, 2) NULL,
	[RockMargin] [numeric](38, 6) NULL,
	[AgentCommission] [numeric](38, 6) NULL,
	[agentname] [varchar](50) NULL,
	[Agents] [varchar](1) NOT NULL,
	[UCost] [numeric](38, 6) NULL,
	[TAmnt] [numeric](38, 2) NULL,
	[NoOFT] [int] NULL,
	[ProductName] [varchar](50) NULL,
	[UName] [varchar](30) NULL,
	[ttName] [varchar](13) NOT NULL,
	[Relationshiptype] [varchar](50) NULL,
	[datecreated] [datetime] NOT NULL,
	[DestinationCode] [varchar](48) NOT NULL,
	[EndorsementCodes] [varchar](100) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[IAgentNEWData]    Script Date: 7/7/2017 11:21:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IAgentNEWData](
	[Sales] [int] NULL,
	[Amount] [numeric](38, 6) NULL,
	[RockMargin] [numeric](38, 6) NULL,
	[AgentCommission] [numeric](38, 6) NULL,
	[agentname] [varchar](50) NULL,
	[Agents] [varchar](1) NOT NULL,
	[UCost] [numeric](38, 6) NULL,
	[TAmnt] [numeric](38, 6) NULL,
	[NoOFT] [int] NULL,
	[ProductName] [varchar](50) NULL,
	[UName] [varchar](30) NULL,
	[ttName] [varchar](13) NOT NULL,
	[Relationshiptype] [varchar](50) NULL,
	[datecreated] [datetime] NOT NULL,
	[Destination] [varchar](48) NOT NULL,
	[EndorsementCodes] [varchar](100) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MGBCCCFilter]    Script Date: 7/7/2017 11:21:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MGBCCCFilter](
	[emailaddress] [varchar](100) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NewAgent]    Script Date: 7/7/2017 11:21:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NewAgent](
	[agentid] [int] NULL,
	[agentname] [nvarchar](255) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Policy]    Script Date: 7/7/2017 11:21:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Policy](
	[PolicyNumber] [varchar](255) NULL,
	[PolicyStartDate] [datetime] NULL,
	[PolicyEndDate] [datetime] NULL,
	[Duration] [varchar](50) NULL,
	[isPricepaid] [bit] NULL,
	[PolicyStatus] [varchar](255) NULL,
	[DateCancelled] [datetime] NULL,
	[CancelledReason] [text] NULL,
	[DateCreated] [datetime] NULL,
	[LastModified] [datetime] NULL,
	[IsRenewed] [varchar](20) NULL,
	[expirydate] [datetime] NULL,
	[policyid] [varchar](20) NOT NULL,
	[Endorsement] [varchar](255) NULL,
	[CoverCost] [money] NULL,
	[CoverRequired] [varchar](255) NULL,
	[NetBanxRef] [varchar](255) NULL,
	[WinterSports] [varchar](255) NULL,
	[IsCancelled] [bit] NULL,
	[policystatusOLD] [int] NULL,
	[endorsementidOLD] [int] NULL,
	[durationid] [int] NULL,
	[durationid2] [varchar](25) NULL,
	[MRLQuoteid] [varchar](255) NULL,
	[visibility] [int] NULL,
	[LinkedPolicyIds] [varchar](255) NULL,
	[linkedpolicynumbers] [varchar](255) NULL,
 CONSTRAINT [Policy_poicyid] PRIMARY KEY CLUSTERED 
(
	[policyid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Policyendorsement]    Script Date: 7/7/2017 11:21:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Policyendorsement](
	[Pid] [int] IDENTITY(1,1) NOT NULL,
	[policyid] [varchar](20) NULL,
	[EndorsemntCode] [varchar](255) NULL,
	[ROCKLIVEquoteid] [int] NULL,
	[MRLQuoteid] [varchar](255) NULL,
	[endorsementidold] [int] NULL,
 CONSTRAINT [PK_Policyendorsement] PRIMARY KEY CLUSTERED 
(
	[Pid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Policyholder]    Script Date: 7/7/2017 11:21:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Policyholder](
	[Title] [varchar](50) NULL,
	[FirstName] [varchar](255) NULL,
	[LastName] [varchar](255) NULL,
	[DateOfBirth] [datetime] NULL,
	[Age] [int] NULL,
	[AddressLineOne] [varchar](255) NULL,
	[AddressLineTwo] [varchar](255) NULL,
	[TownCity] [varchar](255) NULL,
	[CountyState] [varchar](255) NULL,
	[Country] [varchar](255) NULL,
	[PostcodeZip] [varchar](50) NULL,
	[PhoneEvening] [varchar](255) NULL,
	[PhoneDaytime] [varchar](255) NULL,
	[EmailAddress] [varchar](255) NULL,
	[WantsEmailUpdates] [bit] NULL,
	[DateCreated] [datetime] NULL,
	[LastModified] [datetime] NULL,
	[policyid] [varchar](20) NULL,
	[policyholderid] [int] IDENTITY(1,1) NOT NULL,
	[AddressLinethree] [varchar](255) NULL,
	[MRLQuoteid] [varchar](255) NULL,
	[Renewalquotation] [varchar](255) NULL,
	[Insure74] [varchar](255) NULL,
	[I4AgeLimit] [varchar](20) NULL,
 CONSTRAINT [Policyholder_PolicyholderId] PRIMARY KEY CLUSTERED 
(
	[policyholderid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[policyholdertemp]    Script Date: 7/7/2017 11:21:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[policyholdertemp](
	[Title] [varchar](50) NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[DateOfBirth] [datetime] NULL,
	[Age] [int] NULL,
	[AddressLineOne] [varchar](50) NULL,
	[AddressLineTwo] [varchar](50) NULL,
	[AddressLineThree] [varchar](50) NULL,
	[TownCity] [varchar](50) NULL,
	[CountyState] [varchar](50) NULL,
	[Country] [varchar](50) NULL,
	[PostcodeZip] [varchar](10) NOT NULL,
	[PhoneEvening] [varchar](50) NULL,
	[PhoneDaytime] [varchar](50) NULL,
	[EmailAddress] [varchar](50) NULL,
	[WantsEmailUpdates] [bit] NULL,
	[DateCreated] [datetime] NOT NULL,
	[LastModified] [datetime] NOT NULL,
	[policyholderid] [int] NOT NULL,
	[Renewalquotation] [varchar](255) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[policytemp]    Script Date: 7/7/2017 11:21:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[policytemp](
	[Policyid] [varchar](20) NULL,
	[PolicyHolderId] [int] NOT NULL,
	[quoteid] [int] NOT NULL,
	[PolicyNumber] [varchar](15) NULL,
	[PolicyStartDate] [datetime] NULL,
	[PolicyEndDate] [datetime] NULL,
	[PricePaid] [numeric](18, 2) NOT NULL,
	[DateCancelled] [datetime] NULL,
	[CancellationReason] [text] NULL,
	[DateCreated] [datetime] NOT NULL,
	[LastModified] [datetime] NOT NULL,
	[IsRenewed] [bit] NULL,
	[iscancelled] [bit] NULL,
	[ispaid] [bit] NOT NULL,
	[Policystatus] [varchar](1) NOT NULL,
	[LinkedPolicyIds] [varchar](250) NULL,
	[LinkedPolicyNumbers] [varchar](250) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PolicyTemp5]    Script Date: 7/7/2017 11:21:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PolicyTemp5](
	[Policystatus] [nvarchar](255) NULL,
	[PolicyNumber] [nvarchar](255) NULL,
	[NetBanxRef] [nvarchar](255) NULL,
	[PolicyID] [varchar](255) NULL,
	[DateCreated] [datetime] NULL,
	[DateCancelled] [datetime] NULL,
	[Title] [nvarchar](255) NULL,
	[LastName] [nvarchar](255) NULL,
	[FirstName] [nvarchar](255) NULL,
	[AddressLineOne] [nvarchar](255) NULL,
	[CountyState] [nvarchar](255) NULL,
	[TownCity] [nvarchar](255) NULL,
	[PostcodeZip] [nvarchar](255) NULL,
	[PhoneDaytime] [nvarchar](255) NULL,
	[PhoneEvening] [nvarchar](255) NULL,
	[EmailAddress] [nvarchar](255) NULL,
	[triptype] [nvarchar](255) NULL,
	[DestinationName] [nvarchar](255) NULL,
	[tripstartdate] [datetime] NULL,
	[tripenddate] [datetime] NULL,
	[Duration] [varchar](50) NULL,
	[CoverRequired] [nvarchar](255) NULL,
	[WinterSports] [nvarchar](255) NULL,
	[Covername] [nvarchar](255) NULL,
	[CoverCost] [money] NULL,
	[Traveller1Title] [nvarchar](255) NULL,
	[Traveller1FirstName] [nvarchar](255) NULL,
	[Traveller1Surname] [nvarchar](255) NULL,
	[Traveller1DOB] [datetime] NULL,
	[Traveller1Gender] [nvarchar](255) NULL,
	[Traveller2Title] [nvarchar](255) NULL,
	[Traveller2FirstName] [nvarchar](255) NULL,
	[Traveller2Surname] [nvarchar](255) NULL,
	[Traveller2DOB] [datetime] NULL,
	[Traveller2Gender] [nvarchar](255) NULL,
	[Traveller3Title] [nvarchar](255) NULL,
	[Traveller3FirstName] [nvarchar](255) NULL,
	[Traveller3Surname] [nvarchar](255) NULL,
	[Traveller3DOB] [datetime] NULL,
	[Traveller3Gender] [nvarchar](255) NULL,
	[Traveller4Title] [nvarchar](255) NULL,
	[Traveller4FirstName] [nvarchar](255) NULL,
	[Traveller4Surname] [nvarchar](255) NULL,
	[Traveller4DOB] [datetime] NULL,
	[Traveller4Gender] [nvarchar](255) NULL,
	[Traveller5Title] [nvarchar](255) NULL,
	[Traveller5FirstName] [nvarchar](255) NULL,
	[Traveller5Surname] [nvarchar](255) NULL,
	[Traveller5DOB] [datetime] NULL,
	[Traveller5Gender] [nvarchar](255) NULL,
	[Traveller6Title] [nvarchar](255) NULL,
	[Traveller6FirstName] [nvarchar](255) NULL,
	[Traveller6Surname] [nvarchar](255) NULL,
	[Traveller6DOB] [datetime] NULL,
	[Traveller6Gender] [nvarchar](255) NULL,
	[Traveller7Title] [nvarchar](255) NULL,
	[Traveller7FirstName] [nvarchar](255) NULL,
	[Traveller7Surname] [nvarchar](255) NULL,
	[Traveller7DOB] [datetime] NULL,
	[Traveller7Gender] [nvarchar](255) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PolicyTraveller]    Script Date: 7/7/2017 11:21:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PolicyTraveller](
	[Title] [varchar](50) NULL,
	[FirstName] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
	[DateOfBirth] [datetime] NULL,
	[Age] [int] NULL,
	[DateCreated] [datetime] NULL,
	[LastModified] [datetime] NULL,
	[PolicyID] [varchar](20) NULL,
	[policytravellerid] [int] IDENTITY(1,1) NOT NULL,
	[ROCKLIVEquoteid] [int] NULL,
	[sex] [varchar](20) NULL,
	[MRLQuoteid] [varchar](255) NULL,
	[AgeAbove18] [varchar](255) NULL,
	[Relation] [varchar](255) NULL,
	[ageabove74] [varchar](255) NULL,
	[I4AgeLimit] [varchar](20) NULL,
 CONSTRAINT [PolicyTraveller_PolicyTravellerid] PRIMARY KEY CLUSTERED 
(
	[policytravellerid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[policytravellertemp]    Script Date: 7/7/2017 11:21:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[policytravellertemp](
	[policytravellerid] [int] NOT NULL,
	[Title] [varchar](50) NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[DateOfBirth] [datetime] NULL,
	[Age] [int] NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[LastModified] [datetime] NOT NULL,
	[quoteid] [int] NOT NULL,
	[ageabove18] [varchar](20) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Product]    Script Date: 7/7/2017 11:21:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[Productname] [varchar](50) NULL,
	[Datecreated] [datetime] NULL,
	[Lastmodified] [datetime] NULL,
	[productid] [int] IDENTITY(1,1) NOT NULL,
	[agentproductidLIVE] [int] NULL,
	[agentproductidMRL] [int] NULL,
	[agentproductidOLD] [int] NULL,
	[agentproductidMSM] [int] NULL,
	[PRODUCTNAMETRIMED] [varchar](20) NULL,
	[Pybproductid] [int] NULL,
 CONSTRAINT [Product_productid] PRIMARY KEY CLUSTERED 
(
	[productid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[pure360data]    Script Date: 7/7/2017 11:21:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pure360data](
	[policyid] [varchar](20) NOT NULL,
	[PolicyNumber] [varchar](255) NULL,
	[PolicyStartDate] [datetime] NULL,
	[Title] [varchar](50) NULL,
	[FirstName] [varchar](255) NULL,
	[LastName] [varchar](255) NULL,
	[PhoneDaytime] [varchar](255) NULL,
	[EmailAddress] [varchar](255) NULL,
	[Destinationname] [varchar](50) NULL,
	[Destination] [varchar](255) NULL,
	[Agentname] [varchar](50) NOT NULL,
	[agentversion] [varchar](50) NULL,
	[RockList_Agentname] [varchar](255) NULL,
	[Agentid] [varchar](80) NOT NULL,
	[Expirydate] [datetime] NULL,
	[Value1] [varchar](255) NULL,
	[Value2] [varchar](255) NULL,
	[I4Agelimit] [varchar](20) NULL,
	[I4listFlag] [int] NULL,
	[Pricepaid] [decimal](18, 2) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[pure360datafilter]    Script Date: 7/7/2017 11:21:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pure360datafilter](
	[EmailAddress] [varchar](255) NULL,
	[PolicyStartDate] [datetime] NULL,
	[policynumber] [varchar](255) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[puretestcampaign]    Script Date: 7/7/2017 11:21:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[puretestcampaign](
	[policynumber] [varchar](255) NULL,
	[PolicyEndDate] [datetime] NULL,
	[DateCreated] [datetime] NULL,
	[PolicystartDate] [datetime] NULL,
	[EmailAddress] [varchar](255) NULL,
	[I4listFlag] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[quote]    Script Date: 7/7/2017 11:21:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[quote](
	[NumberOfTravellers] [int] NULL,
	[NumberOfAdults] [int] NULL,
	[NumberOfChildren] [int] NULL,
	[NumberOfSeniors] [int] NULL,
	[NumberOfInfants] [int] NULL,
	[Relationshiptype] [varchar](50) NULL,
	[NetPrice] [decimal](18, 2) NULL,
	[Taxamount] [decimal](18, 2) NULL,
	[Grosspricewithoutsurchages] [decimal](18, 2) NULL,
	[GrossPriceWithSurcharges] [decimal](18, 2) NULL,
	[TripTypeId] [varchar](20) NULL,
	[TripSubTypeId] [varchar](20) NULL,
	[DestinationCode] [varchar](50) NULL,
	[DepartureDate] [datetime] NULL,
	[ReturnDate] [datetime] NULL,
	[Destinationname] [varchar](50) NULL,
	[DateCreated] [datetime] NULL,
	[LastModified] [datetime] NULL,
	[AgentId] [varchar](20) NULL,
	[AgentName] [varchar](50) NULL,
	[agentproductidMSM] [varchar](20) NULL,
	[ProductName] [varchar](50) NULL,
	[ROCKLIVEquoteid] [int] NULL,
	[tripstartdate] [datetime] NULL,
	[tripenddate] [datetime] NULL,
	[triptype] [varchar](20) NULL,
	[policyid] [varchar](20) NULL,
	[quoteid] [int] IDENTITY(1,1) NOT NULL,
	[covername] [varchar](255) NULL,
	[agentidLIVE] [varchar](20) NULL,
	[agentidOLD] [varchar](20) NULL,
	[agentidMRL] [varchar](20) NULL,
	[MRLQuoteid] [varchar](255) NULL,
	[agentproductidLIVE] [int] NULL,
	[agentproductidOLD] [int] NULL,
	[agentproductidMRL] [int] NULL,
	[areaIdOLD] [varchar](50) NULL,
	[areaIdMRL] [varchar](50) NULL,
	[Destination] [varchar](255) NULL,
	[agentnameprism] [varchar](255) NULL,
	[AgentVersionPrism] [varchar](255) NULL,
	[Prism_Brand] [varchar](255) NULL,
	[Prism_Channel] [varchar](255) NULL,
	[PromotionalCode] [varchar](50) NULL,
	[Prism_Brand_Code] [varchar](25) NULL,
	[Prism_Channel_Code] [varchar](25) NULL,
	[Policyidtest] [varchar](25) NULL,
	[I4listFlag] [int] NULL,
 CONSTRAINT [quote_quoteid] PRIMARY KEY CLUSTERED 
(
	[quoteid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[quotefilter]    Script Date: 7/7/2017 11:21:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[quotefilter](
	[quoteid] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[quotetemp]    Script Date: 7/7/2017 11:21:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[quotetemp](
	[NumberOfTravellers] [int] NOT NULL,
	[NumberOfAdults] [int] NOT NULL,
	[NumberOfChildren] [int] NOT NULL,
	[NumberOfSeniors] [int] NOT NULL,
	[NumberOfInfants] [int] NOT NULL,
	[RelationshipType] [varchar](50) NOT NULL,
	[NetPrice] [numeric](18, 2) NOT NULL,
	[TaxAmount] [numeric](18, 2) NOT NULL,
	[GrossPriceWithoutSurcharges] [numeric](18, 2) NOT NULL,
	[GrossPriceWithSurcharges] [numeric](18, 2) NOT NULL,
	[TripTypeId] [int] NULL,
	[TripSubTypeId] [int] NULL,
	[DestinationCode] [varchar](50) NULL,
	[DepartureDate] [datetime] NOT NULL,
	[ReturnDate] [datetime] NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[LastModified] [datetime] NOT NULL,
	[AgentId] [int] NOT NULL,
	[productid] [int] NOT NULL,
	[QuoteId] [int] NOT NULL,
	[Triptype] [varchar](10) NOT NULL,
	[DestinationName] [varchar](49) NOT NULL,
	[Destination] [varchar](9) NOT NULL,
	[endorsementcodes] [varchar](500) NULL,
	[PromotionalCode] [varchar](50) NULL,
	[agentnameprism] [varchar](255) NULL,
	[agentversionprism] [varchar](255) NULL,
	[Prism_Brand] [varchar](255) NULL,
	[Prism_Channel] [varchar](255) NULL,
	[Prism_Brand_Code] [varchar](255) NULL,
	[Prism_channel_code] [varchar](255) NULL,
	[Policyidtest] [varchar](25) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Rateset]    Script Date: 7/7/2017 11:21:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rateset](
	[RatesetId] [int] NOT NULL,
	[UnderwriterId] [int] NOT NULL,
	[RatesetName] [varchar](50) NOT NULL,
	[HasAreaOne] [bit] NOT NULL,
	[HasAreaTwo] [bit] NOT NULL,
	[HasAreaThree] [bit] NOT NULL,
	[HasAreaFour] [bit] NOT NULL,
	[HasAreaFive] [bit] NOT NULL,
	[Deleted] [bit] NULL,
	[Active] [bit] NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[LastModified] [datetime] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Relationship]    Script Date: 7/7/2017 11:21:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Relationship](
	[PolicyID] [varchar](255) NULL,
	[Adult] [varchar](255) NULL,
	[Children] [varchar](255) NULL,
	[Relationship] [varchar](255) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RemovedAgents]    Script Date: 7/7/2017 11:21:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RemovedAgents](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AgentId] [int] NOT NULL,
	[AgentName] [varchar](100) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ReprtData]    Script Date: 7/7/2017 11:21:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReprtData](
	[Sales] [int] NULL,
	[Amount] [numeric](38, 2) NULL,
	[agentname] [varchar](50) NULL,
	[productname] [varchar](50) NULL,
	[agentid] [int] NOT NULL,
	[triptypeid] [int] NOT NULL,
	[UnderwriterName] [varchar](30) NULL,
	[RelationshipType] [varchar](50) NULL,
	[DestinationCode] [varchar](50) NULL,
	[age] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Rock_Margin]    Script Date: 7/7/2017 11:21:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rock_Margin](
	[AgentCommissionId] [int] NOT NULL,
	[QuoteId] [int] NOT NULL,
	[AgentId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[IsBaseProduct] [bit] NOT NULL,
	[CommissionAmount] [decimal](18, 6) NOT NULL,
	[Deleted] [nchar](10) NULL,
	[DateCreated] [datetime] NOT NULL,
	[LastModified] [datetime] NOT NULL,
	[AgentLevel] [int] NOT NULL,
	[Notes] [text] NULL,
	[Policyid] [varchar](20) NULL,
	[Rock_Margin] [decimal](18, 6) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RockData]    Script Date: 7/7/2017 11:21:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RockData](
	[Sales] [int] NULL,
	[Amount] [decimal](38, 6) NULL,
	[rockmargin] [decimal](38, 6) NOT NULL,
	[AgentCommission] [decimal](38, 6) NOT NULL,
	[agentname] [varchar](50) NULL,
	[UCost] [decimal](38, 6) NULL,
	[TAmnt] [decimal](38, 6) NULL,
	[NoOFT] [int] NULL,
	[ProductName] [varchar](50) NULL,
	[UName] [varchar](30) NULL,
	[ttName] [varchar](13) NOT NULL,
	[Relationshiptype] [varchar](50) NULL,
	[datecreated] [datetime] NOT NULL,
	[Destination] [varchar](48) NOT NULL,
	[EndorsementCodes] [varchar](100) NULL,
	[IsPaid] [varchar](10) NULL,
	[IsCancelled] [varchar](10) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SalesData]    Script Date: 7/7/2017 11:21:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SalesData](
	[Sales] [int] NULL,
	[Amount] [numeric](38, 2) NULL,
	[agentname] [varchar](50) NULL,
	[productname] [varchar](50) NULL,
	[agentid] [int] NOT NULL,
	[ispaid] [bit] NOT NULL,
	[Iscancelled] [bit] NULL,
	[datecreated] [datetime] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SearchData]    Script Date: 7/7/2017 11:21:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SearchData](
	[PolicyNumber] [varchar](255) NULL,
	[policyid] [varchar](20) NOT NULL,
	[Title] [varchar](50) NULL,
	[FirstName] [varchar](255) NULL,
	[LastName] [varchar](255) NULL,
	[PostcodeZip] [varchar](50) NULL,
	[EmailAddress] [varchar](255) NULL,
	[CoverCost] [money] NULL,
	[IsCancelled] [bit] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SecData]    Script Date: 7/7/2017 11:21:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SecData](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TransId] [varchar](50) NULL,
	[Date] [datetime] NULL,
	[Amount] [decimal](18, 2) NULL,
	[Status] [varchar](50) NULL,
	[TransactionName] [varchar](150) NULL,
	[Postcode] [varchar](50) NULL,
	[Refunded] [bit] NULL,
 CONSTRAINT [PK_SecData] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SimpleSalesData]    Script Date: 7/7/2017 11:21:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SimpleSalesData](
	[Sales] [int] NULL,
	[Amount] [numeric](38, 2) NULL,
	[agentname] [varchar](50) NULL,
	[productname] [varchar](50) NULL,
	[agentid] [int] NOT NULL,
	[datecreated] [datetime] NOT NULL,
	[ispaid] [bit] NOT NULL,
	[iscancelled] [bit] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TempFX]    Script Date: 7/7/2017 11:21:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TempFX](
	[AgentProductid] [int] NULL,
	[productname] [nvarchar](255) NULL,
	[DateCreated] [datetime] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TodayClaim]    Script Date: 7/7/2017 11:21:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TodayClaim](
	[call_dte] [datetime] NULL,
	[call_ref] [nvarchar](255) NULL,
	[source] [nvarchar](255) NULL,
	[title] [nvarchar](255) NULL,
	[forename] [nvarchar](255) NULL,
	[name] [nvarchar](255) NULL,
	[call_typ] [nvarchar](255) NULL,
	[status] [nvarchar](255) NULL,
	[status desc] [nvarchar](255) NULL,
	[acc_ind] [nvarchar](255) NULL,
	[death] [nvarchar](255) NULL,
	[wsport] [nvarchar](255) NULL,
	[outpat] [nvarchar](255) NULL,
	[clm_sch] [nvarchar](255) NULL,
	[risk_ind] [float] NULL,
	[user] [nvarchar](255) NULL,
	[interface_dte] [datetime] NULL,
	[initial] [nvarchar](255) NULL,
	[age] [float] NULL,
	[inc_date] [datetime] NULL,
	[ctry_cde] [nvarchar](255) NULL,
	[postcode] [nvarchar](255) NULL,
	[inc_code] [float] NULL,
	[sex] [nvarchar](255) NULL,
	[settled_dte] [datetime] NULL,
	[finc_dte] [nvarchar](255) NULL,
	[inc_text1] [nvarchar](255) NULL,
	[icd9_code] [float] NULL,
	[decl_code] [nvarchar](255) NULL,
	[decl_description] [nvarchar](255) NULL,
	[hospital] [nvarchar](255) NULL,
	[cov_strt] [datetime] NULL,
	[cov_end] [datetime] NULL,
	[trv_strt] [datetime] NULL,
	[trv_end] [datetime] NULL,
	[pol_no] [nvarchar](255) NULL,
	[Datecreated] [datetime] NULL,
	[AgentName] [nvarchar](255) NULL,
	[ProductName] [nvarchar](255) NULL,
	[tour_op] [nvarchar](255) NULL,
	[agent] [nvarchar](255) NULL,
	[issue_dt] [datetime] NULL,
	[reserve] [float] NULL,
	[paid] [float] NULL,
	[incurred] [float] NULL,
	[sch_desc] [nvarchar](255) NULL,
	[ag_code] [nvarchar](255) NULL,
	[start_date] [datetime] NULL,
	[expiry_date] [datetime] NULL,
	[Causation] [nvarchar](255) NULL,
	[Recovery] [nvarchar](255) NULL,
	[potential ] [float] NULL,
	[actual ] [float] NULL,
	[Curt] [nvarchar](255) NULL,
	[In-Out Patient] [nvarchar](255) NULL,
	[Pay and Claim] [nvarchar](255) NULL,
	[Curtailment] [nvarchar](255) NULL,
	[polnumdup] [nvarchar](255) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TripType]    Script Date: 7/7/2017 11:21:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TripType](
	[TripTypeCode] [varchar](255) NULL,
	[DateCreated] [datetime] NULL,
	[LastModified] [datetime] NULL,
	[triptypeid] [int] IDENTITY(1,1) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Underwriter]    Script Date: 7/7/2017 11:21:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Underwriter](
	[UnderwriterId] [int] NOT NULL,
	[UnderwriterName] [varchar](30) NOT NULL,
	[AddressLineOne] [varchar](30) NULL,
	[AddressLineTwo] [varchar](30) NULL,
	[AddressLineThree] [varchar](30) NULL,
	[AddressLineFour] [varchar](30) NULL,
	[Country] [varchar](30) NULL,
	[Postcode] [varchar](10) NULL,
	[MainContact] [varchar](20) NULL,
	[MainContactTel] [varchar](20) NULL,
	[MainContactFax] [varchar](20) NULL,
	[MainContactEmail] [varchar](50) NULL,
	[PolicyPrefix] [varchar](10) NOT NULL,
	[AreaOneName] [varchar](50) NULL,
	[AreaTwoName] [varchar](50) NULL,
	[AreaThreeName] [varchar](50) NULL,
	[AreaFourName] [varchar](50) NULL,
	[AreaFiveName] [varchar](50) NULL,
	[Deleted] [bit] NULL,
	[Active] [bit] NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[LastModified] [datetime] NOT NULL,
	[Notes] [text] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[uploadlistconfig]    Script Date: 7/7/2017 11:21:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[uploadlistconfig](
	[profileName] [varchar](255) NULL,
	[listName] [varchar](255) NULL,
	[languageCode] [varchar](255) NULL,
	[transactionType] [varchar](255) NULL,
	[emailCol] [varchar](255) NULL,
	[mobileCol] [varchar](255) NULL,
	[responseType] [varchar](255) NULL,
	[responseUrl] [varchar](255) NULL,
	[Query] [varchar](8000) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UploadListConfig_Test]    Script Date: 7/7/2017 11:21:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UploadListConfig_Test](
	[profileName] [varchar](255) NULL,
	[listName] [varchar](255) NULL,
	[languageCode] [varchar](255) NULL,
	[transactionType] [varchar](255) NULL,
	[emailCol] [varchar](255) NULL,
	[mobileCol] [varchar](255) NULL,
	[responseType] [varchar](255) NULL,
	[responseUrl] [varchar](255) NULL,
	[Query] [varchar](8000) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserLogin]    Script Date: 7/7/2017 11:21:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserLogin](
	[UserLoginId] [int] IDENTITY(1057,1) NOT NULL,
	[UserRole] [varchar](50) NOT NULL,
	[LinkId] [int] NOT NULL,
	[Username] [varchar](50) NOT NULL,
	[Password] [varchar](100) NOT NULL,
	[Deleted] [bit] NULL,
	[Active] [bit] NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[LastModified] [datetime] NOT NULL,
 CONSTRAINT [PK_UserLogin] PRIMARY KEY CLUSTERED 
(
	[UserLoginId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Policyholder]  WITH CHECK ADD  CONSTRAINT [Policyholder_policyid] FOREIGN KEY([policyid])
REFERENCES [dbo].[Policy] ([policyid])
GO
ALTER TABLE [dbo].[Policyholder] CHECK CONSTRAINT [Policyholder_policyid]
GO
ALTER TABLE [dbo].[PolicyTraveller]  WITH CHECK ADD  CONSTRAINT [PolicyTraveller_policyid] FOREIGN KEY([PolicyID])
REFERENCES [dbo].[Policy] ([policyid])
GO
ALTER TABLE [dbo].[PolicyTraveller] CHECK CONSTRAINT [PolicyTraveller_policyid]
GO
ALTER TABLE [dbo].[quote]  WITH CHECK ADD  CONSTRAINT [quote_policyid] FOREIGN KEY([policyid])
REFERENCES [dbo].[Policy] ([policyid])
GO
ALTER TABLE [dbo].[quote] CHECK CONSTRAINT [quote_policyid]
GO
