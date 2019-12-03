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
INTO MID_PROLREPLEVY

SELECT /*+ PARALLEL(16) */

'000000' AS TRANSACTIONNO ,
'000000' AS COMPANYCODE ,
replevymain.policyNo AS POLICYNO ,
replevymain.registNo AS REGISTNO ,
replevymain.claimNo AS CLMNO ,
claim.CaseNo  AS CASENO ,
replevydetail.clauseCode AS CLAUSECODE ,
replevydetail.kindCode AS KINDCODE ,
1 AS SERIALNO ,
replevydetail.replevyType AS RECOVERYTYPECODE ,
'000000' AS RECOVERYTYPENAME ,
replevydetail.repleviedPerson AS RECOVERYNAME ,
'000000' AS RECOVERYIDENTIFYTYPE ,
'000000' AS RECOVERYIDENTIFYNUMBER ,
'000000' AS COUNTRYCODE ,
replevydetail.replevyDate AS RECOVERYDATE ,
replevydetail.replevyHandleDate AS TAKEBAKEDATE ,
replevydetail.replevyReason AS RECOVERYREASON ,
replevydetail.replevyWay AS RECOVERYWAY ,
replevydetail.CURRENCY AS RECECHARGEFEEORIGCUR  ,
replevymain.sumplanReplevy AS RECECHARGEFEEORIG ,
replevymain.sumplanReplevy AS RECECHARGEFEE ,
replevydetail.CURRENCY AS RECOVERYFEEORIGCUR  ,
replevymain.sumrealReplevy AS RECOVERYFEEORIG ,
replevymain.sumrealReplevy AS RECOVERYFEE ,
replevydetail.CURRENCY AS SUMRECOVEYCHARGEFEEORIGCUR  ,
replevydetail.replevyFee AS SUMRECOVEYCHARGEFEEORIG ,
replevydetail.replevyFee AS SUMRECOVEYCHARGEFEE ,
'1990-01-01' AS TRANSACTIONDATE ,
'000000' AS BATCHNO 

FROM ins_claim.PrpLReplevyDetail replevydetail
left join ins_claim.PrpLReplevyMain replevymain on  replevymain.RegistNo=replevydetail.RegistNo and replevymain.id=replevydetail.replevyId
left join ins_claim.PrpLClaim claim on claim.RegistNo=replevydetail.RegistNo
 
commit;

spool off
!
