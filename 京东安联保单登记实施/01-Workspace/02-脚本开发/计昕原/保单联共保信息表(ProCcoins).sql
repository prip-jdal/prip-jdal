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
INTO MID_PROCCOINS

SELECT /*+ PARALLEL(16) */

'000000' AS TRANSACTIONNO ,
'000000' AS COMPANYCODE ,
ccoins.POLICYNO AS POLICYNO ,
ccoins.RISKCODE AS RISKCODE ,
'000000' AS CLAUSECODE ,
driskclausekind.KINDCODE AS KINDCODE ,
1 AS SERIALNO ,
ccoins.COINSPOLICYNO AS MAINPOLICYNO ,
ccoins.COINSPOLICYNO AS SUBPOLICYNO ,
ccoins.coinscode AS COINSCODE ,
ccoins.CoinsName AS COINSNAME ,
ccoins.COINSTYPE AS COINSFLAG ,
ccoins.COINSRATE AS COINSRATE ,
ccoins.CURRENCY AS CURRENCY ,
ccoins.CURRENCY AS COINSAMOUNTORIGCUR ,
ccoins.COINSINSURED AS COINSAMOUNTORIG ,
ccoins.coinsInsured1 AS COINSAMOUNT ,
ccoins.CURRENCY AS COINSPREMIUMORIGCUR ,
ccoins.COINSPREMIUM AS COINSPREMIUMORIG ,
ccoins.coinsPremium1 AS COINSPREMIUM ,
'1990-01-01' AS TRANSACTIONDATE ,
'000000' AS BATCHNO 

FROM fccbdb.prpccoins ccoins
left join fccbdb.prpdriskclausekind driskclausekind on driskclausekind.RISKCODE=ccoins.RISKCODE
 
commit;

spool off

