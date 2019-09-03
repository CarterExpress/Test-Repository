SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[deletedInvoiceHeader] (
		[ivh_invoicenumber]               [varchar](12) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[ivh_billto]                      [varchar](8) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[ivh_terms]                       [char](3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[ivh_totalcharge]                 [money] NULL,
		[ivh_shipper]                     [varchar](8) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[ivh_consignee]                   [varchar](8) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[ivh_originpoint]                 [varchar](8) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[ivh_destpoint]                   [varchar](8) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[ivh_invoicestatus]               [varchar](6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[ivh_origincity]                  [int] NULL,
		[ivh_destcity]                    [int] NULL,
		[ivh_originstate]                 [char](2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[ivh_deststate]                   [char](2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[ivh_originregion1]               [varchar](6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[ivh_destregion1]                 [varchar](6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[ivh_supplier]                    [varchar](8) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[ivh_shipdate]                    [datetime] NULL,
		[ivh_deliverydate]                [datetime] NULL,
		[ivh_revtype1]                    [varchar](6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[ivh_revtype2]                    [varchar](6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[ivh_revtype3]                    [varchar](6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[ivh_revtype4]                    [varchar](6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[ivh_totalweight]                 [float] NULL,
		[ivh_totalpieces]                 [float] NULL,
		[ivh_totalmiles]                  [float] NULL,
		[ivh_currency]                    [varchar](6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[ivh_currencydate]                [datetime] NULL,
		[ivh_totalvolume]                 [float] NULL,
		[ivh_taxamount1]                  [money] NULL,
		[ivh_taxamount2]                  [money] NULL,
		[ivh_taxamount3]                  [money] NULL,
		[ivh_taxamount4]                  [money] NULL,
		[ivh_transtype]                   [varchar](6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[ivh_creditmemo]                  [char](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[ivh_applyto]                     [varchar](12) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[shp_hdrnumber]                   [int] NULL,
		[ivh_printdate]                   [datetime] NULL,
		[ivh_billdate]                    [datetime] NULL,
		[ivh_lastprintdate]               [datetime] NULL,
		[ivh_hdrnumber]                   [int] NOT NULL,
		[ord_hdrnumber]                   [int] NULL,
		[ivh_originregion2]               [varchar](6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[ivh_originregion3]               [varchar](6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[ivh_originregion4]               [varchar](6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[ivh_destregion2]                 [varchar](6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[ivh_destregion3]                 [varchar](6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[ivh_destregion4]                 [varchar](6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[mfh_hdrnumber]                   [int] NULL,
		[ivh_remark]                      [varchar](254) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[ivh_driver]                      [varchar](8) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[ivh_tractor]                     [varchar](8) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[ivh_trailer]                     [varchar](13) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[ivh_user_id1]                    [char](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[ivh_user_id2]                    [char](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[ivh_ref_number]                  [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[ivh_driver2]                     [varchar](8) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[mov_number]                      [int] NULL,
		[ivh_edi_flag]                    [char](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[ivh_freight_miles]               [float] NULL,
		[ivh_priority]                    [varchar](6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[ivh_low_temp]                    [smallint] NULL,
		[ivh_high_temp]                   [smallint] NULL,
		[ivh_xferdate]                    [datetime] NULL,
		[ivh_order_by]                    [varchar](8) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[tar_tarriffnumber]               [varchar](12) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[tar_number]                      [int] NULL,
		[ivh_bookyear]                    [tinyint] NULL,
		[ivh_bookmonth]                   [tinyint] NULL,
		[tar_tariffitem]                  [varchar](12) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[ivh_maxlength]                   [money] NULL,
		[ivh_maxwidth]                    [money] NULL,
		[ivh_maxheight]                   [money] NULL,
		[ivh_mbstatus]                    [varchar](6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[ivh_mbnumber]                    [int] NULL,
		[ord_number]                      [char](12) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[ivh_quantity]                    [float] NULL,
		[ivh_rate]                        [money] NULL,
		[ivh_charge]                      [money] NULL,
		[cht_itemcode]                    [varchar](6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[ivh_splitbill_flag]              [char](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[ivh_company]                     [varchar](6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[ivh_carrier]                     [varchar](8) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[ivh_archarge]                    [money] NULL,
		[ivh_arcurrency]                  [varchar](6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[ivh_loadtime]                    [float] NULL,
		[ivh_unloadtime]                  [float] NULL,
		[ivh_drivetime]                   [float] NULL,
		[ivh_totaltime]                   [float] NULL,
		[ivh_rateby]                      [char](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[ivh_revenue_date]                [datetime] NULL,
		[ivh_batch_id]                    [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[ivh_stopoffs]                    [smallint] NULL,
		[Ivh_quantity_type]               [smallint] NULL,
		[ivh_charge_type]                 [smallint] NULL,
		[ivh_originzipcode]               [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[ivh_destzipcode]                 [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[ivh_ratingquantity]              [float] NULL,
		[ivh_ratingunit]                  [varchar](6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[ivh_unit]                        [varchar](6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[ivh_mileage_adjustment]          [decimal](9, 1) NULL,
		[ivh_definition]                  [varchar](6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[ivh_hideshipperaddr]             [char](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[ivh_hideconsignaddr]             [char](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[ivh_paperworkstatus]             [varchar](6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[ivh_showshipper]                 [varchar](8) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[ivh_showcons]                    [varchar](8) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[ivh_allinclusivecharge]          [money] NULL,
		[ivh_order_cmd_code]              [varchar](8) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[ivh_applyto_definition]          [varchar](6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[ivh_reftype]                     [varchar](6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[ivh_attention]                   [varchar](254) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[ivh_rate_type]                   [smallint] NULL,
		[ivh_paperwork_override]          [char](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[ivh_cmrbill_link]                [int] NULL,
		[ivh_mbperiod]                    [datetime] NULL,
		[ivh_mbperiodstart]               [datetime] NULL,
		[ivh_imagestatus]                 [tinyint] NULL,
		[ivh_imagestatus_date]            [datetime] NULL,
		[ivh_imagecount]                  [smallint] NULL,
		[ivh_mbimagestatus]               [tinyint] NULL,
		[ivh_mbimagestatus_date]          [datetime] NULL,
		[ivh_mbimagecount]                [smallint] NULL,
		[last_updateby]                   [varchar](256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[last_updatedate]                 [datetime] NULL,
		[ivh_mileage_adj_pct]             [decimal](9, 2) NULL,
		[inv_revenue_pay_fix]             [int] NULL,
		[inv_revenue_pay]                 [money] NULL,
		[ivh_billto_parent]               [varchar](8) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[ivh_block_printing]              [char](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[ivh_custdoc]                     [int] NULL,
		[ivh_entryport]                   [varchar](8) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[ivh_exitport]                    [varchar](8) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[ivh_paid_amount]                 [money] NULL,
		[ivh_pay_status]                  [char](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[ivh_dimfactor]                   [decimal](12, 4) NULL,
		[ivh_TrlConfiguration]            [varchar](6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[ivh_fuelprice]                   [decimal](19, 4) NULL,
		[ivh_gp_gl_postdate]              [datetime] NOT NULL,
		[ivh_booked_revtype1]             [varchar](12) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[ivh_order_source]                [varchar](6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[ivh_charge_type_lh]              [smallint] NULL,
		[ivh_misc_number]                 [varchar](12) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[ivh_paid_indicator]              [char](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[ivh_lastchecknumber]             [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[ivh_lastcheckamount]             [money] NULL,
		[ivh_totalpaid]                   [money] NULL,
		[ivh_lastcheckdate]               [datetime] NULL,
		[ivh_exchangerate]                [numeric](19, 4) NULL,
		[ivh_loaded_distance]             [float] NULL,
		[ivh_empty_distance]              [float] NULL,
		[ivh_furthestpointconsignee]      [varchar](8) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[ivh_BelongsTo]                   [varchar](6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[ivh_invoiceby]                   [varchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[ivh_mbnumber_custom]             [int] NULL,
		[ivh_leaseid]                     [int] NULL,
		[ivh_leaseperiodenddate]          [datetime] NULL,
		[ivh_nomincharges]                [char](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[car_key]                         [int] NULL,
		[ivh_docnumber]                   [int] NULL,
		[rowsec_rsrv_id]                  [int] NULL,
		[ivh_trailer2]                    [varchar](13) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[ivh_reprint]                     [char](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[ivh_GPDatabase]                  [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[ivh_GPserver]                    [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[ivh_GPTerritory]                 [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[ivh_GPSalesPerson]               [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[ivh_GPPONumber]                  [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[ivh_GPDocDescription]            [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[ivh_GPCustNumber]                [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[ivh_GPDocnumber]                 [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[ivh_GPbachnumbeer]               [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[ivh_GPbilldate]                  [datetime] NULL,
		[ivh_GPDuedate]                   [datetime] NULL,
		[ivh_GPpostdate]                  [datetime] NULL,
		[dbh_id]                          [int] NULL,
		[ivh_mb_customgroupby]            [varchar](80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[ivh_dballocate_flag]             [char](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[ivh_exportedflags]               [int] NULL,
		[ivh_firstxferdate]               [datetime] NULL,
		[ivh_donotprint]                  [char](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[ivh_dedicated_includedate]       [datetime] NULL,
		[ivh_splitgroup]                  [varchar](6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[ivh_billing_usedate]             [datetime] NULL,
		[ivh_billing_usedate_setting]     [varchar](6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[ivh_dedicated_invnumber]         [int] NULL,
		[posted_ind]                      [char](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[mbgroupdata]                     [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
ALTER TABLE [dbo].[deletedInvoiceHeader] SET (LOCK_ESCALATION = TABLE)
GO