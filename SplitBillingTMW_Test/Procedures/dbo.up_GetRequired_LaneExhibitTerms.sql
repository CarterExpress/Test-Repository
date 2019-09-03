SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[up_GetRequired_LaneExhibitTerms]
AS
SELECT [TermKey]
  FROM [SplitbillingTMW].[dbo].[Required_LaneExhibitTerms]
GO
