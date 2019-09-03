SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[up_Update_BilltoControl]
@Id int ,
@Shipper varchar(15),
@Consignee varchar(15),
@terms varchar(3),
@billto varchar(8),
@Mstordnumber varchar(30)
AS
update tmw_test.dbo.Billto_Control
set fgt_shipper = upper(@Shipper)
, fgt_consignee = upper(@Consignee)
, fgt_billto = upper(@billto)
, fgt_terms = upper(@terms)
, masterord_number = upper(@Mstordnumber)
where id = @Id

SELECT Id,fgt_Shipper AS Shipper
	,fgt_consignee AS Consignee
	,fgt_terms AS Terms
	,fgt_billto AS Billto
	,masterord_number AS Mstordnumber
from tmw_test.dbo.Billto_Control
where Id = @Id
GO
