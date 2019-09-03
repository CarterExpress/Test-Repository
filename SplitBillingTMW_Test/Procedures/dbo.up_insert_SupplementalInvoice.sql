SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[up_insert_SupplementalInvoice]
 @orderhdrnumber varchar(50) 
, @billto varchar(20)
, @total float
, @createdBY varchar(50)
, @CreatedDate datetime
, @invoiceDetail dbo.InvoiceDetail readonly
as
DECLARE @NewInv INT
	DECLARE @NewIvd INT

declare @invoicecnt int
declare @letter varchar(4)

select @invoicecnt = count(*) from tmw_test.dbo.invoiceheader where ord_hdrnumber = @orderhdrnumber


SELECT 
   @letter =
      Coalesce((SELECT Char(65 + (N.Num - 475255) / 456976 % 26) WHERE N.Num >= 475255), '')
      + Coalesce((SELECT Char(65 + (N.Num - 18279) / 17576 % 26) WHERE N.Num >= 18279), '')
      + Coalesce((SELECT Char(65 + (N.Num - 703) / 676 % 26) WHERE N.Num >= 703), '')
      + Coalesce((SELECT Char(65 + (N.Num - 27) / 26 % 26) WHERE N.Num >= 27), '')
      + (SELECT Char(65 + (N.Num - 1) % 26))
FROM
   (VALUES
      (@invoicecnt+1)
   ) N (Num)

   declare @invoicenumber varchar(50) = @orderhdrnumber+@letter
   
   EXEC @NewInv = TMW_test.dbo.getsystemnumber 'INVHDR'
		, NULL

	/*EXEC @NewIvd = TMW_test.dbo.getsystemnumber 'INVDET'
		, NULL*/
		


		
		INSERT INTO TMW_test.dbo.invoiceheader (
		ivh_invoicenumber
		, ivh_billto
		, ivh_terms
		, ivh_totalcharge
		, ivh_shipper
		, ivh_consignee
		, ivh_originpoint
		, ivh_destpoint
		, ivh_invoicestatus
		, ivh_origincity
		, ivh_destcity
		, ivh_originstate
		, ivh_deststate
		, ivh_shipdate
		, ivh_deliverydate
		, ivh_revtype1
		, ivh_revtype2
		, ivh_revtype3
		, ivh_revtype4
		, ivh_totalweight
		, ivh_totalpieces
		, ivh_totalmiles
		, ivh_currency
		, ivh_totalvolume
		, ivh_taxamount1
		, ivh_taxamount2
		, ivh_taxamount3
		, ivh_taxamount4
		, ivh_transtype
		, ivh_applyto
		, ivh_billdate
		, ivh_hdrnumber
		, ord_hdrnumber
		, ivh_mbnumber
		, ivh_driver
		, ivh_driver2
		, ivh_tractor
		, ivh_trailer
		, ivh_edi_flag
		, ivh_freight_miles
		, ivh_priority
		, ivh_low_temp
		, ivh_high_temp
		, ivh_order_by
		, ivh_user_id1
		, ivh_user_id2
		, ivh_mbstatus
		, ord_number
		, ivh_quantity
		, ivh_charge
		, ivh_splitbill_flag
		, ivh_company
		, ivh_carrier
		, ivh_archarge
		, ivh_arcurrency
		, ivh_unit
		, ivh_revenue_date
		, ivh_batch_id
		, Ivh_quantity_type
		, ivh_charge_type
		, ivh_originzipcode
		, ivh_destzipcode
		, ivh_definition
		, ivh_showshipper
		, ivh_showcons
		, ivh_mileage_adjustment
		, ivh_paperworkstatus
		, ivh_reftype
		, ivh_rate_type
		, ivh_paperwork_override
		, ivh_cmrbill_link
		, inv_revenue_pay_fix
		, inv_revenue_pay
		, ivh_billto_parent
		, ivh_block_printing
		, ivh_entryport
		, ivh_exitport
		, ivh_mileage_adj_pct
		, ivh_dimfactor
		, ivh_TrlConfiguration
		, ivh_charge_type_lh
		, ivh_booked_revtype1
		, ivh_misc_number
		, ivh_remark
		)

		select top 1 @invoicenumber
		, @billto
		, ivh_terms
		, @total
		, ivh_shipper
		, ivh_consignee
		, ivh_originpoint
		, ivh_destpoint
		, 'PRN'
		, ivh_origincity
		, ivh_destcity
		, ivh_originstate
		, ivh_deststate
		, ivh_shipdate
		, ivh_deliverydate
		, ivh_revtype1
		, ivh_revtype2
		, ivh_revtype3
		, ivh_revtype4
		, ivh_totalweight
		, ivh_totalpieces
		, ivh_totalmiles
		, ivh_currency
		, ivh_totalvolume
		, ivh_taxamount1
		, ivh_taxamount2
		, ivh_taxamount3
		, ivh_taxamount4
		, ivh_transtype
		, @invoicenumber
		, @createdDate
		, @newinv
		, ord_hdrnumber
		, ivh_mbnumber
		, ivh_driver
		, ivh_driver2
		, ivh_tractor
		, ivh_trailer
		, ivh_edi_flag
		, ivh_freight_miles
		, ivh_priority
		, ivh_low_temp
		, ivh_high_temp
		, ivh_order_by
		, ivh_user_id1
		, ivh_user_id2
		, 'PRN'
		, ord_number
		, ivh_quantity
		, @total
		, ivh_splitbill_flag
		, ivh_company
		, ivh_carrier
		, ivh_archarge
		, ivh_arcurrency
		, ivh_unit
		, ivh_revenue_date
		, ivh_batch_id
		, Ivh_quantity_type
		, ivh_charge_type
		, ivh_originzipcode
		, ivh_destzipcode
		, ivh_definition
		, ivh_showshipper
		, ivh_showcons
		, ivh_mileage_adjustment
		, ivh_paperworkstatus
		, ivh_reftype
		, ivh_rate_type
		, ivh_paperwork_override
		, ivh_cmrbill_link
		, inv_revenue_pay_fix
		, inv_revenue_pay
		, ivh_billto_parent
		, ivh_block_printing
		, ivh_entryport
		, ivh_exitport
		, ivh_mileage_adj_pct
		, ivh_dimfactor
		, ivh_TrlConfiguration
		, ivh_charge_type_lh
		, ivh_booked_revtype1
		, ivh_misc_number
		, ivh_remark
		from tmw_test.dbo.invoiceheader where ord_hdrnumber =@orderhdrnumber and ivh_billto=@billto

   


    DECLARE detail CURSOR --- We need to name It!
