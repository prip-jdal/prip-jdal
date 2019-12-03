ora_db=$1
user_name=$2
user_pwd=$3
log_file=$4

sqlplus ${user_name}/${user_pwd}@${ora_db}<<!
WHENEVER SQLERROR EXIT SQL.SQLCODE
set timing on;
spool ${log_file}

ALTER SESSION ENABLE PARALLEL DML;

INSERT /*+ append PARALLEL(16) */
INTO MID_PROCITEM_CB_SPERSON

SELECT /*+ PARALLEL(16) */

'000000' AS TRANSACTIONNO ,
'000000' AS COMPANYCODE ,
citemhull.policyno AS POLICYNO ,
cmain.RISKCODE AS RISKCODE ,
citemhull.VesselCode AS SHIPNO ,
1 AS RELATIONSHIPNO ,
'1、3、5' AS RELTYPECODE ,
'船东、管理人、原船东' AS RELTYPENAME ,
'000000' AS RELATIONSHIPNAME ,
nu1l AS IHGCODE ,
null AS NATIVEPLACE ,
null AS PROVINCE ,
null AS CITY ,
null AS COUNTY ,
null AS DETAILADD ,
null AS POSTCODE ,
'1990-01-01' AS TRANSACTIONDATE ,
'000000' AS BATCHN

FROM fccbdb.ods_p_prpcitemhull citemhull
left join fccbdb.ods_p_prpcmain cmain on cmain.policyno=citemhull.policyno
 
commit;

spool off
!
