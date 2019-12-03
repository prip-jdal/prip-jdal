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
INTO MID_ProCengage

select 
'000000' as TRANSACTIONNO ,
'000000' as COMPANYCODE , 
prpce.POLICYNO as POLICYNO ,
prpce.serialNo as SERIALNO ,
prpce.RISKCODE as RISKCODE ,
prpce.clauseCode as ESPECIALCODE ,
prpce.CLAUSENAME as ESPECIALNAME ,
prpce.clauses as ESPECIALCLAUSES ,
'000000' as TRANSACTIONDATE ,
'000000' as BATCHNO
from prpcengage prpce;

commit;

spool off
!





























































































































































































