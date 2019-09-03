SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
--exec [dbo].[up_get_fuelRate] 'xg440','1752544'
CREATE proc [dbo].[up_get_fuelRate]
@Billto varchar(20),
@orderbillto varchar(20)
as

declare @reorderBillto varchar(20)




select @reorderBillto = ord_billto from tmw_live.dbo.orderheader where ord_number in (select ord_fromorder from tmw_live.dbo.orderheader where ord_hdrnumber = @orderbillto)
print @reorderBillto

Declare @TarNumber int 
CREATE TABLE #RateTar(
	[trk_number] [int] NOT NULL,
	[tar_number] [int] NULL,
	[trk_description] [varchar](50) NULL,
	[trk_billto] [char](8) NULL,
	[trk_originpoint] [char](8) NULL,
	[trk_destpoint] [char](8) NULL,
	[trk_startdate] [datetime] NULL,
	[trk_enddate] [datetime] NULL,
	[cmp_othertype1] [char](6) NULL,
	[cmp_othertype2] [char](6) NULL,
	[cmd_code] [char](8) NULL,
	[cmd_class] [char](8) NULL,
	[trl_type1] [char](6) NULL,
	[trl_type2] [char](6) NULL,
	[trl_type3] [char](6) NULL,
	[trl_type4] [char](6) NULL,
	[trk_revtype1] [char](6) NULL,
	[trk_revtype2] [char](6) NULL,
	[trk_revtype3] [char](6) NULL,
	[trk_revtype4] [char](6) NULL,
	[trk_originzip] [varchar](10) NULL,
	[trk_originstate] [varchar](6) NULL,
	[trk_destzip] [varchar](10) NULL,
	[trk_deststate] [varchar](6) NULL,
	[trk_minmiles] [int] NULL,
	[trk_minweight] [decimal](19, 4) NULL,
	[trk_minpieces] [int] NULL,
	[trk_minvolume] [decimal](19, 4) NULL,
	[trk_maxmiles] [int] NULL,
	[trk_maxweight] [decimal](19, 4) NULL,
	[trk_maxpieces] [int] NULL,
	[trk_maxvolume] [decimal](19, 4) NULL,
	[trk_minstops] [int] NULL,
	[trk_maxstops] [int] NULL,
	[trk_minodmiles] [int] NULL,
	[trk_maxodmiles] [int] NULL,
	[trk_minvariance] [money] NULL,
	[trk_maxvariance] [money] NULL,
	[tar_description] [varchar](50) NULL,
	[cty_origin] [varchar](30) NULL,
	[cty_dest] [varchar](30) NULL,
	[compute_othertypes1] [varchar](11) NOT NULL,
	[compute_othertypes2] [varchar](11) NOT NULL,
	[compute_revtype1] [varchar](8) NOT NULL,
	[compute_revtype2] [varchar](8) NOT NULL,
	[compute_revtype3] [varchar](8) NOT NULL,
	[compute_revtype4] [varchar](8) NOT NULL,
	[compute_trltype1] [varchar](8) NOT NULL,
	[compute_trltype2] [varchar](8) NOT NULL,
	[compute_trltype3] [varchar](8) NOT NULL,
	[compute_trltype4] [varchar](8) NOT NULL,
	[tar_tarriffnumber] [varchar](12) NULL,
	[trk_orderedby] [varchar](8) NULL,
	[tar_tariffitem] [varchar](12) NULL,
	[trk_origincounty] [char](3) NULL,
	[trk_destcounty] [char](3) NULL,
	[trk_minlength] [money] NULL,
	[trk_maxlength] [money] NULL,
	[trk_minwidth] [money] NULL,
	[trk_maxwidth] [money] NULL,
	[trk_minheight] [money] NULL,
	[trk_maxheight] [money] NULL,
	[trk_number2] [int] NOT NULL,
	[tar_number2] [int] NULL,
	[trk_distunit] [varchar](6) NULL,
	[trk_wgtunit] [varchar](6) NULL,
	[trk_countunit] [varchar](6) NULL,
	[trk_volunit] [varchar](6) NULL,
	[trk_odunit] [varchar](6) NULL,
	[trk_carrier] [varchar](8) NULL,
	[trk_boardcarrier] [char](6) NULL,
	[trk_load] [char](6) NULL,
	[trk_team] [char](6) NULL,
	[trk_company] [varchar](8) NULL,
	[trk_lghtype1] [char](6) NULL,
	[compute_lghtype1] [varchar](8) NOT NULL,
	[trk_terms] [char](6) NULL,
	[cmp_mastercompany] [varchar](8) NOT NULL,
	[taa_seq] [int] NOT NULL,
	[trk_return_billto] [varchar](8) NULL,
	[trk_return_revtype1] [varchar](6) NULL,
	[cht_description] [varchar](30) NOT NULL,
	[origin] [varchar](100) NULL,
	[originloc] [varchar](50) NOT NULL,
	[destination] [varchar](100) NULL,
	[destinationloc] [varchar](50) NOT NULL,
	[trk_billto_carkeyname] [varchar](100) NOT NULL,
	[cht_itemcode] [char](6) NULL,
	[trk_mincarriersvcdays] [int] NULL,
	[trk_maxcarriersvcdays] [int] NULL
)
insert into #RateTar
execute TMW_Live.dbo.d_tar_viewtariffs_sp   @Primary = 'Y', @Date = '1950-01-01 00:00:00.000', @BillTo = 'UNKNOWN', @CmpType1 = 'UNK', @CmpType2 = 'UNK', @TrlType1 = 'UNK', @TrlType2 = 'UNK', @TrlType3 = 'UNK', @TrlType4 = 'UNK', @RevType1 = 'UNK', @RevType2 = 'UNK', @RevType3 = 'UNK', @RevType4 = 'UNK', @CmdCode = 'UNKNOWN', @CmdClass = 'UNKNOWN', @OriginPoint = 'UNKNOWN', @OriginCity = 0, @OriginZip = 'UNKNOWN', @OriginCounty = 'UNK', @OriginState = 'XX', @DestPoint = 'UNKNOWN', @DestCity = 0, @DestZip = 'UNKNOWN', @DestCounty = 'UNK', @DestState = 'XX', @OrderBy = 'UNKNOWN', @carrier = 'UNKNOWN', @boardcarrier = 'UNK', @load = 'UNK', @team = 'UNK', @enddate = '2049-12-31 23:59:00.000', @company = 'UNK', @lghtype1 = 'UNK', @terms = 'UNK', @mastercompany = 'UNKNOWN', @tariffnumber = '', @tariffitem = '', @returnbillto = 'UNKNOWN', @returnrevtype1 = 'UNK', @carrier_only = 'N', @table_rates_only = 'N', @effectiveduringfrom = '1950-01-01 00:00:00.000', @effectiveduringto = '2049-12-31 23:59:00.000', @effectivestartingfrom = '1950-01-01 00:00:00.000', @effectivestartingto = '2049-12-31 23:59:00.000', @expiredfrom = '2018-03-13 23:59:59.000', @expiredto = '2049-12-31 23:59:00.000', @effectivedatesearchtype = 'A', @itemcode = 'UNK'
/*
set @TarNumber = (
select top 1 tar_number from #RateTar where trk_billto = @Billto)
*/
if(@TarNumber is null)
begin
set @Billto = @reorderbillto
set @TarNumber = (
select top 1 tar_number from #RateTar where trk_billto = @Billto)
print @Billto
end
CREATE TABLE #FscHolder (
	tra_rate FLOAT
	,trc_number_row INT
	,trc_number_col INT
	,tar_number INT
	,tariffrow_sequence INT
	,tariffcolumn_sequence INT
	,tra_apply INT
	,tra_retired DATETIME
	,tra_activedate DATETIME
	,tra_minrate FLOAT
	,tra_mincharge FLOAT
	,tra_billmiles INT
	,tra_paymiles INT
	,tra_standardhours INT
	,tra_minqty CHAR(1)
	,tra_rateasflat CHAR(1)
	,trc_rowrangevalue FLOAT
	,trc_colrangevalue FLOAT
	)

