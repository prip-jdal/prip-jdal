
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
INTO MID_ProCitem_ZR_PrptPreserve

select 
'000000' as TRANSACTIONNO ,
'000000' as COMPANYCODE ,
oppr.policyNo as POLICYNO ,
'000000' as SERIALNO ,
oppc.riskcode as RISKCODE ,
'000000' as ITEMTYPECODE ,
oppr.caseNo as CASENO ,
oppr.actionType as PROPMODECODE ,
'000000' as ASSETTYPECODE ,
oppr.preservationTypeDesc as PROPITEMDESC ,
oppr.preservationType as OBTYPECODE ,
oppr.acceptanceCourt as PROPCOURTNAME ,
'000000' as ADD ,
null as POSTCODE ,
'000000' as AREACODE ,
'000000' as COUNTRYCODE ,
'000000' as IHGCODE ,
null as PRESERVATIONAMTORIGCUR ,
oppr.preservationAmount as PRESERVATIONAMTORIG ,
oppr.preservationAmount as PRESERVATIONAMT ,
oppr.stageOfAction as CASESTAGECODE ,
oppr.preservationAscription as ITEMOWNERSHIPCODE ,
'000000' as PROTECTSUMAMOUNTORIGCUR ,
oppr.actionAmount as PROTECTSUMAMOUNTORIG ,
oppr.actionAmount as PROTECTSUMAMOUNT ,
'000000' as TRANSACTIONDATE ,
'000000' as BATCHNO 
from oppr oppr left join ods_p_prpcmain oppc 
on oppr.policyNo = oppc.policyNo;

commit;
spool off
!