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
INTO MID_ProLClaimOpinionDeal

select 
'000000' as TRANSACTIONNO ,
'000000' as COMPANYCODE , 
prplc.PolicyNo as POLICYNO ,
prplc.ClaimNo  as CLMNO ,
null as CLAIMDEALTYPECODE,
prplc.ClaimTime  as CLAIMDEALTIME ,
prplc.ZeroReasonCode as CANCELREASONS ,
prplct.CancelDate as CLAIMCANCELRECOVERDATE ,
null as CLAIMCANCELRECOVERNUMBER,
prplc.MakeCom as CLAIMDEALCODE ,
null as CLAIMDEALNAME,
'000000' as TRANSACTIONDATE ,
'000000' as BATCHNO
from PrpLClaim prplc left join PrpLCanceltrace prplct on prplc.ClaimNo = prplct.BusinessNo

commit;

spool off
!