SELECT
	'' AS TRANSACTIONNO,-- �ݲ�ӳ��
	'' AS COMPANYCODE,-- �ݲ�ӳ��
	plr.POLICYNO AS POLICYNO,
	plr.REGISTNO AS REGISTNO,
	plrd.DISASTERCODE AS LEV_CATACODE,
	plrd.DISASTERNAME AS LEV_CATANAME,
	plr.REPORTTIME AS REPORTTIME,
	plr.REPORTORNAME AS REPORTORNAME,
	plr.REPORTORPHONE AS REPORTORNUMBER,
	if(LENGTH(plr.REPORTORPHONE)=11,plr.REPORTORPHONE,null) AS REPORTORMOBILE,-- ����绰����Ϊ11����绰�ż�Ϊ�ֻ���
	plr.LINKERNAME AS LINKERNAME,
	plr.LINKERPHONE AS LINKERPHONE,
	if(LENGTH(plr.LINKERPHONE)=11,plr.LINKERPHONE,null) AS LINKERMOBILE,-- ����绰����Ϊ11����绰�ż�Ϊ�ֻ���
	plr.REPORTORRELATION AS REPORTORRELINSURED,
	plr.MERCYFLAG AS MERCYFLAG,
	plrd.DAMAGETIME AS ACCIDENTTIME,
	IFNULL(plrd.DamageCode,'') AS CHDAMAGECODE,-- �Ʋ��ճ���ԭ����룬����ԭ���ֶζ�ѡһ��Ϊ��
	IFNULL(plrd.DamageReASonType,'') AS RSDAMAGECODE,-- �����ճ���ԭ����룬����ԭ���ֶζ�ѡһ��Ϊ��
	(Select Dataname From ins_claim.Commondata c Where 
		(c.Datacode = 'damage' And c.Datacode = plrd.Damagecode)
		or (c.Datacode = 'damagereaon' And c.Datacode = plrd.DamageReASonType)) AS Damagename,-- ��ͨ������ԭ�����ȥcommondata��ȡֵ
	plrd.DAMAGEREMARK AS ACCIDENTDESC,
	plrd.DAMAGEAREACODE AS DAMAGEADDRESSTYPECODE,
	plrd.DAMAGEADDRESS AS ACCIDENTSITE,
	plrd.DAMAGEADDRESS AS REPORTADDRESS,-- δ�ҵ����ֶΣ���ͬACCIDENTSITE
	null AS CHECKAREACODE,-- �ֶδ��ɣ���Ҫ����̽��
	plr.QDCASETYPE AS QDCASETYPE,
	CASE
		When (Select Count(1) From ins_claim.prplclaim lc Where lc.Registno = plr.Registno) > 0 
		Then '1'
		Else '2'
	End AS CLAIMSTATUS,-- ͨ��ͳ���������뱨�����й��������Ƿ����0���ж�������
	'000000' AS CLAIMTYPE,-- δ�ҵ���Ӧ����
	plr.CANCELFLAG AS CANCELFLAG,
	Null AS CLAIMAMOUNTORIGCUR,-- �����⸶�����أ���Ҫ����̽��
	Null AS CLAIMAMOUNTORIG,-- �����⸶�����أ���Ҫ����̽��
	Null AS CLAIMAMOUNT,-- �����⸶�����أ���Ҫ����̽��
	'' AS TRANSACTIONDATE,-- �ݲ�ӳ��
	'' AS BATCHNO-- �ݲ�ӳ��
from
	ins_claim.prplregist plr
	left join ins_claim.prplregistdamage plrd on ins_claim.plr.RegistNo = plrd.RegistNo
	