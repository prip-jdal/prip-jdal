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
INTO MID_ProCitem_ZR_Product

select 
'000000' as TRANSACTIONNO ,
'000000' as COMPANYCODE ,
opp.policyno as POLICYNO ,
opp.itemno as ITEMNO ,
oppc.RISKCODE as RISKCODE ,
'000000' as ITEMTYPECODE ,
opp.productName as PRODNAME ,
'000000' as PRODMODEL ,
null as PRODUSAGE ,
'000000' as PRODTYPECODE ,
'000000' as PRODTYPENAME ,
'000000' as ESTIMATEDSALESORIGCUR ,
opp.estimateYearSales as ESTIMATEDSALESORIG ,
opp.estimateYearSales as ESTIMATEDSALES ,
null as PRODTYPELV1 ,
null as PRODTYPELV1NAME ,
null as PRODTYPELV2 ,
null as PRODTYPELV2NAME ,
null as PRODTYPELV3 ,
null as PRODTYPELV3NAME ,
null as PRODTYPELV4 ,
null as PRODTYPELV4NAME ,
opp.qualityStandard as QUALITYIDENTIFYFLAG ,
opp.certificate as QUALITYIDENTIFY ,
'000000' as TRANSACTIONDATE ,
'000000' as BATCHNO 
from ods_p_prpcitemproperty opp left join ods_p_prpcmain oppc
 on opp.policy = oppc.policy;

 commit;

spool off
!