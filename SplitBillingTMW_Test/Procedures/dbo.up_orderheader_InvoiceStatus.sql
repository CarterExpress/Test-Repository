SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE up_orderheader_InvoiceStatus @ordhdrnumber VARCHAR(50)
AS
UPDATE TMW_TEST.dbo.orderheader
SET ord_invoicestatus = 'PPD'
WHERE ord_hdrnumber = @ordhdrnumber

select ord_invoicestatus from TMW_TEST.dbo.orderheader WHERE ord_hdrnumber = @ordhdrnumber
GO
