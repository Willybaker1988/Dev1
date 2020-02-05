alter user SNOWPIPE set rsa_public_key='
MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAs0Elr1Xf5q8ViatMiPb1
sLDlGNzq1fw3CO4ez3MUv/W4yX5cMPaSnfrASNoJu9RI47TXF/B6g/daIfuc/LHg
OTyzdAmDdZL3xb7h8CBMDDiDagogFhcqDenw5MX69Wfld4Gc9J6Tqfg8fCBF6aQx
HQ2+X3Gsx3DzuBrgHGIXDA/3o4DF5nmAlb6++v/XVPw7HEKHhLzTds6Y0jFrOW3X
TktXVKPNjkxT7nBB808fs0rruTeMIcY66JRqP8i/NM8FvDBxqYIBfbHwKtrdJFuY
PaeHeDPAGLtbUtK4GFRFXXGXGxaRnuwAF23LLUvi5ZnxkYnie6z1QHY4q9SXAYV+
JQIDAQAB';

desc user SNOWPIPE;

 -- Create a role to contain the Snowpipe privileges
use role securityadmin;

create or replace role SNOWPIPE;

-- Grant the role to a user
grant role SNOWPIPE to user SNOWPIPE;

-- Set the role as the default role for the user
alter user SNOWPIPE set default_role = SNOWPIPE;

-- Grant the required privileges on the database objects
grant usage on database SOURCE_SYSTEM_TEST to role SNOWPIPE;
grant usage on schema SOURCE_SYSTEM_TEST.SAPRAW to role SNOWPIPE;

grant insert, select on SOURCE_SYSTEM_TEST.SAPRAW."0COMP_CODE_TEXT" to role SNOWPIPE;
grant insert, select on SOURCE_SYSTEM_TEST.SAPRAW."0COSTCENTER_0101_HIER" to role SNOWPIPE;
grant insert, select on SOURCE_SYSTEM_TEST.SAPRAW."0COSTELMNT_0102_HIER" to role SNOWPIPE;
grant insert, select on SOURCE_SYSTEM_TEST.SAPRAW."0COSTELMNT_0102_HIER_INTVL" to role SNOWPIPE;
grant insert, select on SOURCE_SYSTEM_TEST.SAPRAW."0COSTELMNT_ATTR" to role SNOWPIPE;
grant insert, select on SOURCE_SYSTEM_TEST.SAPRAW."0COSTELMNT_TEXT" to role SNOWPIPE;
grant insert, select on SOURCE_SYSTEM_TEST.SAPRAW."0CO_OM_CCA_1" to role SNOWPIPE;
grant insert, select on SOURCE_SYSTEM_TEST.SAPRAW."0CO_OM_CCA_1_CLONE" to role SNOWPIPE;
grant insert, select on SOURCE_SYSTEM_TEST.SAPRAW."0CO_OM_CCA_9" to role SNOWPIPE;
grant insert, select on SOURCE_SYSTEM_TEST.SAPRAW."0CURTYPE_TEXT" to role SNOWPIPE;
grant insert, select on SOURCE_SYSTEM_TEST.SAPRAW."0PROFIT_CTR_ATTR" to role SNOWPIPE;
grant insert, select on SOURCE_SYSTEM_TEST.SAPRAW."0PROFIT_CTR_TEXT" to role SNOWPIPE;
grant insert, select on SOURCE_SYSTEM_TEST.SAPRAW."0VENDOR_ATTR" to role SNOWPIPE;
grant insert, select on SOURCE_SYSTEM_TEST.SAPRAW."0VENDOR_TEXT" to role SNOWPIPE;
grant insert, select on SOURCE_SYSTEM_TEST.SAPRAW."0VTYPE_TEXT" to role SNOWPIPE;
grant insert, select on SOURCE_SYSTEM_TEST.SAPRAW."CSKS" to role SNOWPIPE;
grant insert, select on SOURCE_SYSTEM_TEST.SAPRAW."CSKT" to role SNOWPIPE;
grant insert, select on SOURCE_SYSTEM_TEST.SAPRAW."MY_DATE_DIMENSION" to role SNOWPIPE;
grant insert, select on SOURCE_SYSTEM_TEST.SAPRAW."ZDIVISION" to role SNOWPIPE;
grant insert, select on SOURCE_SYSTEM_TEST.SAPRAW."CSKT_SP" to role SNOWPIPE;
grant insert, select on SOURCE_SYSTEM_TEST.SAPRAW."CSKS_SP" to role SNOWPIPE;--FOR TESTING

