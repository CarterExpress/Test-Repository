SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[up_get_Billtos]
as
select cmp_id as Id,cmp_id+' - '+cmp_name as Name from tmw_test.dbo.company where cmp_billto ='Y' and cmp_active ='Y'
GO
