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
INTO MID_ProCitem_ZR_ErEmployee

select 
'000000' as TRANSACTIONNO ,
'000000' as COMPANYCODE ,
oppl.POLICYNO as POLICYNO ,
oppl.SERIALNO as EMPSERIALNO ,
oppc.RISKCODE as RISKCODE ,
'000000' as ITEMTYPECODE ,
oppl.EMPLOYEENAME as EMPNAME ,
oppl.TEMNO as EMPGROUPSERIALNO ,
oppl.AGE as AGE ,
oppl.SEX as SEX ,
oppl.IDENTIFYTYPE as CERTTYPE ,
oppl.IDENTIFYNUMBER as CERTNO ,
'000000' as POSTNAME ,
oppl.JOBCODE as JOBCODE ,
oppl.JOBNAME as JOBNAME ,
oppl.HIGHRISKCODE as HRISKWORKTYPECODE ,
oppl.HIGHRISKCODE as WORKTYPENAME ,
oppl.CONTRACTSTARTDATE as INDIVISIONDATE ,
null as WORKYEARS ,
'000000' as CURRENCYORIGCUR ,
oppl.SELFMONTHINCOME as MONTHLYWAGESORIG ,
oppl.SELFMONTHINCOME as MONTHLYWAGES ,
'000000' as TRANSACTIONDATE ,
'000000' as BATCHNO 
from ods_p_prpctememploylist oppl left join ods_p_prpcmain oppc 
 on oppl.policyNo = oppc.policyNo;
  
  commit;

spool off
!
