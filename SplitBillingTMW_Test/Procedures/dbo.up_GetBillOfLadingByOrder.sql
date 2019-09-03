SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

--exec [dbo].[up_GetBillOfLadingByOrder] '1738295'
CREATE PROCEDURE [dbo].[up_GetBillOfLadingByOrder] 
@Id VARCHAR(50)
AS
SELECT *
FROM (
	SELECT *,
		DENSE_RANK() OVER (
			PARTITION BY TMWFreightKey ORDER BY CASE 
					WHEN terms = CustomerTerms
						THEN 1
					ELSE 2
					END
			) AS dRank
	FROM (
		SELECT DISTINCT f.fgt_number AS 'TMWFreightKey',
			f.fgt_refnum AS 'TMWReferenceKey',
			f.stp_number AS 'TMWStopKey',
			--btcFull.fgt_billto '1', btcshipconall.fgt_billto '2', btcmallconRTE.fgt_billto '3', btcmallconall.fgt_billto '4', btcmshallRTE.fgt_billto '5', btcshallall.fgt_billto '6', btcthrdRTE.fgt_billto '7', btcthrdall.fgt_billto '8',
			CASE 
				WHEN o.ord_billto IN (
						'001',
						'002',
						'N111'
						)
					THEN coalesce(btcFull.fgt_billto, btcshipconall.fgt_billto, btcmallconRTE.fgt_billto, btcmallconall.fgt_billto, btcmshallRTE.fgt_billto, btcshallall.fgt_billto, btcthrdRTE.fgt_billto, btcthrdall.fgt_billto, CASE 
								WHEN f.fgt_terms = 'COL'
									THEN (
											SELECT CASE cmp_defaultbillto
													WHEN 'UNKNOWN'
														THEN NULL
													ELSE cmp_defaultbillto
													END AS cmp_defaultbillto
											FROM TMW_Live.dbo.company
											WHERE cmp_id = f.fgt_consignee
											)
								WHEN f.fgt_terms = 'PPD'
									THEN (
											SELECT CASE cmp_defaultbillto
													WHEN 'UNKNOWN'
														THEN NULL
													ELSE cmp_defaultbillto
													END AS cmp_defaultbillto
											FROM TMW_Live.dbo.company
											WHERE cmp_id = f.fgt_shipper
											)
								END, 'Unknown')
				ELSE coalesce(btcfull.fgt_billto, btcshipconall.fgt_billto, btcmallconRTE.fgt_billto, btcshallall.fgt_billto, btcthrdRTE.fgt_billto, btcthrdall.fgt_billto, o.ord_billto)
				END AS 'BillTo'
			/*
		,isnull(CASE 
			WHEN f.fgt_billto IS NULL
				AND coalesce(btcFull.fgt_billto, btcpart.fgt_billto, btcpart2.fgt_billto, btcpart3.fgt_billto, btcpart4.fgt_billto, f.fgt_billto, o.ord_billto) IS NOT NULL
				AND coalesce(btcFull.fgt_billto, btcpart.fgt_billto, btcpart2.fgt_billto, btcpart3.fgt_billto, btcpart4.fgt_billto, f.fgt_billto, o.ord_billto) NOT IN (
					'001'
					,'002'
					)
				THEN coalesce(btcFull.fgt_billto, btcpart.fgt_billto, btcpart2.fgt_billto, btcpart3.fgt_billto, btcpart4.fgt_billto, f.fgt_billto, o.ord_billto)
			WHEN f.fgt_billto IS NOT NULL
				AND coalesce(btcFull.fgt_billto, btcpart.fgt_billto, btcpart2.fgt_billto, btcpart3.fgt_billto, btcpart4.fgt_billto, f.fgt_billto, o.ord_billto) IS NULL
				THEN f.fgt_billto
			WHEN f.fgt_billto IS NULL
				AND (
					coalesce(btcFull.fgt_billto, btcpart.fgt_billto, btcpart2.fgt_billto, btcpart3.fgt_billto, btcpart4.fgt_billto, f.fgt_billto, o.ord_billto) IS NULL
					OR coalesce(btcFull.fgt_billto, btcpart.fgt_billto, btcpart2.fgt_billto, btcpart3.fgt_billto, btcpart4.fgt_billto, f.fgt_billto, o.ord_billto) IN (
						'001'
						,'002'
						)
					)
				THEN CASE 
						WHEN f.fgt_terms = 'COL'
							THEN (
									SELECT case cmp_defaultbillto when 'UNKNOWN' then null else cmp_defaultbillto end as cmp_defaultbillto
									FROM TMW_Live.dbo.company
									WHERE cmp_id = f.fgt_consignee
									)
						WHEN f.fgt_terms = 'PPD'
							THEN (
									SELECT case cmp_defaultbillto when 'UNKNOWN' then null else cmp_defaultbillto end as cmp_defaultbillto
									FROM TMW_Live.dbo.company
									WHERE cmp_id = f.fgt_shipper
									)
						END
			END,btcpart5.fgt_billto) AS 'BillTo'*/
			,
			f.fgt_shipper AS 'Shipper',
			f.fgt_leg_origin AS LegOrigin,
			f.fgt_leg_dest AS LegDest,
			f.fgt_consignee AS 'Consignee',
			f.fgt_terms AS 'Terms',
			CASE 
				WHEN o.ord_billto IN (
						'001',
						'002'
						) or coalesce(btcFull.fgt_billto, btcshipconall.fgt_billto, btcmallconRTE.fgt_billto, btcmallconall.fgt_billto, btcmshallRTE.fgt_billto, btcshallall.fgt_billto, btcthrdRTE.fgt_billto, btcthrdall.fgt_billto) is not null
					THEN coalesce(btcFull.fgt_terms, btcshipconall.fgt_terms, btcmallconRTE.fgt_terms, btcmallconall.fgt_terms, btcmshallRTE.fgt_terms, btcshallall.fgt_terms, f.fgt_terms)
				ELSE f.fgt_terms
				END AS 'CustomerTerms',
			f.fgt_bolid AS 'TMWFreightBOLID',
			CASE 
				WHEN stp_type = 'PUP'
					THEN fgt_weight
				ELSE 0
				END AS 'InboundWeight',
			CASE 
				WHEN stp_type = 'DRP'
					THEN fgt_weight
				ELSE 0
				END AS 'OutboundWeight',
			f.fgt_weight AS 'RawWeight',
			CASE 
				WHEN fgt_countunit = 'PLT'
					THEN fgt_count
				WHEN fgt_count2unit = 'PLT'
					THEN fgt_count2
				END AS 'PalletCount',
			(
				SELECT c.cty_code
				FROM TMW_Live.dbo.company cp
				INNER JOIN [TMW_Live].[dbo].city c
					ON cp.cmp_city = c.cty_code
				WHERE cp.cmp_id = f.fgt_shipper
				) AS 'OriginCity',
			(
				SELECT c.cty_state
				FROM TMW_Live.dbo.company cp
				INNER JOIN [TMW_Live].[dbo].city c
					ON cp.cmp_city = c.cty_code
				WHERE cp.cmp_id = f.fgt_shipper
				) AS 'OriginState',
			(
				SELECT c.cty_zip
				FROM TMW_Live.dbo.company cp
				INNER JOIN [TMW_Live].[dbo].city c
					ON cp.cmp_city = c.cty_code
				WHERE cp.cmp_id = f.fgt_shipper
				) AS 'OriginZip',
			(
				SELECT c.cty_code
				FROM TMW_Live.dbo.company cp
				INNER JOIN [TMW_Live].[dbo].city c
					ON cp.cmp_city = c.cty_code
				WHERE cp.cmp_id = f.fgt_consignee
				) AS 'DestinationCity',
			(
				SELECT c.cty_state
				FROM TMW_Live.dbo.company cp
				INNER JOIN [TMW_Live].[dbo].city c
					ON cp.cmp_city = c.cty_code
				WHERE cp.cmp_id = f.fgt_consignee
				) AS 'DestinationState',
			(
				SELECT c.cty_zip
				FROM TMW_Live.dbo.company cp
				INNER JOIN [TMW_Live].[dbo].city c
					ON cp.cmp_city = c.cty_code
				WHERE cp.cmp_id = f.fgt_consignee
				) AS 'DestinationZip',
			s.lgh_number
		FROM TMW_Live.dbo.orderheader o
		INNER JOIN TMW_Live.dbo.stops s
			ON o.mov_number = s.mov_number
		INNER JOIN TMW_Live.dbo.freightdetail f
			ON f.stp_number = s.stp_number
		LEFT JOIN [TMW_Live].[dbo].[Billto_Control] btcFull
			ON (f.fgt_shipper = btcFull.fgt_shipper)
				AND (f.fgt_consignee = btcFull.fgt_consignee)
				AND (btcFull.masterord_number = o.ord_fromorder)
		LEFT JOIN [TMW_Live].[dbo].[Billto_Control] btcshipconall
			ON (f.fgt_shipper = btcshipconall.fgt_shipper)
				AND (f.fgt_consignee = btcshipconall.fgt_consignee)
				AND (btcshipconall.masterord_number = '*')
		LEFT JOIN [TMW_Live].[dbo].[Billto_Control] btcmallconRTE
			ON ('*' = btcmallconRTE.fgt_shipper)
				AND (f.fgt_consignee = btcmallconRTE.fgt_consignee)
				AND (btcmallconRTE.masterord_number = o.ord_fromorder)
				AND f.fgt_terms = 'COL'
		LEFT JOIN [TMW_Live].[dbo].[Billto_Control] btcmallconall
			ON ('*' = btcmallconall.fgt_shipper)
				AND (f.fgt_consignee = btcmallconall.fgt_consignee)
				AND (btcmallconall.masterord_number = '*')
				AND f.fgt_terms = 'COL'
		LEFT JOIN [TMW_Live].[dbo].[Billto_Control] btcmshallRTE
			ON (f.fgt_shipper = btcmshallRTE.fgt_shipper)
				AND ('*' = btcmshallRTE.fgt_consignee)
				AND (btcmshallRTE.masterord_number = o.ord_fromorder)
				AND f.fgt_terms = 'PPD'
		LEFT JOIN [TMW_Live].[dbo].[Billto_Control] btcshallall
			ON (f.fgt_shipper = btcshallall.fgt_shipper)
				AND ('*' = btcshallall.fgt_consignee)
				AND (btcshallall.masterord_number = '*')
				AND f.fgt_terms = 'PPD'
		LEFT JOIN [TMW_Live].[dbo].[Billto_Control] btcthrdRTE
			ON (f.fgt_shipper = btcthrdRTE.fgt_shipper)
				AND ('*' = btcthrdRTE.fgt_consignee)
				AND (btcthrdRTE.masterord_number = o.ord_fromorder)
				AND f.fgt_terms = 'THR'
		LEFT JOIN [TMW_Live].[dbo].[Billto_Control] btcthrdall
			ON (f.fgt_shipper = btcthrdall.fgt_shipper)
				AND ('*' = btcthrdall.fgt_consignee)
				AND (btcshallall.masterord_number = '*')
				AND f.fgt_terms = 'THR'
		LEFT JOIN TMW_Live.dbo.company comp
			ON comp.cmp_id = f.fgt_consignee
		WHERE o.ord_number = @Id
			AND f.fgt_bolid IS NOT NULL
		) a
	WHERE isnull(BillTo, '') NOT IN ('N110T')
		AND RawWeight != 0
	) b
WHERE drank = 1
ORDER BY TMWReferenceKey,
	BillTo
GO
