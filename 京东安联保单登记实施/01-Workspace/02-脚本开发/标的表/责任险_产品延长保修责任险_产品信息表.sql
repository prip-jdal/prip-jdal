
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
INTO MID_ProCitem_ZR_WExtProduct

select 
'000000' as TRANSACTIONNO ,
'000000' as COMPANYCODE ,
oppr.policyno as POLICYNO ,
oppr.ItemNo as ITEMNO ,
oppc.RISKCODE as RISKCODE ,
'000000' as ITEMTYPECODE ,
oppcr.category as EXTENDNAME ,
oppcr.brand as BRAND ,
oppcr.model as PRODMODEL ,
'000000' as PRODTYPECODE ,
'000000' as PRODPRICEORIGCUR ,
oppcr.svcProdPrice as PRODPRICEORIG ,
oppcr.svcProdPrice as PRODPRICE ,
oppcr.mstProdSaleTime as BUYTIME ,
oppcr.other as BUYERADDRESS ,
'000000' as BUYERNAME ,
'000000' as TRANSACTIONDATE ,
'000000' as BATCHNO 
from ods_p_prptriskInfoWarranty oppr left join ods_p_prpcmain oppc
 on oppr.policyNo = oppc.policyNo left join ods_p_prp_copyrisk_info_elec_warranty oppcr 
 on oppr.policyNo = oppcr.policyNo;
 
   commit;

spool off
!
