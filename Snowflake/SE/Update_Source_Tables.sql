SELECT 
    CURRENT_TIMESTAMP::TIMESTAMP_NTZ  AS  TASK_EXECUTION_TIMESTAMP,
    S.TABLE_NAME , 
    D.LAST_LOAD_TIME, 
    D.LAST_FILE_LOADED, 
    D.ROW_COUNT,
    CASE WHEN TO_DATE(CAST(CURRENT_DATE AS VARCHAR), 'YYYY-MM-DD') = D.LAST_LOAD_TIME::DATE  THEN 1 ELSE 0 END AS IS_LOADED 
FROM 
   FRAMEWORK.PUBLIC.SOURCE_TABLES S
INNER JOIN
(
SELECT 
   S.TABLE_NAME , 
   S.FILE_NAME AS LAST_FILE_LOADED, 
   S.ROW_COUNT AS ROW_COUNT,
   F.LAST_LOAD_TIME 
FROM 
   DEMO_DB.ACCOUNT_USAGE_VIEWS.VW_REP_MONITOR_SAPRAW S
INNER JOIN
    (
   SELECT
      TABLE_NAME,
      MAX(LAST_LOAD_TIME::TIMESTAMP_NTZ) AS LAST_LOAD_TIME
   FROM
      DEMO_DB.ACCOUNT_USAGE_VIEWS.VW_REP_MONITOR_SAPRAW 
   GROUP BY 
      TABLE_NAME
    ) F ON S.TABLE_NAME = F.TABLE_NAME AND S.LAST_LOAD_TIME::TIMESTAMP_NTZ = F.LAST_LOAD_TIME
) D ON S.TABLE_NAME = D.TABLE_NAME;