CREATE TABLE #FuelCharges (
	TMWAverageFuelPriceKey INT
	,TableId VARCHAR(5)
	,Description VARCHAR(MAX)
	,Price DECIMAL(19, 4)
	,EffectiveDate DATETIME
	,RawPrice DECIMAL(19, 4)	
	)

INSERT INTO #FscHolder
EXECUTE TMW_Live.dbo.d_tariffrate_sp @pl_tarnum = @tarnumber

print @tarnumber

DECLARE @key INT
	,@tableid INT
	,@desc VARCHAR(MAX)
	,@price FLOAT
	,@date DATETIME

DECLARE FuelChargeParser CURSOR READ_ONLY FORWARD_ONLY
FOR
SELECT afp_id
	,afp_tableid
	,afp_description
	,afp_price
	,afp_date
FROM TMW_Live.dbo.averagefuelprice

OPEN FuelChargeParser

FETCH NEXT
FROM FuelChargeParser
INTO @key
	,@tableid
	,@desc
	,@price
	,@date

WHILE @@FETCH_STATUS = 0
BEGIN
	DECLARE @rate FLOAT

	SET @rate = (
			SELECT TOP 1 tra_rate AS FSC
			FROM #FscHolder
			WHERE trc_rowrangevalue >= @price
			ORDER BY trc_rowrangevalue
			)

	INSERT INTO #FuelCharges
	SELECT @key
		,@tableid
		,@desc
		,@rate
		,@date
		,@price		

	FETCH NEXT
	FROM FuelChargeParser
	INTO @key
		,@tableid
		,@desc
		,@price
		,@date
END

CLOSE FuelChargeParser

DEALLOCATE FuelChargeParser

SELECT *
FROM #FuelCharges
DROP TABLE #FscHolder

DROP TABLE #FuelCharges
drop table #RateTar



GO
