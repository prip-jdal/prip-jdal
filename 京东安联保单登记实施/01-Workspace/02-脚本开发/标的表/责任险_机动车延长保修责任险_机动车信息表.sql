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
INTO MID_ProCitem_ZR_WExtVehicle

select
'000000' as TRANSACTIONNO ,
'000000' as COMPANYCODE ,
opprw.policyno as POLICYNO ,
opprw.ItemNo as MOTORSERIALNO ,
ods_p_prpcmain.RISKCODE as RISKCODE ,
'000000' as ITEMTYPECODE ,
opprw.licenseNo as LICENSEPLATENO ,
opprw.vin as VINCODE ,
opprw.brandName as BRAND ,
opprw.brandName as MODELNO ,
'000000' as VEHICLETYPE ,
opprw.displacement as ENGINEEXHAUSTSCALE ,
opprw.fuelType as DRIVEWAYCODE ,
opprw.intakeMode as TURBOCHARGINGFLAG ,
'000000' as BUYTIME ,
opprw.initialMileage as RUNMILES ,
oppi.insuredname as SELLERNAME ,
oppi.insuredcode as SELLERCODE ,
'000000' as ENSURESCOPECODE ,
opprw.warrantyEnd - opprw.warrantyStart as WARRANTYYEARS ,
opprw.maxMileage as WARRANTYKM ,
oppc.SIGNDATE as EXTENDSALEDATE ,
oppc.STARTDATE as EXTENDSTARTDATE ,
oppc.ENDDATE as EXTENDENDDATE ,
opprw.extendWarrantyMileage as EXTENDENDKM ,
opprw.userName as OWNERNAME ,
null as OWNERIDENTIFYTYPE ,
opprw.identifyNumber as OWNERIDENTIFYNUM ,
opprw.contactPhone as CONTACTINFOR ,
'000000' as TRANSACTIONDATE ,
'000000' as BATCHNO 
from ods_p_prptriskInfoWarranty opprw left join ods_p_prpcmain oppc 
on opprw.policyno = oppc.policyno left join ods_p_prpcinsured oppi 
on opprw.policyNo = oppi.policyNo;
   commit;

spool off
!

