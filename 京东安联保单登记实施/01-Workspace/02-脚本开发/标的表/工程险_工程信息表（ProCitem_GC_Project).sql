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
INTO MID_PROCITEM_GC_PROJECT

SELECT /*+ PARALLEL(16) */

'000000' AS TRANSACTIONNO ,
'000000' AS COMPANYCODE ,
citemengineering.POLICYNO AS POLICYNO ,
citemengineering.ItemNo AS ITEMNO ,
cmain.RISKCODE AS RISKCODE ,
citemengineering.ContractTitle AS PROJECTNAME ,
citemengineering.ContractType AS PROJECTTYPECODE ,
citemengineering.ContractType AS PROJECTTYPENAME ,
citemengineering.ContractNature AS PROJECTNATURE ,
citemengineering.ContractDesc AS NATUREPLAIN ,
null AS IHGCODE ,
null AS COUNTRYCODE ,
citemengineering.ItemProvinceCode AS PROVINCE ,
citemengineering.ItemCityCode AS CITY ,
citemengineering.ItemDistrictCode AS COUNTY ,
citemengineering.itemAddress AS DETAILADD ,
citemengineering.ItemPostalCode AS POSTCODE ,
citemengineering.ContractStartDate AS PROJECTTSTARTDATE ,
citemengineering.ContractEndDate AS PROJECTTENDDATE ,
citemengineering.Currency AS CURRENCY ,
citemengineering.ContractValue AS PROJECTBUDGETORIG ,
citemengineering.ContractValue AS PROJECTBUDGET ,
'000000' AS INPAYMENTCODE ,
citemengineering.TestingStartDate AS TESTPERIODSTARTDATE ,
citemengineering.TestingEndDate AS TESTPERIODENDDATE ,
citemengineering.MaintenStartDate AS WARRANTYSTARTDATE ,
citemengineering.MaintenEndDate AS WARRANTYENDDATE ,
citemengineering.MaintenDays AS WARRANTYPERIODN ,
'1990-01-01' AS TRANSACTIONDATE ,
'000000' AS BATCHNO

FROM fccbdb.ods_p_prpcitemengineering citemengineering
left join fccbdb.ods_p_prpcmain cmain on cmain.policyno=citemengineering.policyno
 
commit;

spool off
!
