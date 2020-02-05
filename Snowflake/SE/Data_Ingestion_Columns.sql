
--metadata$filename

SELECT
LISTAGG(META_LOAADING_TO_TARGET,';
        
        ')
FROM
(
SELECT 
    TABLE_NAME--, CURRENT_TIMESTAMP
   , CONCAT('ALTER TABLE "',TABLE_NAME, '" ADD COLUMN metadata$filename NVARCHAR(100),FILELOADDATE_LTZ timestamp_ltz, FILELOADDATE_NTZ timestamp_ntz') AS META_LOAADING_TO_TARGET
FROM 
    "SOURCE_SYSTEM_TEST"."INFORMATION_SCHEMA"."TABLES" 
WHERE 
    TABLE_TYPE = 'BASE TABLE' 
AND
    TABLE_SCHEMA = 'SAPRAW'
AND 
TABLE_NAME NOT IN ('0CO_OM_CCA_1_CLONE','MY_DATE_DIMENSION','0CO_OM_CCA_9_DUMP')
)D;
    
    
--create OR REPLACE table mytable (amount TIMESTAMPNTZ)
--insert into mytable values(CURRENT_TIMESTAMP::TIMESTAMP_NTZ)
--SELECT * FROM mytable