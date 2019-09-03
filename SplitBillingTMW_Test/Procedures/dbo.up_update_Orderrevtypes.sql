SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE proc up_update_Orderrevtypes
@ordernumber varchar(50),
@RevType varchar(20),
@Value varchar(20)
as

if(@RevType = 'RevType1')
begin
	update TMW_Test.dbo.orderheader
	set ord_revtype1 = @value
	where ord_hdrnumber = @ordernumber

	update [NAUS03DT2\SQL2016,49345].splitbilling.dbo.orders
	set Revtype1=@Value
	where ordernumber = @ordernumber
end
if(@RevType = 'RevType2')
begin
	update TMW_Test.dbo.orderheader
	set ord_revtype2 = @value
	where ord_hdrnumber = @ordernumber

	update [NAUS03DT2\SQL2016,49345].splitbilling.dbo.orders
	set Revtype2=@Value
	where ordernumber = @ordernumber
end
if(@RevType = 'RevType3')
begin
	update TMW_Test.dbo.orderheader
	set ord_revtype3 = @value
	where ord_hdrnumber = @ordernumber

	update [NAUS03DT2\SQL2016,49345].splitbilling.dbo.orders
	set Revtype3=@Value
	where ordernumber = @ordernumber
end
if(@RevType = 'RevType4')
begin
	update TMW_Test.dbo.orderheader
	set ord_revtype4 = @value
	where ord_hdrnumber = @ordernumber

	update [NAUS03DT2\SQL2016,49345].splitbilling.dbo.orders
	set Revtype4=@Value
	where ordernumber = @ordernumber
end


GO
