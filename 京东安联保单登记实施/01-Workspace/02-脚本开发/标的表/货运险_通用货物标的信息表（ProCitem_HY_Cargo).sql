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
INTO MID_PROCITEM_HY_CARGO

SELECT /*+ PARALLEL(16) */

'000000' AS TRANSACTIONNO ,
'000000' AS COMPANYCODE ,
citemcargodetail.POLICYNO AS POLICYNO ,
'000000' AS POLICYIDVNO ,
1 AS POLICYIDVDETAILNO ,
citemcargodetail.itemNo AS ITEMNO ,
cmain.RISKCODE AS RISKCODE ,
citemcargodetail.itemDetailCode AS ITEMTYPECODE ,
citemcargodetail.itemDetailName AS ITEMTYPENAME ,
citemcargodetail.itemDetailList AS ITEMDETAILNAME ,
citemcargodetail.detaiDesc AS ITEMNAME ,
citemcargodetail.packing AS PACKAGINGCODE ,
citemcargodetail.packing AS PACKAGINGNAME ,
null AS LOADINGCODE ,
citemcargodetail.packingName AS LOADINGNAME ,
null AS QUANTITYUINIT ,
citemcargodetail.quantity AS QUANTITY ,
citemcargodetail.shippingDesc AS MARKS ,
'1990-01-01' AS TRANSACTIONDATE ,
'000000' AS BATCHNO

FROM fccbdb.ods_p_prpcitemcargodetail citemcargodetail
left join fccbdb.ods_p_prpcmain cmain on cmain.policyno=citemcargodetail.policyno
 
commit;

spool off
!
