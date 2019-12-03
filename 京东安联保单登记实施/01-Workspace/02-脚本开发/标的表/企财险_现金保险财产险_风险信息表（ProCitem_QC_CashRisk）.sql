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
INTO MID_PROCITEM_QC_CASHRISK

SELECT /*+ PARALLEL(16) */

'000000' AS TRANSACTIONNO ,
'000000' AS COMPANYCODE ,
citemproperty.policyno AS POLICYNO ,
citemproperty.ItemNo AS ITEMNO ,
cmain.RISKCODE AS RISKCODE ,
citemproperty.ItemTypeCode AS ITEMTYPECODE ,
'000000' AS INSUREDNO ,
criskinfo.industryCode AS INDUSTRYCODE ,
null AS BIZAMOUNTSCALE ,
null AS BIZPLACE ,
null AS DELIVERYAREA ,
null AS FIFLAG ,
null AS FCOMFLAG ,
null AS DEPCOUNT ,
null AS DELIVERYCOUNT ,
null AS CASHDELIVERYWAY ,
null AS PEOPLECOUNT ,
null AS CONVOYFLAG ,
null AS REGULARFLAG ,
null AS VAULTFLAG ,
null AS VAULTADDRESS ,
null AS VAULTDOORYEAR ,
null AS VAULTKEYFLAG ,
null AS SAFEFLAG ,
null AS SAFEKEYFLAG ,
null AS ARMEDGUARDFLAG ,
null AS VIDEOFLAG ,
null AS FIREFIGHTINGFLAG ,
null AS THEFTROBWARNSYSFLAG ,
null AS POLICENETFLAG ,
'1990-01-01' AS TRANSACTIONDATE ,
'000000' AS BATCHNO

FROM fccbdb.ods_p_prpcitemproperty citemproperty
left join fccbdb.ods_p_prpcmain cmain on cmain.policyno=citemproperty.policyno
left join fccbdb.ods_p_prpcriskinfo criskinfo on criskinfo.policyno=citemproperty.policyno
 
commit;

spool off
!
