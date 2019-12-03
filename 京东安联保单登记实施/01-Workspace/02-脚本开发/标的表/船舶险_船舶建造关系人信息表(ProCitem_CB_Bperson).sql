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
INTO MID_PROCITEM_CB_BPERSON

SELECT /*+ PARALLEL(16) */

'000000' AS TRANSACTIONNO ,
'000000' AS COMPANYCODE ,
citemhull.policyno AS POLICYNO ,
cmain.RISKCODE AS RISKCODE ,
1 AS BRELATIONSHIPNO ,
'1' AS BRELTYPECODE ,
'´¬¶«' AS BRELTYPENAME ,
citemhull.OwnerCName AS BRELATIONSHIPNAME ,
'000000' AS INSUREDMARK ,
'1990-01-01' AS TRANSACTIONDATE ,
'000000' AS BATCHNO

FROM fccbdb.ods_p_prpcitemhull citemhull
left join fccbdb.ods_p_prpcmain cmain on cmain.policyno=citemhull.policyno
 
commit;

spool off
!
