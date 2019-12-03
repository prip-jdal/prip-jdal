SELECT
	'' AS TRANSACTIONNO,-- 暂不映射
	'' AS COMPANYCODE,-- 暂不映射
	plr.POLICYNO AS POLICYNO,
	plr.REGISTNO AS REGISTNO,
	plrd.DISASTERCODE AS LEV_CATACODE,
	plrd.DISASTERNAME AS LEV_CATANAME,
	plr.REPORTTIME AS REPORTTIME,
	plr.REPORTORNAME AS REPORTORNAME,
	plr.REPORTORPHONE AS REPORTORNUMBER,
	if(LENGTH(plr.REPORTORPHONE)=11,plr.REPORTORPHONE,null) AS REPORTORMOBILE,-- 如果电话长度为11，则电话号即为手机号
	plr.LINKERNAME AS LINKERNAME,
	plr.LINKERPHONE AS LINKERPHONE,
	if(LENGTH(plr.LINKERPHONE)=11,plr.LINKERPHONE,null) AS LINKERMOBILE,-- 如果电话长度为11，则电话号即为手机号
	plr.REPORTORRELATION AS REPORTORRELINSURED,
	plr.MERCYFLAG AS MERCYFLAG,
	plrd.DAMAGETIME AS ACCIDENTTIME,
	IFNULL(plrd.DamageCode,'') AS CHDAMAGECODE,-- 财产险出险原因代码，出险原因字段二选一不为空
	IFNULL(plrd.DamageReASonType,'') AS RSDAMAGECODE,-- 人身险出险原因代码，出险原因字段二选一不为空
	(Select Dataname From ins_claim.Commondata c Where 
		(c.Datacode = 'damage' And c.Datacode = plrd.Damagecode)
		or (c.Datacode = 'damagereaon' And c.Datacode = plrd.DamageReASonType)) AS Damagename,-- 可通过出险原因代码去commondata中取值
	plrd.DAMAGEREMARK AS ACCIDENTDESC,
	plrd.DAMAGEAREACODE AS DAMAGEADDRESSTYPECODE,
	plrd.DAMAGEADDRESS AS ACCIDENTSITE,
	plrd.DAMAGEADDRESS AS REPORTADDRESS,-- 未找到该字段，暂同ACCIDENTSITE
	null AS CHECKAREACODE,-- 字段存疑，需要数据探查
	plr.QDCASETYPE AS QDCASETYPE,
	CASE
		When (Select Count(1) From ins_claim.prplclaim lc Where lc.Registno = plr.Registno) > 0 
		Then '1'
		Else '2'
	End AS CLAIMSTATUS,-- 通过统计立案表与报案表有关数据量是否大于0，判断是立案
	'000000' AS CLAIMTYPE,-- 未找到相应数据
	plr.CANCELFLAG AS CANCELFLAG,
	Null AS CLAIMAMOUNTORIGCUR,-- 申请赔付金额相关，需要数据探查
	Null AS CLAIMAMOUNTORIG,-- 申请赔付金额相关，需要数据探查
	Null AS CLAIMAMOUNT,-- 申请赔付金额相关，需要数据探查
	'' AS TRANSACTIONDATE,-- 暂不映射
	'' AS BATCHNO-- 暂不映射
from
	ins_claim.prplregist plr
	left join ins_claim.prplregistdamage plrd on ins_claim.plr.RegistNo = plrd.RegistNo
	