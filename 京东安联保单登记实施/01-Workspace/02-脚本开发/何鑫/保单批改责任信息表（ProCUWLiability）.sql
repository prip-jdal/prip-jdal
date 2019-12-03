SELECT
/*交易编码*/
'' AS TransactionNo,
/*公司编码*/
'' AS CompanyCode,
prppitemkind.POLICYNO AS PolicyNo,
prppmain.ENDORSENO AS EndorseNo,
prppitemkind.APPLYNO AS ApplyNo,
prppitemkind.ITEMKINDNO AS ItemKindNo,
prppitemkind.RISKCODE AS RiskCode,
prppitemkind.CLAUSECODE AS ClauseCode,
prppitemkind.KINDCODE AS KindCode,
prppitemkind.ITEMCODE AS ItemTypeCode,
/*项目类别名称，ITEMCODE转中文*/
'' AS ItemDetailName,
prppitemkind.CURRENCY AS Curreny,
prppitemkind.chgSumInsured2 AS ChgAmountOrig,
/*保额变化量，chgSumInsured2转RMB*/
'' AS ChgAmount,
prppitemkind.CURRENCY AS CurrenyOrig,
prppitemkind.chgGrossPremium2 AS ChgPremiumTaxOrig,
/*保费变化量（含税），chgGrossPremium2转RMB*/
'' AS ChgPremiumTax,
prppitemkind.chgNoVatGrossPremium2 AS ChgPremiumNoTaxOrig,
/*保费变化量（不含税），chgNoVatGrossPremium2转RMB*/
'' AS ChgPremiumNoTax,
prppitemkind.chgVat2 AS SumTaxFeeOrig,
/*税额变化量，chgVat2转RMB*/
'' AS SumTaxFee,
/*交易完成时间*/
'' AS TransactionDate,
/*批次号*/
'' AS BatchNo
FROM
	prppmain,
	prppitemkind
WHERE
	prppmain.APPLYNO = prppitemkind.APPLYNO 
	/* 条款关联限定条件待定
	AND prppitemkind.VALIDSTATUS = ''*/;