SELECT
/*���ױ���*/
	'' AS TransactionNo,
/*��˾����*/
	'' AS CompanyCode,
	prpppayee.policyNo AS PolicyNo,
	prppmain.ENDORSENO AS EndorseNo,
/*���*/
	'' AS SerialNo,
	prpppayee.payeeName AS PayeeName,
/*Ӫҵִ�պ��롢˰��Ǽ�֤�š���֯�������롢ͳһ�������֤����������һ������4���ֶ�*/
	'' AS PayeeBusiLicCode,
	prppinsured.TEXIDENTITYNUMBER AS PayeeTaxRegistNo,
	prppinsured.ORGANIZATIONCODE AS PayeeOrgNo,
	'' AS PayeeUniSocialCredit,
	prppinsured.contactPhone AS TelPhone,
/*֧���ұ�*/
	'' AS Currency,
	prpppayee.coinsClaimInd AS PayModeFlag,
/*֧����ʽ����Ϊ���п�������ת���෽ʽʱ�������4���ֶ�*/
	prpppayee.BankTypeCode AS BankCode,
	prpppayee.BankTypeName AS BankName,
	prpppayee.accountName AS AccountName,
	prpppayee.account AS AccountCardNo,
/*�˿�֧�����*/
	'' AS PaySumFee,
/*�˿�֧��ʱ�� YYYY-MM-DD*/
	'' AS PayDate,
/*�������ʱ��*/
	'' AS TransactionDate,
/*���κ�*/
	'' AS BatchNo 
FROM
	prppmain,
	prppinsured,
	prpppayee 
WHERE
	prppmain.APPLYNO = prppinsured.APPLYNO 
	AND prppmain.APPLYNO = prpppayee.APPLYNO
	/* ����˱����ϵ�˱�ʹ��������������������
	AND prppinsured.LINKERNAME = prpppayee.payeeName 
	AND prppinsured.INSUREDTYPE = ''*/;