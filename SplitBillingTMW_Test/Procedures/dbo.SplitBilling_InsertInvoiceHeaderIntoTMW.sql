SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

-- =============================================  
-- Author:  Mike Reynolds
-- Create date: 12/19/2017  
-- Description: Creates Invoice Header records in TMW. 
-- =============================================  
CREATE PROCEDURE [dbo].[SplitBilling_InsertInvoiceHeaderIntoTMW] 

   @billTo VARCHAR(8)  
 , @ordnum VARCHAR(12)
 , @terms VARCHAR(3)  
 , @totalAmountDue DECIMAL(8, 2)  
 , @bol VARCHAR(35)  
 , @bolId INT  
 , @consignorId VARCHAR(8)  
 , @consigneeId VARCHAR(8)  
 , @originCity VARCHAR(30)  
 , @destCity VARCHAR(30)  
 , @originState VARCHAR(2)  
 , @destState VARCHAR(2)  
 , @shipDate DATETIME  
 , @deliveryDate DATETIME  
 , @originZip VARCHAR(11)  
 , @destZip VARCHAR(11)
 , @remark VARCHAR(254) = NULL 
 , @totalweight DECIMAL(18,4)
 , @totalmiles DECIMAL(18,4)
 , @revtype1 VARCHAR(6) -- ChargeType
 , @revtype2 VARCHAR(6) = 'UNK'
 , @revtype3 VARCHAR(6) = 'UNK'
 , @revtype4 VARCHAR(6) = 'UNK'
 , @movnumber INT
 , @fueltableid VARCHAR(8) = NULL
 , @fuelprice DECIMAL(18,4)
 
AS  
BEGIN  
SET NOCOUNT ON;  
  
DECLARE @NewInv INT 

EXEC @NewInv = TMW_Test.dbo.getsystemnumber 'INVHDR', NULL

PRINT @NewInv

DECLARE	  @driver1 VARCHAR(8)
		, @driver2 VARCHAR(8)
		, @tractor VARCHAR(8)
		, @trailer VARCHAR(13)

SELECT	@driver1 = lgh_driver1,
		@driver2 = lgh_driver2,
		@tractor = lgh_tractor,
		@trailer = lgh_primary_trailer
