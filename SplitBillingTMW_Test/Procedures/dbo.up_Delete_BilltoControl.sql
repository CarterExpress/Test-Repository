SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
create PROC [dbo].[up_Delete_BilltoControl]
@Id int
AS
delete from  tmw_test.dbo.Billto_Control
where id = @Id

GO
