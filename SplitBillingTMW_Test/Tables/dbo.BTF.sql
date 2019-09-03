SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BTF] (
		[Reference Number]                     [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Pickup Date]                          [datetime] NULL,
		[Fuel Rate]                            [float] NULL,
		[Fuel Rate Units]                      [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Errors]                               [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Movement (Truck/IM) Fuel Rate]        [float] NULL,
		[Temperature Protection Fuel Rate]     [float] NULL,
		[Mode]                                 [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[SCAC]                                 [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Temperature Class]                    [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Number of Stops]                      [float] NULL,
		[Origin City]                          [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Origin State]                         [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Origin Postal Code]                   [float] NULL,
		[Origin Country]                       [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Stop 2 City]                          [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Stop 2 State]                         [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Stop 2 Postal Code]                   [float] NULL,
		[Stop 2 Country]                       [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Stop N City]                          [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Stop N State]                         [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Stop N Postal Code]                   [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Stop N Country]                       [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Stop 2 City1]                         [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Stop 2 State1]                        [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Stop 2 Postal Code1]                  [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Stop 2 Country1]                      [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[RateLookup]                           [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Route]                                [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Miles]                                [float] NULL,
		[Linehaul]                             [money] NULL,
		[Bill to code]                         [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[BTF Fuel]                             [money] NULL,
		[Total]                                [money] NULL,
		[Rate Table]                           [float] NULL,
		[F36]                                  [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[F37]                                  [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
ALTER TABLE [dbo].[BTF] SET (LOCK_ESCALATION = TABLE)
GO