--Grant usage of stage and file format objects.
grant usage on STAGE SOURCE_SYSTEM_TEST.SAPRAW.SE_DATALAKE_STAGE to role SNOWPIPE;
grant usage on FILE FORMAT SOURCE_SYSTEM_TEST.SAPRAW.MY_PARQUET_FORMAT to role SNOWPIPE;



--grant ownership to snowpipe role on pipes
grant ownership on pipe SOURCE_SYSTEM_TEST.SAPRAW."SNOWPIPE_CSKS" to role SNOWPIPE;
grant ownership on pipe SOURCE_SYSTEM_TEST.SAPRAW."SNOWPIPE_0COSTELMNT_0102_HIER_INTVL"to role SNOWPIPE;
grant ownership on pipe SOURCE_SYSTEM_TEST.SAPRAW."SNOWPIPE_0PROFIT_CTR_TEXT"to role SNOWPIPE;
grant ownership on pipe SOURCE_SYSTEM_TEST.SAPRAW."SNOWPIPE_ZDIVISION"to role SNOWPIPE;
grant ownership on pipe SOURCE_SYSTEM_TEST.SAPRAW."SNOWPIPE_0VENDOR_TEXT"to role SNOWPIPE;
grant ownership on pipe SOURCE_SYSTEM_TEST.SAPRAW."SNOWPIPE_0CURTYPE_TEXT"to role SNOWPIPE;
grant ownership on pipe SOURCE_SYSTEM_TEST.SAPRAW."SNOWPIPE_0COMP_CODE_TEXT"to role SNOWPIPE;
grant ownership on pipe SOURCE_SYSTEM_TEST.SAPRAW."SNOWPIPE_CSKT"to role SNOWPIPE;
grant ownership on pipe SOURCE_SYSTEM_TEST.SAPRAW."SNOWPIPE_0VENDOR_ATTR"to role SNOWPIPE;
grant ownership on pipe SOURCE_SYSTEM_TEST.SAPRAW."SNOWPIPE_0COSTELMNT_0102_HIER"to role SNOWPIPE;
grant ownership on pipe SOURCE_SYSTEM_TEST.SAPRAW."SNOWPIPE_0CO_OM_CCA_1"to role SNOWPIPE;
grant ownership on pipe SOURCE_SYSTEM_TEST.SAPRAW."SNOWPIPE_0COSTCENTER_0101_HIER"to role SNOWPIPE;
grant ownership on pipe SOURCE_SYSTEM_TEST.SAPRAW."SNOWPIPE_0PROFIT_CTR_ATTR"to role SNOWPIPE;
grant ownership on pipe SOURCE_SYSTEM_TEST.SAPRAW."SNOWPIPE_0COSTELMNT_ATTR"to role SNOWPIPE;
grant ownership on pipe SOURCE_SYSTEM_TEST.SAPRAW."SNOWPIPE_0CO_OM_CCA_9"to role SNOWPIPE;
grant ownership on pipe SOURCE_SYSTEM_TEST.SAPRAW."SNOWPIPE_0COSTELMNT_TEXT"to role SNOWPIPE;
grant ownership on pipe SOURCE_SYSTEM_TEST.SAPRAW."SNOWPIPE_0VTYPE_TEXT"to role SNOWPIPE;


