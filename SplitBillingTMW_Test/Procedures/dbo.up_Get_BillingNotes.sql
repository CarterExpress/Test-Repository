SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[up_Get_BillingNotes]
as
	select	not_number as 'TMWNoteKey',
		not_text_large as 'Text', 
		not_type as 'NoteType', 
		not_expires as 'ExpireDate', 
		nre_tablekey as 'OrderNumber', 
		not_sequence as 'Sequence', 
		last_updatedby as 'UpdatedBy', 
		last_updatedatetime as 'UpdatedDate' 
	from tmw_Test.dbo.notes 
	where not_type = 'B' 
	and ntb_table = 'orderheader' 
	and nre_tablekey in ( select o.OrderNumber
	FROM [naus03sql2].splitbilling.dbo.Orders o
		
                                WHERE o.Status in (0,3)
								and shipdate > ='4/23/2018')
GO
