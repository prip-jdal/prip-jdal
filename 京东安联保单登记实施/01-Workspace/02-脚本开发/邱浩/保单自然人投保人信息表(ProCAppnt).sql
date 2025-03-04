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
INTO MID_PROCAPPNT

SELECT /*+ PARALLEL(16) */

'000000' AS TRANSACTIONNO ,
'000000' AS COMPANYCODE ,
cinsured.POLICYNO AS POLICYNO ,
cinsured.INSUREDCODE AS APPNTNO ,
cinsured.INSUREDNAME AS APPNTNAME ,
cinsured.SEX AS APPNTSEX ,
cinsured.AGE AS APPNTAGE ,
cinsured.BIRTHDAY AS APPNTBIRTHDATE ,
cinsured.identifyType AS APPNTCERTTYPE ,
cinsured.IDENTIFYNUMBER AS APPNTCERTNO ,
'000000' AS APPLIRESIDENCE ,
'000000' AS RGTADDRESS ,
cinsured.nation AS NATIONALITY ,
cinsured.NATIONCODE AS IHGCODE ,
cinsured.COUNTRY AS NATIVEPLACE ,
cinsured.province AS PROVINCE ,
cinsured.city AS CITY ,
cinsured.region AS COUNTY ,
cinsured.other AS STREET ,
cinsured.postalCode AS POSTCODE ,
1 AS STATURE ,
1 AS AVOIRDUPOIS ,
'000000' AS SALARYORIGCUR ,
1 AS SALARYORIG ,
1 AS SALARY ,
cinsured.MARRIAGE AS MARRIAGE ,
'1990-01-01' AS MARRIAGEDATE ,
'000000' AS HEALTH ,
'000000' AS APPNTMP ,
cinsured.HOMEPHONE AS APPNTFP ,
cinsured.EMAIL AS APPNTEMAIL ,
cinsured.LINKERADDRESS AS APPNTPOSTADDRESS ,
cinsured.LINKERPOSTCODE AS APPNTPOSTCODE ,
cinsured.INSUREDENAME AS APPNTENAME ,
'000000' AS DEGREE ,
'000000' AS GRPNAME ,
'000000' AS POSITION ,
'000000' AS OCCUPATIONTYPE ,
'000000' AS OCCUPATIONNAME ,
cinsured.OCCUPATIONCODE AS OCCUPATIONCODE ,
'000000' AS OCCUPATIONCODENAME ,
'000000' AS WORKTYPE ,
'000000' AS PLURALITYTYPE ,
'000000' AS SMOKEFLAG ,
'000000' AS LICENSEFLAG ,
'000000' AS LICENSETYPE ,
'000000' AS SOCIALINSUFLAG ,
'000000' AS SOCIALINSUNO ,
'000000' AS CUSTOMERNO ,
'000000' AS CREDITGRADE ,
'1990-01-01' AS TRANSACTIONDATE ,
'000000' AS BATCHNO 

FROM fccbdb.prpcinsured cinsured
 
commit;

spool off
!
