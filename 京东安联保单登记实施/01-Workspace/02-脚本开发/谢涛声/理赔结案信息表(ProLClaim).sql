SELECT
	'' AS TRANSACTIONNO,-- �ݲ�ӳ��
	'' AS COMPANYCODE,-- �ݲ�ӳ��
	plc.POLICYNO AS POLICYNO,
	plc.REGISTNO AS REGISTNO,
	plc.ClaimNo AS CLMNO,
	plc.CaseNo AS CASENO,
	pld.DisasterCode AS LEV_CATACODE,
	pld.DisasterName AS LEV_CATANAME,
	plc.ClaimTime AS CLMDATE,/* datetimeתdate */
	plc.DamageTime AS ACCIDENTDATE, /* datetimeתdate */
	plc.DamageTime AS ACCIDENTTIME,
	plc.DamageAreaCode AS DAMAGEADDRESSTYPECODE,
	plc.DamageArea AS ACCIDENTSITE,
	'2' AS CLAIMFLAGCODE, /* δ�ҵ����ֶΣ��ݶ�Ĭ��Ϊ'2'�˹����� */
	plc.DamageCode AS CHDAMAGECODE,
	plc.DamageReasonType AS DAMAGETYPE,
	plc.DamageName AS DAMAGENAME,/* ����ԭ�����ƣ��ֶδ��ڣ��Ƿ���Ҫ����� */
	plc.DAMAGEDETAIL AS ACCIDENTDESC,/* �������� */
	plcp.SumAmt AS STANDPAY,
	plcp.Currency AS FINALPAYORIGCUR,
	ifnull(plcp.SumAmt,0) AS FINALPAYORIG,
	ifnull(plcp.SumAmt,0) AS FINALPAY,
	plcp.Currency AS SUMEXPAMOUNTORIGCUR,
	ifnull(plcp.SumFee,0) AS SUMEXPAMOUNTORIG,
	ifnull(plcp.SumFee,0) AS SUMEXPAMOUNT,/* ֱ����������ܽ����أ���Ҫ�жϷ������ͣ��������� */
	plcp.Currency AS SUMKINDEXPAMOUNTORIGCUR,
	0 AS SUMKINDEXPAMOUNTORIG,
	0 AS SUMKINDEXPAMOUNT,/* ������������ܽ����أ���Ҫ�жϷ������ͣ��������� */
	'CNY' AS ACCOMAMOUNTORIGCUR,
    0 AS ACCOMAMOUNTORIG,
    0 AS ACCOMAMOUNT, /* ͨ�ڸ��������ñ�����ҵ���漰ͨ�ڸ��������͡�0�� */
	'CNY' AS EXGRATIAFEEORIGCUR,
    0 AS EXGRATIAFEEORIG,   
    0 AS EXGRATIAFEE, /* Э������ñ�����ҵ���漰����Э����������͡�0�� */
	plcp.Currency AS SUMLOSSAMOUNTORIGCUR,
	plcp.SumAmt+ifnull(plcp.SumFee,0) AS SUMLOSSAMOUNTORIG,
	plcp.SumAmt+ifnull(plcp.SumFee,0) AS SUMLOSSAMOUNT,/* �ⰸ���ܵ��⸶���,���ں����⸶���+ͨ�ڸ������+Э����+ֱ����������ܽ�� */
	plcp.Currency AS SUMPREPAIDORIGCUR,
	ifnull(plcp.SumPreAmt,0) AS SUMPREPAIDORIG,
	ifnull(plcp.SumPreAmt,0) AS PREPAY,/* Ԥ���� */
	plcp.Currency AS BALANCEPAYORIGCUR,
	plcp.SumPaidAmt AS BALANCEPAYORIG,
	plcp.SumPaidAmt AS BALANCEPAY,/* ������ */
	plcp.Currency AS DECLINEPAYORIGCUR,
	0 AS DECLINEPAYORIG,
	0 AS DECLINEPAY,/* ������   */
	plcp.CaseType AS GIVETYPE,/* �⸶���۴��� */
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
		where claimno = plc.claimno) AS CASEREOPENNUM,/* �ؿ��ⰸ��ʶ��ʱ�䡢����?	 */
	'' AS ISREINSFLAG,/* ������Ϊ�ٱ��ֳ�ҵ���Ҹ��ⰸ�漰�ٱ���˾���̯��ʱ���ñ�־Ϊ���ǡ�����֮Ϊ���񡱡����� */
	plc.RelateRecovery AS RECOVERYFLAG, /* ��׷��������־ */
	'' AS MICROCLMFLAG, /* ��С�������־��������ҽ���ձ��� */
	if(plc.CaseType='1',plc.CancelReason,'') AS REFUSEPAYRCODE,/* ����ԭ����룬�⸶����Ϊ�����Ǳ��̽���ֵ */
	plc.CancelTime AS CREFUSALTIME, /* ����֪ͨʱ�䣬����ҽ���ձ��δ�ҵ����ֶ� */
	plcp.UnderwriteDate AS UWTHROUGHTTIME,
	plr.ClaimantApplyDate AS CAPPLYTIME,/* ��������ʱ��,���ֶ�����Ϊ�ݲ�ʹ�� */
	plr.DocumentInformDate AS NOTIFYTIME,/* ��֪ʱ��,���ֶ�����Ϊ�ݲ�ʹ�� */
	plc.DoccollEndTime AS AFFIXGETDATE,/* ���Ͻ�����ȫ����,���ֶ�����Ϊ�ݲ�ʹ�� */
	null AS POSITIVEFLAG,/* ���Ա�־��δ�ҵ����ֶ� */
	null AS REMOTECLAIMFLAG,/* ��ز鿱��־��δ�ҵ��ֶ� */
	null AS COORDINATEFLAG,/* Э����־��δ�ҵ��ֶ� */
	case 
		when
			(select count(1)
			from ins_claim.PRPLcheck
			where registno = plc.registno) > 0
		then 1
		else 0
	end AS SURVEYFLAG,/* �����־��δ�ҵ����ֶΣ��鿱���PRPLcheck�������� */
	null AS SURVEYSTARTDATE,/* ���鿪ʼ���ڣ��������־Ϊ���ǡ���ʱ���ֶα������ */
	null AS SURVEYENDDATE,/* ����������ڣ��������־Ϊ���ǡ���ʱ���ֶα������*/
	'' AS SURVEYCONCLUSION,	/* δ�ҵ��ֶ� */
	'' AS HOSPITALREGIONCODE,/* δ�ҵ��ֶ� */
	'' AS HOSPITALREGION,/* ҽ���ձ��� */
	(select count(1)
		from ins_claim.PrpLAgency 
		where registNo = plc.registNo and agencyType = '01') AS ADJUSTERCODE,
	(select agencyName
		from ins_claim.PrpLAgency 
		where registNo = plc.registNo and agencyType = '01') AS ADJUSTERNAME,
	plc.ComCode AS CLAIMACCEPTANCECODE,
	'' AS CLAIMACCEPTANCENAME,/* �᰸������������ƣ��ֶδ��� */
	'' AS TRANSACTIONDATE,-- �ݲ�ӳ��
	'' AS BATCHNO-- �ݲ�ӳ��
FROM
	ins_claim.PrpLClaim plc
	left join ins_claim.PrpLRegist plr on plc.RegistNo = plr.RegistNo
	left join ins_claim.PrpLCompensate plcp on plc.ClaimNo = plcp.ClaimNo and plc.caseno is not null
	left join ins_claim.PrpLDisaster pld on plc.ClaimNo = pld.ClaimNo