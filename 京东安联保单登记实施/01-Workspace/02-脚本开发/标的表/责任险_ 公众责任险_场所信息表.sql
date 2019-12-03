
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
INTO MID_ProCitem_ZR_PublicSite

select
'000000' as TRANSACTIONNO ,
'000000' as COMPANYCODE ,
oppd.policyno as POLICYNO ,
oppd.ItemNo as SERIALNO ,
oppc.Riskcode as RISKCODE ,
'000000' as ITEMTYPECODE ,
oppd.FieldAA as BIZADDRESS ,
null as POSTCODE ,
'000000' as AREACODE ,
'000000' as COUNTRYCODE ,
'000000' as IHGCODE ,
oppd.FieldAB as BIZSQUARE ,
'000000' as PLACETRADECODE ,
null as RISKEXPOSUREAREA ,
null as STRUCTURECODE ,
null as UNDERGROUNDFLAG ,
null as PLACEFLAG ,
null as FIREPROOFFACILITYFLAG ,
'000000' as TRANSACTIONDATE ,
'000000' as BATCHNO 
from ods_p_prpcitemdynamic oppd left join ods_p_prpcmain oppc
 on oppd.policyno = oppc.policyno;
 
 commit;

spool off
!