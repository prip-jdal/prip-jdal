
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
gppd.policy_no as VISACODE ,
gppd.policy_no as POLICYNO ,
gppm.VISACLASS_NO as PRTNO ,
gppd.fee_type_code as CHARGETYP ,
gppd.fee_type_code as CHARGENAME ,
gppm.CURRENCY as CURRENCY ,
gppm.PAY_REF_FEE as PAYAMOUNT ,
gppm.SETTLEMENT_FEE as PAYAMOUNTCNY ,
gppm.PAYMENT_TYPE as PAYWAY ,
gppm.PAY_DATE as ACCOUNTDATE ,
gppm.VOUCHER_DATE as RECOGDATE ,
gppd.pay_no as PREMIUMNO ,
null as PAYERBANKCODE ,
null as PAYERBANKNAME ,
gpp.REF_BANKA_CCOUNT_CODE as PAYERBANKACCNO ,
gppm.PAYEE as PAYERACCNAME ,
null as PAYERCERTTYPE ,
null as PAYERCERTNO ,
'000000' as TRANSACTIONDATE ,
'000000' as BATCHNO 
from GPPOLICYPAYMENTDETAIL gppd left join GPPAYMENTMAIN  gppm on gppd.total_serial_no = gppm.total_serial_no
left join  GPPAYMENTDETAIL gpp on gpp.payment_no = gppd.payment_no;

commit;

spool off
!