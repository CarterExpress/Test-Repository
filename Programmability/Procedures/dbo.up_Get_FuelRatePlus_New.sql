SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[up_Get_FuelRatePlus_New]
	-- Add the parameters for the stored procedure here
	@Billto VARCHAR(30)
	,@ShipDate DATETIME
	,@MasterOrderNumber VARCHAR(30)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	-- Insert statements for procedure here
	DECLARE @TarNumber INT
	DECLARE @Trk_FuelTableId INT
	DECLARE @AFP_Date DATETIME
	DECLARE @AFP_Price DECIMAL(19, 4)
	DECLARE @Trc_RangeValue DECIMAL(19, 4)

	SELECT @Billto = ord_billto
	FROM tmw_live.dbo.orderheader
	WHERE ord_number = @MasterOrderNumber

	SELECT @TarNumber = (
			SELECT tar_number
			FROM tmw_live.dbo.tariffkey
			WHERE trk_billto = @Billto
				AND @ShipDate BETWEEN trk_startdate
					AND trk_enddate
				AND trk_fueltableid IS NOT NULL
				AND trk_enddate = NULL
				AND masterordernumber = @MasterOrderNumber
			)

	IF @TarNumber IS NULL
	BEGIN
		SELECT @TarNumber = (
				SELECT tar_number
				FROM tmw_live.dbo.tariffkey
				WHERE trk_billto = @Billto
					AND @ShipDate BETWEEN trk_startdate
						AND trk_enddate
					AND masterordernumber IS NULL
					AND trk_fueltableid IS NOT NULL
					AND trk_enddate = '2049-12-31 23:59:00.000'
				)
	END

	SELECT @Trk_FuelTableId = (
			SELECT trk_fueltableid
			FROM tmw_live.dbo.tariffkey
			WHERE trk_billto = @Billto
				AND tar_number = @TarNumber
			)

	SELECT @AFP_Date = (
			SELECT max(afp_date)
			FROM tmw_live.dbo.averagefuelprice
			WHERE @ShipDate > afp_date
				AND afp_tableid = @Trk_FuelTableId
			)

	SELECT @AFP_Price = (
			SELECT afp_price
			FROM tmw_live.dbo.averagefuelprice
			WHERE @ShipDate > afp_date
				AND afp_tableid = @Trk_FuelTableId
				AND afp_date = @AFP_Date
			)

	SELECT @Trc_RangeValue = (
			SELECT MIN(tariffrowcolumn.trc_rangevalue)
			FROM tmw_live.dbo.tariffrowcolumn
				,tmw_live.dbo.tariffrate
			WHERE tariffrowcolumn.trc_number = tariffrate.trc_number_row
				AND tariffrate.tar_number = @TarNumber
				AND tariffrowcolumn.trc_rangevalue >= @AFP_Price
			)

	SELECT tariffrate.tra_rate
		,@AFP_Price AS AFP_Price
	FROM tmw_live.dbo.tariffrowcolumn
		,tmw_live.dbo.tariffrate
	WHERE tariffrate.trc_number_row = tariffrowcolumn.trc_number
		AND tariffrate.tar_number = @TarNumber
		AND tariffrowcolumn.trc_rangevalue >= @AFP_Price
		AND tariffrowcolumn.trc_rangevalue = @Trc_RangeValue
END
GO