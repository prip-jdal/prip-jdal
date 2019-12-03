
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
000000' as TRANSACTIONNO ,
000000' as COMPANYCODE ,
null as TRANSACTIONNOORIG ,
null as VISACODE ,
gppd.policy_no as POLICYNO ,
gppm.VISACLASS_NO as ACTUGETNO ,
gppd.fee_type_code as GETTYPE ,
gppd.fee_type_code as GETNAME ,
gppm.PAYMENT_TYPE as GETWAY ,
gppm.CURRENCY as CURRENCY ,
gppm.PAY_REF_FEE as SUMACTUGETMONEY ,
gppm.SETTLEMENT_FEE as SUMACTUGETMONEYCNY ,
GPPAYMENTDETAIL.BANK_REF_DATE as ENTERACCDATE ,
gppm.VOUCHER_DATE as RECOGDATE ,
gpph.BANK_CODE as PAYEEBANKCODE ,
gpph.BANK_NAME as PAYEEBANKNAME ,
gpph.BANK_ACCOUNT_NO as PAYEEBANKACCNO ,
gpph.BANK_ACCOUNT_NAME as PAYEEACCNAME ,
gpph.IDENTIFY_TYPE as PAYEEIDTYPE ,
gpph.IDENTIFY_NUMBER as PAYEEIDNO ,
000000' as TRANSACTIONDATE ,
000000' as BATCHNO 
from GPPOLICYPAYMENTDETAIL gppd left join GPPAYMENTMAIN gppm on gppd.payment_no = gppm.payment_no
left join GPPAYMETHOD gpph gppd.TOTAL_SERIAL_NO = gpph.TOTAL_SERIAL_NO£»

commit;

spool off
!