USE ROLE SNOWPIPE;
--PAUSE PIPES
ALTER PIPE SOURCE_SYSTEM_TEST.SAPRAW."SNOWPIPE_CSKS"SET PIPE_EXECUTION_PAUSED=TRUE;
ALTER PIPE SOURCE_SYSTEM_TEST.SAPRAW."SNOWPIPE_0COSTELMNT_0102_HIER_INTVL"SET PIPE_EXECUTION_PAUSED=TRUE;
ALTER PIPE SOURCE_SYSTEM_TEST.SAPRAW."SNOWPIPE_0PROFIT_CTR_TEXT"SET PIPE_EXECUTION_PAUSED=TRUE;
ALTER PIPE SOURCE_SYSTEM_TEST.SAPRAW."SNOWPIPE_ZDIVISION"SET PIPE_EXECUTION_PAUSED=TRUE;
ALTER PIPE SOURCE_SYSTEM_TEST.SAPRAW."SNOWPIPE_0VENDOR_TEXT"SET PIPE_EXECUTION_PAUSED=TRUE;
ALTER PIPE SOURCE_SYSTEM_TEST.SAPRAW."SNOWPIPE_0CURTYPE_TEXT"SET PIPE_EXECUTION_PAUSED=TRUE;
ALTER PIPE SOURCE_SYSTEM_TEST.SAPRAW."SNOWPIPE_0COMP_CODE_TEXT"SET PIPE_EXECUTION_PAUSED=TRUE;
ALTER PIPE SOURCE_SYSTEM_TEST.SAPRAW."SNOWPIPE_CSKT"SET PIPE_EXECUTION_PAUSED=TRUE;
ALTER PIPE SOURCE_SYSTEM_TEST.SAPRAW."SNOWPIPE_0VENDOR_ATTR"SET PIPE_EXECUTION_PAUSED=TRUE;
ALTER PIPE SOURCE_SYSTEM_TEST.SAPRAW."SNOWPIPE_0COSTELMNT_0102_HIER"SET PIPE_EXECUTION_PAUSED=TRUE;
ALTER PIPE SOURCE_SYSTEM_TEST.SAPRAW."SNOWPIPE_0CO_OM_CCA_1"SET PIPE_EXECUTION_PAUSED=TRUE;
ALTER PIPE SOURCE_SYSTEM_TEST.SAPRAW."SNOWPIPE_0COSTCENTER_0101_HIER"SET PIPE_EXECUTION_PAUSED=TRUE;
ALTER PIPE SOURCE_SYSTEM_TEST.SAPRAW."SNOWPIPE_0PROFIT_CTR_ATTR"SET PIPE_EXECUTION_PAUSED=TRUE;
ALTER PIPE SOURCE_SYSTEM_TEST.SAPRAW."SNOWPIPE_0COSTELMNT_ATTR"SET PIPE_EXECUTION_PAUSED=TRUE;
ALTER PIPE SOURCE_SYSTEM_TEST.SAPRAW."SNOWPIPE_0CO_OM_CCA_9"SET PIPE_EXECUTION_PAUSED=TRUE;
ALTER PIPE SOURCE_SYSTEM_TEST.SAPRAW."SNOWPIPE_0COSTELMNT_TEXT"SET PIPE_EXECUTION_PAUSED=TRUE;
ALTER PIPE SOURCE_SYSTEM_TEST.SAPRAW."SNOWPIPE_0VTYPE_TEXT"SET PIPE_EXECUTION_PAUSED=TRUE;


