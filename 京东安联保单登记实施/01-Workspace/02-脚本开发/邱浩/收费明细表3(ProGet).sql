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
'000000' as TransactionNo ,
'000000' as CompanyCode ,
null as TransactionNoOrig ,
gppd.policy_no as VisaCode ,
gppd.policy_no as PolicyNo ,
gppm.VISACLASS_NO as PrtNo ,
gppd.fee_type_code as ChargeTyp ,
gppd.fee_type_code as ChargeName ,
gppm.CURRENCY as Currency ,
gppm.PAY_REF_FEE as PayAmount ,
gppm.SETTLEMENT_FEE as PayAmountCNY ,
gppm.PAYMENT_TYPE as PayWay ,
gppm.PAY_DATE as AccountDate ,
gppm.VOUCHER_DATE as RecogDate ,
gppd.pay_no as PremiumNo ,
null as PayerBankCode ,
null as PayerBankName ,
gppay.REF_BANKA_CCOUNT_CODE as PayerBankAccNo ,
gppm.PAYEE as PayerAccName ,
null as PayerCertType ,
null as PayerCertNo ,
'000000' as TransactionDate ,
'000000' as BatchNo
from GPPOLICYPAYMENTDETAIL gppd left join GPPAYMENTMAIN gppm on gppd.PAYMENT_NO = gppm.PAYMENT_NO
left join GPPAYMENTDETAIL gppay on gppd.PAYMENT_NO = gppay.PAYMENT_NO;

commit;

spool off
!