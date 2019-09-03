SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[up_SplitBilling_UpdatePaymentTerms]
 @bolid INT
	, @terms VARCHAR(5),@bolNumber VARCHAR(10)
	as
	begin

	IF EXISTS (
			SELECT *
			FROM tmw_test.dbo.invoicedetail
			WHERE ivd_bolid = @bolid
			)
	BEGIN
		UPDATE ivh
		SET ivh.ivh_terms = @terms, ivh.ivh_ref_number = @bolNumber
		FROM tmw_test.dbo.invoicedetail ivd
		INNER JOIN tmw_test.dbo.invoiceheader ivh
		on ivh.ivh_hdrnumber = ivd.ivh_hdrnumber and ivd.ivd_bolid = @bolid				
	END

	UPDATE tmw_Test.dbo.freightdetail
	SET fgt_terms = @terms, fgt_refnum = @bolNumber
	WHERE fgt_bolid = @bolid
	end

	select 1
GO