--START SNOPIPES FROM AUTO INGEST
USE ROLE SNOWPIPE; ALTER PIPE SOURCE_SYSTEM_TEST.SAPRAW."SNOWPIPE_CSKS"SET PIPE_EXECUTION_PAUSED=FALSE;
USE ROLE SNOWPIPE; ALTER PIPE SOURCE_SYSTEM_TEST.SAPRAW."SNOWPIPE_0COSTELMNT_0102_HIER_INTVL"SET PIPE_EXECUTION_PAUSED=FALSE;
USE ROLE SNOWPIPE; ALTER PIPE SOURCE_SYSTEM_TEST.SAPRAW."SNOWPIPE_0PROFIT_CTR_TEXT"SET PIPE_EXECUTION_PAUSED=FALSE;
USE ROLE SNOWPIPE; ALTER PIPE SOURCE_SYSTEM_TEST.SAPRAW."SNOWPIPE_ZDIVISION"SET PIPE_EXECUTION_PAUSED=FALSE;
USE ROLE SNOWPIPE; ALTER PIPE SOURCE_SYSTEM_TEST.SAPRAW."SNOWPIPE_0VENDOR_TEXT"SET PIPE_EXECUTION_PAUSED=FALSE;
USE ROLE SNOWPIPE; ALTER PIPE SOURCE_SYSTEM_TEST.SAPRAW."SNOWPIPE_0CURTYPE_TEXT"SET PIPE_EXECUTION_PAUSED=FALSE;
USE ROLE SNOWPIPE; ALTER PIPE SOURCE_SYSTEM_TEST.SAPRAW."SNOWPIPE_0COMP_CODE_TEXT"SET PIPE_EXECUTION_PAUSED=FALSE;
USE ROLE SNOWPIPE; ALTER PIPE SOURCE_SYSTEM_TEST.SAPRAW."SNOWPIPE_CSKT"SET PIPE_EXECUTION_PAUSED=FALSE;
USE ROLE SNOWPIPE; ALTER PIPE SOURCE_SYSTEM_TEST.SAPRAW."SNOWPIPE_0VENDOR_ATTR"SET PIPE_EXECUTION_PAUSED=FALSE;
USE ROLE SNOWPIPE; ALTER PIPE SOURCE_SYSTEM_TEST.SAPRAW."SNOWPIPE_0COSTELMNT_0102_HIER"SET PIPE_EXECUTION_PAUSED=FALSE;
USE ROLE SNOWPIPE; ALTER PIPE SOURCE_SYSTEM_TEST.SAPRAW."SNOWPIPE_0CO_OM_CCA_1"SET PIPE_EXECUTION_PAUSED=FALSE;
USE ROLE SNOWPIPE; ALTER PIPE SOURCE_SYSTEM_TEST.SAPRAW."SNOWPIPE_0COSTCENTER_0101_HIER"SET PIPE_EXECUTION_PAUSED=FALSE;
USE ROLE SNOWPIPE; ALTER PIPE SOURCE_SYSTEM_TEST.SAPRAW."SNOWPIPE_0PROFIT_CTR_ATTR"SET PIPE_EXECUTION_PAUSED=FALSE;
USE ROLE SNOWPIPE; ALTER PIPE SOURCE_SYSTEM_TEST.SAPRAW."SNOWPIPE_0COSTELMNT_ATTR"SET PIPE_EXECUTION_PAUSED=FALSE;
USE ROLE SNOWPIPE; ALTER PIPE SOURCE_SYSTEM_TEST.SAPRAW."SNOWPIPE_0CO_OM_CCA_9"SET PIPE_EXECUTION_PAUSED=FALSE;
USE ROLE SNOWPIPE; ALTER PIPE SOURCE_SYSTEM_TEST.SAPRAW."SNOWPIPE_0COSTELMNT_TEXT"SET PIPE_EXECUTION_PAUSED=FALSE;
USE ROLE SNOWPIPE; ALTER PIPE SOURCE_SYSTEM_TEST.SAPRAW."SNOWPIPE_0VTYPE_TEXT"SET PIPE_EXECUTION_PAUSED=FALSE;


--FORCE RESUME SNOWPIPES IF NEEDED
--SELECT sYSTEM$PIPE_FORCE_RESUME('SNOWPIPE_CSKS');
--SELECT sYSTEM$PIPE_FORCE_RESUME('SNOWPIPE_0COSTELMNT_0102_HIER_INTVL');
--SELECT sYSTEM$PIPE_FORCE_RESUME('SNOWPIPE_0PROFIT_CTR_TEXT');
--SELECT sYSTEM$PIPE_FORCE_RESUME('SNOWPIPE_ZDIVISION');
--SELECT sYSTEM$PIPE_FORCE_RESUME('SNOWPIPE_0VENDOR_TEXT');
--SELECT sYSTEM$PIPE_FORCE_RESUME('SNOWPIPE_0CURTYPE_TEXT');
--SELECT sYSTEM$PIPE_FORCE_RESUME('SNOWPIPE_0COMP_CODE_TEXT');
--SELECT sYSTEM$PIPE_FORCE_RESUME('SNOWPIPE_CSKT');
--SELECT sYSTEM$PIPE_FORCE_RESUME('SNOWPIPE_0VENDOR_ATTR');
--SELECT sYSTEM$PIPE_FORCE_RESUME('SNOWPIPE_0COSTELMNT_0102_HIER');
--SELECT sYSTEM$PIPE_FORCE_RESUME('SNOWPIPE_0CO_OM_CCA_1');
--SELECT sYSTEM$PIPE_FORCE_RESUME('SNOWPIPE_0COSTCENTER_0101_HIER');
--SELECT sYSTEM$PIPE_FORCE_RESUME('SNOWPIPE_0PROFIT_CTR_ATTR');
--SELECT sYSTEM$PIPE_FORCE_RESUME('SNOWPIPE_0COSTELMNT_ATTR');
--SELECT sYSTEM$PIPE_FORCE_RESUME('SNOWPIPE_0CO_OM_CCA_9');
--SELECT sYSTEM$PIPE_FORCE_RESUME('SNOWPIPE_0COSTELMNT_TEXT');
--SELECT sYSTEM$PIPE_FORCE_RESUME('SNOWPIPE_0VTYPE_TEXT')








