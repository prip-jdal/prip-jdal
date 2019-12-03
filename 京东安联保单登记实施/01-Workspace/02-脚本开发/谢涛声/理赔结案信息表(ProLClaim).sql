SELECT
	'' AS TRANSACTIONNO,-- 暂不映射
	'' AS COMPANYCODE,-- 暂不映射
	plc.POLICYNO AS POLICYNO,
	plc.REGISTNO AS REGISTNO,
	plc.ClaimNo AS CLMNO,
	plc.CaseNo AS CASENO,
	pld.DisasterCode AS LEV_CATACODE,
	pld.DisasterName AS LEV_CATANAME,
	plc.ClaimTime AS CLMDATE,/* datetime转date */
	plc.DamageTime AS ACCIDENTDATE, /* datetime转date */
	plc.DamageTime AS ACCIDENTTIME,
	plc.DamageAreaCode AS DAMAGEADDRESSTYPECODE,
	plc.DamageArea AS ACCIDENTSITE,
	'2' AS CLAIMFLAGCODE, /* 未找到该字段，暂定默认为'2'人工理赔 */
	plc.DamageCode AS CHDAMAGECODE,
	plc.DamageReasonType AS DAMAGETYPE,
	plc.DamageName AS DAMAGENAME,/* 出险原因名称，字段存在，是否需要对码表 */
	plc.DAMAGEDETAIL AS ACCIDENTDESC,/* 存在争议 */
	plcp.SumAmt AS STANDPAY,
	plcp.Currency AS FINALPAYORIGCUR,
	ifnull(plcp.SumAmt,0) AS FINALPAYORIG,
	ifnull(plcp.SumAmt,0) AS FINALPAY,
	plcp.Currency AS SUMEXPAMOUNTORIGCUR,
	ifnull(plcp.SumFee,0) AS SUMEXPAMOUNTORIG,
	ifnull(plcp.SumFee,0) AS SUMEXPAMOUNT,/* 直接理赔费用总金额相关，需要判断费用类型，存在疑问 */
	plcp.Currency AS SUMKINDEXPAMOUNTORIGCUR,
	0 AS SUMKINDEXPAMOUNTORIG,
	0 AS SUMKINDEXPAMOUNT,/* 责任理赔费用总金额相关，需要判断费用类型，存在疑问 */
	'CNY' AS ACCOMAMOUNTORIGCUR,
    0 AS ACCOMAMOUNTORIG,
    0 AS ACCOMAMOUNT, /* 通融给付金额，若该笔理赔业务不涉及通融给付金额，报送‘0’ */
	'CNY' AS EXGRATIAFEEORIGCUR,
    0 AS EXGRATIAFEEORIG,   
    0 AS EXGRATIAFEE, /* 协议金额，若该笔理赔业务不涉及理赔协议给付，报送‘0’ */
	plcp.Currency AS SUMLOSSAMOUNTORIGCUR,
	plcp.SumAmt+ifnull(plcp.SumFee,0) AS SUMLOSSAMOUNTORIG,
	plcp.SumAmt+ifnull(plcp.SumFee,0) AS SUMLOSSAMOUNT,/* 赔案下总的赔付金额,等于核赔赔付金额+通融给付金额+协议金额+直接理赔费用总金额 */
	plcp.Currency AS SUMPREPAIDORIGCUR,
	ifnull(plcp.SumPreAmt,0) AS SUMPREPAIDORIG,
	ifnull(plcp.SumPreAmt,0) AS PREPAY,/* 预赔金额 */
	plcp.Currency AS BALANCEPAYORIGCUR,
	plcp.SumPaidAmt AS BALANCEPAYORIG,
	plcp.SumPaidAmt AS BALANCEPAY,/* 结算金额 */
	plcp.Currency AS DECLINEPAYORIGCUR,
	0 AS DECLINEPAYORIG,
	0 AS DECLINEPAY,/* 拒赔金额   */
	plcp.CaseType AS GIVETYPE,/* 赔付结论代码 */
	plc.EndCaseTime AS ENDCASETIME,
	case 
		when 
			(select count(1)
			from ins_claim.prplrecase
			where claimno = plc.claimno) > 1 
		then '1'
		else '0'
	end AS CASEREOPENFLAG,
	(select max(opencasedate) 
	from ins_claim.prplrecase 
	where claimno = plc.claimno) AS CASEREOPENTIME,
	(select count(1)
		from ins_claim.prplrecase 
		where claimno = plc.claimno) AS CASEREOPENNUM,/* 重开赔案标识、时间、次数?	 */
	'' AS ISREINSFLAG,/* 当保单为再保分出业务且该赔案涉及再保公司赔款摊回时，该标志为“是”，反之为“否”。必填 */
	plc.RelateRecovery AS RECOVERYFLAG, /* “追偿案件标志 */
	'' AS MICROCLMFLAG, /* “小额理赔标志”，个人医疗险必填 */
	if(plc.CaseType='1',plc.CancelReason,'') AS REFUSEPAYRCODE,/* 拒赔原因代码，赔付结论为拒赔是必填，探查存值 */
	plc.CancelTime AS CREFUSALTIME, /* 拒赔通知时间，个人医疗险必填。未找到该字段 */
	plcp.UnderwriteDate AS UWTHROUGHTTIME,
	plr.ClaimantApplyDate AS CAPPLYTIME,/* 索赔申请时间,该字段描述为暂不使用 */
	plr.DocumentInformDate AS NOTIFYTIME,/* 告知时间,该字段描述为暂不使用 */
	plc.DoccollEndTime AS AFFIXGETDATE,/* 资料接收齐全日期,该字段描述为暂不使用 */
	null AS POSITIVEFLAG,/* 阳性标志，未找到该字段 */
	null AS REMOTECLAIMFLAG,/* 异地查勘标志，未找到字段 */
	null AS COORDINATEFLAG,/* 协调标志，未找到字段 */
	case 
		when
			(select count(1)
			from ins_claim.PRPLcheck
			where registno = plc.registno) > 0
		then 1
		else 0
	end AS SURVEYFLAG,/* 调查标志，未找到该字段，查勘察表PRPLcheck数据数量 */
	null AS SURVEYSTARTDATE,/* 调查开始日期，当调查标志为“是”有时该字段必填，存疑 */
	null AS SURVEYENDDATE,/* 调查结束日期，当调查标志为“是”有时该字段必填，存疑*/
	'' AS SURVEYCONCLUSION,	/* 未找到字段 */
	'' AS HOSPITALREGIONCODE,/* 未找到字段 */
	'' AS HOSPITALREGION,/* 医疗险必填 */
	(select count(1)
		from ins_claim.PrpLAgency 
		where registNo = plc.registNo and agencyType = '01') AS ADJUSTERCODE,
	(select agencyName
		from ins_claim.PrpLAgency 
		where registNo = plc.registNo and agencyType = '01') AS ADJUSTERNAME,
	plc.ComCode AS CLAIMACCEPTANCECODE,
	'' AS CLAIMACCEPTANCENAME,/* 结案机构代码和名称，字段存疑 */
	'' AS TRANSACTIONDATE,-- 暂不映射
	'' AS BATCHNO-- 暂不映射
FROM
	ins_claim.PrpLClaim plc
	left join ins_claim.PrpLRegist plr on plc.RegistNo = plr.RegistNo
	left join ins_claim.PrpLCompensate plcp on plc.ClaimNo = plcp.ClaimNo and plc.caseno is not null
	left join ins_claim.PrpLDisaster pld on plc.ClaimNo = pld.ClaimNo