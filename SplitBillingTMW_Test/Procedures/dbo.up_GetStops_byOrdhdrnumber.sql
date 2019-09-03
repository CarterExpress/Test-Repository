SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
--exec up_Getstops_byordhdrnumber '1696868'
CREATE proc [dbo].[up_GetStops_byOrdhdrnumber]
 @ordhdrnumber VARCHAR(50) 
as
SELECT LTrim(RTrim(o.ord_number)) AS 'TMWRouteKey'
	, s.stp_number AS 'TMWStopKey'
	, s.stp_mfh_sequence AS 'StopSequence'
	, convert(dec(10,2),ISNULL(s.stp_trip_mileage, 0)) AS 'Miles'
	, s.stp_origschdt AS 'EffectiveDate'
	, stoporg.cmp_name AS 'OriginFullName'
	, stoporg.cmp_id AS 'OriginName'
	, orgcity.cty_name AS 'OriginCity'
	, orgcity.cty_state AS 'OriginState'
	, orgcity.cty_zip AS 'OriginZip'
	, s.cmp_name AS 'DestinationFullName'
	, s.cmp_id AS 'DestinationName'
	, Destcity.cty_name AS 'DestinationCity'
	, Destcity.cty_state AS 'DestinationState'
	, Destcity.cty_zip AS 'DestinationZip'
	, s.lgh_number
	, lg.lgh_carrier as 'Carrier'
	, so.id as Order_Id
	, lg.lgh_driver1 as Driver1
FROM Tmw_Live.dbo.orderheader o
INNER JOIN Tmw_Live.dbo.stops s
	ON s.mov_number = o.mov_number
inner join TMW_Live.dbo.legheader lg
on lg.lgh_number = s.lgh_number
LEFT JOIN TMW_Live.dbo.city Destcity
	ON Destcity.cty_code = S.stp_city
LEFT JOIN Tmw_Live.dbo.stops stoporg
	ON stoporg.mov_number = o.mov_number
		AND stoporg.stp_mfh_sequence = (s.stp_mfh_sequence - 1)
LEFT JOIN TMW_Live.dbo.city orgcity
	ON orgcity.cty_code = stoporg.stp_city
	inner join naus03sql2.splitbilling.dbo.orders so
on so.ordernumber = convert(varchar,o.ord_hdrnumber)
WHERE s.stp_mfh_sequence != 1
	AND o.ord_hdrnumber = @ordhdrnumber
ORDER BY s.stp_mfh_sequence ASC
	, s.stp_number ASC
GO
