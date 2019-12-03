SELECT
/*���ױ���*/
'' AS TransactionNo,
/*��˾����*/
'' AS CompanyCode,
prppitemkind.POLICYNO AS PolicyNo,
prppmain.ENDORSENO AS EndorseNo,
prppitemkind.APPLYNO AS ApplyNo,
prppitemkind.ITEMKINDNO AS ItemKindNo,
prppitemkind.RISKCODE AS RiskCode,
prppitemkind.CLAUSECODE AS ClauseCode,
prppitemkind.KINDCODE AS KindCode,
prppitemkind.ITEMCODE AS ItemTypeCode,
/*��Ŀ������ƣ�ITEMCODEת����*/
'' AS ItemDetailName,
prppitemkind.CURRENCY AS Curreny,
prppitemkind.chgSumInsured2 AS ChgAmountOrig,
/*����仯����chgSumInsured2תRMB*/
'' AS ChgAmount,
prppitemkind.CURRENCY AS CurrenyOrig,
prppitemkind.chgGrossPremium2 AS ChgPremiumTaxOrig,
/*���ѱ仯������˰����chgGrossPremium2תRMB*/
'' AS ChgPremiumTax,
prppitemkind.chgNoVatGrossPremium2 AS ChgPremiumNoTaxOrig,
/*���ѱ仯��������˰����chgNoVatGrossPremium2תRMB*/
'' AS ChgPremiumNoTax,
prppitemkind.chgVat2 AS SumTaxFeeOrig,
/*˰��仯����chgVat2תRMB*/
'' AS SumTaxFee,
/*�������ʱ��*/
'' AS TransactionDate,
/*���κ�*/
'' AS BatchNo
FROM
	prppmain,
	prppitemkind
WHERE
	prppmain.APPLYNO = prppitemkind.APPLYNO 
	/* ��������޶���������
	AND prppitemkind.VALIDSTATUS = ''*/;