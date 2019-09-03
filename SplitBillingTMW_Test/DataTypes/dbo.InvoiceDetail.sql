CREATE TYPE [dbo].[InvoiceDetail]
AS TABLE (
		[SupplementalInvoiceDetailId]     [bigint] NULL,
		[SupplementalInvoiceHeader]       [bigint] NULL,
		[ChargeType]                      [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Quantity]                        [float] NULL,
		[Rate]                            [float] NULL,
		[SendToTMW]                       [bit] NULL,
		[CreatedBy]                       [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[CreatedDate]                     [datetime] NULL
)
GO
