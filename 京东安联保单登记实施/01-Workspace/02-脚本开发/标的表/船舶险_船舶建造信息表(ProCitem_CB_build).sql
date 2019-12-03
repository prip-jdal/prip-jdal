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
INTO MID_PROCITEM_CB_BUILD

SELECT /*+ PARALLEL(16) */

'000000' AS TRANSACTIONNO ,
'000000' AS COMPANYCODE ,
citemhull.policyno AS POLICYNO ,
citemhull.itemno AS ITEMNO ,
cmain.RISKCODE AS RISKCODE ,
citemhull.MadeFactory AS BUILDFACTORY ,
null AS IHGCODE ,
null AS NATIVEPLACE ,
null AS PROVINCE ,
null AS CITY ,
null AS COUNTY ,
citemhull.BulitPlace AS DETAILADD ,
null AS POSTCODE ,
'000000' AS BUILDCONTRACTNO ,
citemhull.VesselTypeCode AS SHIPTYPECODE ,
citemhull.VesselTypeCDesc AS SHIPTYPE ,
citemhull.VesselClass AS SHIPSTEP ,
citemhull.VesselClass AS SHIPCLASS ,
citemhull.VesselStructure AS SHIPSTRUCTCODE ,
citemhull.VesselStructure AS SHIPSTRUCT ,
citemhull.DeadWeightTon AS DEADWEIGHT ,
citemhull.VesselLength AS SHIPLENGTH ,
citemhull.VesselWidth AS SHIPBREADTH ,
citemhull.VesselDepth AS SHIPDEPTH ,
citemhull.Currency AS CURRENCYORIG ,
citemhull.VesselValue AS CONTRACTPRICEORIG ,
null AS CONTRACTPRICE ,
null AS BONUSPROPORTION ,
null AS KEELLAYINGDATE ,
null AS LAUNCHINGDATE ,
null AS LAUNCHINGWAY ,
null AS TRIALTRIPDATE ,
citemhull.EndDate AS DELIVERYDATE ,
'000000' AS DELIVERYLOC ,
citemhull.SailAreaCode AS TRIALTRIPAREA ,
null AS TRIALTRIPDEADLINE ,
null AS BUILDSTARTDATE ,
null AS BUILDENDDATE ,
'1990-01-01' AS TRANSACTIONDATE ,
'000000' AS BATCHNO


FROM fccbdb.ods_p_prpcitemhull citemhull
left join fccbdb.ods_p_prpcmain cmain on cmain.policyno=citemhull.policyno
 
commit;

spool off
!
