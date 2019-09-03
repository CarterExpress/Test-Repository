SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
create proc up_insertSplitbilling_CarrierInvoice
as
insert into naus03sql2.splitbilling.[dbo].[OrderCarrierInvoices]
(
[Order_Id],
			[lgh_number],
			[Carrier],
			[CarrierCharges]
)
SELECT  so.Id,convert(int,ed.TABLE_KEY) AS lgh_number
, lg.lgh_carrier
	, convert(dec(10,2),ed.col_data) AS CarrierCharges
	
FROM TMW_Live.dbo.EXTRA_INFO_DATA e --ON l.lgh_number = e.table_key 	
INNER JOIN TMW_Live.dbo.EXTRA_INFO_DATA ed
	ON e.table_key = ed.table_key
		AND (ed.EXTRA_ID = 12)
		AND (ed.TAB_ID = 3)
		AND ed.COL_ID = 45
		AND (e.EXTRA_ID = 12)
		AND (e.TAB_ID = 3)
		AND e.COL_ID = 43
		and isnumeric( ed.col_data) =1 
inner join (select * from tmw_live.dbo.legheader where ord_hdrnumber in (
select ordernumber from naus03sql2.splitbilling.dbo.orders)) lg
on lg.lgh_number = convert(int,e.TABLE_KEY)
inner join naus03sql2.splitbilling.dbo.orders so
on so.ordernumber = lg.ord_hdrnumber
left join naus03sql2.splitbilling.[dbo].[OrderCarrierInvoices] oci
on oci.[Order_Id] = so.id and oci.[lgh_number] = lg.lgh_number
WHERE e.COL_DATA = 'Y' and oci.id is null




GO
