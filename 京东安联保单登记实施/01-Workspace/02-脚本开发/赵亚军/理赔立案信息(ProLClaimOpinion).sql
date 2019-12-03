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
INTO MID_ProLClaimOpinion

select 
'000000' as TRANSACTIONNO ,
'000000' as COMPANYCODE , 
prplc.PolicyNo as POLICYNO ,
prplc.RegistNo  as REGISTNO ,
prplc.ClaimNo  as CLMNO ,
prpld.DisasterCode as LEV_CATACODE ,
prpld.DisasterName as LEV_CATANAME ,
prplc.OperatorCode as OPERATORCODE ,
prplc.OperatorName as OPERATORNAME ,
prplc.ltext as OPINIONS ,
prplc.ClaimTime  as CLAIMDATE ,
prplc.DamageTime  as ACCIDENTDATE ,
prplc.DamageTime  as ACCIDENTTIME ,
prplc.DamageCode  as CHDAMAGECODE ,
prplc.DamageCode  as RSDAMAGECODE ,
prplc.DamageName as DAMAGENAME ,
prplc.DamageDetail  as ACCIDENTDESC ,
prplc.DamageAreaCode as DAMAGEADDRESSTYPECODE ,
prplc.DamageAddress as ACCIDENTSITE ,
prplc.Currency as ESTIMATEDLOSSAMOUNTORIGCUR  ,
prplc.SumClaim  as ESTIMATEDLOSSAMOUNTORIG ,
prplc.SumClaim  as ESTIMATEDLOSSAMOUNT ,
prplc.EndCaseFlag as LAWSUITFLAG ,
prplc.MakeCom as CLAIMDEALCODE ,
null as CLAIMDEALNAME,
prplr.validFlag as CASEREOPENFLAG ,
prplr.openCaseDate as CASEREOPENTIME ,
prplr.claimNo as CLMNOORIG ,
'000000' as TRANSACTIONDATE ,
'000000' as BATCHNO

from PrpLClaim prplc left join PrpLDisaster prpld on prplc.ClaimNo = prpld.ClaimNo
left join prplr prplr on prpld.ClaimNo = prplr.claimNo;

commit;

spool off
!