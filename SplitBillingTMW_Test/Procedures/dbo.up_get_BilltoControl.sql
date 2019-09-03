SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[up_get_BilltoControl]
AS
SELECT Id,ltrim(rtrim(fgt_Shipper)) AS Shipper
	,ltrim(rtrim(fgt_consignee)) AS Consignee
	,ltrim(rtrim(fgt_terms)) AS Terms
	,ltrim(rtrim(fgt_billto)) AS Billto
	,ltrim(rtrim(masterord_number)) AS Mstordnumber
from tmw_test.dbo.Billto_Control

GO
