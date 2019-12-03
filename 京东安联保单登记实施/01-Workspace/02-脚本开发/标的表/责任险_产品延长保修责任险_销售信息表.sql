
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
INTO MID_ProCitem_ZR_WExtSales

select 
'000000' as TRANSACTIONNO ,
'000000' as COMPANYCODE ,
oppp.policyno as POLICYNO ,
oppp.ItemNo as SERIALNO ,
oppc.RISKCODE as RISKCODE ,
oppp.ItemTypeCode as ITEMTYPECODE ,
oppp.estimateSalesNum as SALECOUNT ,
'000000' as SALEAMOUNTORIGCUR ,
oppp.estimateYearSales as SALEAMOUNTORIG ,
oppp.estimateYearSales as SALEAMOUNT ,
null as PRODKIND ,
oppc.STARTDATE as EXTENDSTARTDATE ,
oppc.ENDDATE as EXTENDENDDATE ,
'000000' as TRANSACTIONDATE ,
'000000' as BATCHNO 
from old_p_prpcitemproperty oppp left join ods_p_prpcmain oppc 
on oppp.policyNo = oppc.policyNo;

  commit;

spool off
!