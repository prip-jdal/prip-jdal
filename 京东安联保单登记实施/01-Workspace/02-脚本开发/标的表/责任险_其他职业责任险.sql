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
INTO MID_ProCitem_ZR_Others

select 
'000000' as TRANSACTIONNO ,
'000000' as COMPANYCODE ,
oppr.policyNo as POLICYNO ,
'000000' as SERIALNO ,
oppc.riskcode as RISKCODE ,
'000000' as ITEMTYPECODE ,
oppi.insuredname as NAME ,
oppi.NATIONCODE as COUNTRYCODE ,
oppi.identifyType as CERTTYPE ,
oppi.IDENTIFYNUMBER as CERTNO ,
oppi.SEX as SEX ,
oppi.AGE as AGE ,
oppi.OCCUPATIONCODE as OCCUPATIONCODE ,
oppi.OCCUPATIONCODE as OCCUPATIONCODENAME ,
null as JOBTITLE ,
oppc.STARTDATE as DUTYSTARTDATE ,
'000000' as TRANSACTIONDATE ,
'000000' as BATCHNO 
from ods_p_prpcriskinfo oppr left join ods_p_prpcmain oppc
 on oppr.policyNo = oppc.policyNo left join ods_p_prpcinsured oppi
 on oppr.policyNo = oppi.policyNo;

  commit;

spool off
!