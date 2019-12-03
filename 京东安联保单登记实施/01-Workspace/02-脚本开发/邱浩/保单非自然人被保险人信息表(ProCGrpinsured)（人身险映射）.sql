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
INTO MID_PROCGRPINSURED

SELECT /*+ PARALLEL(16) */

'000000' AS TRANSACTIONNO ,
'000000' AS COMPANYCODE ,
cinsuredidvlist.policyNo AS POLICYNO ,
cinsuredidvlist.insuredCode AS ASSUREDNO ,
cinsuredidvlist.insuredName AS ASSUREDNAME ,
null AS IHGCODE ,
cinsuredidvlist.nationCode AS COUNTRYCODE ,
null AS PROVINCE ,
null AS CITY ,
null AS COUNTY ,
cinsuredidvlist.insuredAddress AS STREET ,
cinsuredidvlist.postCode AS POSTCODE ,
null AS BUSINESSTYPE ,
cinsuredidvlist.workFlag AS GRPNATURE ,
null AS BUSILICENSECODE ,
null AS BUSILICENSESDATE ,
null AS BUSILICENSEEDATE ,
null AS TAXREGISTNO ,
null AS ORGANIZATIONNO ,
null AS UNIFORMSOCIALCREDIT ,
null AS REGISTMONEYORIGCUR ,
null AS REGISTMONEYORIG ,
null AS REGISTMONEY ,
null AS ASSETORIGCUR ,
null AS ASSETORIG ,
null AS ASSET ,
null AS NETPROFITRATE ,
null AS MAINBUSSINESS ,
null AS CORPORATION ,
null AS PEOPLES ,
null AS ONWORKPEOPLES ,
null AS OFFWORKPEOPLES ,
cinsuredidvlist.postCode AS ZIPCODE ,
cinsuredidvlist.faxNumber AS FAX ,
cinsuredidvlist.phoneNumber AS PHONE ,
cinsuredidvlist.email AS COMPANYEMAIL ,
cinsuredidvlist.linkerName AS LINKERNAME ,
cinsuredidvlist.linkerPhone AS LINKERMOBILE ,
null AS LINKERNUMBER ,
null AS FOUNDDATE ,
null AS CUSTOMERNO ,
null AS CREDITGRADE ,
'1990-01-01' AS TRANSACTIONDATE ,
'000000' AS BATCHNO 

FROM fccbdb.prpcinsuredidvlist cinsuredidvlist
 
commit;

spool off
!
