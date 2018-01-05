DECLARE @DUPS AS TABLE
(
gpid nvarchar(10)
)

INSERT INTO @DUPS

SELECT GPId
FROM
(
	SELECT 
		[GPId], 
		MIN([IsActive]) AS [0],
		MAX([IsActive]) AS [1]
	FROM
	(

		SELECT 
			   [GPId]
			  ,[IsActive]  =  case when IsActive = 0 then 0 else 1 end
		  FROM [NHS].[Datawarehouse].[DimGeneralPracticeAddress]
	)D
	GROUP BY 
		[GPId]
)
D
WHERE
D.[1] = 0 AND GPId =  'A83019'


SELECT M.* FROM [Mirror].[DimGeneralPracticeAddress] M
INNER JOIN @DUPS D ON M.GPId = D.gpid


SELECT P.* FROM [Datawarehouse].[DimGeneralPracticeAddress] P
INNER JOIN @DUPS D ON P.GPId = D.gpid
ORDER BY GPId


SELECT
	[GPId] = T.[GPId],
	[GeneralPracticePrimarySurgeryName] = T.GeneralPracticePrimarySurgeryName,
	[GeneralPracticeSecondarySurgeryName]= T.GeneralPracticeSecondarySurgeryName,
	[AddressLine1] = T.AddressLine1,
	[AddressLine2] = T.AddressLine2,
	[AddressLine3] = T.AddressLine3,
	[PostCode]	   = T.PostCode,
	[FileLogId]    = T.FileLogId
FROM
	[NHS].[Transform].[DimGeneralPracticeAddress] t
INNER JOIN
(
	SELECT 
		 GPId,
		 COUNT(DISTINCT PostCode) as Dups
	FROM  [NHS].[Transform].[DimGeneralPracticeAddress] 
	WHERE GPId IN (SELECT GPID FROM @DUPS)
	GROUP BY  GPId
	HAVING COUNT(DISTINCT PostCode) > 1
)d
on d.GPId = t.GPId
UNION ALL
SELECT
	M.[GPId] ,
	[GeneralPracticePrimarySurgeryName] ,
	[GeneralPracticeSecondarySurgeryName],
	[AddressLine1] ,
	[AddressLine2] ,
	[AddressLine3] ,
	[PostCode] ,
	[FileLogId]
FROM NHS.Mirror.DimGeneralPracticeAddress M
INNER JOIN @DUPS D ON M.GPId = D.gpid

ORDER BY FileLogId

