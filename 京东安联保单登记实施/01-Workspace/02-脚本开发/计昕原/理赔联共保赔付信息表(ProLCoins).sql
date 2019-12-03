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
INTO MID_PROLCOINS

SELECT /*+ PARALLEL(16) */

'000000' AS TRANSACTIONNO ,
'000000' AS COMPANYCODE ,
cfeecoins.POLICYNO AS POLICYNO ,
cfeecoins.REGISTNO AS REGISTNO ,
claim.ClaimNo  AS CLMNO ,
claim.CaseNo  AS CASENO ,
1 AS SERIALNO ,
cfeecoins.RISKCODE AS RISKCODE ,
null AS CLAUSECODE ,
cfeecoins.KINDCODE AS KINDCODE ,
cfeecoins.COINSRATE AS PROSHARERATE ,
cfeecoins.CURRENCY AS CURRENCY ,
CASE WHEN charge.DIVIDEFLAG='0' THEN cfeecoins.SUMPAID ELSE cfeecoins.COINSSUMPAID END AS ORISUMPAY ,
CASE WHEN charge.DIVIDEFLAG='0' THEN cfeecoins.SUMPAID*cfeecoins.EXCHRATE ELSE cfeecoins.COINSSUMPAID*cfeecoins.EXCHRATE END AS ORISUMPAYCNY ,
cfeecoins.COINSCODE AS COINSCODE ,
cfeecoins.COINSNAME AS COINSNAME ,
'1990-01-01' AS TRANSACTIONDATE ,
'000000' AS BATCHNO 

FROM ins_claim.PrpLCFeeCoins cfeecoins
left join ins_claim.PrpLCharge charge on  charge.POLICYNO=cfeecoins.POLICYNO
left join ins_claim.PrpLClaim claim on claim.RegistNo=cfeecoins.RegistNo
 
commit;

spool off
!
