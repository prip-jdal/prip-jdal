SELECT
/*交易编码*/
	'' AS TransactionNo,
/*公司编码*/
	'' AS CompanyCode,
	prpppayee.policyNo AS PolicyNo,
	prppmain.ENDORSENO AS EndorseNo,
/*序号*/
	'' AS SerialNo,
	prpppayee.payeeName AS PayeeName,
	prppinsured.contactPhone AS TelPhone,
	prppinsured.identifyType AS PayEEIDType,
	prppinsured.IDENTIFYNUMBER AS PayEEIDNo,
/*支付币别*/
	'' AS Currency,
	prpppayee.coinsClaimInd AS PayModeFlag,
/*支付方式代码为银行卡或银行转账类方式时必填，以下4个字段*/
	prpppayee.BankTypeCode AS BankCode,
	prpppayee.BankTypeName AS BankName,
	prpppayee.accountName AS AccountName,
	prpppayee.account AS AccountNo,
/*退款支付金额*/
	'' AS PaySumFee,
/*退款支付时间 YYYY-MM-DD*/
	'' AS PayDate,
/*交易完成时间*/
	'' AS TransactionDate,
/*批次号*/
	'' AS BatchNo 
FROM
	prppmain,
	prppinsured,
	prpppayee 
WHERE
	prppmain.APPLYNO = prppinsured.APPLYNO 
	AND prppmain.APPLYNO = prpppayee.APPLYNO
	/* 领款人表与关系人表，使用姓名做关联条件待定
	AND prppinsured.LINKERNAME = prpppayee.payeeName 
	AND prppinsured.INSUREDTYPE = ''*/;