--	--- We need to Tell the System what it is for
--	--- We can do a complex SQl Statement with 16 joins 
--	--- or a simple one like this one.
FOR
   select *,ROW_NUMBER ( )   OVER (order by createddate) as row
   from @invoiceDetail
  
	declare @SupplementalInvoiceDetailId [bigint],
	@SupplementalInvoiceHeader [bigint],
	@ChargeType [varchar](50),
	@Quantity [float],
	@Rate [float],
	@SendToTMW [bit] ,
	@dCreatedBy [varchar](50) ,
	@dCreatedDate [datetime],
	@Rownumber int
   
open detail

fetch next from detail 
into @SupplementalInvoiceDetailId,
	@SupplementalInvoiceHeader,
	@ChargeType,
	@Quantity,
	@Rate,
	@SendToTMW,
	@dCreatedBy,
	@dCreatedDate,
	@Rownumber

	WHILE (@@FETCH_STATUS <> - 1)
BEGIN
   EXEC @NewIvd = TMW_test.dbo.getsystemnumber 'INVDET'
		, NULL
INSERT INTO TMW_test.dbo.invoicedetail (
		ivh_hdrnumber
		, ivd_number
		, ivd_description
		, ivd_quantity
		, ivd_rate
		, ivd_charge
		, ivd_taxable1
		, ivd_taxable2
		, ivd_taxable3
		, ivd_taxable4
		, ivd_unit
		, cur_code
		, ivd_glnum
		, ord_hdrnumber
		, ivd_type
		, ivd_rateunit
		, ivd_billto
		, ivd_itemquantity
		, ivd_subtotalptr
		, ivd_sequence
		, ivd_refnum
		, cmp_id
		, ivd_distance
		, ivd_distunit
		, ivd_wgt
		, ivd_wgtunit
		, ivd_count
		, ivd_reftype
		, ivd_volume
		, ivd_volunit
		, ivd_countunit
		, cht_itemcode
		, cmd_code
		, ivd_sign
		, cht_basisunit
		, ivd_remark
		, ivd_fromord
		, cht_rollintolh
		, ivd_quantity_type
		, cht_class
		, ivd_charge_type
		, ivd_rate_type
		, cht_lh_min
		, cht_lh_rev
		, cht_lh_stl
		, cht_lh_rpt
		, ivd_ordered_volume
		, ivd_ordered_loadingmeters
		, ivd_ordered_count
		, ivd_ordered_weight
		, ivd_loadingmeters
		, ivd_revtype1
		, ivd_ARTaxAuth		
		)

   SELECT @NewInv ivh_hdrnumber
		, @NewIvd ivh_number
		, 'UNKNOWN' ivd_description
		, [Quantity]
		, rate
		, ([Quantity] * rate)
		, 'Y'
		, 'Y'
		, 'N'
		, 'N'
		, 'FLT'
		, 'US'
		, '301080'
		, @orderhdrnumber
		, 'LI'
		, cht_rateunit
		, @billto
		, 0
		, 0
		, @Rownumber
		, null
		, 'UNKNOWN'
		, 0
		, 'MIL'
		, 0
		, 'LBS'
		, 0
		, 'REF'
		, 0
		, 'CUB'
		, 'PLT'
		, chargetype
		, 'AP'
		, 1
		,  cht_basisunit
		, ''
		, ''
		, cht_rollintolh
		, 0
		, cht_class
		, 0
		, 0
		, 'Y'
		, 'Y'
		, 'Y'
		, 'Y'
		, 0
		, 0
		, 0
		, 0
		, 0
		, 'UNK'
		, ''
from @invoiceDetail
inner join TMW_TEST.dbo.chargetype b
on b.cht_itemcode = chargetype	
where SupplementalInvoiceDetailId = @SupplementalInvoiceDetailId


fetch next from detail 
into @SupplementalInvoiceDetailId,
	@SupplementalInvoiceHeader,
	@ChargeType,
	@Quantity,
	@Rate,
	@SendToTMW,
	@dCreatedBy,
	@dCreatedDate,
	@Rownumber
end


CLOSE detail

DEALLOCATE detail;


GO
