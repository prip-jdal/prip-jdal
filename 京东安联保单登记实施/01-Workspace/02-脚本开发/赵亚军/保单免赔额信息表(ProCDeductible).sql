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
INTO MID_ProCDeductible

select 
'000000' as TRANSACTIONNO ,
'000000' as COMPANYCODE , 
prpcl.POLICYNO as POLICYNO ,
prpcl.SERIALNO as LIMITNO ,
prpcl.RISKCODE as RISKCODE ,
prpcl.CLAUSECODE as CLAUSECODE ,        
case when prpcl.LIMITLEVEL = '03' then prpcl.KindCode else null end as KINDCODE,
prpcl.ITEMNO as ITEMKINDNO ,
null as MODECODE,
prpcl.LIMITTYPE as LIMITTYPECODE ,
prpcl.LIMITNAME as DEDUCTTYPENAME ,
prpcl.CURRENCY as ORIGINALCURCODE ,
prpcl.LIMITFEE as CURRENCYAMOUNT ,
prpcl.LIMITs as DEDUCTIBLE ,
null as DEDUCTIBLERATE,
null as CHOOMODECODE,
null as CALMODECODE,
null as LIMITDESCRI,
'000000' as TRANSACTIONDATE ,
'000000' as BATCHNO
from prpclimit prpcl;

commit;

spool off
!