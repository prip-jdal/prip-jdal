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
INTO MID_ProCLimit

select
'000000' as TRANSACTIONNO ,
'000000' as COMPANYCODE , 
prpcl.POLICYNO as POLICYNO ,
null as LIMITNO,
prpcl.RISKCODE as RISKCODE ,
case when prpcl.LIMITLEVEL = '02' then prpcl.CLAUSECODE else null end as CLAUSECODE,
case when prpcl.LIMITLEVEL = '03' then prpcl.KindCode else null end as KINDCODE,
prpcl.ITEMNO as ITEMKINDNO ,
prpcl.CALCULATEFLAG as CALCULATEPREMIUMFLAG ,
null as CLAIMRATE,
prpcl.LIMITLEVEL as LIMITGRADECODE ,
prpcl.SERIALNO as LIMITTYPENO ,
prpcl.LIMITNAME as LIMITTYPENAME ,
prpcl.CURRENCY as CURRENCYCODE ,
prpcl.LIMITFEE as CURRENCYAMOUNT ,
prpcl.LIMITs as LIMIT ,
'000000' as TRANSACTIONDATE ,
'000000' as BATCHNO
from prpClimit prpcl


commit;

spool off
!