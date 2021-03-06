SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Bryan Ellis
-- Create date: 1/24/2018
-- Description:
-- =============================================
CREATE PROCEDURE [dbo].[delete_invoices_tmw] 
	
	@ordNum varchar(100)

AS
BEGIN
	
	SET NOCOUNT ON;

   insert into deletedInvoiceDetail 
select
[ivh_hdrnumber]
      ,[ivd_number]
      ,[stp_number]
      ,[ivd_description]
      ,[cht_itemcode]
      ,[ivd_quantity]
      ,[ivd_rate]
      ,[ivd_charge]
      ,[ivd_taxable1]
      ,[ivd_taxable2]
      ,[ivd_taxable3]
      ,[ivd_taxable4]
      ,[ivd_unit]
      ,[cur_code]
      ,[ivd_currencydate]
      ,[ivd_glnum]
      ,[ord_hdrnumber]
      ,[ivd_type]
      ,[ivd_rateunit]
      ,[ivd_billto]
      ,[ivd_itemquantity]
      ,[ivd_subtotalptr]
      ,[ivd_allocatedrev]
      ,[ivd_sequence]
      ,[ivd_invoicestatus]
      ,[mfh_hdrnumber]
      ,[ivd_refnum]
      ,[cmd_code]
      ,[cmp_id]
      ,[ivd_distance]
      ,[ivd_distunit]
      ,[ivd_wgt]
      ,[ivd_wgtunit]
      ,[ivd_count]
      ,[ivd_countunit]
      ,[evt_number]
      ,[ivd_reftype]
      ,[ivd_volume]
      ,[ivd_volunit]
      ,[ivd_orig_cmpid]
      ,[ivd_payrevenue]
      ,[ivd_sign]
      ,[ivd_length]
      ,[ivd_lengthunit]
      ,[ivd_width]
      ,[ivd_widthunit]
      ,[ivd_height]
      ,[ivd_heightunit]
      ,[ivd_exportstatus]
      ,[cht_basisunit]
      ,[ivd_remark]
      ,[tar_number]
      ,[tar_tariffnumber]
      ,[tar_tariffitem]
      ,[ivd_fromord]
      ,[ivd_zipcode]
      ,[ivd_quantity_type]
      ,[cht_class]
      ,[ivd_mileagetable]
      ,[ivd_charge_type]
      ,[ivd_trl_rent]
      ,[ivd_trl_rent_start]
      ,[ivd_trl_rent_end]
      ,[ivd_rate_type]
      ,[last_updateby]
      ,[last_updatedate]
      ,[cht_lh_min]
      ,[cht_lh_rev]
      ,[cht_lh_stl]
      ,[cht_lh_rpt]
      ,[cht_rollintolh]
      ,[cht_lh_prn]
      ,[fgt_number]
      ,[ivd_paylgh_number]
      ,[ivd_tariff_type]
      ,[ivd_taxid]
      ,[ivd_ordered_volume]
      ,[ivd_ordered_loadingmeters]
      ,[ivd_ordered_count]
      ,[ivd_ordered_weight]
      ,[ivd_loadingmeters]
      ,[ivd_loadingmeters_unit]
      ,[ivd_revtype1]
      ,[ivd_hide]
      ,[ivd_baserate]
      ,[ivd_rawcharge2]
      ,[ivd_oradjustment]
      ,[ivd_cbadjustment]
      ,[ivd_fsc]
      ,[ivd_splitbillratetype]
      ,[ivd_rawcharge]
      ,[ivd_bolid]
      ,[ivd_shared_wgt]
      ,[ivd_ARTaxAuth]
      ,[ivd_tollcost]
      ,[ivd_paid_indicator]
      ,[ivd_paid_amount]
      ,[ivd_miscmoney1]
      ,[ivd_actual_quantity]
      ,[ivd_actual_unit]
      ,[ivd_tax_basis]
      ,[ivd_billable_flag]
      ,[ivd_post_invoice]
      ,[ivd_loaded_distance]
      ,[ivd_empty_distance]
      ,[fgt_supplier]
      ,[ivd_showas_cmpid]
      ,[ivd_ord_number]
      ,[ivd_leaseassetid]
      ,[ivd_MaskFromRating]
      ,[ivd_car_key]
      ,[ivd_allocated_quantity]
      ,[ivd_allocated_rate]
      ,[ivd_allocated_charge]
      ,[ivd_allocated_ivd_number]
      ,[dbsd_id_tariff]
      ,[ivd_allocation_type]
      ,[ivd_allocated_qty]
      ,[ivd_reconcile_tariff]
      ,[ivd_comment]
      ,[ivd_transdate]
      ,[ivd_ico_pyd_number_parent]
      ,[ivd_description_type]
      ,[ivd_rated_qty]
      ,[ivd_rated_rate]
      ,[dbst_rollinto_tar]
      ,[ivd_customer_char1]
      ,[ivd_branch]
      ,[ivd_delays]
      ,[ivd_rate_factor]
