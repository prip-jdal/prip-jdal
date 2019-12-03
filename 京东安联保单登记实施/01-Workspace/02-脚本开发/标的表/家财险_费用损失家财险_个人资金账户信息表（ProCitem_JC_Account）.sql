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
INTO MID_PROCITEM_JC_ACCOUNT

SELECT /*+ PARALLEL(16) */

'000000' AS TRANSACTIONNO ,
'000000' AS COMPANYCODE ,
citemproperty.policyno AS POLICYNO ,
citemproperty.ItemNo AS ITEMNO ,
cmain.RISKCODE AS RISKCODE ,
citemproperty.ItemTypeCode AS ITEMTYPECODE ,
'000000' AS INDIACCFLAG ,
null AS OPENACCNAME ,
citemdynamicdetail.insuredName AS ACCOUNTNAME ,
citemdynamicdetail.dynamicField AS BANKCARDNO ,
null AS ACCOUNTCOUNT ,
'1990-01-01' AS TRANSACTIONDATE ,
'000000' AS BATCHNO

FROM fccbdb.ods_p_prpcitemproperty citemproperty
left join fccbdb.ods_p_prpcmain cmain on cmain.policyno=citemproperty.policyno
left join fccbdb.ods_p_prpcitemdynamicdetail citemdynamicdetail on citemdynamicdetail.policyno=citemproperty.policyno
 
commit;

spool off
!
