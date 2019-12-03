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
INTO MID_PROCGRPBENEFIT

SELECT /*+ PARALLEL(16) */

'000000' AS TRANSACTIONNO ,
'000000' AS COMPANYCODE ,
cbeneficiary.policyno AS POLICYNO ,
1 AS BNFSERIALNUM ,
'1' AS BENEFITSERIALNO ,
cbeneficiary.BenefitRate AS PERCENTOFBENEFIT ,
cbeneficiary.insuredCode AS ICCUSTOMERNO ,
cbeneficiary.BeneficiaryName AS BNFNAME ,
'000000' AS BENEFITBUSILICENSENO ,
'000000' AS BENEFITTAXREGISNO ,
cbeneficiary.IdentifyNumber AS BENEFITORGCODE ,
'000000' AS BENEFITUNIFORMSOCIALCREDIT ,
'000000' AS IHGCODE ,
'000000' AS COUNTRYCODE ,
null AS PROVINCE ,
null AS CITY ,
null AS COUNTY ,
cbeneficiary.insuredAddress AS DETAILADD ,
null AS POSTCODE ,
null AS CUSTOMERNO ,
'1990-01-01' AS TRANSACTIONDATE ,
'000000' AS BATCHNO 

FROM fccbdb.prpcbeneficiary cbeneficiary
 
commit;

spool off
!
