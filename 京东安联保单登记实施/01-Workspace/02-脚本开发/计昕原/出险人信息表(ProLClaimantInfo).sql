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
INTO MID_PROLCLAIMANTINFO

SELECT /*+ PARALLEL(16) */

'000000' AS TRANSACTIONNO ,
'000000' AS COMPANYCODE ,
claim.PolicyNo AS POLICYNO ,
registdamageperson.RegistNo AS REGISTNO ,
claim.ClaimNo  AS CLMNO ,
claim.CaseNo AS CASENO ,
registdamageperson.CustomerId AS CLAIMANTNO ,
null AS CUSTOMERNO ,
registdamageperson.DamagePersonName AS LOSSNAME ,
registdamageperson.DamagePersonSex AS LOSSSEX ,
registdamageperson.DamagePersonBirthday AS LOSSBIRTHDATE ,
registdamageperson.IdentifyType AS LOSSIDENTIFYTYPE ,
registdamageperson.IdentifyNo AS LOSSIDENTIFYNO ,
'000000' AS POLTYPECODE ,
CASE WHEN registdamage.IsDead='0'  THEN '1' ELSE '0' END AS DIEFLAG ,
null AS DEATHDATE , 
null AS DEATHREASONCODE ,
'1990-01-01' AS TRANSACTIONDATE ,
'000000' AS BATCHNO 

FROM ins_claim.PrpLRegistDamagePerson registdamageperson 
left join ins_claim.PrpLClaim claim on  claim.RegistNo=registdamageperson.RegistNo
left join ins_claim.PrpLRegistDamage registdamage on  registdamage.RegistNo=registdamageperson.RegistNo
 
commit;

spool off
!
