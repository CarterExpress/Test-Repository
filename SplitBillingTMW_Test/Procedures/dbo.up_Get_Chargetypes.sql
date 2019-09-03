SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[up_Get_Chargetypes]
as
SELECT cht_itemcode as Itemcode
	, cht_description as [Description]
	, cht_basis as Basis
	, cht_basisunit as Basisunit
	, cht_rateunit as Rateunit
	, cht_rate as Rate
FROM TMW_TEST.dbo.chargetype
WHERE isnull(cht_retired, 'N') = 'N'
GO
