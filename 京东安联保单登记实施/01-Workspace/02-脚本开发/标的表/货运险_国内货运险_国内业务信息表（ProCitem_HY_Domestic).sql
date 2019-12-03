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
INTO MID_PROCITEM_HY_DOMESTIC

SELECT /*+ PARALLEL(16) */

'000000' AS TRANSACTIONNO ,
'000000' AS COMPANYCODE ,
citemcargo.POLICYNO AS POLICYNO ,
'000000' AS POLICYIDVNO ,
'000000' AS POLICYIDVDETAILNO ,
cmain.RISKCODE AS RISKCODE ,
citemcargo.ConveyanceType AS CONVEYANCECODE ,
citemcargo.ConveyanceType AS CONVEYANCENAME ,
citemcargo.StartDate AS STARTDATE ,
citemcargo.StartSiteName AS STARTSITENAME ,
citemcargo.ViaSiteName AS VIASITENAME ,
citemcargo.TargetSiteName AS ENDSITENAME ,
crisk.billOfLadingNo AS CARRYBILLNO ,
crisk.nvoiceNo AS INVOICENO ,
'1990-01-01' AS TRANSACTIONDATE ,
'000000' AS BATCHNO

FROM fccbdb.ods_p_prpcitemcargo citemcargo
left join fccbdb.ods_p_prpcmain cmain on cmain.policyno=citemcargo.policyno
left join fccbdb.ods_p_prpcrisk crisk on crisk.policyno=citemcargo.policyno
 
commit;

spool off
!
