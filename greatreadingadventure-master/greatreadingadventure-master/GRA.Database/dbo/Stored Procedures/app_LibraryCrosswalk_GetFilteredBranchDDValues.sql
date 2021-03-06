﻿
CREATE PROCEDURE [dbo].[app_LibraryCrosswalk_GetFilteredBranchDDValues] @DistrictID INT = 0,
	@City VARCHAR(50) = '',
	@TenID INT = NULL
AS
SELECT DISTINCT BranchID AS CID,
	c.Code AS Code, c.[Description] as [Description]
FROM LibraryCrosswalk w
INNER JOIN Code c ON w.BranchID = c.CID
WHERE (
		DistrictID = @DistrictID
		OR @DistrictID IS NULL
		OR @DistrictID = 0
		)
	AND (
		City = @City
		OR @City IS NULL
		OR @City = ''
		)
	AND (
		w.TenID = @TenID
		OR @TenID IS NULL
		)
ORDER BY [Description]
