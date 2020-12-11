-- 1. CREATE REPORT READER ROLE

CREATE ROLE "PBI_READER" COMMENT = 'Power BI Snowflake Usage Reader Role';

GRANT ROLE "PBI_READER" TO ROLE "PUBLIC";

-- 2. ASSIGN PERMISSIONS

GRANT IMPORTED PRIVILEGES ON DATABASE snowflake TO ROLE PBI_READER;

-- 3. CREATE USER

--CREATE USER PBI_Snowflake_Reader PASSWORD = '************' COMMENT = 'Account  for Power BI dashboard' DEFAULT_ROLE = "PUBLIC" MUST_CHANGE_PASSWORD = FALSE;

-- 4. ASSIGN USER TO ROLE

--ASSIGN USER POWER_BI to ROLE PBI_READER;

--grant role PBI_READER to user POWER_BI;

SHOW GRANTS OF ROLE PBI_READER;
--SHOW GRANTS OF USER WBAKER
SHOW GRANTS TO USER POWER_BI;

--revoke role SYSADMIN from user POWER_BI;

--ALTER USER POWER_BI SET DEFAULT_ROLE = 'PBI_READER';


grant operate on warehouse POWERBI_WH to role PBI_READER;