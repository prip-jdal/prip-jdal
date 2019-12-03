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
INTO MID_ProCitem_ZR_ErCorporation

select 
'000000' as TRANSACTIONNO ,
'000000' as COMPANYCODE ,
oppi.policyno as POLICYNO ,
oppi.SERIALNO as ENTSERIALNO ,
oppc.RISKCODE as RISKCODE ,
'000000' as ITEMTYPECODE ,
oppc.INSUREDADDRESS as ADDNAME ,
oppc.postalCode as POSTCODE ,
oppc.region as AREACODE ,
oppc.COUNTRY as COUNTRYCODE ,
oppc.province as IHGCODE ,
oppc.BUSINESSSOURCE as INDUSTRYCODE ,
'000000' as HRISKPEOPLEFLAG ,
oppr.remeberName as INSUREDFLAG ,
null as INSUREINFLAG ,
'000000' as INSUREINCOUNT ,
oppn.FieldAD as EMPCOUNT ,
'000000' as STAFFCOUNT ,
'000000' as TOTALWAGEORIGCUR ,
oppn.FieldAC as TOTALWAGEORIG ,
oppn.FieldAC as TOTALWAGE ,
'000000' as COSTORIGCUR ,
'000000' as COSTORIG ,
'000000' as COST ,
'000000' as TRANSACTIONDATE ,
'000000' as BATCHNO
 from ods_p_prpcinsured oppi left join ods_p_prpcmain oppc 
 on oppi.policy = oppc.policy left join ods_p_prpcriskinfo oppr
 on oppi.policyno = oppr.policyno left join ods_p_prpcitemdynamic oppn
 on oppi.policyno = oppn.policyno;
 
  commit;

spool off
!