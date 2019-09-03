SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[up_Insert_BilltoControl]
@Shipper varchar(15),
@Consignee varchar(15),
@terms varchar(3),
@billto varchar(8),
@Mstordnumber varchar(30)
AS

declare @tbl table (Id int)

insert into tmw_test.dbo.Billto_Control
(fgt_shipper
, fgt_consignee
, fgt_billto
, fgt_terms
, masterord_number)
output inserted.id into @tbl
 values (upper(@Shipper),upper(@Consignee), upper(@billto), upper(@terms), upper(@Mstordnumber))

 SELECT Id,fgt_Shipper AS Shipper
	,fgt_consignee AS Consignee
	,fgt_terms AS Terms
	,fgt_billto AS Billto
	,masterord_number AS Mstordnumber
from tmw_test.dbo.Billto_Control
where Id in (select id from @tbl)
GO
