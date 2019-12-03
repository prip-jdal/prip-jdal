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
INTO MID_PROCITEM_CB_SHIP

SELECT /*+ PARALLEL(16) */

'000000' AS TRANSACTIONNO ,
'000000' AS COMPANYCODE ,
citemhull.policyno AS POLICYNO ,
citemhull.itemno AS ITEMNO ,
ods_p_prpcmain.RISKCODE AS RISKCODE ,
citemhull.VesselCode AS SHIPNO ,
citemhull.AccumNo AS SHIPSIGN ,
citemhull.IMCONo AS IMONO ,
citemhull.VesselCName AS SHIPCNAME ,
citemhull.VesselEName AS SHIPENAME ,
citemhull.ExVesselCName AS SHIPUNAME ,
citemhull.PortOfRegisty AS HOMEPORT ,
citemhull.VesselClass AS SHIPSTEP ,
citemhull.VesselClass AS SHIPCLASS ,
citemhull.ExVesselClass AS SHIPCLASSUCODE ,
citemhull.ExVesselClass AS SHIPCLASSUNAME ,
null AS SHIPFLAGCODE ,
citemhull.VesselFlag AS SHIPFLAG ,
citemhull.VesselTypeCode AS SHIPTYPECODE ,
citemhull.VesselTypeCDesc AS SHIPTYPE ,
citemhull.VesselStructure AS SHIPSTRUCTCODE ,
citemhull.VesselStructure AS SHIPSTRUCT ,
citemhull.DeadWeightTon AS GROSSTONNES ,
citemhull.PassengersNo AS RATEDSEAT ,
citemhull.VesselLength AS SHIPLENGTH ,
citemhull.VesselWidth AS SHIPBREADTH ,
citemhull.VesselDepth AS SHIPDEPTH ,
citemhull.SailAreaCode AS SAILAREACODE ,
citemhull.SailAreaCName AS SAILAREA ,
citemhull.OperationMode AS SAILMODECODE ,
citemhull.OperationMode AS SAILMODE ,
citemhull.BuiltDate AS BUILDTIME ,
citemhull.LogicalYear AS SHIPAGE ,
citemhull.MadeFactory AS BUILDFACTORY ,
null AS BUILDAREANO ,
null AS BUILDAREA ,
citemhull.ReBuiltYear AS REBUILDTIME ,
citemhull.ReBuiltFactory AS REBUILDAREA ,
citemhull.Currency AS CURRENCYORIG ,
citemhull.VesselValue AS CONTRACTPRICEORIG ,
citemhull.VesselValue AS CONTRACTPRICE ,
citemhull.PIClubCode AS PROINDEMCLUBCODE ,
citemhull.PIClub AS PROINDEMCLUB ,
citemhull.StatPremium AS POWER ,
citemhull.PowerUnit AS POWERUNITCODE ,
citemhull.PowerUnit AS POWERUNIT ,
null AS YACHTTYPE ,
null AS YACHTBUSINESSLICENSENO ,
null AS ENGINEBUILDTIME ,
null AS ENGINEBUILDFACTORY ,
null AS ENGINENO ,
null AS ENGINETYPE ,
null AS ENGINETOPSPEED ,
null AS ENGINEFUEL ,
'1990-01-01' AS TRANSACTIONDATE ,
'000000' AS BATCHNO

FROM fccbdb.ods_p_prpcitemhull citemhull
 
commit;

spool off
!