FROM	TMW_live.dbo.legheader
WHERE	mov_number = @movnumber 
/*
select  @billTo = ltrim(rtrim(@billTo))
 , @ordnum = ltrim(rtrim(@ordnum))
 , @terms = ltrim(rtrim(@terms)) 
 , @bol = ltrim(rtrim(@bol)) 
 , @consignorId = ltrim(rtrim(@consignorId))
 , @consigneeId = ltrim(rtrim(@consigneeId))
 , @originCity = ltrim(rtrim(@originCity))
 , @destCity = ltrim(rtrim(@destCity))
 , @originState = ltrim(rtrim(@originState))
 , @destState = ltrim(rtrim(@destState)) 
 , @originZip = ltrim(rtrim(@originZip))
 , @destZip = ltrim(rtrim(@destZip))
 , @remark = ltrim(rtrim(@remark)) 
 , @revtype1 =ltrim(rtrim(@revType1))
 , @revtype2 =ltrim(rtrim(@revType2))
 , @revtype3 =ltrim(rtrim(@revType3))
 , @revtype4 =ltrim(rtrim(@revType4)) 
 , @fueltableid  =ltrim(rtrim(@fueltableid))
 insert into spjunk
 values(
  @billTo
 , @ordnum
 , @terms
 , @totalAmountDue
 , @bol
 , @bolId
 , @consignorId
 , @consigneeId
 , @originCity
 , @destCity
 , @originState
 , @destState
 , @shipDate
 , @deliveryDate
 , @originZip
 , @destZip
 , @remark
 , @totalweight
 , @totalmiles
 , @revtype1
 , @revtype2
 , @revtype3
 , @revtype4
 , @movnumber
 , @fueltableid
 , @fuelprice
 , @NewInv
 )
 /*select  @billTo billto
 , @ordnum ordnum
 , @terms terms
 , @bol bol
 , @consignorId shipper
 , @consigneeId consignee
 , @originCity ocity
 , @destCity dcity
 , @originState ostate
 , @destState dstate
 , @originZip ozip
 , @destZip dzip
 , @remark remark
 , @revtype1 rt1
 , @revtype2 rt2
 , @revtype3 rt3 
 , @revtype4 rt4
 , @fueltableid ft
 into tmw_test.dbo.spjunk*/
 */
 INSERT INTO TMW_Test.dbo.invoiceheader (  
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
  , mov_number
  , ivh_edi_flag  
  , ivh_freight_miles  
  , ivh_priority  
  , ivh_xferdate
  , ivh_low_temp  
  , ivh_high_temp  
  , ivh_order_by  
  , tar_number
  , ivh_bookyear
  , ivh_bookmonth
  , ivh_user_id1  
  , ivh_user_id2  
  , ivh_mbstatus  
  , ivh_maxlength
  , ivh_maxwidth
  , ivh_maxheight
  , ord_number  
  , ivh_quantity  
  , ivh_rate
  , ivh_charge  
  , cht_itemcode
  , ivh_splitbill_flag  
  , ivh_company  
  , ivh_carrier  
  , ivh_archarge  
  , ivh_arcurrency  
  , ivh_loadtime
  , ivh_unloadtime
  , ivh_drivetime
  , ivh_rateby
  , ivh_unit  
  , ivh_revenue_date  
  , ivh_batch_id  
  , ivh_stopoffs
  , Ivh_quantity_type  
  , ivh_charge_type  
  , ivh_originzipcode  
  , ivh_destzipcode  
  , ivh_ratingquantity
  , ivh_ratingunit
  , ivh_definition 
  , ivh_hideshipperaddr
  , ivh_hideconsignaddr 
  , ivh_showshipper  
  , ivh_showcons  
  , ivh_allinclusivecharge
  , ivh_order_cmd_code
  , ivh_applyto_definition
  , ivh_attention
  , ivh_mileage_adjustment  
  , ivh_paperworkstatus  
  , ivh_reftype  
  , ivh_rate_type  
  , ivh_paperwork_override  
  , ivh_cmrbill_link  
  , ivh_mbperiod
  , ivh_mbperiodstart
  , ivh_imagestatus_date
  , ivh_mbimagestatus_date
  , ivh_imagestatus
  , ivh_imagecount
  , ivh_mbimagestatus
  , ivh_mbimagecount
  , inv_revenue_pay_fix  
  , inv_revenue_pay  
  , ivh_billto_parent  
  , ivh_block_printing 
  , ivh_custdoc 
  , ivh_entryport  
  , ivh_exitport  
  , ivh_paid_amount
  , ivh_mileage_adj_pct  
  , ivh_dimfactor  
  , ivh_TrlConfiguration  
  , ivh_fuelprice
  , ivh_charge_type_lh  
  , ivh_booked_revtype1  
  , ivh_misc_number  
  , ivh_remark  
  , ivh_currencydate
  , ivh_originregion2
  , ivh_originregion3
  , ivh_originregion4
  , ivh_destregion2
  , ivh_destregion3
  , ivh_destregion4
  , ivh_ref_number
  , ivh_docnumber
  , ivh_totaltime
  )  
 SELECT
    @NewInv  			-- ivh_invoicenumber  
  , @billTo 		  	-- ivh_billto  
  , @terms  			-- ivh_terms  
  , @totalAmountDue  	-- ivh_totalcharge  
  , @consignorId  		-- ivh_shipper  
  , @consigneeId  		-- ivh_consignee  
  , @consignorId  		-- ivh_originpoint  
  , @consigneeId  		-- ivh_destpoint  
  , 'RTP'  				-- ivh_invoicestatus  
  , @originCity			-- ivh_origincity  
  , @destCity			-- ivh_destcity  
  , @originState  		-- ivh_originstate  
  , @destState  		-- ivh_deststate  
  , @shipDate  			-- ivh_shipdate  
  , @deliveryDate  		-- ivh_deliverydate  
  , @revtype1			-- ivh_revtype1  
  , @revtype2			-- ivh_revtype2  
  , @revtype3			-- ivh_revtype3  
  , @revtype4			-- ivh_revtype4  
  , @totalweight 		-- ivh_totalweight  	  
  , 0  					-- ivh_totalpieces  
  , @totalmiles			-- ivh_totalmiles  
  , 'US$'  				-- ivh_currency  
  , 0  					-- ivh_totalvolume  
  , 0.0000  			-- ivh_taxamount1  
  , 0.0000  			-- ivh_taxamount2  
  , 0.0000  			-- ivh_taxamount3  
  , 0.0000  			-- ivh_taxamount4  
  , 'CSH'  				-- ivh_transtype  
  , @NewInv  			-- ivh_applyto  
  , GETDATE()  			-- ivh_billdate  
   ,@newinv  			-- ivh_hdrnumber  
  , @ordnum				-- ord_hdrnumber  
  , 0  					-- ivh_mbnumber  
  , @driver1  			-- ivh_driver  
  , @driver2  			-- ivh_driver2  
  , @tractor  			-- ivh_tractor  
  , @trailer  			-- ivh_trailer 
  , @movnumber			-- mov_number
  , ''  				-- ivh_edi_flag  
  , @totalmiles			-- ivh_freight_miles  
  , 'UNK'  				-- ivh_priority  
  , '1-1-1900 0:0:0.000'-- ivh_xferdate
  , 0  					-- ivh_low_temp  
  , 0  					-- ivh_high_temp  
  , @fueltableid		-- ivh_order_by  
  , 0					-- tar_number
  , 0					-- ivh_bookyear
  , 0					-- ivh_bookmonth
  , 'System'  			-- ivh_user_id1  
  , 'System'  			-- ivh_user_id2  
  , 'NTP'  				-- ivh_mbstatus  
  , 0.00				-- ivh_maxlength
  , 0.00				-- ivh_maxwidth
  , 0.00				-- ivh_maxheight
  , @ordnum  			-- ord_number  
  , 0  					-- ivh_quantity  
  , 0.00				-- ivh_rate
  , 0.00			  	-- ivh_charge  
  , 'UNKNOW'			-- cht_itemcode
  , 'N'  				-- ivh_splitbill_flag  
  , 'UNK'  				-- ivh_company  
  , 'UNK'  				-- ivh_carrier  
  , 0.00			  	-- ivh_archarge  
  , 'US$'  				-- ivh_arcurrency  
  , 0					-- ivh_loadtime
  , 0					-- ivh_unloadtime
  , 0					-- ivh_drivetime
  , 'D'					-- ivh_rateby
  , ''  				-- ivh_unit  
  , GETDATE()			-- ivh_revenue_date  
  , ''  				-- ivh_batch_id  
  , 0					-- ivh_stopoffs
  , 0  					-- Ivh_quantity_type  
  , 0  					-- ivh_charge_type  
  , @originZip  		-- ivh_originzipcode  
  , @destZip  			-- ivh_destzipcode  
  , 0					-- ivh_ratingquantity
  , ''					-- ivh_ratingunit
  , ''  				-- ivh_definition 
  , ''					-- ivh_hideshipperaddr
  , ''					-- ivh_hideconsignaddr 
  , @consignorId  		-- ivh_showshipper  
  , @consigneeId  		-- ivh_showcons  
  , 0.00				-- ivh_allinclusivecharge
  , ''					-- ivh_order_cmd_code
  , ''					-- ivh_applyto_definition
  , ''					-- ivh_attention
  , 0.0 				-- ivh_mileage_adjustment  
  , 'UNK'  				-- ivh_paperworkstatus  
  , ''  				-- ivh_reftype  
  , 0  					-- ivh_rate_type  
  , ''					-- ivh_paperwork_override  
  , 0  					-- ivh_cmrbill_link  
  , '1900-01-01 0:0:0.0'-- ivh_mbperiod
  , '1900-01-01 0:0:0.0'-- ivh_mbperiodstart
  , '1900-01-01 0:0:0.0'-- ivh_imagestatus_date
  , '1900-01-01 0:0:0.0'-- ivh_mbimagestatus_date
  , 0					-- ivh_imagestatus
  , 0					-- ivh_imagecount
  , 0					-- ivh_mbimagestatus
  , 0					-- ivh_mbimagecount
  , 0  					-- inv_revenue_pay_fix  
  , 0.00			  	-- inv_revenue_pay  
  , ''  				-- ivh_billto_parent  
  , ''  				-- ivh_block_printing 
  , 0					-- ivh_custdoc 
  , 'UNKNOWN'  			-- ivh_entryport  
  , 'UNKNOWN'  			-- ivh_exitport  
  , 0.00				-- ivh_paid_amount
  , 0.00  				-- ivh_mileage_adj_pct  
  , 0.0000  			-- ivh_dimfactor  
  , NULL 				-- ivh_TrlConfiguration  
  , @fuelprice			-- ivh_fuelprice
  , NULL				-- ivh_charge_type_lh  
  , NULL  				-- ivh_booked_revtype1  
  , NULL			  	-- ivh_misc_number  
  , @remark				-- ivh_remark  
  , GETDATE()			-- ivh_currencydate
  , ''					-- ivh_originregion2
  , ''					-- ivh_originregion3
  , ''					-- ivh_originregion4
  , ''					-- ivh_destregion2
  , ''					-- ivh_destregion3
  , ''					-- ivh_destregion4
  , @bol				-- ivh_ref_number
  , 0					-- ivh_docnumber
  , 0					-- ivh_totaltime
	
	
SELECT @NewInv

END  

GO
