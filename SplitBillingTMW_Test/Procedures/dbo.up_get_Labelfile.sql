SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE proc up_get_Labelfile
as
select labeldefinition,name,abbr 
from TMW_Test.dbo.labelfile
where isnull(retired,'N') = 'N'

GO
