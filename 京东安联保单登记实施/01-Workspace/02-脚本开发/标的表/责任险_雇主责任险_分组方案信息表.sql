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
INTO MID_ProCitem_ZR_ErUnit
select
'000000' as TRANSACTIONNO ,
'000000' as COMPANYCODE ,
oppcd.policyno as POLICYNO ,
oppc.RISKCODE as RISKCODE ,
oppcd.ITEMNO as GROUPNO ,
null as HRISKWORKTYPECODE ,
null as WORKTYPENAME ,
null as POSTNAME ,
null as JOBATTRIBUTECODE ,
null as JOBATTRIBUTENAME ,
oppc.FieldAD as EMPCOUNT ,
'000000' as ANNTOTALWAGEORIGCUR ,
oppd.FieldAC as ANNTOTALWAGEORIG ,
oppd.FieldAC as ANNTOTALWAGE ,
'000000' as TRANSACTIONDATE ,
'000000' as BATCHNO 
from ods_p_prpCitemdynamicdetail oppcd left join ods_p_prpcmain oppc 
on oppcd.policyNo = oppc.policyNo left join ods_p_prpcitemdynamic oppd 
on oppd.policy = oppcd.policy;

  commit;

spool off
!