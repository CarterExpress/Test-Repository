SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[up_get_CarrierInvoices] 
 @lgh_number INT 
AS
SELECT TOP 10 convert(int,ed.TABLE_KEY) AS lgh_number
	, convert(dec(10,2),ed.col_data) AS CarrierCharges
FROM TMW_test.dbo.EXTRA_INFO_DATA e --ON l.lgh_number = e.table_key 	
INNER JOIN TMW_Test.dbo.EXTRA_INFO_DATA ed
	ON e.table_key = ed.table_key
		AND (ed.EXTRA_ID = 12)
		AND (ed.TAB_ID = 3)
		AND ed.COL_ID = 45
		AND (e.EXTRA_ID = 12)
		AND (e.TAB_ID = 3)
		AND e.COL_ID = 43
WHERE e.COL_DATA = 'Y'
	AND e.TABLE_KEY = @lgh_number
GO
