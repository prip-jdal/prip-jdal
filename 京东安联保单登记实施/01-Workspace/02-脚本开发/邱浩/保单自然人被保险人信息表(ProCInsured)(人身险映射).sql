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
INTO MID_PROCINSURED

SELECT /*+ PARALLEL(16) */

'000000' AS TRANSACTIONNO ,
'000000' AS COMPANYCODE ,
cinsuredidvlist.policyNo AS POLICYNO ,
cinsuredidvlist.insuredCode AS INSUREDNO ,
cinsuredidvlist.relationToInsured AS RELATIONTOMAININSURED ,
'000000' AS ISMAININSUREDFLAG ,
cinsuredidvlist.insuredCode AS MAININSUREDNO ,
'000000' AS GROUPNO ,
cinsuredidvlist.relationToAppnt AS RELATIONTOAPPNT ,
cinsuredidvlist.insuredName AS INSUREDNAME ,
cinsuredidvlist.insuredEName AS INSUREDENAME ,
cinsuredidvlist.sex AS INSUREDSEX ,
cinsuredidvlist.age AS INSUREDAGE ,
cinsuredidvlist.birthday AS INSUREDBIRTHDATE ,
cinsuredidvlist.identifyTYpe AS INSUREDIDENTIFYTYPE ,
cinsuredidvlist.identifyNumber AS INSUREDIDENTIFYNUMBER ,
'000000' AS APPLIRESIDENCE ,
cinsuredidvlist.boigonAddress AS RGTADDRESS ,
'000000' AS NATIONALITY ,
'000000' AS IHGCODE ,
cinsuredidvlist.nationCode AS NATIVEPLACE ,
'000000' AS PROVINCE ,
'000000' AS CITY ,
'000000' AS COUNTY ,
cinsuredidvlist.insuredAddress AS INSUREDADDRESS ,
cinsuredidvlist.postCode AS POSTCODE ,
1 AS STATURE ,
1 AS AVOIRDUPOIS ,
'000000' AS SALARYORIGCUR ,
1 AS SALARYORIG ,
1 AS SALARY ,
cinsuredidvlist.marriage AS MARRIAGE ,
'1990-01-01' AS MARRIAGEDATE ,
cinsuredidvlist.mobile AS INSUREDMOBILE ,
cinsuredidvlist.phoneNumber AS INSUREDPHONENUMBER ,
cinsuredidvlist.faxNumber AS INSUREDFAXNUMBER ,
cinsuredidvlist.postCode AS INSUREDEMAIL ,
cinsuredidvlist.postAddress AS INSUREDPOSTADDRESS ,
cinsuredidvlist.postCode AS INSUREDPOSTCODE ,
'000000' AS DEGREE ,
'000000' AS POSITION ,
'000000' AS OCCUPATIONTYPE ,
'000000' AS OCCUPATIONNAME ,
'000000' AS OCCUPATIONCODE ,
'000000' AS OCCUPATIONCODENAME ,
'000000' AS WORKTYPE ,
'000000' AS PLURALITYTYPE ,
'1990-01-01' AS DEATHDATE ,
'000000' AS SMOKEFLAG ,
cinsuredidvlist.unit AS GRPNAME ,
'000000' AS LICENSEFLAG ,
'000000' AS LICENSETYPE ,
'000000' AS SOCIALINSUFLAG ,
'000000' AS SOCIALINSUNO ,
'000000' AS ARRIVECITY ,
'000000' AS ABNORMALFLAG ,
'000000' AS ABNORMALCONTENT ,
'000000' AS CUSTOMERNO ,
'000000' AS CREDITGRADE ,
'1990-01-01' AS TRANSACTIONDATE ,
'000000' AS BATCHNO 


FROM fccbdb.prpcinsuredidvlist cinsuredidvlist
 
commit;

spool off
!
