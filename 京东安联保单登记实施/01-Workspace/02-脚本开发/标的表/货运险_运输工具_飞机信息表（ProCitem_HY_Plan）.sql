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
INTO MID_PROCITEM_HY_PLAN

SELECT /*+ PARALLEL(16) */

'000000' AS TRANSACTIONNO ,
'000000' AS COMPANYCODE ,
citemcargodetail.POLICYNO AS POLICYNO ,
'000000' AS POLICYIDVNO ,
1 AS POLICYIDVDETAILNO ,
cmain.RISKCODE AS RISKCODE ,
citemCargo.voyageCardNo AS FLIGHTNO ,
null AS PLANTYPENAME ,
'1990-01-01' AS TRANSACTIONDATE ,
'000000' AS BATCHNO

FROM fccbdb.ods_p_prpcitemcargodetail citemcargodetail
left join fccbdb.ods_p_prpcmain cmain on cmain.policyno=citemcargodetail.policyno
left join fccbdb.ods_p_prpcitemCargo citemCargo on citemCargo.policyno=citemcargodetail.policyno
 
commit;

spool off
!
