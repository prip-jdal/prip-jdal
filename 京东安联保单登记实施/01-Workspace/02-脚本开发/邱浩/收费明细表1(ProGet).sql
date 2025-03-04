

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
INTO MID_ProGet

select 
'000000' as TRANSACTIONNO ,
'000000' as COMPANYCODE ,
null as TRANSACTIONNOORIG ,
gpcd.POLICY_NO as VISACODE ,
gpcd.POLICY_NO as POLICYNO ,
gppm.VISACLASS_NO as ACTUGETNO ,
gpcsm.BILL_TYPE as GETTYPE ,
gpcsm.BILL_TYPE as GETNAME ,
gppm.PAYMENT_TYPE as GETWAY ,
gppm.CURRENCY as CURRENCY ,
gppm.PAY_REF_FEE as SUMACTUGETMONEY ,
gppm.SETTLEMENT_FEE as SUMACTUGETMONEYCNY ,
GPPAYMENTDETAIL.BANK_REF_DATE as ENTERACCDATE ,
gppm.VOUCHER_DATE as RECOGDATE ,
gpcsm.BANK_CODE as PAYEEBANKCODE ,
gpcsm.BANK_NAME as PAYEEBANKNAME ,
gpcsm.BANK_ACCOUNT_NO as PAYEEBANKACCNO ,
gpcsm.BANK_ACCOUNT_NAME as PAYEEACCNAME ,
gpcsm.IDENTIFY_TYPE as PAYEEIDTYPE ,
gpcsm.IDENTIFY_NUMBER as PAYEEIDNO ,
'000000' as TRANSACTIONDATE ,
'000000' as BATCHNO 
from gpcsmDETAIL gpcd left join GPPAYMENTMAIN gppm gpcd.PAYMENT_NO = gppm.PAYMENT_NO
left join GPCOMMISSIONPAYMENT gpcsm gpcd.PAYMENT_NO = gpcsm.PAYMENT_NO;

commit;

spool off
!