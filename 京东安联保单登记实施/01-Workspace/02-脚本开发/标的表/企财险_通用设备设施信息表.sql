
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
INTO MID_ProCitem_QC_Facility

select 
'000000' as TRANSACTIONNO ,
'000000' as COMPANYCODE ,
opp.policyno as POLICYNO ,
opp.ItemNo as ITEMNO ,
oppc.RISKCODE as RISKCODE ,
opp.ItemTypeCode as ITEMTYPECODE ,
null as MODEL ,
null as PURCHASEDATE ,
null as ITEMQUANTITY ,
null as UNIT ,
'000000' as TRANSACTIONDATE ,
'000000' as BATCHNO 
from ods_p_prpcitemproperty opp left join ods_p_prpcmain oppc 
on opp.policyno = oppc.policyno;

commit;

spool off
!