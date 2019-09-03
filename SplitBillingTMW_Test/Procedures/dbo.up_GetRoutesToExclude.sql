SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[up_GetRoutesToExclude]
AS
SELECT [RouteName]
  FROM [SplitbillingTMW].[dbo].[RoutesToExclude]
GO