from tmw_test.dbo.invoicedetail
where ord_hdrnumber = @ordNum

insert into deletedInvoiceHeader
select 
[ivh_invoicenumber]
      ,[ivh_billto]
      ,[ivh_terms]
      ,[ivh_totalcharge]
      ,[ivh_shipper]
      ,[ivh_consignee]
      ,[ivh_originpoint]
      ,[ivh_destpoint]
      ,[ivh_invoicestatus]
      ,[ivh_origincity]
      ,[ivh_destcity]
      ,[ivh_originstate]
      ,[ivh_deststate]
      ,[ivh_originregion1]
      ,[ivh_destregion1]
      ,[ivh_supplier]
      ,[ivh_shipdate]
      ,[ivh_deliverydate]
      ,[ivh_revtype1]
      ,[ivh_revtype2]
      ,[ivh_revtype3]
      ,[ivh_revtype4]
      ,[ivh_totalweight]
      ,[ivh_totalpieces]
      ,[ivh_totalmiles]
      ,[ivh_currency]
      ,[ivh_currencydate]
      ,[ivh_totalvolume]
      ,[ivh_taxamount1]
      ,[ivh_taxamount2]
      ,[ivh_taxamount3]
      ,[ivh_taxamount4]
      ,[ivh_transtype]
      ,[ivh_creditmemo]
      ,[ivh_applyto]
      ,[shp_hdrnumber]
      ,[ivh_printdate]
      ,[ivh_billdate]
      ,[ivh_lastprintdate]
      ,[ivh_hdrnumber]
      ,[ord_hdrnumber]
      ,[ivh_originregion2]
      ,[ivh_originregion3]
      ,[ivh_originregion4]
      ,[ivh_destregion2]
      ,[ivh_destregion3]
      ,[ivh_destregion4]
      ,[mfh_hdrnumber]
      ,[ivh_remark]
      ,[ivh_driver]
      ,[ivh_tractor]
      ,[ivh_trailer]
      ,[ivh_user_id1]
      ,[ivh_user_id2]
      ,[ivh_ref_number]
      ,[ivh_driver2]
      ,[mov_number]
     
      ,[ivh_edi_flag]
      ,[ivh_freight_miles]
      ,[ivh_priority]
      ,[ivh_low_temp]
      ,[ivh_high_temp]
      ,[ivh_xferdate]
      ,[ivh_order_by]
      ,[tar_tarriffnumber]
      ,[tar_number]
      ,[ivh_bookyear]
      ,[ivh_bookmonth]
      ,[tar_tariffitem]
      ,[ivh_maxlength]
      ,[ivh_maxwidth]
      ,[ivh_maxheight]
      ,[ivh_mbstatus]
      ,[ivh_mbnumber]
      ,[ord_number]
      ,[ivh_quantity]
      ,[ivh_rate]
      ,[ivh_charge]
      ,[cht_itemcode]
      ,[ivh_splitbill_flag]
      ,[ivh_company]
      ,[ivh_carrier]
      ,[ivh_archarge]
      ,[ivh_arcurrency]
      ,[ivh_loadtime]
      ,[ivh_unloadtime]
      ,[ivh_drivetime]
      ,[ivh_totaltime]
      ,[ivh_rateby]
      ,[ivh_revenue_date]
      ,[ivh_batch_id]
      ,[ivh_stopoffs]
      ,[Ivh_quantity_type]
      ,[ivh_charge_type]
      ,[ivh_originzipcode]
      ,[ivh_destzipcode]
      ,[ivh_ratingquantity]
      ,[ivh_ratingunit]
      ,[ivh_unit]
      ,[ivh_mileage_adjustment]
      ,[ivh_definition]
      ,[ivh_hideshipperaddr]
      ,[ivh_hideconsignaddr]
      ,[ivh_paperworkstatus]
      ,[ivh_showshipper]
      ,[ivh_showcons]
      ,[ivh_allinclusivecharge]
      ,[ivh_order_cmd_code]
      ,[ivh_applyto_definition]
      ,[ivh_reftype]
      ,[ivh_attention]
      ,[ivh_rate_type]
      ,[ivh_paperwork_override]
      ,[ivh_cmrbill_link]
      ,[ivh_mbperiod]
      ,[ivh_mbperiodstart]
      ,[ivh_imagestatus]
      ,[ivh_imagestatus_date]
      ,[ivh_imagecount]
      ,[ivh_mbimagestatus]
      ,[ivh_mbimagestatus_date]
      ,[ivh_mbimagecount]
      ,[last_updateby]
      ,[last_updatedate]
      ,[ivh_mileage_adj_pct]
      ,[inv_revenue_pay_fix]
      ,[inv_revenue_pay]
      ,[ivh_billto_parent]
      ,[ivh_block_printing]
      ,[ivh_custdoc]
      ,[ivh_entryport]
      ,[ivh_exitport]
      ,[ivh_paid_amount]
      ,[ivh_pay_status]
      ,[ivh_dimfactor]
      ,[ivh_TrlConfiguration]
      ,[ivh_fuelprice]
      ,[ivh_gp_gl_postdate]
      ,[ivh_booked_revtype1]
      ,[ivh_order_source]
      ,[ivh_charge_type_lh]
      ,[ivh_misc_number]
      ,[ivh_paid_indicator]
      ,[ivh_lastchecknumber]
      ,[ivh_lastcheckamount]
      ,[ivh_totalpaid]
      ,[ivh_lastcheckdate]
      ,[ivh_exchangerate]
      ,[ivh_loaded_distance]
      ,[ivh_empty_distance]
      ,[ivh_furthestpointconsignee]
      ,[ivh_BelongsTo]
      ,[ivh_invoiceby]
      ,[ivh_mbnumber_custom]
      ,[ivh_leaseid]
      ,[ivh_leaseperiodenddate]
      ,[ivh_nomincharges]
      ,[car_key]
      ,[ivh_docnumber]
      ,[rowsec_rsrv_id]
      ,[ivh_trailer2]
      ,[ivh_reprint]
      ,[ivh_GPDatabase]
      ,[ivh_GPserver]
      ,[ivh_GPTerritory]
      ,[ivh_GPSalesPerson]
      ,[ivh_GPPONumber]
      ,[ivh_GPDocDescription]
      ,[ivh_GPCustNumber]
      ,[ivh_GPDocnumber]
      ,[ivh_GPbachnumbeer]
      ,[ivh_GPbilldate]
      ,[ivh_GPDuedate]
      ,[ivh_GPpostdate]
      ,[dbh_id]
      ,[ivh_mb_customgroupby]
      ,[ivh_dballocate_flag]
      ,[ivh_exportedflags]
      ,[ivh_firstxferdate]
      ,[ivh_donotprint]
      ,[ivh_dedicated_includedate]
      ,[ivh_splitgroup]
      ,[ivh_billing_usedate]
      ,[ivh_billing_usedate_setting]
      ,[ivh_dedicated_invnumber]
      ,[posted_ind]
      ,[mbgroupdata]
from tmw_test.dbo.invoiceheader
where ord_hdrnumber = @ordNum


delete from TMW_Test.dbo.invoicedetail
where ord_hdrnumber = @ordNum

delete from TMW_Test.dbo.invoiceheader
where ord_hdrnumber = @ordNum


 update [NAUS03DT2\SQL2016,49345].[SplitBilling].[dbo].[Orders] set Status = 3
  where OrderNumber = @ordNum
END
GO
