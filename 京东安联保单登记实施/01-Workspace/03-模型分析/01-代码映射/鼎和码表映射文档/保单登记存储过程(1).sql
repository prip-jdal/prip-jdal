-------------------------------------------------------
-- Export file for user PRZXUSER@10.248.34.2BDDJ_OLD --
-- Created by hezheng on 2019/11/14, 23:44:29 ---------
-------------------------------------------------------

set define off
spool 保单登记存储过程.log

prompt
prompt Creating package LIST_CONST_P
prompt =============================
prompt
create or replace package przxuser.list_const_p
is
  list_sep varchar2(10) := ',';
end list_const_p;
/

prompt
prompt Creating package PAK_PR_ALL
prompt ===========================
prompt
create or replace package przxuser.Pak_PR_ALL is
  ---------------******该包是所有提数的入口，包括增量提数或存量提数******--------------------

  --增量提数总入口提当天的T+1增量数据
  procedure Proc_PR_ALL;

  --增量|存量|重报|补报提数入口
  procedure Proc_PR_ALLForDataType(i_startdate date,
                                   i_enddate   date,
                                   i_dataType  varchar2);

  --存量提数或单笔提入口
  procedure Proc_ALL_ForNo(modelType varchar2, --模块类型（Policy|Claim|Product|Payment|Other）
                           no        varchar2, --业务号 (保单号|批单号|立案号|赔款号|产品代码等)
                           flag      varchar2 --增量或存量或其它用途
                           );

end Pak_PR_ALL;
/

prompt
prompt Creating package PAK_PR_ALL_REASON
prompt ==================================
prompt
create or replace package przxuser.Pak_PR_ALL_Reason is
  ---------------******该包是提取数据到保单登记中间表******--------------------
  --按增量存入相关中间表数据
  procedure Proc_PR_ALL_Reason;
  --通过参数按交易类型存入相关中间表数据
  procedure Proc_PR_ALL_ReasonForDataType(i_datatype varchar2);

end Pak_PR_ALL_Reason;
/

prompt
prompt Creating package PAK_PR_CLAIM
prompt =============================
prompt
create or replace package przxuser.Pak_PR_Claim is
  ---------------******该包是理赔提数的入口，包括增量提数或存量提数交易类型：理赔报案、理赔报案处理、理赔立案、理赔立案处理、理赔结案、理赔追偿******--------------------

  --取理赔增量数据，包括报案、立案、结案、追偿等，并计算好交易类型及交易号
  procedure Proc_PR_Claim(i_startdate date, i_enddate date);
  --取新理赔（inc:增量 his:存量 fai:重报 pth:补报）数据，包括报案、立案、结案、追偿等，并计算好交易类型及交易号
  procedure Proc_PR_ClaimForDataType(i_startdate date,
                                     i_enddate   date,
                                     i_dataType  varchar2);
/*旧理赔提数注释,20190812,罗智
  --通过报案号及提数类型（his:存量 fai:重报 pth:补报）取理赔报案数据，并计算好交易类型及交易号
  procedure Proc_PR_ClaimForRegistNo(i_registNo varchar2,
                                     i_dataType varchar2);
  --通过立案号及提数类型（his:存量 fai:重报 pth:补报）取理赔立案数据，并计算好交易类型及交易号
  procedure Proc_PR_ClaimForClaimNo(i_claimNo  varchar2,
                                    i_dataType varchar2);
  --通过赔款计算书号及提数类型（his:存量 fai:重报 pth:补报）取理赔结案和追偿数据，并计算好交易类型及交易号
  procedure Proc_PR_ClaimForCompensateNo(i_compensateNo varchar2,
                                         i_dataType     varchar2);
 */
  --通过提数类型提数，脚本太长
  procedure MID_Proc_PR_ClaimForDataType(i_dataType     varchar2);                                       
end Pak_PR_Claim;
/

prompt
prompt Creating package PAK_PR_OTHER
prompt =============================
prompt
create or replace package przxuser.Pak_PR_Other is
  ---------------******该包是其它提数的入口，包括增量提数或存量提数交易类型：客户黑名单、其它******--------------------

  --取客户黑名单或其它数据，并计算好交易类型及交易号
  procedure Proc_PR_Other(i_startdate date, i_enddate date);
  --取客户黑名单或其它（inc:增量 his:存量 fai:重报 pth:补报）数据，并计算好交易类型及交易号
  procedure Proc_PR_OtherForDataType(i_startdate date,
                                     i_enddate   date,
                                     i_dataType  varchar2);
  --取客户黑名单数据，并计算好交易类型及交易号
  procedure Proc_PR_Other_Black(i_startdate date, i_enddate date);
  --取客户黑名单（inc:增量 his:存量 fai:重报 pth:补报）数据，并计算好交易类型及交易号
  procedure Proc_PR_Other_BlackForDataType(i_startdate date,
                                           i_enddate   date,
                                           i_dataType  varchar2);
  --通过客户代码及提数类型（his:存量 fai:重报 pth:补报）提客户黑名单数据，并计算好交易类型及交易号
  procedure Proc_PR_Other_Black_ForCus(i_customerCode varchar2,
                                       i_dataType     varchar2);

end Pak_PR_Other;
/

prompt
prompt Creating package PAK_PR_PAYMENT
prompt ===============================
prompt
create or replace package przxuser.Pak_PR_Payment is
  ---------------******该包是收付财务提数的入口，包括增量提数或存量提数交易类型：续期******--------------------

  --取收付增量数据，包括续期等，并计算好交易类型及交易号
  procedure Proc_PR_Payment(i_startdate date, i_enddate date);
  --取收付（inc:增量 his:存量 fai:重报 pth:补报）数据，包括续期等，并计算好交易类型及交易号
  procedure Proc_PR_PaymentForDataType(i_startdate date,
                                       i_enddate   date,
                                       i_dataType  varchar2);
  --通过业务号及提数类型（his:存量 fai:重报 pth:补报）取收付数据，包括续期等，并计算好交易类型及交易号
  procedure Proc_PR_PaymentForCertiNo(i_certiNo  varchar2,
                                      i_dataType varchar2);

end Pak_PR_Payment;
/

prompt
prompt Creating package PAK_PR_POLICY
prompt ==============================
prompt
create or replace package przxuser.Pak_PR_Policy is
  ---------------******该包是承保提数的入口，包括增量提数或存量提数交易类型：新单承保、续保、预收保费、退预收保费、批改、满期******--------------------

  --取承保增量数据，包括保单、批单等，并计算好交易类型及交易号
  procedure Proc_PR_Policy(i_startdate date, i_enddate date);
  --取承保（inc:增量 his:存量 fai:重报 pth:补报）数据，包括保单、批单等，并计算好交易类型及交易号
  procedure Proc_PR_PolicyForDataType(i_startdate date,
                                      i_enddate   date,
                                      i_dataType  varchar2);
  --通过保单号及提数类型（his:存量 fai:重报 pth:补报）提取数据，并计算好交易类型及交易号
  procedure Proc_PR_Policy_ForPolicyNo(policyNo varchar2,
                                       dataType varchar2);
  --通过批单号及提数类型（his:存量 fai:重报 pth:补报）提取增量数据，并计算好交易类型及交易号
  procedure Proc_PR_Policy_ForEndorseNo(endorseNo varchar2,
                                        dataType  varchar2);

end Pak_PR_Policy;
/

prompt
prompt Creating package PAK_PR_PRODUCT
prompt ===============================
prompt
create or replace package przxuser.Pak_PR_Product is
  ---------------******该包是产品提数的入口，包括增量提数或存量提数交易类型：产品新增、产品变更、产品退市******--------------------

  --取产品增量数据，包括新增产品、调整产品等，并计算好交易类型及交易号
  procedure Proc_PR_Product(i_startdate date, i_enddate date);
  --取产品（inc:增量 his:存量 fai:重报 pth:补报）数据，包括新增产品、调整产品等，并计算好交易类型及交易号
  procedure Proc_PR_ProductForDataType(i_startdate date,
                                       i_enddate   date,
                                       i_dataType  varchar2);
  --通过险种代码及提数类型（inc:增量 his:存量 fai:重报 pth:补报）取产品增量数据，包括新增产品、调整产品等，并计算好交易类型及交易号
  procedure Proc_PR_ProductForRiskCode(i_riskcode varchar2,
                                       i_dataType varchar2);

end Pak_PR_Product;
/

prompt
prompt Creating package PAK_PR_REINS
prompt =============================
prompt
create or replace package przxuser.Pak_PR_Reins is
  ---------------******该包是再保提数的入口，包括增量提数或存量提数交易类型：再保合约新增、分入、分出业务******--------------------

  --取理赔增量数据，包括合约新增、分出、入业务新增、分出、入业务批改、分出、入业务摊回等，并计算好交易类型及交易号
  procedure Proc_PR_Reins(i_startdate date, i_enddate date);
  --取理赔（inc:增量 his:存量 fai:重报 pth:补报）数据，包括合约新增、分出、入业务新增、分出、入业务批改、分出、入业务摊回等，并计算好交易类型及交易号
  procedure Proc_PR_ReinsForDataType(i_startdate date,
                                     i_enddate   date,
                                     i_dataType  varchar2);
  

end Pak_PR_Reins;
/

prompt
prompt Creating package PAK_PR_UTILS
prompt =============================
prompt
create or replace package przxuser.Pak_PR_Utils is
  ---------------******保单登记工具包******--------------------

  --获取保险机构代码
  Function Fn_PR_CompanyCode return varchar2;
  --获取交易编码
  Function Fn_PR_NextTransactionNo return varchar2;
  --重置序列从1开始
  procedure proc_PR_SeqRest(i_seqname varchar2);
  --获取批次号
  Function Fn_PR_NextBatchNo(i_datatype varchar2) return varchar2;
  --计算承保模块交易类型
  Function Fn_PR_Policy_TransactionReason(i_policyNo   varchar2, --保单号
                                          i_endorSeqNo varchar2, --批改序号
                                          LASTPOLICYNO      varchar2) --新保标志
   return varchar2;
  --获取条款内容
  --Function Fn_PR_PrpdclauseContext(i_clausecode varchar2) return CLOB;

  --获取业务表特约内容
  -- Fn_PR_PrpCengageContext(i_policyno varchar2,i_serialno varchar2,i_transactionreason varchar2) return CLOB;

  --取如果是空的返回默认的生日日期(预留用身份证计算日期)
  Function Fn_PR_DefaultBirthday(i_date date,i_identifynumber varchar2) return date;

  --通过身份证计算性别
  Function Fn_PR_DefaultSex(i_sex varchar2,i_identifynumber varchar2) return varchar2;

  --根据日期、时、分返回时间
  Function Fn_PR_calDateTime(i_date date,i_hour number,i_minute number) return date;

  --获取被保人代码
  Function Fn_PR_insuredCode(i_riskCode varchar2,i_insuredCode varchar2,i_serialno varchar2) return Varchar2;

  --合计实收保费
  Function Fn_PR_SumAccPrem(i_policyno varchar2,i_sumpremium number) return number;

  --检查身份证号码合法性1是合法0是非法
  Function Fn_PR_CheckIdNumber(i_identifynumber varchar2) return number;

  --根据证件号判断并返回证件类型
  Function Fn_PR_IdentifyType(i_identifyType varchar2,i_identifynumber varchar2) return varchar2;

  --去除姓名特殊字符
  Function Fn_PR_InsuredName(i_insuredName varchar2) return varchar2;

  --自定义提数入参数据类型
  TYPE Type_All_Param IS RECORD(
    TransactionNo     varchar2(50), --交易流水号
    TransactionReason varchar2(10), --交易类型
    ModelType         varchar2(20), --模块类型
    CertiNo           varchar2(50), --业务号或险种代码等
    CertiType         varchar2(10), --业务类型
    TransactionDate   date, --交易日期
    DataType          varchar2(10), --提数类型（his:存量 fai:重报 pth:补报）
    Flag              varchar2(10)); --标志（存量/增量或者其它用途）

  --根据险种，险类返回具体险类
  Function Fn_PR_ClassCodeType(i_ClassCode varchar2,i_RiskCode varchar2) return varchar2;
  --根据保单和被保险人人姓名，返回代码
  Function Fn_PR_InsuredCodeByName(i_PolicyNo varchar2,i_insuredName varchar2) return varchar2;

  --根据日期返回默认时间、时、分
  Function Fn_PR_defDateTime(i_date Date) return date;
  --根据日期返回默认时间
  Function Fn_PR_defDate(i_date Date) return date;
end Pak_PR_Utils;
/

prompt
prompt Creating function LISTAGG_CLOB
prompt ==============================
prompt
CREATE OR REPLACE FUNCTION PRZXUSER.listagg_clob (input varchar2) RETURN clob
PARALLEL_ENABLE AGGREGATE USING listagg_clob_t;
/

prompt
prompt Creating procedure BACKUPSTABLE
prompt ===============================
prompt
CREATE OR REPLACE Procedure PRZXUSER.backupsTable wrapped
a000000
354
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
7
5089 b16
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
/

prompt
prompt Creating procedure COPYTABLE
prompt ============================
prompt
CREATE OR REPLACE Procedure PRZXUSER.CopyTable wrapped
a000000
354
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
7
a6ef c22
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
/

prompt
prompt Creating procedure COPYTABLENOLINK
prompt ==================================
prompt
CREATE OR REPLACE Procedure PRZXUSER.CopyTableNolink wrapped
a000000
354
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
7
a70c bc1
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
p6doLJr5mw/UAcdn
/

prompt
prompt Creating procedure DATA_CHECK
prompt =============================
prompt
CREATE OR REPLACE Procedure PRZXUSER.DATA_CHECK(i_ruleid varchar2) is
/*****************************************************************
       用途：保单登记自查数据存储过程
       输入参数：i_ruleid，为空时执行全部校验
       编写人员：黄毅 huangyi@sinosoft.com.cn
       创建日期：2019-02-23
*****************************************************************/
  v_sql varchar2(4000); --执行的sql
  v_errorcounts number(10);--自查问题数据量
  v_errorcounts_sql varchar2(4000);--自查问题数据量执行脚本
  v_counts number(10);--自查数据量
  v_counts_sql varchar2(4000);--自查数据量执行脚本
  v_rectification VARCHAR2(8);--是否涉及整改
  v_errorcounts_exeSec number(10);--自查问题数据量执行耗时秒数
  v_counts_exeSec number(10);--自查数据量执行耗时秒数
  v_errorcounts_exeSuccess number(1);--自查问题数据量执行结果 0-成功 1-失败
  v_counts_exeSuccess number(1);--自查数据量执行结果 0-成功 1-失败
  v_remark varchar2(4000);--备注
  v_begindate date; --执行开始时间
begin

  for rec in (select * from data_check_rule a Where a.ruleid like nvl(i_ruleid,'%') order by a.ruleid) loop
    begin
    v_rectification := '待核实';
    v_errorcounts_exeSuccess := 0;
    v_counts_exeSuccess := 0;
    v_errorcounts := -1;
    v_counts := -1;
    v_sql := rec.sql_exe ||' '||rec.conditions2;
    v_errorcounts_sql := '无';
    v_errorcounts_exeSec  := 0;
    v_counts_sql := '无';
    v_counts_exeSec  := 0;

    if rec.valid = '0' --不核查
      then
        v_errorcounts := 0;
        v_counts := 0;
        v_errorcounts_exeSuccess := 1;
        v_counts_exeSuccess := 1;
        v_rectification := '否';
    end if;
    if rec.valid = '1'
      then
      --DBMS_OUTPUT.put_line(v_sql);
      v_errorcounts_sql := 'select '||rec.selectitem||' from (' || v_sql ||' )';
      --DBMS_OUTPUT.put_line(v_errorcounts_sql);
      v_counts_sql := 'select '||rec.selectitem||' from (' || REPLACE(v_sql,rec.conditions,' ')||' )';
      --DBMS_OUTPUT.put_line(v_counts_sql);
      v_begindate := sysdate;
      execute immediate v_errorcounts_sql into v_errorcounts;
      v_errorcounts_exeSuccess := 1;
      v_errorcounts_exeSec  := ROUND(TO_NUMBER(Sysdate - v_begindate) * 24 * 60 * 60);
      --DBMS_OUTPUT.put_line(v_errorcounts);
      if v_errorcounts = 0 then v_rectification := '否'; end if;--错误数为0不用整改
      v_begindate := sysdate;
      execute immediate v_counts_sql into v_counts;
      v_counts_exeSuccess := 1;
      v_counts_exeSec  := ROUND(TO_NUMBER(Sysdate - v_begindate) * 24 * 60 * 60);
      --DBMS_OUTPUT.put_line(v_counts);
    end if;

    delete from DATA_CHECK_Result where ruleid = rec.ruleid;--先删除原来的执行的结果
    insert into DATA_CHECK_Result(ruleid,modelname,tablecname,tablename,itemcname,itemname,datatype,
      ruledesc,sql_exe,errorcounts,counts,Rectification,errorcounts_sql,counts_sql,errorcounts_exeSec,
      counts_exeSec,errorcounts_exeSuccess,counts_exeSuccess,createtime,remark)
    values (rec.ruleid,rec.modelname,rec.tablecname,rec.tablename,rec.itemcname,rec.itemname,rec.datatype,
      rec.ruledesc,rec.sql_exe,v_errorcounts,v_counts,v_rectification,v_errorcounts_sql,v_counts_sql,v_errorcounts_exeSec,
      v_counts_exeSec,v_errorcounts_exeSuccess,v_counts_exeSuccess,sysdate,'成功');
    commit;

    exception
    when others then rollback;
    v_remark:=substr(sqlerrm, 0, 3500);
    --插入提数失败对列
    delete from DATA_CHECK_Result where ruleid = rec.ruleid;
    insert into DATA_CHECK_Result(ruleid,modelname,tablecname,tablename,itemcname,itemname,datatype,
      ruledesc,sql_exe,errorcounts,counts,Rectification,errorcounts_sql,counts_sql,errorcounts_exeSec,
      counts_exeSec,errorcounts_exeSuccess,counts_exeSuccess,createtime,remark)
    values (rec.ruleid,rec.modelname,rec.tablecname,rec.tablename,rec.itemcname,rec.itemname,rec.datatype,
      rec.ruledesc,rec.sql_exe,v_errorcounts,v_counts,v_rectification,v_errorcounts_sql,v_counts_sql,v_errorcounts_exeSec,
      v_counts_exeSec,v_errorcounts_exeSuccess,v_counts_exeSuccess,sysdate,v_remark);
    commit;

    end;
  end LOOP;

end DATA_CHECK;
/

prompt
prompt Creating procedure DELTABLE
prompt ===========================
prompt
CREATE OR REPLACE Procedure PRZXUSER.DelTable wrapped
a000000
354
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
7
9238 814
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
0S2H7j6wwXKuqnNb2W6CbQ==
/

prompt
prompt Creating procedure NOTICETRANSCOUNTS
prompt ====================================
prompt
create or replace procedure przxuser.noticeTransCounts wrapped
a000000
354
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
7
f0a7 11c2
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
/

prompt
prompt Creating procedure PROC_ALL_YW_IMAGE
prompt ====================================
prompt
create or replace procedure przxuser.Proc_ALL_yw_Image is
begin
insert into YW_Image_BussNo
  select c.proposalno, 'T', c.policyno, '', '','',c.proposalno, '0',sysdate
    from ywuser.prpcmain c
   where c.riskcode = '2315'
     and not exists
   (select 1 from YW_Image_BussNo b where b.policyno = c.policyno);
commit;

insert into YW_Image_BussNo
  select c.registno, 'C', c.policyno, c.registno,l.claimno,l.claimno, '',  '0',sysdate
    from nclaimuser.prplregist c,nclaimuser.prplclaim l,nclaimuser.prplcompensate d
   where c.riskcode = '2315' and c.registno = l.registno and l.claimno = d.claimno and d.UNDERWRITEDATE is not null
     and not exists
   (select 1 from YW_Image_BussNo b where b.registno = c.registno);
commit;
end Proc_ALL_yw_Image;
/

prompt
prompt Creating package body PAK_PR_ALL
prompt ================================
prompt
create or replace package body przxuser.Pak_PR_ALL is
procedure Proc_PR_ALL is
nowdate date;
begin
nowdate := to_date(to_char(sysdate - 1, 'yyyy-MM-dd'), 'yyyy-MM-dd'); Proc_PR_ALLForDataType(nowdate, nowdate, 'inc'); commit;
end Proc_PR_ALL;

procedure Proc_PR_ALLForDataType(i_startdate date, i_enddate date, i_dataType varchar2) is
begin
----增加分支机构配置----
insert into ldcodemapping select sys_guid() idcode, 'MakeCom' codetype, t.comcode basiccode, t.comcname basiccodename,(select l.targetcode from ldcodemapping l where l.codetype = 'MakeCom' and l.basiccode = (substr(t.comcode, 0, 2) || '000000')) targetcode,(select l.targetcodename from ldcodemapping l where l.codetype = 'MakeCom' and l.basiccode = (substr(t.comcode, 0, 2) || '000000')) targetcodename, '' othersign, '86' managecom, '保险分支机构代码' remark from ywuser.prpdcompany t where t.comcode in (select distinct substr(a.comcode, 0, 6) || '00' from ywuser.prpdcompany a where not exists(select 1 from ldcodemapping b where b.codetype = 'MakeCom' and b.basiccode = (substr(a.comcode, 0, 6) || '00')) and exists(select 1 from ldcodemapping b where b.codetype = 'MakeCom' and b.basiccode = (substr(a.comcode, 0, 2) || '000000')));
----清理增量提数临时表----
insert into pr_all_noLog(select * from pr_all_no);
--
EXECUTE IMMEDIATE 'TRUNCATE TABLE pr_all_no'; commit;
--调产品模块提数
Pak_PR_Product.Proc_PR_ProductForDataType(i_startdate, i_enddate, i_dataType);
--调承保模块提数
Pak_PR_Policy.Proc_PR_PolicyForDataType(i_startdate, i_enddate, i_dataType);
--调理赔模块提数
Pak_PR_Claim.Proc_PR_ClaimForDataType(i_startdate, i_enddate, i_dataType);
--调收付模块提数
Pak_PR_Payment.Proc_PR_PaymentForDataType(i_startdate, i_enddate, i_dataType);
--调其它模块提数
Pak_PR_Other.Proc_PR_OtherForDataType(i_startdate, i_enddate, i_dataType);
--调再保模块提数
Pak_PR_Reins.Proc_PR_ReinsForDataType(i_startdate, i_enddate, i_dataType);
DBMS_OUTPUT.put_line('Proc_PR_ALLForDataType');
end Proc_PR_ALLForDataType;

procedure Proc_ALL_ForNo(modelType varchar2, no varchar2, flag varchar2) is
begin
DBMS_OUTPUT.put_line('Proc_ALL_ForNo');
end Proc_ALL_ForNo;

end Pak_PR_ALL;
/

prompt
prompt Creating package body PAK_PR_ALL_REASON
prompt =======================================
prompt
create or replace package body przxuser.Pak_PR_ALL_Reason is
procedure Proc_PR_ALL_Reason is
begin
  Proc_PR_ALL_ReasonForDataType('inc');
  commit;
end Proc_PR_ALL_Reason;

procedure Proc_PR_ALL_ReasonForDataType(i_datatype varchar2) is
warndesc clob; --错误信息
v_rownum int;--提数影响行数
v_takemsg varchar2(4100);--提数完成情况情况
v_transactiondate varchar2(10);--交易日期
v_begindate date;--提数开始时间
v_enddate date;--提数开始时间
v_remark varchar2(255);--备注
sqltxt varchar2(10000);
begin
/*20191109 测试新非车数据提取 dataschedule_proc_20191109TEST*/
  for rec in (select a.* from dataschedule_proc_20191109TEST a where a.busitype = upper(i_datatype||'001') and exists (select 1 from pr_all_no b where b.datatype = i_datatype and a.trantype = b.transactionreason)) loop
      begin
        v_begindate :=sysdate;
        sqltxt :=rec.sqltext;
        execute immediate sqltxt;
        v_rownum := SQL%ROWCOUNT;
         commit;
         v_enddate := Sysdate;
        --取交易日期
        if v_transactiondate is null then
        select to_char(max(b.transactiondate) ,'yyyy-mm-dd') into v_transactiondate from pr_all_no b where b.datatype = i_datatype;
        end if;
        
        --提数超过5分钟
        --if (sysdate-v_begindate)*24*60*60 > 5*60 then
        v_remark:='提数时间（S）：'||to_char((v_enddate-v_begindate)*24*60*60)||'开始时间：'||to_char(v_begindate,'yyyy-mm-dd hh24:mi:ss')||'结束时间：'||to_char(Sysdate,'yyyy-mm-dd hh24:mi:ss');
        --v_remark:='提数时间（S）：'||to_number((to_date(to_char(sysdate,'yyyy-mm-dd hh24:mi:ss'),'yyyy-mm-dd hh24:mi:ss')-to_date(to_char(v_begindate,'yyyy-mm-dd hh24:mi:ss'),'yyyy-mm-dd hh24:mi:ss'))*24*60*60,'99999999.9')||'开始时间：'||to_char(v_begindate,'yyyy-mm-dd hh24:mi:ss')||'结束时间：'||to_char(Sysdate,'yyyy-mm-dd hh24:mi:ss');
        --end if;
        --插入提数成功对列
        insert into dataschedulequeue(busitype,trantype,tablename,calcode,insdate,operdate,opercode,startdate,enddate,presql,sqltext,takemsg,times,status,remark)
        values(rec.busitype,rec.trantype,rec.tablename,rec.calcode,sysdate,sysdate,'Admin',v_transactiondate,v_transactiondate,null,rec.sqltext,'提数成功，条数：'||v_rownum,1,1,v_remark);
        
        commit;
        exception
        when others then rollback;
        v_takemsg:=substr(sqlerrm, 0, 4000);
        warndesc := warndesc||rec.busitype||' '||rec.trantype||' '||rec.tablename||' '||rec.calcode||' '||'错误原因：'||substr(v_takemsg, 0, 100)||chr(10);
        --插入提数失败对列
        insert into dataschedulequeue(busitype,trantype,tablename,calcode,insdate,operdate,opercode,startdate,enddate,presql,sqltext,takemsg,times,status,remark)
        values(rec.busitype,rec.trantype,rec.tablename,rec.calcode,sysdate,sysdate,'Admin',v_transactiondate,v_transactiondate,null,rec.sqltext,v_takemsg,1,2,v_remark);
        commit;
        
      end;
  end loop;
  --一些特殊处理
        --UPDATE mid_ProCItemKind  a SET A.KINDCODE='',A.KINDNAME='' where  a.KINDCODE not in (SELECT kindcode FROM ProDClauseKind b );
        --UPDATE mid_ProCcommissionDetail  a SET A.KINDCODE='' where  a.KINDCODE not in (SELECT KINDCODE FROM ProDClauseKind b  );
        --UPDATE mid_ProCUWLiability  a SET A.KINDCODE='' where a.KINDCODE not in (SELECT KINDCODE FROM ProDClauseKind b  );
       -- UPDATE mid_ProClimit  a SET A.KINDCODE='' where  a.KINDCODE not in (SELECT KINDCODE FROM ProDClauseKind b  );
        commit;
  --送警告
  if warndesc is not null then
  insert into EarlyWarningMsg (WARNID, WARNTYPE, WARNOBJECT, WARNDESC, WARNDATE, WARNTIME, WARNSTATUS, WARNSTATUSDESC, WARNSENDTIMES, WARNWAY, REMARK)
  values (to_char(systimestamp, 'yyyymmddhh24missff6'), '01', '数据提取处理异常请尽快处理', warndesc, to_date(to_char(sysdate,'yyyy-mm-dd'), 'yyyy-mm-dd'), to_char(sysdate,'hh24:mi:ss'), '00', '初始化', 0, '01', '');
  end if;
  --数据提取完成，修改状态
  Update prgluser.procdataconfig Set RESERVE1='1' ; 
  commit;
end Proc_PR_ALL_ReasonForDataType;

end Pak_PR_ALL_Reason;
/

prompt
prompt Creating package body PAK_PR_CLAIM
prompt ==================================
prompt
create or replace package body przxuser.Pak_PR_Claim is
procedure Proc_PR_Claim(i_startdate date, i_enddate date) is
begin
DBMS_OUTPUT.put_line('Proc_PR_Claim' || i_startdate || '-' || i_enddate);
end Proc_PR_Claim;

--从新理赔提取
procedure Proc_PR_ClaimForDataType(i_startdate date, i_enddate date, i_dataType varchar2) is
v_remark varchar2(400); --备注
v_errormsg varchar2(1000); --错误信息
warndesc clob;
begin
----****11-理赔报案,flag区分二期三期****----/*20190929lz剔除无保单报案案件*/
--insert into pr_all_no select pak_pr_utils.Fn_PR_NextTransactionNo() transactionno, '11' transactionreason, 'Claim' modeltype, a.registno certino, '--' certitype, to_date(to_char(a.reportdate, 'yyyy-MM-dd') || ' ' || a.reporthour, 'yyyy-MM-dd HH24:mi:ss') transactinonate, 'O' flag, sysdate createtime, i_dataType dataType, Pak_PR_Utils.Fn_PR_CompanyCode() CompanyCode, a.policyno,Pak_PR_Utils.Fn_PR_NextBatchNo(i_dataType) BatchNo from ywuser.prplregist a where a.reportdate >= i_startdate and a.reportdate < (i_enddate + 1) And a.flag Is Null and exists(select 1 from Prpdriskforreport risk where a.riskcode = risk.riskcode and risk.validstatus = '1');
Insert Into Pr_All_No Select Pak_Pr_Utils.Fn_Pr_Nexttransactionno() Transactionno, '11' Transactionreason, 'Claim' Modeltype, a.Registno Certino,  '--' Certitype,  a.ReportTime Transactinonate,          '03' Flag,          Sysdate Createtime,          i_Datatype Datatype,          Pak_Pr_Utils.Fn_Pr_Companycode() Companycode,          a.Policyno,Pak_PR_Utils.Fn_PR_NextBatchNo(i_dataType) BatchNo     From nclaimuser.Prplregist a    Where a.POLICYNO NOT LIKE 'T%' AND a.ReportTime >= i_Startdate      And a.ReportTime < (i_Enddate + 1)      And a.ReportTime Is Not Null      And Exists (Select 1             From Prpdriskforreport Risk            Where a.Riskcode = Risk.Riskcode    And Risk.Validstatus = '1')  and not exists (SELECT 1 FROM fccbuser.prpcmain main where main.policyno=a.policyno  AND main.COINSFLAG  in ('2','4') );
Insert Into Pr_All_No Select Pak_Pr_Utils.Fn_Pr_Nexttransactionno() Transactionno, '11' Transactionreason, 'Claim' Modeltype, a.Registno Certino,  '--' Certitype,  a.ReportTime Transactinonate,          '02' Flag,          Sysdate Createtime,          i_Datatype Datatype,          Pak_Pr_Utils.Fn_Pr_Companycode() Companycode,          a.Policyno,Pak_PR_Utils.Fn_PR_NextBatchNo(i_dataType) BatchNo     From nclaimuser.Prplregist a    Where a.POLICYNO NOT LIKE 'T%' AND a.ReportTime >= i_Startdate      And a.ReportTime < (i_Enddate + 1)      And a.ReportTime Is Not Null      And Exists (Select 1             From ywuser.prpdriskprext Risk            Where a.Riskcode = Risk.Riskcode    And Risk.Validstatus = '1')  and not exists (SELECT 1 FROM fccbuser.prpcmain main where main.policyno=a.policyno  AND main.COINSFLAG  in ('2','4') );
----****11-理赔报案****----

----****12-理赔报案处理,报案注销****----
/*insert into pr_all_no select pak_pr_utils.Fn_PR_NextTransactionNo() transactionno, '12' transactionreason, 'Claim' modeltype, a.registno certino, '--' certitype, canceldate transactinonate, 'O' flag, sysdate createtime, i_dataType dataType, Pak_PR_Utils.Fn_PR_CompanyCode() CompanyCode, a.policyno,Pak_PR_Utils.Fn_PR_NextBatchNo(i_dataType) BatchNo from ywuser.prplregist a where a.canceldate is
not null and a.canceldate >= i_startdate and a.canceldate < (i_enddate + 1) And a.flag Is Null and exists(select 1 from Prpdriskforreport risk where a.riskcode = risk.riskcode and risk.validstatus = '1');
*/
Insert Into Pr_All_No  Select Pak_Pr_Utils.Fn_Pr_Nexttransactionno() Transactionno, '12' Transactionreason,  'Claim' Modeltype, a.Registno Certino, '--' Certitype,Canceltime Transactinonate, '03' Flag,  Sysdate Createtime, i_Datatype Datatype, Pak_Pr_Utils.Fn_Pr_Companycode() Companycode,a.Policyno,Pak_PR_Utils.Fn_PR_NextBatchNo(i_dataType) BatchNo  From nclaimuser.Prplregist a   Where a.CancelTime Is 
Not Null And a.CancelTime >= i_Startdate  And a.CancelTime < (i_Enddate + 1)  And Exists (Select 1   From Prpdriskforreport Risk  Where a.Riskcode = Risk.Riskcode    And Risk.Validstatus = '1') and not exists (SELECT 1 FROM fccbuser.prpcmain main where main.policyno=a.policyno  AND main.COINSFLAG  in ('2','4') ); 
Insert Into Pr_All_No  Select Pak_Pr_Utils.Fn_Pr_Nexttransactionno() Transactionno, '12' Transactionreason,  'Claim' Modeltype, a.Registno Certino, '--' Certitype,Canceltime Transactinonate, '02' Flag,  Sysdate Createtime, i_Datatype Datatype, Pak_Pr_Utils.Fn_Pr_Companycode() Companycode,a.Policyno,Pak_PR_Utils.Fn_PR_NextBatchNo(i_dataType) BatchNo  From nclaimuser.Prplregist a   Where a.CancelTime Is 
Not Null And a.CancelTime >= i_Startdate  And a.CancelTime < (i_Enddate + 1)  And Exists (Select 1   From ywuser.prpdriskprext Risk  Where a.Riskcode = Risk.Riskcode    And Risk.Validstatus = '1') and not exists (SELECT 1 FROM fccbuser.prpcmain main where main.policyno=a.policyno  AND main.COINSFLAG  in ('2','4') ); 
----****12-理赔报案处理,报案注销****----

----****13-理赔立案****----
--Insert Into Pr_All_No   Select Pak_Pr_Utils.Fn_Pr_Nexttransactionno() Transactionno,          '13' Transactionreason,          'Claim' Modeltype,          a.Claimno Certino,          '--' Certitype,          Claimdate Transactinonate,          'O' Flag,          Sysdate Createtime,          i_Datatype Datatype,          Pak_Pr_Utils.Fn_Pr_Companycode() Companycode,          a.Policyno,Pak_PR_Utils.Fn_PR_NextBatchNo(i_dataType) BatchNo     From Ywuser.Prplclaim a,ywuser.prplregist b    Where a.Claimdate >= i_Startdate      And a.Claimdate < (i_Enddate + 1)      And a.registno=b.registno      And b.flag Is Null      And Exists (Select 1             From Prpdriskforreport  Risk           Where a.Riskcode = Risk.Riskcode              And Risk.Validstatus = '1'); 
Insert Into Pr_All_No   Select Pak_Pr_Utils.Fn_Pr_Nexttransactionno() Transactionno,          '13' Transactionreason,          'Claim' Modeltype,          a.Claimno Certino,          '--' Certitype,          claimtime Transactinonate,          '03' Flag,          Sysdate Createtime,          i_Datatype Datatype,          Pak_Pr_Utils.Fn_Pr_Companycode() Companycode,          a.Policyno,Pak_PR_Utils.Fn_PR_NextBatchNo(i_dataType) BatchNo     From nclaimuser.Prplclaim a    Where a.claimtime >= i_Startdate      And a.claimtime < (i_Enddate + 1)      And a.claimtime Is Not Null      And Exists (Select 1             From Prpdriskforreport Risk            Where a.Riskcode = Risk.Riskcode              And Risk.Validstatus = '1') and not exists (SELECT 1 FROM fccbuser.prpcmain main where main.policyno=a.policyno  AND main.COINSFLAG  in ('2','4') ); 
Insert Into Pr_All_No   Select Pak_Pr_Utils.Fn_Pr_Nexttransactionno() Transactionno,          '13' Transactionreason,          'Claim' Modeltype,          a.Claimno Certino,          '--' Certitype,          claimtime Transactinonate,          '02' Flag,          Sysdate Createtime,          i_Datatype Datatype,          Pak_Pr_Utils.Fn_Pr_Companycode() Companycode,          a.Policyno,Pak_PR_Utils.Fn_PR_NextBatchNo(i_dataType) BatchNo     From nclaimuser.Prplclaim a    Where a.claimtime >= i_Startdate      And a.claimtime < (i_Enddate + 1)      And a.claimtime Is Not Null      And Exists (Select 1             From ywuser.prpdriskprext Risk            Where a.Riskcode = Risk.Riskcode              And Risk.Validstatus = '1') and not exists (SELECT 1 FROM fccbuser.prpcmain main where main.policyno=a.policyno  AND main.COINSFLAG  in ('2','4') ); 
----****13-理赔立案****----

----****14-理赔立案处理,立案注销****----
--Insert Into Pr_All_No   Select Pak_Pr_Utils.Fn_Pr_Nexttransactionno() Transactionno,          '14' Transactionreason,          'Claim' Modeltype,          a.Claimno Certino,          '--' Certitype,          a.Canceldate Transactinonate,          'O' Flag,          Sysdate Createtime,          i_Datatype Datatype,          Pak_Pr_Utils.Fn_Pr_Companycode() Companycode,          a.Policyno,Pak_PR_Utils.Fn_PR_NextBatchNo(i_dataType) BatchNo     From Ywuser.Prplclaim a,ywuser.prplregist b    Where a.Canceldate Is Not Null      And a.Canceldate >= i_Startdate      And a.Canceldate < (i_Enddate + 1)      And a.registno=b.registno      And b.flag Is Null      And Exists (Select 1             From Prpdriskforreport Risk            Where a.Riskcode = Risk.Riskcode              And Risk.Validstatus = '1'); 
Insert Into Pr_All_No   Select Pak_Pr_Utils.Fn_Pr_Nexttransactionno() Transactionno,          '14' Transactionreason,          'Claim' Modeltype,          a.Claimno Certino,          '--' Certitype,          a.CANCELTIME  Transactinonate,          '03' Flag,          Sysdate Createtime,          i_Datatype Datatype,          Pak_Pr_Utils.Fn_Pr_Companycode() Companycode,          a.Policyno,Pak_PR_Utils.Fn_PR_NextBatchNo(i_dataType) BatchNo     From nclaimuser.Prplclaim a    Where a.CANCELTIME  Is Not Null      And a.CANCELTIME  >= i_Startdate      And a.CANCELTIME  < (i_Enddate + 1)  And a.claimtime Is Not Null    And Exists (Select 1             From Prpdriskforreport Risk            Where a.Riskcode = Risk.Riskcode              And Risk.Validstatus = '1') and not exists (SELECT 1 FROM fccbuser.prpcmain main where main.policyno=a.policyno  AND main.COINSFLAG  in ('2','4') ); 
Insert Into Pr_All_No   Select Pak_Pr_Utils.Fn_Pr_Nexttransactionno() Transactionno,          '14' Transactionreason,          'Claim' Modeltype,          a.Claimno Certino,          '--' Certitype,          a.CANCELTIME  Transactinonate,          '02' Flag,          Sysdate Createtime,          i_Datatype Datatype,          Pak_Pr_Utils.Fn_Pr_Companycode() Companycode,          a.Policyno,Pak_PR_Utils.Fn_PR_NextBatchNo(i_dataType) BatchNo     From nclaimuser.Prplclaim a    Where a.CANCELTIME  Is Not Null      And a.CANCELTIME  >= i_Startdate      And a.CANCELTIME  < (i_Enddate + 1)  And a.claimtime Is Not Null    And Exists (Select 1             From ywuser.prpdriskprext Risk            Where a.Riskcode = Risk.Riskcode              And Risk.Validstatus = '1') and not exists (SELECT 1 FROM fccbuser.prpcmain main where main.policyno=a.policyno  AND main.COINSFLAG  in ('2','4') ); 
----****14-理赔立案处理,立案注销****----

----****15-理赔结案****----
--Insert Into Pr_All_No   Select Pak_Pr_Utils.Fn_Pr_Nexttransactionno() Transactionno,          '15' Transactionreason,          'Claim' Modeltype,          a.Compensateno Certino,          '--' Certitype,          a.Endcasedate Transactinonate,          'O' Flag,          Sysdate Createtime,          i_Datatype Datatype,          Pak_Pr_Utils.Fn_Pr_Companycode() Companycode,          a.Policyno,Pak_PR_Utils.Fn_PR_NextBatchNo(i_dataType) BatchNo     From Ywuser.Prplcompensate a,ywuser.prplregist b,ywuser.prplclaim c    Where a.Endcasedate Is Not Null      And a.Endcasedate >= i_Startdate      And a.Endcasedate < (i_Enddate + 1)      And a.claimno=c.claimno      And c.registno=b.registno      And b.flag Is Null      And Exists (Select 1             From Prpdriskforreport Risk            Where a.Riskcode = Risk.Riskcode              And Risk.Validstatus = '1'); 
Insert Into Pr_All_No   Select Pak_Pr_Utils.Fn_Pr_Nexttransactionno() Transactionno,          '15' Transactionreason,          'Claim' Modeltype,          a.Compensateno Certino,          '--' Certitype,          a.UnderwriteDate Transactinonate,          '03' Flag,          Sysdate Createtime,          i_Datatype Datatype,          Pak_Pr_Utils.Fn_Pr_Companycode() Companycode,          a.Policyno,Pak_PR_Utils.Fn_PR_NextBatchNo(i_dataType) BatchNo     From Nclaimuser.prplcompensate a    Where a.UnderwriteDate Is Not Null  and a.sumamt+a.sumfee>0    And a.UnderwriteDate >= i_Startdate      And a.UnderwriteDate < (i_Enddate + 1)      And a.UnderwriteFlag In ('1','3') and exists (select 1 from nclaimuser.prplclaim where claimno=a.claimno and caseno is not null and ENDCASETIME is not null)  And a.compensatetype Not Like '%Y%' and a.compensatetype ='1'  And Exists (Select 1             From Prpdriskforreport Risk            Where a.Riskcode = Risk.Riskcode              And Risk.Validstatus = '1') and not exists (SELECT 1 FROM fccbuser.prpcmain main where main.policyno=a.policyno  AND main.COINSFLAG  in ('2','4') ); 
Insert Into Pr_All_No   Select Pak_Pr_Utils.Fn_Pr_Nexttransactionno() Transactionno,          '15' Transactionreason,          'Claim' Modeltype,          a.Compensateno Certino,          '--' Certitype,          a.UnderwriteDate Transactinonate,          '02' Flag,          Sysdate Createtime,          i_Datatype Datatype,          Pak_Pr_Utils.Fn_Pr_Companycode() Companycode,          a.Policyno,Pak_PR_Utils.Fn_PR_NextBatchNo(i_dataType) BatchNo     From Nclaimuser.prplcompensate a    Where a.UnderwriteDate Is Not Null  and a.sumamt+a.sumfee>0     And a.UnderwriteDate >= i_Startdate      And a.UnderwriteDate < (i_Enddate + 1)      And a.UnderwriteFlag In ('1','3') and exists (select 1 from nclaimuser.prplclaim where claimno=a.claimno and caseno is not null and ENDCASETIME is not null)  And a.compensatetype Not Like '%Y%' and a.compensatetype ='1'  And Exists (Select 1             From ywuser.prpdriskprext Risk            Where a.Riskcode = Risk.Riskcode              And Risk.Validstatus = '1') and not exists (SELECT 1 FROM fccbuser.prpcmain main where main.policyno=a.policyno  AND main.COINSFLAG  in ('2','4') ); 
----****15-理赔结案****----
--备注
v_remark := 'Proc_PR_ClaimForDataType  取数日期 >= ' || to_char(i_startdate, 'yyyy-MM-dd') || ' < ' || to_char(i_enddate + 1, 'yyyy-MM-dd');
--出错处理开始
exception
when others then rollback;
--
v_errormsg := substr(sqlerrm, 0, 900);
warndesc := v_remark || v_errormsg;
--错误日志
insert into PR_ALL_ERRLOG values(sys_guid(), i_dataType, 'Claim', 'Proc_PR_ClaimForDataType', '无', sysdate, v_errormsg, v_remark);
insert into EarlyWarningMsg (WARNID, WARNTYPE, WARNOBJECT, WARNDESC, WARNDATE, WARNTIME, WARNSTATUS, WARNSTATUSDESC, WARNSENDTIMES, WARNWAY, REMARK)
values (to_char(systimestamp, 'yyyymmddhh24missff6'), '01', '增量数据提取处理异常请尽快处理', warndesc, to_date(to_char(sysdate,'yyyy-mm-dd'), 'yyyy-mm-dd'), to_char(sysdate,'hh24:mi:ss'), '00', '初始化', 0, '01', '');
--
commit;
--出错处理结束
DBMS_OUTPUT.put_line(v_remark);
end Proc_PR_ClaimForDataType;

/*旧理赔提数注释,20190812,罗智
procedure Proc_PR_ClaimForRegistNo(i_registNo varchar2, i_dataType varchar2) is
v_remark varchar2(400); --备注
v_errormsg varchar2(1000); --错误信息
warndesc clob;
begin
----****报案****----
insert into pr_all_no select pak_pr_utils.Fn_PR_NextTransactionNo() transactionno, '11' transactionreason, 'Claim' modeltype, a.registno certino, '--' certitype, to_date(to_char(a.reportdate, 'yyyy-MM-dd') || ' ' || a.reporthour, 'yyyy-MM-dd HH24:mi:ss') transactinonate, 'O' flag, sysdate createtime, i_dataType dataType, Pak_PR_Utils.Fn_PR_CompanyCode() CompanyCode, a.policyno,Pak_PR_Utils.Fn_PR_NextBatchNo(i_dataType) BatchNo from ywuser.prplregist a where a.registno = i_registNo And a.flag Is Null and exists(select 1 from Prpdriskforreport risk where a.riskcode = risk.riskcode and risk.validstatus = '1');
Insert Into Pr_All_No   Select Pak_Pr_Utils.Fn_Pr_Nexttransactionno() Transactionno,          '11' Transactionreason,          'Claim' Modeltype,          a.Registno Certino,          '--' Certitype,          a.ReportTime Transactinonate,          '--' Flag,          Sysdate Createtime,          i_Datatype Datatype,          Pak_Pr_Utils.Fn_Pr_Companycode() Companycode,          a.Policyno,Pak_PR_Utils.Fn_PR_NextBatchNo(i_dataType) BatchNo     From nclaimuser.Prplregist a    Where a.Registno = i_Registno      And a.ReportTime Is Not Null      And Exists (Select 1             From Prpdriskforreport Risk            Where a.Riskcode = Risk.Riskcode              And Risk.Validstatus = '1'); 
----****报案****----
--备注
v_remark := 'Proc_PR_ClaimForRegistNo' || i_registNo || '-' || i_dataType;
--出错处理开始
exception
when others then rollback;
--
v_errormsg := substr(sqlerrm, 0, 900);
warndesc := v_remark || v_errormsg;
--错误日志
insert into PR_ALL_ERRLOG values(sys_guid(), i_dataType, 'Claim', 'Proc_PR_ClaimForRegistNo', i_registNo, sysdate, v_errormsg, v_remark);
insert into EarlyWarningMsg (WARNID, WARNTYPE, WARNOBJECT, WARNDESC, WARNDATE, WARNTIME, WARNSTATUS, WARNSTATUSDESC, WARNSENDTIMES, WARNWAY, REMARK)
values (to_char(systimestamp, 'yyyymmddhh24missff6'), '01', '增量数据提取处理异常请尽快处理', warndesc, to_date(to_char(sysdate,'yyyy-mm-dd'), 'yyyy-mm-dd'), to_char(sysdate,'hh24:mi:ss'), '00', '初始化', 0, '01', '');
--
commit;
--出错处理结束
DBMS_OUTPUT.put_line(v_remark);
end Proc_PR_ClaimForRegistNo;

*/

/*旧理赔提数注释,20190812,罗智
procedure Proc_PR_ClaimForClaimNo(i_claimNo varchar2, i_dataType varchar2) is
v_remark varchar2(400); --备注
v_errormsg varchar2(1000); --错误信息
warndesc clob;
begin
----****立案****----
insert into pr_all_no select pak_pr_utils.Fn_PR_NextTransactionNo() transactionno, '13' transactionreason, 'Claim' modeltype, a.claimno certino, '--' certitype, claimdate transactinonate, 'O' flag, sysdate createtime, i_dataType dataType, Pak_PR_Utils.Fn_PR_CompanyCode() CompanyCode, a.policyno,Pak_PR_Utils.Fn_PR_NextBatchNo(i_dataType) BatchNo from ywuser.prplclaim a where a.claimno = i_claimNo and exists(select 1 from Prpdriskforreport risk where a.riskcode = risk.riskcode and risk.validstatus = '1');
Insert Into Pr_All_No   Select Pak_Pr_Utils.Fn_Pr_Nexttransactionno() Transactionno,          '13' Transactionreason,          'Claim' Modeltype,          a.Claimno Certino,          '--' Certitype,          Claimdate Transactinonate,          '--' Flag,          Sysdate Createtime,          i_Datatype Datatype,          Pak_Pr_Utils.Fn_Pr_Companycode() Companycode,          a.Policyno,Pak_PR_Utils.Fn_PR_NextBatchNo(i_dataType) BatchNo     From Ywuser.Prplclaim a,ywuser.prplregist b    Where a.Claimno = i_Claimno    And a.registno=b.registno    And b.flag Is Null      And Exists (Select 1             From Prpdriskforreport Risk            Where a.Riskcode = Risk.Riskcode              And Risk.Validstatus = '1'); 
----****立案****----
--备注
v_remark := 'Proc_PR_ClaimForClaimNo' || i_claimNo || '-' || i_dataType;

--出错处理开始
exception
when others then rollback;
--
v_errormsg := substr(sqlerrm, 0, 900);
warndesc := v_remark || v_errormsg;
--错误日志
insert into PR_ALL_ERRLOG values(sys_guid(), i_dataType, 'Claim', 'Proc_PR_ClaimForClaimNo', i_claimNo, sysdate, v_errormsg, v_remark);
insert into EarlyWarningMsg (WARNID, WARNTYPE, WARNOBJECT, WARNDESC, WARNDATE, WARNTIME, WARNSTATUS, WARNSTATUSDESC, WARNSENDTIMES, WARNWAY, REMARK)
values (to_char(systimestamp, 'yyyymmddhh24missff6'), '01', '增量数据提取处理异常请尽快处理', warndesc, to_date(to_char(sysdate,'yyyy-mm-dd'), 'yyyy-mm-dd'), to_char(sysdate,'hh24:mi:ss'), '00', '初始化', 0, '01', '');
--
commit;
--出错处理结束
DBMS_OUTPUT.put_line(v_remark);
end Proc_PR_ClaimForClaimNo;

*/


/*旧理赔提数注释,20190812,罗智
procedure Proc_PR_ClaimForCompensateNo(i_compensateNo varchar2, i_dataType varchar2) is
v_remark varchar2(400); --备注
v_errormsg varchar2(1000); --错误信息
warndesc clob;
begin
----****结案****----
Insert Into Pr_All_No   Select Pak_Pr_Utils.Fn_Pr_Nexttransactionno() Transactionno,          '15' Transactionreason,          'Claim' Modeltype,          a.Compensateno Certino,          '--' Certitype,          a.Endcasedate Transactinonate,          'O' Flag,          Sysdate Createtime,          i_Datatype Datatype,          Pak_Pr_Utils.Fn_Pr_Companycode() Companycode,          a.Policyno,Pak_PR_Utils.Fn_PR_NextBatchNo(i_dataType) BatchNo     From Ywuser.Prplcompensate a,ywuser.prplclaim b,ywuser.prplregist c    Where a.Compensateno = i_Compensateno    And a.claimno=b.claimno    And b.registno=c.registno    And c.flag Is Null      And Exists (Select 1             From Prpdriskforreport Risk            Where a.Riskcode = Risk.Riskcode              And Risk.Validstatus = '1'); 
Insert Into Pr_All_No   Select Pak_Pr_Utils.Fn_Pr_Nexttransactionno() Transactionno,          '15' Transactionreason,          'Claim' Modeltype,          a.Compensateno Certino,          '--' Certitype,          a.UnderwriteDate Transactinonate,          '--' Flag,          Sysdate Createtime,          i_Datatype Datatype,          Pak_Pr_Utils.Fn_Pr_Companycode() Companycode,          a.Policyno,Pak_PR_Utils.Fn_PR_NextBatchNo(i_dataType) BatchNo     From Nclaimuser.prplcompensate a    Where a.Compensateno = i_Compensateno  And a.caseno Is Not Null    And Exists (Select 1             From Prpdriskforreport Risk            Where a.Riskcode = Risk.Riskcode              And Risk.Validstatus = '1'); 
----****结案****-Pr_All_No---
--备注
v_remark := 'Proc_PR_ClaimForCompensateNo' || i_compensateNo || '-' || i_dataType;
--出错处理开始
exception
when others then rollback;
--
v_errormsg := substr(sqlerrm, 0, 900);
warndesc := v_remark || v_errormsg;
--错误日志
insert into PR_ALL_ERRLOG values(sys_guid(), i_dataType, 'Claim', 'Proc_PR_ClaimForCompensateNo', i_compensateNo, sysdate, v_errormsg, v_remark);
insert into EarlyWarningMsg (WARNID, WARNTYPE, WARNOBJECT, WARNDESC, WARNDATE, WARNTIME, WARNSTATUS, WARNSTATUSDESC, WARNSENDTIMES, WARNWAY, REMARK)
values (to_char(systimestamp, 'yyyymmddhh24missff6'), '01', '增量数据提取处理异常请尽快处理', warndesc, to_date(to_char(sysdate,'yyyy-mm-dd'), 'yyyy-mm-dd'), to_char(sysdate,'hh24:mi:ss'), '00', '初始化', 0, '01', '');
--
commit;
--出错处理结束
DBMS_OUTPUT.put_line(v_remark);
end Proc_PR_ClaimForCompensateNo;

*/

procedure MID_Proc_PR_ClaimForDataType(i_dataType     varchar2) is 

begin
Insert Into Mid_Prolclaimpolicy
  Select Claimpolicy.Transactionno,
         Companycode,
         Policyno,
         Registno,
         Clmno,
         Caseno,
         Compensateno,
         Row_Number() Over(Partition By Compensateno Order By Compensateno) As Serialno,
         Riskcode,
         Clausecode,
         Classification,
         Kindcode,
         Losscatcode,
         Losscatname,
         Twolosscode,
         Twolossname,
         Threelosscode,
         Threelossname,
         Fourlevelcode,
         Fourlevelloss,
         Occreasoncode,
         Occreasonname,
         Mercyflag,
         Itemkindno,
         Itemtypecode,
         Itemdetailname,
         Lossitemname,
         Unitlossquantity,
         Lossdegree,
         Currencycode,
         Currencyamount,
         Deductible,
         Deductiblerate,
         Itemvalueorigcur,
         Itemvalueorig,
         Itemvalue,
         Unitsumlossorigcur,
         Unitsumlossorig,
         Unitsumloss,
         Unitcompensateexp,
         Unitsumrestorigcur,
         Unitsumrestorig,
         Unitsumrest,
         Unitsumdeflossorigcur,
         Unitsumdeflossorig,
         Unitsumdefloss,
         Finalpayorigcur,
         Finalpayorig,
         Standpay,
         Unitlctext,
         Currency,
         Standpayorig,
         Unitsumpaid,
         Unitsumprepaidorigcur,
         Unitsumprepaidorig,
         Unitsumprepaid,
         Unitsumrealpayorigcur,
         Unitsumrealpayorig,
         Unitsumrealpay,
         Unitexceptdeductibeorigcur,
         Unitexceptdeductibeyorig,
         Unitexceptdeductibe,
         Deprerate,
         Losstypeorigcur,
         Losstypeorig,
         Losstype,
         Underwriteenddate,
         Pfstatus,
         Recoveryflag,
         Lawsuitflag,
         Lawsuitno,
         Givetype,
         Givetypedescription,
         Refusepayrcode,
         Getdutykind,
         Lossfeetype,
         Criticalillnesscode,
         Claimrate,
         Claimratioend,
         Underwritecomcode,
         Underwritecomname,
         Ishospitalflag,
         Hospitalcode,
         Hospitalname,
         Hospitalregioncode,
         Hospitalregion,
         Disabilitycode,
         Disabilityclass,
         Transactiondate,
         Batchno,
         Busino
    From (Select b.Transactionno As Transactionno,
                 b.Companycode As Companycode,
                 d.Policyno As Policyno,
                 c.Registno As Registno,
                 d.Claimno As Clmno,
                 d.Claimno As Caseno,
                 d.Compensateno As Compensateno,
                 Row_Number() Over(Partition By a.Compensateno Order By a.Compensateno) As Serialno,
                 c.Riskcode As Riskcode,
                 Nvl((Select Clausecode
                       From Ywuser.Prpdkindclause
                      Where Kindcode = a.Kindcode
                        And Riskcode = a.Riskcode
                        and rownum=1),
                     'F999') As Clausecode,
                 case when c.classcode in ('61','62') then '9900' else '' end As Classification,
                 a.Kindcode As Kindcode,
                 Null As Losscatcode,
                 Null As Losscatname,
                 Null As Twolosscode,
                 Null As Twolossname,
                 Null As Threelosscode,
                 Null As Threelossname,
                 Null As Fourlevelcode,
                 Null As Fourlevelloss,
                 c.Damagecode As Occreasoncode,
                 c.Damagename As Occreasonname,
                 Null As Mercyflag,
                 a.ITEMKINDNO As Itemkindno,
                 '' As Itemtypecode,
                 '000000' As Itemdetailname,--不可为空,传默认值000000
                 nvl(nvl(a.ITEMNAME,a.Lossname),'000000') As Lossitemname,
                 Nvl(a.Lossquantity, 0) As Unitlossquantity,
                 Nvl(c.Lossname, '无') As Lossdegree,
                 a.Currency As Currencycode,
                 Nvl(a.Deductabsamt, 0) As Currencyamount,
                 Nvl(a.Deductabsamt, 0) As Deductible,
                 Nvl(a.Deductabsrate, 0) As Deductiblerate,
                 a.Currency As Itemvalueorigcur,
                 Nvl(a.Itemvalue, 0) As Itemvalueorig,
                 Nvl(a.Itemvalue, 0) As Itemvalue,
                 a.Currency As Unitsumlossorigcur,
                 a.Sumloss As Unitsumlossorig,
                 a.Sumloss As Unitsumloss,
                 Dbms_Lob.Substr('') As Unitcompensateexp,
                 a.Currency As Unitsumrestorigcur,
                 Nvl(a.Sumrest, 0) As Unitsumrestorig,
                 Nvl(a.Sumrest, 0) As Unitsumrest,
                 a.Currency As Unitsumdeflossorigcur,
                 Nvl(a.Sumrealpay, 0) As Unitsumdeflossorig,
                 Nvl(a.Sumrealpay, 0) As Unitsumdefloss,
                 'CNY' As Finalpayorigcur,
                 0 As Finalpayorig,
                 a.SUMREALPAY As Standpay,
                 Dbms_Lob.Substr(c.Ltext) As Unitlctext,
                 a.Currency As Currency,
                 Nvl(a.Sumrealpay, 0) As Standpayorig,
                 Nvl(a.Sumrealpay, 0) As Unitsumpaid,
                 a.Currency As Unitsumprepaidorigcur,
                 Nvl(a.Offpreamt, 0) As Unitsumprepaidorig,
                 Nvl(a.Offpreamt, 0) As Unitsumprepaid,
                 a.Currency As Unitsumrealpayorigcur,
                 Nvl(a.Sumrealpay, 0) As Unitsumrealpayorig,
                 Nvl(a.Sumrealpay, 0) As Unitsumrealpay,
                 a.Currency As Unitexceptdeductibeorigcur,
                 0 As Unitexceptdeductibeyorig,
                 0 As Unitexceptdeductibe,
                 a.Deprerate As Deprerate,
                 a.Currency As Losstypeorigcur,
                 0 As Losstypeorig,
                 0 As Losstype,
                 d.Underwritedate As Underwriteenddate,
                 Case
                   When (Select Payrefflag
                           From Ywuser.Prpjplanfee
                          Where Certino = d.Compensateno
                            And Serialno = '1') = '0' Then
                    '1'
                   Else
                    '2'
                 End As Pfstatus,
                 d.Recoveryflag As Recoveryflag,
                 d.Lawsuitflag As Lawsuitflag,
                 '' As Lawsuitno,
                 Nvl(Decode(c.Casetype, '0', '1', c.Casetype), '9') As Givetype,
                 Dbms_Lob.Substr(Decode(c.Casetype,
                                        '0',
                                        '拒赔',
                                        '1',
                                        '拒赔',
                                        '2',
                                        '赔付',
                                        '其他')) As Givetypedescription,
                 c.Cancelreason As Refusepayrcode,
                 case when c.classcode in ('61','62') then '306' else '301' end As Getdutykind,--20190918与保信韩川老师沟通
                 Null As Lossfeetype,
                 Null As Criticalillnesscode,
                 a.Claimrate/100 As Claimrate,
                 Null As Claimratioend,
                 Substr(d.Comcode, 0, 6) || '00' As Underwritecomcode,
                 (Select Comcname
                    From ywuser.Prpdcompany
                   Where Comcode = Substr(d.Comcode, 0, 6) || '00') As Underwritecomname,
                 Null As Ishospitalflag,
                 Null As Hospitalcode,
                 Null As Hospitalname,
                 Null As Hospitalregioncode,
                 Null As Hospitalregion,
                 Null As Disabilitycode,
                 Null As Disabilityclass,
                 b.Transactiondate As Transactiondate,
                 b.Batchno As Batchno,
                 b.transactionno As Busino
            From Pr_All_No                 b,
                 Nclaimuser.Prplclaim      c,
                 Nclaimuser.Prpllossprop   a,
                 Nclaimuser.Prplcompensate d
           Where b.Datatype = i_dataType
             And d.Compensateno = b.Certino
             And c.Claimno = d.Claimno
             And a.Compensateno = b.Certino
             And b.Transactionreason = '15'
          Union All
          Select b.Transactionno As Transactionno,
                 b.Companycode As Companycode,
                 d.Policyno As Policyno,
                 c.Registno As Registno,
                 d.Claimno As Clmno,
                 d.Claimno As Caseno,
                 d.Compensateno As Compensateno,
                 Row_Number() Over(Partition By g.Compensateno Order By g.Compensateno) As Serialno,
                 c.Riskcode As Riskcode,
                 Nvl((Select Clausecode
                       From Ywuser.Prpdkindclause
                      Where Kindcode = g.Kindcode
                        And Riskcode = c.Riskcode
                        and rownum=1),
                     'F999') As Clausecode,
                 case when c.classcode in ('61','62') then '9900' else '' end As Classification,
                 g.Kindcode As Kindcode,
                 Null As Losscatcode,
                 Null As Losscatname,
                 Null As Twolosscode,
                 Null As Twolossname,
                 Null As Threelosscode,
                 Null As Threelossname,
                 Null As Fourlevelcode,
                 Null As Fourlevelloss,
                 c.Damagecode As Occreasoncode,
                 c.Damagename As Occreasonname,
                 c.Mercyflag As Mercyflag,
                 (Select Max(Itemkindno)
                    From Nclaimuser.Prplclaimkind t
                   Where t.Registno = c.Registno
                     And t.Kindcode = g.Kindcode) As Itemkindno,
                 Null As Itemtypecode,
                 '000000' As Itemdetailname,
                 nvl(a.Personname,'000000') As Lossitemname,
                 Nvl(c.Injurynumber, 1) As Unitlossquantity,
                 Nvl(c.Lossname, '无') As Lossdegree,
                 a.Currency As Currencycode,
                 Nvl(a.Deductabsamt, 0) As Currencyamount,
                 Nvl(a.Deductabsamt, 0) As Deductible,
                 Nvl(a.Deductaddrate, 0) As Deductiblerate,
                 a.Currency As Itemvalueorigcur,
                 Nvl(a.Itemamount, 0) As Itemvalueorig,
                 Nvl(a.Itemamount, 0) As Itemvalue,
                 a.Currency As Unitsumlossorigcur,
                 g.Feeloss As Unitsumlossorig,
                 g.Feeloss As Unitsumloss,
                 Dbms_Lob.Substr('') As Unitcompensateexp,
                 a.Currency As Unitsumrestorigcur,
                 Null As Unitsumrestorig,
                 Null As Unitsumrest,
                 a.Currency As Unitsumdeflossorigcur,
                 g.Feerealpay As Unitsumdeflossorig,
                 g.Feerealpay As Unitsumdefloss,
                 'CNY' As Finalpayorigcur,
                 0 As Finalpayorig,
                 g.Feerealpay As Standpay,
                 Dbms_Lob.Substr(c.Ltext) As Unitlctext,
                 a.Currency As Currency,
                 g.Feerealpay As Standpayorig,
                 Nvl(g.Feerealpay, 0) As Unitsumpaid,
                 a.Currency As Unitsumprepaidorigcur,
                 Nvl(g.Offpreamt, 0) As Unitsumprepaidorig,
                 Nvl(g.Offpreamt, 0) As Unitsumprepaid,
                 a.Currency As Unitsumrealpayorigcur,
                 Nvl(g.Feerealpay, 0) As Unitsumrealpayorig,
                 Nvl(g.Feerealpay, 0) As Unitsumrealpay,
                 a.Currency As Unitexceptdeductibeorigcur,
                 0 As Unitexceptdeductibeyorig,
                 0 As Unitexceptdeductibe,
                 0 As Deprerate,
                 Null As Losstypeorigcur,
                 Null As Losstypeorig,
                 Null As Losstype,
                 d.Underwritedate As Underwriteenddate,
                 Case
                   When (Select Payrefflag
                           From Ywuser.Prpjplanfee
                          Where Certino = d.Compensateno
                            And Serialno = '1') = '0' Then
                    '1'
                   Else
                    '2'
                 End As Pfstatus,
                 d.Recoveryflag As Recoveryflag,
                 d.Lawsuitflag As Lawsuitflag,
                 '' As Lawsuitno,
                 Nvl(Decode(c.Casetype, '0', '1', c.Casetype), '9') As Givetype,
                 Dbms_Lob.Substr(Decode(c.Casetype,
                                        '0',
                                        '拒赔',
                                        '1',
                                        '拒赔',
                                        '2',
                                        '赔付',
                                        '其他')) As Givetypedescription,
                 c.Cancelreason As Refusepayrcode,
                 case when c.classcode in ('61','62') then '306' else '301' end As Getdutykind,
                 '' As Lossfeetype,
                 '' As Criticalillnesscode,
                 a.Claimrate As Claimrate,
                 Null As Claimratioend,
                 Substr(d.Comcode, 0, 6) || '00' As Underwritecomcode,
                 (Select Comcname
                    From ywuser.Prpdcompany
                   Where Comcode = Substr(d.Comcode, 0, 6) || '00') As Underwritecomname,
                 Null As Ishospitalflag,
                 Null As Hospitalcode,
                 Null As Hospitalname,
                 Null As Hospitalregioncode,
                 Null As Hospitalregion,
                 Null As Disabilitycode,
                 g.maimlevel As Disabilityclass,--20191021lz根据平台要求补充
                 b.Transactiondate As Transactiondate,
                 b.Batchno As Batchno,
                 b.transactionno As Busino
            From Pr_All_No                    b,
                 Nclaimuser.Prplclaim         c,
                 Nclaimuser.Prpllossperson    a,
                 Nclaimuser.Prplcompensate    d,
                 Nclaimuser.Prpllosspersonfee g
           Where b.Datatype = i_dataType
             And c.Claimno = d.Claimno
             And d.Compensateno = b.Certino
             And g.Compensateno = b.Certino
             And a.Compensateno = b.Certino
             And d.Compensateno = g.Compensateno
             And d.Compensateno = a.Compensateno
             And a.Compensateno = g.Compensateno
             And a.Id = g.Losspersonid
             And b.Transactionreason = '15'
          union all
          Select b.Transactionno As Transactionno,
                 b.Companycode As Companycode,
                 d.Policyno As Policyno,
                 c.Registno As Registno,
                 d.Claimno As Clmno,
                 d.Claimno As Caseno,
                 d.Compensateno As Compensateno,
                 Row_Number() Over(Partition By a.Compensateno Order By a.Compensateno) As Serialno,
                 c.Riskcode As Riskcode,
                 Nvl((Select Clausecode
                       From Ywuser.Prpdkindclause
                      Where Kindcode = a.Kindcode
                        And Riskcode = c.Riskcode
                        and rownum=1),
                     'F999') As Clausecode,
                 case when c.classcode in ('61','62') then '9900' else '' end As Classification,
                 a.Kindcode As Kindcode,
                 Null As Losscatcode,
                 Null As Losscatname,
                 Null As Twolosscode,
                 Null As Twolossname,
                 Null As Threelosscode,
                 Null As Threelossname,
                 Null As Fourlevelcode,
                 Null As Fourlevelloss,
                 c.Damagecode As Occreasoncode,
                 c.Damagename As Occreasonname,
                 c.Mercyflag As Mercyflag,
                 (Select Max(Itemkindno)
                    From Nclaimuser.Prplclaimkind t
                   Where t.Registno = c.Registno
                     And t.Kindcode = a.Kindcode) As Itemkindno,
                 Null As Itemtypecode,
                 '000000' As Itemdetailname,
                 '000000' As Lossitemname,
                 Nvl(c.Injurynumber, 1) As Unitlossquantity,
                 Nvl(c.Lossname, '无') As Lossdegree,
                 a.Currency As Currencycode,
                 0 As Currencyamount,
                 0 As Deductible,
                 0 As Deductiblerate,
                 a.Currency As Itemvalueorigcur,
                 Nvl(a.FEEAMT, 0) As Itemvalueorig,
                 Nvl(a.FEEAMT, 0) As Itemvalue,
                 a.Currency As Unitsumlossorigcur,
                 a.FEEAMT As Unitsumlossorig,
                 a.FEEAMT As Unitsumloss,
                 Dbms_Lob.Substr('') As Unitcompensateexp,
                 a.Currency As Unitsumrestorigcur,
                 Null As Unitsumrestorig,
                 Null As Unitsumrest,
                 Null As Unitsumdeflossorigcur,
                 Null As Unitsumdeflossorig,
                 Null As Unitsumdefloss,
                 'CNY' As Finalpayorigcur,
                 a.FEEAMT As Finalpayorig,
                 a.FEEAMT As Standpay,
                 Dbms_Lob.Substr(c.Ltext) As Unitlctext,
                 a.Currency As Currency,
                 a.FEEAMT As Standpayorig,
                 Nvl(a.FEEAMT, 0) As Unitsumpaid,
                 a.Currency As Unitsumprepaidorigcur,
                 0 As Unitsumprepaidorig,
                 0 As Unitsumprepaid,
                 a.Currency As Unitsumrealpayorigcur,
                 a.FEEAMT As Unitsumrealpayorig,
                 a.FEEAMT As Unitsumrealpay,
                 a.Currency As Unitexceptdeductibeorigcur,
                 0 As Unitexceptdeductibeyorig,
                 0 As Unitexceptdeductibe,
                 0 As Deprerate,
                 Null As Losstypeorigcur,
                 Null As Losstypeorig,
                 Null As Losstype,
                 d.Underwritedate As Underwriteenddate,
                 Case
                   When (Select Payrefflag
                           From Ywuser.Prpjplanfee
                          Where Certino = d.Compensateno
                            And Serialno = '1') = '0' Then
                    '1'
                   Else
                    '2'
                 End As Pfstatus,
                 d.Recoveryflag As Recoveryflag,
                 d.Lawsuitflag As Lawsuitflag,
                 '' As Lawsuitno,
                 Nvl(Decode(c.Casetype, '0', '1', c.Casetype), '9') As Givetype,
                 Dbms_Lob.Substr(Decode(c.Casetype,
                                        '0',
                                        '拒赔',
                                        '1',
                                        '拒赔',
                                        '2',
                                        '赔付',
                                        '其他')) As Givetypedescription,
                 c.Cancelreason As Refusepayrcode,
                 case when c.classcode in ('61','62') then '306' else '301' end As Getdutykind,
                 '' As Lossfeetype,
                 '' As Criticalillnesscode,
                 1 As Claimrate,
                 Null As Claimratioend,
                 Substr(d.Comcode, 0, 6) || '00' As Underwritecomcode,
                 (Select Comcname
                    From ywuser.Prpdcompany
                   Where Comcode = Substr(d.Comcode, 0, 6) || '00') As Underwritecomname,
                 Null As Ishospitalflag,
                 Null As Hospitalcode,
                 Null As Hospitalname,
                 Null As Hospitalregioncode,
                 Null As Hospitalregion,
                 Null As Disabilitycode,
                 Null As Disabilityclass,
                 b.Transactiondate As Transactiondate,
                 b.Batchno As Batchno,
                 b.transactionno As Busino
            From Pr_All_No                 b,
                 Nclaimuser.Prplclaim      c,
                 Nclaimuser.Prplcharge     a,
                 Nclaimuser.Prplcompensate d
           Where b.Datatype = i_dataType
             And c.Claimno = d.Claimno
             And d.Compensateno = b.Certino
             And a.Compensateno = b.Certino
             And d.Compensateno = a.Compensateno
             And b.Transactionreason = '15') Claimpolicy;
             commit;
end   MID_Proc_PR_ClaimForDataType;
end Pak_PR_Claim;
/

prompt
prompt Creating package body PAK_PR_OTHER
prompt ==================================
prompt
create or replace package body przxuser.Pak_PR_Other is
procedure Proc_PR_Other(i_startdate date, i_enddate date) is
begin
DBMS_OUTPUT.put_line('Proc_PR_Other' || i_startdate || '-' || i_enddate);
end Proc_PR_Other;

procedure Proc_PR_OtherForDataType(i_startdate date, i_enddate date, i_dataType varchar2) is
begin
DBMS_OUTPUT.put_line('Proc_PR_OtherForDataType' || i_startdate || '-' || i_enddate);
end Proc_PR_OtherForDataType;

procedure Proc_PR_Other_Black(i_startdate date, i_enddate date) is
begin
DBMS_OUTPUT.put_line('Proc_PR_Other_Black' || i_startdate || '-' || i_enddate);
end Proc_PR_Other_Black;

procedure Proc_PR_Other_BlackForDataType(i_startdate date, i_enddate date, i_dataType varchar2) is
begin
DBMS_OUTPUT.put_line('Proc_PR_Other_BlackForDataType' || i_startdate || '-' || i_enddate);
end Proc_PR_Other_BlackForDataType;

procedure Proc_PR_Other_Black_ForCus(i_customerCode varchar2, i_dataType varchar2) is
begin
DBMS_OUTPUT.put_line('Proc_PR_Other_Black_ForCus' || i_customerCode || '-' || i_dataType);
end Proc_PR_Other_Black_ForCus;

end Pak_PR_Other;
/

prompt
prompt Creating package body PAK_PR_PAYMENT
prompt ====================================
prompt
create or replace package body przxuser.Pak_PR_Payment is
procedure Proc_PR_Payment(i_startdate date, i_enddate date) is
begin
Proc_PR_PaymentForDataType(i_startdate, i_enddate, 'inc');
DBMS_OUTPUT.put_line('Proc_PR_Payment' || i_startdate || '-' || i_enddate);
end Proc_PR_Payment;

procedure Proc_PR_PaymentForDataType(i_startdate date, i_enddate date, i_dataType varchar2) is
begin
--续期,20190813补充二期产品表"09-续期"交易类型提数
INSERT INTO PR_ALL_NO SELECT PAK_PR_UTILS.FN_PR_NEXTTRANSACTIONNO() TRANSACTIONNO, '09' TRANSACTIONREASON, 'Payment' MODELTYPE, A.CERTINO CERTINO, 'P' CERTITYPE, A.PAYREFDATE TRANSACTINONATE, A.SERIALNO FLAG, SYSDATE CREATETIME, I_DATATYPE DATATYPE, PAK_PR_UTILS.FN_PR_COMPANYCODE() COMPANYCODE, A.POLICYNO, PAK_PR_UTILS.FN_PR_NEXTBATCHNO(I_DATATYPE) BATCHNO FROM YWUSER.PRPJPAYREFREC A WHERE A.PAYREFDATE >= I_STARTDATE AND A.PAYREFDATE < I_ENDDATE + 1 AND A.PAYREFREASON IN ('R25', 'R20') AND A.CERTITYPE IN ('P') AND EXISTS (SELECT 1 FROM ywuser.prpdriskprext RISK WHERE A.RISKCODE = RISK.RISKCODE AND RISK.VALIDSTATUS = '1') AND NOT EXISTS (SELECT 1 FROM fccbuser.PRPCMAIN MAIN WHERE MAIN.POLICYNO = A.POLICYNO AND MAIN.COINSFLAG IN ('2', '4'));
INSERT INTO PR_ALL_NO select pak_pr_utils.Fn_PR_NextTransactionNo() transactionno, '09' transactionreason, 'Payment' modeltype, a.certino certino, 'P' certitype, a.payrefdate transactinonate, a.serialno flag, sysdate createtime, i_dataType dataType, Pak_PR_Utils.Fn_PR_CompanyCode() CompanyCode, a.policyno,Pak_PR_Utils.Fn_PR_NextBatchNo(i_dataType) BatchNo from ywuser.prpjpayrefrec a where a.payrefdate >= i_startdate and a.payrefdate < i_enddate + 1 and a.payrefreason in ('R25', 'R20') and a.certitype in ('P') and exists(select 1 from Prpdriskforreport risk where a.riskcode = risk.riskcode and risk.validstatus = '1')  and not exists (SELECT 1 FROM fccbuser.PRPCMAIN main where main.policyno=a.policyno  AND main.COINSFLAG  in ('2','4'));
DBMS_OUTPUT.put_line('Proc_PR_PaymentForDataType' || i_startdate || '-' || i_enddate || '-' || i_dataType);
end Proc_PR_PaymentForDataType;

procedure Proc_PR_PaymentForCertiNo(i_certiNo varchar2, i_dataType varchar2) is
begin
DBMS_OUTPUT.put_line('Proc_PR_PaymentForCertiNo' || i_certiNo || '-' || i_dataType);
end Proc_PR_PaymentForCertiNo;

end Pak_PR_Payment;
/

prompt
prompt Creating package body PAK_PR_POLICY
prompt ===================================
prompt
create or replace package body przxuser.Pak_PR_Policy is
procedure Proc_PR_Policy(i_startdate date, i_enddate date) is
v_remark varchar2(400); --备注
v_errormsg varchar2(1000); --错误信息
begin
Proc_PR_PolicyForDataType(i_startdate, i_enddate, 'inc');
end Proc_PR_Policy;

procedure Proc_PR_PolicyForDataType(i_startdate date, i_enddate date, i_dataType varchar2) is
v_remark varchar2(400); --备注
v_errormsg varchar2(1000); --错误信息
warndesc clob;
begin
----****新保单与批单开始****----
if i_dataType <> 'his' then --非存量
insert into pr_all_no select pak_pr_utils.Fn_PR_NextTransactionNo() transactionno, pak_pr_utils.Fn_PR_Policy_TransactionReason(a.policyno, a.endorseqno, a.LASTPOLICYNO) transactionreason, 'Policy' modeltype, nvl(a.endorseno,a.policyno) certino, decode(a.policyno, a.endorseno, 'C', 'E') certitype, a.createtime transactinonate, '--' flag, sysdate createtime, i_dataType dataType, Pak_PR_Utils.Fn_PR_CompanyCode() CompanyCode, a.policyno,Pak_PR_Utils.Fn_PR_NextBatchNo(i_dataType) BatchNo from fccbuser.prpcopymain a where a.createtime >= i_startdate and a.createtime < (i_enddate + 1) and a.underwriteflag in ('1', '3') AND a.COINSFLAG not in ('2','4') and exists(select 1 from Prpdriskforreport risk where a.riskcode = risk.riskcode and risk.validstatus = '1');
--20181217,加上二期险种非存量
insert into pr_all_no select pak_pr_utils.Fn_PR_NextTransactionNo() transactionno, pak_pr_utils.Fn_PR_Policy_TransactionReason(a.policyno, a.endorseqno, a.LASTPOLICYNO) transactionreason, 'Policy' modeltype, nvl(a.endorseno,a.policyno) certino, decode(a.policyno, a.endorseno, 'C', 'E') certitype, a.createtime transactinonate, '--' flag, sysdate createtime, i_dataType dataType, Pak_PR_Utils.Fn_PR_CompanyCode() CompanyCode, a.policyno,Pak_PR_Utils.Fn_PR_NextBatchNo(i_dataType) BatchNo from fccbuser.prpcopymain a where a.createtime >= i_startdate and a.createtime < (i_enddate + 1) and a.underwriteflag in ('1', '3') AND a.COINSFLAG not in ('2','4') and exists(select 1 from ywuser.prpdriskprext risk where a.riskcode = risk.riskcode and risk.validstatus = '1');
end if;
--
if i_dataType = 'his' then --存量只报二期产品
--存量保单,只能返回"04-新保"或者"05-续保"
--insert into pr_all_no select pak_pr_utils.Fn_PR_NextTransactionNo() transactionno, pak_pr_utils.Fn_PR_Policy_TransactionReason(a.policyno, '000', a.ENDORSEQNO) transactionreason, 'Policy' modeltype, a.policyno certino, 'C' certitype, a.CREATETIME transactinonate, '03' flag, sysdate createtime, i_dataType dataType, Pak_PR_Utils.Fn_PR_CompanyCode() CompanyCode, a.policyno,Pak_PR_Utils.Fn_PR_NextBatchNo(i_dataType) BatchNo from fccbuser.prpcopymain a where a.CREATETIME >= i_startdate and a.CREATETIME < (i_enddate + 1) and a.underwriteflag in ('1', '3') AND a.COINSFLAG not in ('2','4')  and exists(select 1 from Prpdriskforreport risk where a.riskcode = risk.riskcode and risk.validstatus = '1');
insert into pr_all_no select pak_pr_utils.Fn_PR_NextTransactionNo() transactionno, pak_pr_utils.Fn_PR_Policy_TransactionReason(a.policyno, '000', a.ENDORSEQNO) transactionreason, 'Policy' modeltype, a.policyno certino, 'C' certitype, a.CREATETIME transactinonate, '02' flag, sysdate createtime, i_dataType dataType, Pak_PR_Utils.Fn_PR_CompanyCode() CompanyCode, a.policyno,Pak_PR_Utils.Fn_PR_NextBatchNo(i_dataType) BatchNo from fccbuser.prpcopymain a where a.CREATETIME >= i_startdate and a.CREATETIME < (i_enddate + 1) and a.underwriteflag in ('1', '3') AND a.COINSFLAG not in ('2','4')  and exists(select 1 from ywuser.prpdriskprext risk where a.riskcode = risk.riskcode and risk.validstatus = '1');
--存量批单,只能返回"08-续期"
--insert into pr_all_no select pak_pr_utils.Fn_PR_NextTransactionNo() transactionno, '08' transactionreason, 'Policy' modeltype, nvl(a.endorseno,a.policyno) certino, 'E' certitype, a.endordate transactinonate, '03' flag, sysdate createtime, i_dataType dataType, Pak_PR_Utils.Fn_PR_CompanyCode() CompanyCode, a.policyno,Pak_PR_Utils.Fn_PR_NextBatchNo(i_dataType) BatchNo from fccbuser.prpphead a where a.endordate >= i_startdate and a.endordate < (i_enddate + 1) and a.underwriteflag in ('1', '3') and exists(select 1 from Prpdriskforreport risk where a.riskcode = risk.riskcode and risk.validstatus = '1') and not exists (SELECT 1 FROM fccbuser.prpcmain main where main.policyno=a.policyno  AND main.COINSFLAG  in ('2','4') );
insert into pr_all_no select pak_pr_utils.Fn_PR_NextTransactionNo() transactionno, '08' transactionreason, 'Policy' modeltype, nvl(a.endorseno,a.policyno) certino, 'E' certitype, a.endordate transactinonate, '02' flag, sysdate createtime, i_dataType dataType, Pak_PR_Utils.Fn_PR_CompanyCode() CompanyCode, a.policyno,Pak_PR_Utils.Fn_PR_NextBatchNo(i_dataType) BatchNo from fccbuser.prpphead a where a.endordate >= i_startdate and a.endordate < (i_enddate + 1) and a.underwriteflag in ('1', '3') and exists(select 1 from ywuser.prpdriskprext risk where a.riskcode = risk.riskcode and risk.validstatus = '1') and not exists (SELECT 1 FROM fccbuser.prpcmain main where main.policyno=a.policyno  AND main.COINSFLAG  in ('2','4') );
end if;
----****新保单与批单结束****----

----****满期****----剔除退保,剔除注销
insert into pr_all_no select pak_pr_utils.Fn_PR_NextTransactionNo() transactionno, '10' transactionreason, 'Policy' modeltype, a.policyno certino, 'C' certitype, a.enddate transactinonate, '03' flag, sysdate createtime, i_dataType dataType, Pak_PR_Utils.Fn_PR_CompanyCode() CompanyCode, a.policyno,Pak_PR_Utils.Fn_PR_NextBatchNo(i_dataType) BatchNo from fccbuser.prpcmain a where a.enddate >= i_startdate and a.enddate < (i_enddate + 1) and a.cancelflag='0' and a.surrenderind='0' and a.underwriteflag in ('1', '3') AND a.COINSFLAG not in ('2','4')  and exists(select 1 from Prpdriskforreport risk where a.riskcode = risk.riskcode and risk.validstatus = '1');
insert into pr_all_no select pak_pr_utils.Fn_PR_NextTransactionNo() transactionno, '10' transactionreason, 'Policy' modeltype, a.policyno certino, 'C' certitype, a.enddate transactinonate, '02' flag, sysdate createtime, i_dataType dataType, Pak_PR_Utils.Fn_PR_CompanyCode() CompanyCode, a.policyno,Pak_PR_Utils.Fn_PR_NextBatchNo(i_dataType) BatchNo from fccbuser.prpcmain a where a.enddate >= i_startdate and a.enddate < (i_enddate + 1) and a.cancelflag='0' and a.surrenderind='0' and a.underwriteflag in ('1', '3') AND a.COINSFLAG not in ('2','4')  and exists(select 1 from ywuser.prpdriskprext risk where a.riskcode = risk.riskcode and risk.validstatus = '1');
----****满期****----
--备注
v_remark := 'Proc_PR_PolicyForDataType  取数日期 >= ' || to_char(i_startdate, 'yyyy-MM-dd') || ' < ' || to_char(i_enddate + 1, 'yyyy-MM-dd');
--出错处理开始
exception
when others then rollback;
--
v_errormsg := substr(sqlerrm, 0, 900);
warndesc := v_remark || v_errormsg;
--错误日志
insert into PR_ALL_ERRLOG values(sys_guid(), i_dataType, 'Policy', 'Proc_PR_PolicyForDataType', '无', sysdate, v_errormsg, v_remark);
insert into EarlyWarningMsg (WARNID, WARNTYPE, WARNOBJECT, WARNDESC, WARNDATE, WARNTIME, WARNSTATUS, WARNSTATUSDESC, WARNSENDTIMES, WARNWAY, REMARK)
values (to_char(systimestamp, 'yyyymmddhh24missff6'), '01', '增量数据提取处理异常请尽快处理', warndesc, to_date(to_char(sysdate,'yyyy-mm-dd'), 'yyyy-mm-dd'), to_char(sysdate,'hh24:mi:ss'), '00', '初始化', 0, '01', '');
--
commit;
--出错处理结束
DBMS_OUTPUT.put_line(v_remark);
end Proc_PR_PolicyForDataType;

procedure Proc_PR_Policy_ForPolicyNo(policyNo varchar2, dataType varchar2) is
v_remark varchar2(400); --备注
v_errormsg varchar2(1000); --错误信息
begin
DBMS_OUTPUT.put_line('Proc_PR_Policy_ForPolicyNo' || policyNo || '-' || dataType);
end Proc_PR_Policy_ForPolicyNo;

procedure Proc_PR_Policy_ForEndorseNo(endorseNo varchar2, dataType varchar2) is
v_remark varchar2(400); --备注
v_errormsg varchar2(1000); --错误信息
begin
DBMS_OUTPUT.put_line('Proc_PR_Policy_ForEndorseNo' || endorseNo || '-' || dataType);
end Proc_PR_Policy_ForEndorseNo;

end Pak_PR_Policy;
/

prompt
prompt Creating package body PAK_PR_PRODUCT
prompt ====================================
prompt
create or replace package body przxuser.Pak_PR_Product is
procedure Proc_PR_Product(i_startdate date, i_enddate date) is
begin
Proc_PR_ProductForDataType(i_startdate, i_enddate, 'inc');
end Proc_PR_Product;

procedure Proc_PR_ProductForDataType(i_startdate date, i_enddate date, i_dataType varchar2) is
v_remark varchar2(400); --备注
v_errormsg varchar2(1000); --错误信息
begin
--****增量/重报/存量/补报提数入口开始****--
--产品新增
insert into pr_all_no select pak_pr_utils.Fn_PR_NextTransactionNo() transactionno, '01' transactionreason, 'Product' modeltype, a.riskcode certino, '--' certitype, a.createtime transactinonate, '03' flag, sysdate createtime, i_dataType dataType, Pak_PR_Utils.Fn_PR_CompanyCode() CompanyCode, null policyno,Pak_PR_Utils.Fn_PR_NextBatchNo(i_dataType) BatchNo from Prpdriskforreport a where a.validstatus = '1' and to_char(a.createtime, 'yyyy-MM-dd') >= to_char(i_startdate, 'yyyy-MM-dd') and to_char(a.createtime, 'yyyy-MM-dd') < to_char(i_enddate + 1, 'yyyy-MM-dd');
insert into pr_all_no select pak_pr_utils.Fn_PR_NextTransactionNo() transactionno, '01' transactionreason, 'Product' modeltype, a.riskcode certino, '--' certitype, a.createtime transactinonate, '02' flag, sysdate createtime, i_dataType dataType, Pak_PR_Utils.Fn_PR_CompanyCode() CompanyCode, null policyno,Pak_PR_Utils.Fn_PR_NextBatchNo(i_dataType) BatchNo from ywuser.prpdriskprext a where a.validstatus = '1' and to_char(a.createtime, 'yyyy-MM-dd') >= to_char(i_startdate, 'yyyy-MM-dd') and to_char(a.createtime, 'yyyy-MM-dd') < to_char(i_enddate + 1, 'yyyy-MM-dd');
--产品变更
insert into pr_all_no select pak_pr_utils.Fn_PR_NextTransactionNo() transactionno, '02' transactionreason, 'Product' modeltype, a.riskcode certino, '--' certitype, a.updatetime transactinonate, '03' flag, sysdate createtime, i_dataType dataType, Pak_PR_Utils.Fn_PR_CompanyCode() CompanyCode, null policyno,Pak_PR_Utils.Fn_PR_NextBatchNo(i_dataType) BatchNo from Prpdriskforreport a where a.validstatus = '1' and a.updatetime > a.createtime and to_char(a.updatetime, 'yyyy-MM-dd') >= to_char(i_startdate, 'yyyy-MM-dd') and to_char(a.updatetime, 'yyyy-MM-dd') < to_char(i_enddate + 1, 'yyyy-MM-dd');
insert into pr_all_no select pak_pr_utils.Fn_PR_NextTransactionNo() transactionno, '02' transactionreason, 'Product' modeltype, a.riskcode certino, '--' certitype, a.updatetime transactinonate, '02' flag, sysdate createtime, i_dataType dataType, Pak_PR_Utils.Fn_PR_CompanyCode() CompanyCode, null policyno,Pak_PR_Utils.Fn_PR_NextBatchNo(i_dataType) BatchNo from ywuser.prpdriskprext a where a.validstatus = '1' and a.updatetime > a.createtime and to_char(a.updatetime, 'yyyy-MM-dd') >= to_char(i_startdate, 'yyyy-MM-dd') and to_char(a.updatetime, 'yyyy-MM-dd') < to_char(i_enddate + 1, 'yyyy-MM-dd');
--产品退市
insert into pr_all_no select pak_pr_utils.Fn_PR_NextTransactionNo() transactionno, '03' transactionreason, 'Product' modeltype, a.riskcode certino, '--' certitype, a.updatetime transactinonate, '03' flag, sysdate createtime, i_dataType dataType, Pak_PR_Utils.Fn_PR_CompanyCode() CompanyCode, null policyno,Pak_PR_Utils.Fn_PR_NextBatchNo(i_dataType) BatchNo from Prpdriskforreport a where a.validstatus <> '1' and to_char(a.updatetime, 'yyyy-MM-dd') >= to_char(i_startdate, 'yyyy-MM-dd') and to_char(a.updatetime, 'yyyy-MM-dd') < to_char(i_enddate + 1, 'yyyy-MM-dd');
insert into pr_all_no select pak_pr_utils.Fn_PR_NextTransactionNo() transactionno, '03' transactionreason, 'Product' modeltype, a.riskcode certino, '--' certitype, a.updatetime transactinonate, '02' flag, sysdate createtime, i_dataType dataType, Pak_PR_Utils.Fn_PR_CompanyCode() CompanyCode, null policyno,Pak_PR_Utils.Fn_PR_NextBatchNo(i_dataType) BatchNo from ywuser.prpdriskprext a where a.validstatus <> '1' and to_char(a.updatetime, 'yyyy-MM-dd') >= to_char(i_startdate, 'yyyy-MM-dd') and to_char(a.updatetime, 'yyyy-MM-dd') < to_char(i_enddate + 1, 'yyyy-MM-dd');
--****增量/重报/存量/补报提数入口结束****--
--提交事务
commit;
--备注
v_remark := 'Proc_PR_ProductForDataType  prpdriskprext.createtime >= ' || to_char(i_startdate, 'yyyy-MM-dd') || ' < ' || to_char(i_enddate + 1, 'yyyy-MM-dd') || ' i_dataType' || i_dataType;
--出错处理开始
exception
when others then rollback;
--
v_errormsg := substr(sqlerrm, 0, 900);
--
insert into PR_ALL_ERRLOG values(sys_guid(), i_dataType, 'Product', 'Proc_PR_ProductForDataType', '无', sysdate, v_errormsg, v_remark);
--
commit;
--出错处理结束
--日志输出
DBMS_OUTPUT.put_line(v_remark);
end Proc_PR_ProductForDataType;

procedure Proc_PR_ProductForRiskCode(i_riskcode varchar2, i_dataType varchar2) is
v_remark varchar2(400); --备注
v_errormsg varchar2(1000); --错误信息
begin
insert into pr_all_no select pak_pr_utils.Fn_PR_NextTransactionNo() transactionno, decode(a.validstatus, '0', '03', decode(SIGN(a.updatetime - a.createtime), 1, '02', '01')) transactionreason, 'Product' modeltype, a.riskcode certino, '--' certitype, a.createtime transactinonate, '--' flag, sysdate createtime, i_dataType dataType, Pak_PR_Utils.Fn_PR_CompanyCode() CompanyCode, null policyno,Pak_PR_Utils.Fn_PR_NextBatchNo(i_dataType) BatchNo from Prpdriskforreport a where a.riskcode = i_riskcode;
--提交事务
commit;
--备注
v_remark := 'Proc_PR_ProductForRiskCode' || i_riskcode || '-' || i_dataType;
--出错处理开始
exception
when others then rollback;
--
v_errormsg := substr(sqlerrm, 0, 900);
--
insert into PR_ALL_ERRLOG values(sys_guid(), i_dataType, 'Product', 'Proc_PR_ProductForRiskCode', i_riskcode, sysdate, v_errormsg, v_remark);
--
commit;
--出错处理结束
--日志输出
DBMS_OUTPUT.put_line(v_remark);
end Proc_PR_ProductForRiskCode;

end Pak_PR_Product;
/

prompt
prompt Creating package body PAK_PR_REINS
prompt ==================================
prompt
create or replace package body przxuser.Pak_PR_Reins is
procedure Proc_PR_Reins(i_startdate date, i_enddate date) is
Begin
  Proc_PR_ReinsForDataType(i_startdate,i_enddate,'inc');
DBMS_OUTPUT.put_line('Proc_PR_Reins' || i_startdate || '-' || i_enddate);
end Proc_PR_Reins;

procedure Proc_PR_ReinsForDataType(i_startdate date, i_enddate date, i_dataType varchar2) is
v_remark varchar2(400); --备注
v_errormsg varchar2(1000); --错误信息
warndesc clob;
begin
----****20-再保合约新增****----
Insert Into Pr_All_No  Select Pak_Pr_Utils.Fn_Pr_Nexttransactionno() Transactionno,'20' Transactionreason,'Reins' Modeltype,a.TREATYNO Certino,'--' Certitype,a.CREATEDATE Transactinonate,'03' Flag,Sysdate Createtime,i_Datatype Datatype,Pak_Pr_Utils.Fn_Pr_Companycode() Companycode,Null Policyno,Pak_Pr_Utils.Fn_Pr_Nextbatchno(i_Datatype) Batchno    From ywuser.FhTreaty a   Where  To_Char(a.CREATEDATE, 'yyyy-MM-dd') >=To_Char(i_Startdate, 'yyyy-MM-dd')     And To_Char(a.CREATEDATE, 'yyyy-MM-dd') <To_Char(i_Enddate + 1, 'yyyy-MM-dd') and a.TreatyType in('11','21','22','31','41','42','51','61','71','72','73','74');
--Insert Into Pr_All_No  Select Pak_Pr_Utils.Fn_Pr_Nexttransactionno() Transactionno,'20' Transactionreason,'Reins' Modeltype,a.TREATYNO Certino,'--' Certitype,a.CREATEDATE Transactinonate,'02' Flag,Sysdate Createtime,i_Datatype Datatype,Pak_Pr_Utils.Fn_Pr_Companycode() Companycode,Null Policyno,Pak_Pr_Utils.Fn_Pr_Nextbatchno(i_Datatype) Batchno    From ywuser.FhTreaty a   Where  To_Char(a.CREATEDATE, 'yyyy-MM-dd') >=To_Char(i_Startdate, 'yyyy-MM-dd')     And To_Char(a.CREATEDATE, 'yyyy-MM-dd') <To_Char(i_Enddate + 1, 'yyyy-MM-dd') and a.TreatyType in('11','21','22','31','41','42','51','61','71','72','73','74');
----****22-再保合约转续****---- 根据 EXTENDDATE 转续日期判断
Insert Into Pr_All_No  Select Pak_Pr_Utils.Fn_Pr_Nexttransactionno() Transactionno,'22' Transactionreason,'Reins' Modeltype,a.TREATYNO Certino,'--' Certitype,a.EXTENDDATE Transactinonate,'03' Flag,Sysdate Createtime,i_Datatype Datatype,Pak_Pr_Utils.Fn_Pr_Companycode() Companycode,Null Policyno,Pak_Pr_Utils.Fn_Pr_Nextbatchno(i_Datatype) Batchno    From ywuser.FhTreaty a   Where  To_Char(a.EXTENDDATE, 'yyyy-MM-dd') >=To_Char(i_Startdate, 'yyyy-MM-dd')     And To_Char(a.EXTENDDATE, 'yyyy-MM-dd') <To_Char(i_Enddate + 1, 'yyyy-MM-dd') and a.TreatyType in('11','21','22','31','41','42','51','61','71','72','73','74');

----****23-再保合约关闭****---- 根据 CLOSEDATE 转续日期判断
Insert Into Pr_All_No  Select Pak_Pr_Utils.Fn_Pr_Nexttransactionno() Transactionno,'23' Transactionreason,'Reins' Modeltype,a.TREATYNO Certino,'--' Certitype,a.CLOSEDATE Transactinonate,'03' Flag,Sysdate Createtime,i_Datatype Datatype,Pak_Pr_Utils.Fn_Pr_Companycode() Companycode,Null Policyno,Pak_Pr_Utils.Fn_Pr_Nextbatchno(i_Datatype) Batchno    From ywuser.FhTreaty a   Where  To_Char(a.CLOSEDATE, 'yyyy-MM-dd') >=To_Char(i_Startdate, 'yyyy-MM-dd')     And To_Char(a.CLOSEDATE, 'yyyy-MM-dd') <To_Char(i_Enddate + 1, 'yyyy-MM-dd') and a.TreatyType in('11','21','22','31','41','42','51','61','71','72','73','74');


----****分出****----根据平台20190731-FAQ冲销的需要报送
----****24-再保分出业务新增****----  20190916取复核日期UNDERWRITEENDDATE,并且 a.UNDERWRITEFLAG='1' 复核通过
Insert Into Pr_All_No  Select Pak_Pr_Utils.Fn_Pr_Nexttransactionno() Transactionno,'24' Transactionreason,'Reins' Modeltype,a.REPOLICYNO Certino,'C' Certitype,a.UNDERWRITEENDDATE Transactinonate,'03' Flag,Sysdate Createtime,i_Datatype Datatype,Pak_Pr_Utils.Fn_Pr_Companycode() Companycode,a.POLICYNO Policyno,Pak_Pr_Utils.Fn_Pr_Nextbatchno(i_Datatype) Batchno    From Ywuser.FcoRepolicy a   Where  To_Char(a.underwriteenddate, 'yyyy-MM-dd') >=To_Char(i_Startdate, 'yyyy-MM-dd')     And To_Char(a.underwriteenddate, 'yyyy-MM-dd') < To_Char(i_Enddate + 1, 'yyyy-MM-dd') and a.UNDERWRITEFLAG='1'  and exists(select 1 from prpdriskforreport risk where a.riskcode = risk.riskcode and risk.validstatus = '1') and not exists (SELECT 1 FROM ywuser.prpcmain main where main.policyno=a.policyno AND main.riskcode NOT LIKE '1%'  AND main.COINSFLAG  in ('2','4') );
Insert Into Pr_All_No  Select Pak_Pr_Utils.Fn_Pr_Nexttransactionno() Transactionno,'24' Transactionreason,'Reins' Modeltype,a.REPOLICYNO Certino,'C' Certitype,a.UNDERWRITEENDDATE Transactinonate,'02' Flag,Sysdate Createtime,i_Datatype Datatype,Pak_Pr_Utils.Fn_Pr_Companycode() Companycode,a.POLICYNO Policyno,Pak_Pr_Utils.Fn_Pr_Nextbatchno(i_Datatype) Batchno    From Ywuser.FcoRepolicy a   Where  To_Char(a.underwriteenddate, 'yyyy-MM-dd') >=To_Char(i_Startdate, 'yyyy-MM-dd')     And To_Char(a.underwriteenddate, 'yyyy-MM-dd') < To_Char(i_Enddate + 1, 'yyyy-MM-dd') and a.UNDERWRITEFLAG='1'  and exists(select 1 from ywuser.prpdriskprext risk where a.riskcode = risk.riskcode and risk.validstatus = '1') and not exists (SELECT 1 FROM ywuser.prpcmain main where main.policyno=a.policyno AND main.riskcode NOT LIKE '1%'  AND main.COINSFLAG  in ('2','4') );
----****25-再保分出业务批改****---- a.UNDERWRITEFLAG='1' 复核通过
Insert Into Pr_All_No  Select Pak_Pr_Utils.Fn_Pr_Nexttransactionno() Transactionno,'25' Transactionreason,'Reins' Modeltype,a.REENDORNO Certino,'E' Certitype,a.UNDERWRITEENDDATE Transactinonate,'03' Flag,Sysdate Createtime,i_Datatype Datatype,Pak_Pr_Utils.Fn_Pr_Companycode() Companycode,a.POLICYNO Policyno,Pak_Pr_Utils.Fn_Pr_Nextbatchno(i_Datatype) Batchno    From Ywuser.FpoReendor a   Where  To_Char(a.UNDERWRITEENDDATE, 'yyyy-MM-dd') >=To_Char(i_Startdate, 'yyyy-MM-dd')     And To_Char(a.UNDERWRITEENDDATE, 'yyyy-MM-dd') < To_Char(i_Enddate + 1, 'yyyy-MM-dd') and a.UNDERWRITEFLAG='1'  and exists(select 1 from prpdriskforreport risk where a.riskcode = risk.riskcode and risk.validstatus = '1') and not exists (SELECT 1 FROM ywuser.prpcmain main where main.policyno=a.policyno AND main.riskcode NOT LIKE '1%'  AND main.COINSFLAG  in ('2','4') ) and exists (SELECT 1 FROM ywuser.prpphead phead where a.endorno=phead.endorseno and phead.UNDERWRITEFLAG in ('1','3'));
Insert Into Pr_All_No  Select Pak_Pr_Utils.Fn_Pr_Nexttransactionno() Transactionno,'25' Transactionreason,'Reins' Modeltype,a.REENDORNO Certino,'E' Certitype,a.UNDERWRITEENDDATE Transactinonate,'02' Flag,Sysdate Createtime,i_Datatype Datatype,Pak_Pr_Utils.Fn_Pr_Companycode() Companycode,a.POLICYNO Policyno,Pak_Pr_Utils.Fn_Pr_Nextbatchno(i_Datatype) Batchno    From Ywuser.FpoReendor a   Where  To_Char(a.UNDERWRITEENDDATE, 'yyyy-MM-dd') >=To_Char(i_Startdate, 'yyyy-MM-dd')     And To_Char(a.UNDERWRITEENDDATE, 'yyyy-MM-dd') < To_Char(i_Enddate + 1, 'yyyy-MM-dd') and a.UNDERWRITEFLAG='1'  and exists(select 1 from ywuser.prpdriskprext risk where a.riskcode = risk.riskcode and risk.validstatus = '1') and not exists (SELECT 1 FROM ywuser.prpcmain main where main.policyno=a.policyno AND main.riskcode NOT LIKE '1%'  AND main.COINSFLAG  in ('2','4') )and exists (SELECT 1 FROM ywuser.prpphead phead where a.endorno=phead.endorseno and phead.UNDERWRITEFLAG in ('1','3'));
----****26-再保分出业务摊回****---- a.UNDERWRITEFLAG='1' 复核通过
Insert Into Pr_All_No  Select Pak_Pr_Utils.Fn_Pr_Nexttransactionno() Transactionno,'26' Transactionreason,'Reins' Modeltype,a.REPAYNO Certino,'--' Certitype,a.REPORTDATE Transactinonate,'03' Flag,Sysdate Createtime,i_Datatype Datatype,Pak_Pr_Utils.Fn_Pr_Companycode() Companycode,a.POLICYNO Policyno,Pak_Pr_Utils.Fn_Pr_Nextbatchno(i_Datatype) Batchno    From Ywuser.florepay a   Where  To_Char(a.REPORTDATE, 'yyyy-MM-dd') >=To_Char(i_Startdate, 'yyyy-MM-dd')     And To_Char(a.REPORTDATE, 'yyyy-MM-dd') < To_Char(i_Enddate + 1, 'yyyy-MM-dd') and a.UNDERWRITEFLAG='1'  and exists(select 1 from prpdriskforreport risk where a.riskcode = risk.riskcode and risk.validstatus = '1') and not exists (SELECT 1 FROM ywuser.prpcmain main where main.policyno=a.policyno AND main.riskcode NOT LIKE '1%'  AND main.COINSFLAG  in ('2','4') );
Insert Into Pr_All_No  Select Pak_Pr_Utils.Fn_Pr_Nexttransactionno() Transactionno,'26' Transactionreason,'Reins' Modeltype,a.REPAYNO Certino,'--' Certitype,a.REPORTDATE Transactinonate,'02' Flag,Sysdate Createtime,i_Datatype Datatype,Pak_Pr_Utils.Fn_Pr_Companycode() Companycode,a.POLICYNO Policyno,Pak_Pr_Utils.Fn_Pr_Nextbatchno(i_Datatype) Batchno    From Ywuser.florepay a   Where  To_Char(a.REPORTDATE, 'yyyy-MM-dd') >=To_Char(i_Startdate, 'yyyy-MM-dd')     And To_Char(a.REPORTDATE, 'yyyy-MM-dd') < To_Char(i_Enddate + 1, 'yyyy-MM-dd') and a.UNDERWRITEFLAG='1'  and exists(select 1 from ywuser.prpdriskprext risk where a.riskcode = risk.riskcode and risk.validstatus = '1') and not exists (SELECT 1 FROM ywuser.prpcmain main where main.policyno=a.policyno AND main.riskcode NOT LIKE '1%'  AND main.COINSFLAG  in ('2','4') );
----****分入****----
----****27-再保分入业务新增****---- 取复核日期UNDERWRITEENDDATE,并且 a.UNDERWRITEFLAG='1' 复核通过
Insert Into Pr_All_No   Select Pak_Pr_Utils.Fn_Pr_Nexttransactionno() Transactionno,'27' Transactionreason,'Reins' Modeltype,a.REPOLICYNO Certino,'C' Certitype,a.UNDERWRITEENDDATE Transactinonate,'03' Flag,Sysdate Createtime,i_Datatype Datatype,Pak_Pr_Utils.Fn_Pr_Companycode() Companycode,a.POLICYNO Policyno,Pak_Pr_Utils.Fn_Pr_Nextbatchno(i_Datatype) Batchno     From Ywuser.FCIREPOLICY a    Where  To_Char(a.UNDERWRITEENDDATE, 'yyyy-MM-dd') >= To_Char(i_Startdate, 'yyyy-MM-dd')      And To_Char(a.UNDERWRITEENDDATE, 'yyyy-MM-dd') <  To_Char(i_Enddate + 1, 'yyyy-MM-dd') and a.UNDERWRITEFLAG='1' and exists(select 1 from prpdriskforreport risk where a.riskcode = risk.riskcode and risk.validstatus = '1') and not exists (SELECT 1 FROM ywuser.prpcmain main where main.policyno=a.policyno AND main.riskcode NOT LIKE '1%'  AND main.COINSFLAG  in ('2','4') ); 
Insert Into Pr_All_No   Select Pak_Pr_Utils.Fn_Pr_Nexttransactionno() Transactionno,'27' Transactionreason,'Reins' Modeltype,a.REPOLICYNO Certino,'C' Certitype,a.UNDERWRITEENDDATE Transactinonate,'02' Flag,Sysdate Createtime,i_Datatype Datatype,Pak_Pr_Utils.Fn_Pr_Companycode() Companycode,a.POLICYNO Policyno,Pak_Pr_Utils.Fn_Pr_Nextbatchno(i_Datatype) Batchno     From Ywuser.FCIREPOLICY a    Where  To_Char(a.UNDERWRITEENDDATE, 'yyyy-MM-dd') >= To_Char(i_Startdate, 'yyyy-MM-dd')      And To_Char(a.UNDERWRITEENDDATE, 'yyyy-MM-dd') <  To_Char(i_Enddate + 1, 'yyyy-MM-dd') and a.UNDERWRITEFLAG='1' and exists(select 1 from ywuser.prpdriskprext risk where a.riskcode = risk.riskcode and risk.validstatus = '1') and not exists (SELECT 1 FROM ywuser.prpcmain main where main.policyno=a.policyno AND main.riskcode NOT LIKE '1%'  AND main.COINSFLAG  in ('2','4') ); 
----****28-再保分入业务批改****---- 取复核日期UNDERWRITEENDDATE,并且 a.UNDERWRITEFLAG='1' 复核通过
Insert Into Pr_All_No   Select Pak_Pr_Utils.Fn_Pr_Nexttransactionno() Transactionno,'28' Transactionreason,'Reins' Modeltype,a.REENDORNO Certino,'E' Certitype,a.UNDERWRITEENDDATE Transactinonate,'03' Flag,Sysdate Createtime,i_Datatype Datatype,Pak_Pr_Utils.Fn_Pr_Companycode() Companycode,a.POLICYNO Policyno,Pak_Pr_Utils.Fn_Pr_Nextbatchno(i_Datatype) Batchno     From Ywuser.FPIREENDOR a    Where  To_Char(a.UNDERWRITEENDDATE, 'yyyy-MM-dd') >= To_Char(i_Startdate, 'yyyy-MM-dd')      And To_Char(a.UNDERWRITEENDDATE, 'yyyy-MM-dd') <  To_Char(i_Enddate + 1, 'yyyy-MM-dd') and a.UNDERWRITEFLAG='1' and exists(select 1 from prpdriskforreport risk where a.riskcode = risk.riskcode and risk.validstatus = '1') and not exists (SELECT 1 FROM ywuser.prpcmain main where main.policyno=a.policyno AND main.riskcode NOT LIKE '1%'  AND main.COINSFLAG  in ('2','4') ); 
Insert Into Pr_All_No   Select Pak_Pr_Utils.Fn_Pr_Nexttransactionno() Transactionno,'28' Transactionreason,'Reins' Modeltype,a.REENDORNO Certino,'E' Certitype,a.UNDERWRITEENDDATE Transactinonate,'02' Flag,Sysdate Createtime,i_Datatype Datatype,Pak_Pr_Utils.Fn_Pr_Companycode() Companycode,a.POLICYNO Policyno,Pak_Pr_Utils.Fn_Pr_Nextbatchno(i_Datatype) Batchno     From Ywuser.FPIREENDOR a    Where  To_Char(a.UNDERWRITEENDDATE, 'yyyy-MM-dd') >= To_Char(i_Startdate, 'yyyy-MM-dd')      And To_Char(a.UNDERWRITEENDDATE, 'yyyy-MM-dd') <  To_Char(i_Enddate + 1, 'yyyy-MM-dd') and a.UNDERWRITEFLAG='1' and exists(select 1 from ywuser.prpdriskprext risk where a.riskcode = risk.riskcode and risk.validstatus = '1') and not exists (SELECT 1 FROM ywuser.prpcmain main where main.policyno=a.policyno AND main.riskcode NOT LIKE '1%'  AND main.COINSFLAG  in ('2','4') ); 
----****29-再保分入业务分摊****---- a.UNDERWRITEFLAG='1' 复核通过
Insert Into Pr_All_No   Select Pak_Pr_Utils.Fn_Pr_Nexttransactionno() Transactionno,'29' Transactionreason,'Reins' Modeltype,a.REPAYNO Certino,'--' Certitype,a.REPORTDATE Transactinonate,'03' Flag,Sysdate Createtime,i_Datatype Datatype,Pak_Pr_Utils.Fn_Pr_Companycode() Companycode,a.POLICYNO Policyno,Pak_Pr_Utils.Fn_Pr_Nextbatchno(i_Datatype) Batchno     From Ywuser.flirepay a    Where  To_Char(a.REPORTDATE, 'yyyy-MM-dd') >= To_Char(i_Startdate, 'yyyy-MM-dd')      And To_Char(a.REPORTDATE, 'yyyy-MM-dd') <  To_Char(i_Enddate + 1, 'yyyy-MM-dd') and a.UNDERWRITEFLAG='1' and exists(select 1 from prpdriskforreport risk where a.riskcode = risk.riskcode and risk.validstatus = '1') and not exists (SELECT 1 FROM ywuser.prpcmain main where main.policyno=a.policyno AND main.riskcode NOT LIKE '1%'  AND main.COINSFLAG  in ('2','4') ); 
Insert Into Pr_All_No   Select Pak_Pr_Utils.Fn_Pr_Nexttransactionno() Transactionno,'29' Transactionreason,'Reins' Modeltype,a.REPAYNO Certino,'--' Certitype,a.REPORTDATE Transactinonate,'02' Flag,Sysdate Createtime,i_Datatype Datatype,Pak_Pr_Utils.Fn_Pr_Companycode() Companycode,a.POLICYNO Policyno,Pak_Pr_Utils.Fn_Pr_Nextbatchno(i_Datatype) Batchno     From Ywuser.flirepay a    Where  To_Char(a.REPORTDATE, 'yyyy-MM-dd') >= To_Char(i_Startdate, 'yyyy-MM-dd')      And To_Char(a.REPORTDATE, 'yyyy-MM-dd') <  To_Char(i_Enddate + 1, 'yyyy-MM-dd') and a.UNDERWRITEFLAG='1' and exists(select 1 from ywuser.prpdriskprext risk where a.riskcode = risk.riskcode and risk.validstatus = '1') and not exists (SELECT 1 FROM ywuser.prpcmain main where main.policyno=a.policyno AND main.riskcode NOT LIKE '1%'  AND main.COINSFLAG  in ('2','4') ); 

--备注
v_remark := 'Proc_PR_ReinsForDataType  取数日期 >= ' || to_char(i_startdate, 'yyyy-MM-dd') || ' < ' || to_char(i_enddate + 1, 'yyyy-MM-dd');
--出错处理开始
exception
when others then rollback;
--
v_errormsg := substr(sqlerrm, 0, 900);
warndesc := v_remark || v_errormsg;
--错误日志
insert into PR_ALL_ERRLOG values(sys_guid(), i_dataType, 'Reins', 'Proc_PR_ReinsForDataType', '无', sysdate, v_errormsg, v_remark);
insert into EarlyWarningMsg (WARNID, WARNTYPE, WARNOBJECT, WARNDESC, WARNDATE, WARNTIME, WARNSTATUS, WARNSTATUSDESC, WARNSENDTIMES, WARNWAY, REMARK)
values (to_char(systimestamp, 'yyyymmddhh24missff6'), '01', '增量数据提取处理异常请尽快处理', warndesc, to_date(to_char(sysdate,'yyyy-mm-dd'), 'yyyy-mm-dd'), to_char(sysdate,'hh24:mi:ss'), '00', '初始化', 0, '01', '');
--
commit;
--出错处理结束
DBMS_OUTPUT.put_line(v_remark);
end Proc_PR_ReinsForDataType;


end Pak_PR_Reins;
/

prompt
prompt Creating package body PAK_PR_UTILS
prompt ==================================
prompt
create or replace package body przxuser.Pak_PR_Utils is

function Fn_PR_CompanyCode return varchar2 is
begin
return '000129';
end Fn_PR_CompanyCode;

function Fn_PR_NextTransactionNo return varchar2 is
transactionNo varchar2(50);
begin
select '000129' || to_char(sysdate, 'yyyyMMdd') || trim(to_char(SEQ_TRANSNO.nextval, '09999999999999')) into transactionNo from dual; return transactionNo;
end Fn_PR_NextTransactionNo;

procedure proc_PR_SeqRest(i_seqname varchar2) is
  n    number(10);
  tsql varchar2(100);
begin
  execute immediate 'select ' || i_seqname || '.nextval from dual' into n;
  n    := -n;
  tsql := 'alter sequence ' || i_seqname || ' increment by ' || n;
  execute immediate tsql;
  execute immediate 'select ' || i_seqname || '.nextval from dual' into n;
  tsql := 'alter sequence ' || i_seqname || ' increment by 1';
  execute immediate tsql;
end;

function Fn_PR_NextBatchNo(i_datatype varchar2)  return varchar2 is
begin
 return Fn_PR_CompanyCode()||'P'||upper(i_datatype)||'0000000001';
end Fn_PR_NextBatchNo;

/*获取条款内容,把条款表里每行内容拼接*/
/*
Function Fn_PR_PrpdclauseContext(i_clausecode varchar2) return CLOB is
  counts number;
  rownumber number;
  out_context clob;
  contexts varchar2(4000);
begin
  select count(1) into counts from ywuser.prpdclause t where t.clausecode = i_clausecode and rownum <301;
  rownumber := 1;
  while rownumber<=counts LOOP
  select max(t.context) into contexts  from ywuser.prpdclause t where t.clausecode = i_clausecode and t.lineno = rownumber order by t.lineno;
  if contexts is not null then out_context :=  out_context || contexts; end if;
  rownumber:=rownumber+1;
  END LOOP;
  if out_context is null then out_context := '无';end if;
  return out_context;
end Fn_PR_PrpdclauseContext;

Function Fn_PR_PrpCengageContext(i_policyno varchar2,i_serialno varchar2,i_transactionreason varchar2) return CLOB is
  counts number;
  rownumber number;
  out_context clob;
  contexts varchar2(4000);
begin
  select count(1) into counts from ywuser.PrpCengage t where t.policyno = i_policyno and t.serialno=i_serialno and rownum <201;
  rownumber := 1;
  while rownumber<=counts LOOP
  select max(t.clauses) into contexts  from ywuser.PrpCengage t where t.policyno = i_policyno and t.serialno=i_serialno and t.lineno = rownumber order by t.lineno;
  if contexts is not null then out_context :=  out_context || contexts; end if;
  rownumber:=rownumber+1;
  END LOOP;
     return out_context;
end Fn_PR_PrpCengageContext;
*/

Function Fn_PR_DefaultBirthday(i_date date,i_identifynumber varchar2) return date is
   v_birthday date;
begin
  v_birthday:= date '1900-01-01';
  if i_date is not null then v_birthday:=i_date;end if;
  if Pak_PR_Utils.Fn_PR_CheckIdNumber(i_identifynumber)=1 then
    if length(i_identifynumber)=18 then v_birthday:=to_date(substr(i_identifynumber,7,8),'YYYYMMDD');  end if;
    if length(i_identifynumber)=15 then v_birthday:=to_date('19'||substr(i_identifynumber,7,6),'YYYYMMDD'); end if;
  end if;
  if v_birthday < date '1900-01-01'then v_birthday:= date '1900-01-01';end if;
  return v_birthday;
  exception when others then return date'1900-01-01';
end Fn_PR_DefaultBirthday;

/*获取身份证中性别,与2取模*/
Function Fn_PR_DefaultSex(i_sex varchar2,i_identifynumber varchar2) return varchar2 is
  v_sex varchar(1);
begin
  if i_sex is not null then return i_sex;end if;
  v_sex := '0';
  if length(i_identifynumber)=18 then select decode(mod(to_number(substr(i_identifynumber,17,1)),2),0,'2','1') into v_sex from dual;  end if;
  if length(i_identifynumber)=15 then select decode(mod(to_number(i_identifynumber),2),0,'2','1') into v_sex from dual; end if;
  return v_sex;
  exception when others then return '0';
end Fn_PR_DefaultSex;

/*获取起保终保日期,精确到时分*/
Function Fn_PR_calDateTime(i_date date,i_hour number,i_minute number) return date is
  v_hour number;
  v_minute number;
begin
  if i_date is null then return null;end if;
  v_hour := nvl(i_hour,0);
  v_minute := nvl(i_minute,0);
  if v_hour > 24 then v_hour := 24;end if;
  if v_hour < 0 then v_hour := 0;end if;
  if v_hour = 24 then return to_date(to_char(i_date,'yyyy-mm-dd ')||' 23:59:59','yyyy-mm-dd hh24:mi:ss') ;end if;
  if v_minute > 60 then v_minute := 59;end if;
  if v_minute < 0 then v_minute := 0;end if;
  return to_date(to_char(i_date,'yyyy-mm-dd ')||' '||to_char(v_hour,'09')||':'||to_char(v_minute,'09')||':00','yyyy-mm-dd hh24:mi:ss');
end Fn_PR_calDateTime;


Function Fn_PR_Policy_TransactionReason(i_policyNo varchar2, i_endorSeqNo varchar2, LASTPOLICYNO varchar2) return varchar2 IS
v_transactionReason varchar2(2);
begin
--批改判断
v_transactionReason:='04';
if i_endorSeqNo <> '000' then v_transactionReason:= '08';end if;
--看是否续保
if i_endorSeqNo = '000' then
  if LASTPOLICYNO is not null then
    --上年保单号是否为空
    v_transactionReason:= '05';end if;--续保

End If;
--新保
return v_transactionReason;
end Fn_PR_Policy_TransactionReason;

Function Fn_PR_insuredCode(i_riskCode varchar2,i_insuredCode varchar2,i_serialno varchar2) return Varchar2 Is

v_insuredCode varchar2(50);
begin
v_insuredCode:=i_insuredCode;
if i_riskCode = '6103' then v_insuredCode:= v_insuredCode||i_serialno;end if;
if i_riskCode = '6124' then v_insuredCode:= v_insuredCode||i_serialno;end if;
if i_riskCode = '7101' then v_insuredCode:= v_insuredCode||i_serialno;end if;--20191025lz 该产品有多个相同被保险人
if i_riskCode = '7102' then v_insuredCode:= v_insuredCode||i_serialno;end if;--20191025lz 该产品有多个相同被保险人
if i_riskCode = '6102' then v_insuredCode:= '不记名';end if;

return v_insuredCode;
end Fn_PR_insuredCode;


Function Fn_PR_SumAccPrem(i_policyno varchar2,i_sumpremium number) return number Is
  v_sumAccPrem number;
  v_planfeeCount number;
begin
  select nvl((select sum(payreffee) from ywuser.prpjpayrefrec where policyno = i_policyNo  and certitype in ('P', 'E')
              and payrefreason in ('R10', 'R15','R20','R25','R30','R35','P10','P15','P30','P35','P80')),0) into v_sumAccPrem
  from dual;
  if v_sumAccPrem < 0 then v_sumAccPrem := i_sumpremium; end if;
  if v_sumAccPrem = 0 then
    select count(1) into v_planfeeCount from ywuser.prpjplanfee where policyno = i_policyNo  and certitype in ('P', 'E')
              and payrefreason in ('R10', 'R15','R20','R25','R30','R35','P10','P15','P30','P35','P80');
    if v_planfeeCount = 0 then v_sumAccPrem := i_sumpremium; end if;
  end if;
  return v_sumAccPrem;
end Fn_PR_SumAccPrem;


Function Fn_PR_CheckIdNumber(i_identifynumber varchar2) return number Is
   v_regstr      VARCHAR2 (2000);
   v_sum         NUMBER;
   v_mod         NUMBER;
   v_checkcode   CHAR (11)       := '10X98765432';
   v_checkbit    CHAR (1);
   v_areacode    VARCHAR2 (2000) := '11,12,13,14,15,21,22,23,31,32,33,34,35,36,37,41,42,43,44,45,46,50,51,52,53,54,61,62,63,64,65,71,81,82,91,';
BEGIN
   CASE LENGTHB (i_identifynumber)
      WHEN 15
      THEN                                                            -- 15位
         IF INSTRB (v_areacode, SUBSTR (i_identifynumber, 1, 2) || ',') = 0 THEN
            RETURN 0;
         END IF;

         IF MOD (TO_NUMBER (SUBSTRB (i_identifynumber, 7, 2)) + 1900, 400) = 0
            OR
            (
                MOD (TO_NUMBER (SUBSTRB (i_identifynumber, 7, 2)) + 1900, 100) <> 0
                AND
                MOD (TO_NUMBER (SUBSTRB (i_identifynumber, 7, 2)) + 1900, 4) = 0
            )
         THEN                                                          -- 闰年
            v_regstr :=
               '^[1-9][0-9]{5}[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|[1-2][0-9]))[0-9]{3}$';
         ELSE
            v_regstr :=
               '^[1-9][0-9]{5}[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|1[0-9]|2[0-8]))[0-9]{3}$';
         END IF;

         IF REGEXP_LIKE (i_identifynumber, v_regstr) THEN
            RETURN 1;
         ELSE
            RETURN 0;
         END IF;
      WHEN 18
      THEN                                                             -- 18位
         IF INSTRB (v_areacode, SUBSTRB (i_identifynumber, 1, 2) || ',') = 0 THEN
            RETURN 0;
         END IF;

         IF MOD (TO_NUMBER (SUBSTRB (i_identifynumber, 7, 4)), 400) = 0
            OR
            (
                MOD (TO_NUMBER (SUBSTRB (i_identifynumber, 7, 4)), 100) <> 0
                AND
                MOD (TO_NUMBER (SUBSTRB (i_identifynumber, 7, 4)), 4) = 0
            )
         THEN                                                          -- 闰年
            v_regstr :=
               '^[1-9][0-9]{5}(19|20)[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|[1-2][0-9]))[0-9]{3}[0-9Xx]$';
         ELSE
            v_regstr :=
               '^[1-9][0-9]{5}(19|20)[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|1[0-9]|2[0-8]))[0-9]{3}[0-9Xx]$';
         END IF;

         IF REGEXP_LIKE (i_identifynumber, v_regstr) THEN
            v_sum :=
                   (  TO_NUMBER (SUBSTRB (i_identifynumber, 1, 1))
                    + TO_NUMBER (SUBSTRB (i_identifynumber, 11, 1))
                   )
                 * 7
               +   (  TO_NUMBER (SUBSTRB (i_identifynumber, 2, 1))
                    + TO_NUMBER (SUBSTRB (i_identifynumber, 12, 1))
                   )
                 * 9
               +   (  TO_NUMBER (SUBSTRB (i_identifynumber, 3, 1))
                    + TO_NUMBER (SUBSTRB (i_identifynumber, 13, 1))
                   )
                 * 10
               +   (  TO_NUMBER (SUBSTRB (i_identifynumber, 4, 1))
                    + TO_NUMBER (SUBSTRB (i_identifynumber, 14, 1))
                   )
                 * 5
               +   (  TO_NUMBER (SUBSTRB (i_identifynumber, 5, 1))
                    + TO_NUMBER (SUBSTRB (i_identifynumber, 15, 1))
                   )
                 * 8
               +   (  TO_NUMBER (SUBSTRB (i_identifynumber, 6, 1))
                    + TO_NUMBER (SUBSTRB (i_identifynumber, 16, 1))
                   )
                 * 4
               +   (  TO_NUMBER (SUBSTRB (i_identifynumber, 7, 1))
                    + TO_NUMBER (SUBSTRB (i_identifynumber, 17, 1))
                   )
                 * 2
               + TO_NUMBER (SUBSTRB (i_identifynumber, 8, 1)) * 1
               + TO_NUMBER (SUBSTRB (i_identifynumber, 9, 1)) * 6
               + TO_NUMBER (SUBSTRB (i_identifynumber, 10, 1)) * 3;
            v_mod := MOD (v_sum, 11);
            v_checkbit := SUBSTRB (v_checkcode, v_mod + 1, 1);

            IF v_checkbit = upper(substrb(i_identifynumber,18,1)) THEN
               RETURN 1;
            ELSE
               RETURN 0;
            END IF;
         ELSE
            RETURN 0;
         END IF;
      ELSE
         RETURN 0;                                      -- 身份证号码位数不对
   END CASE;
  EXCEPTION
     WHEN OTHERS
     THEN
        RETURN 0;
End Fn_PR_CheckIdNumber;

Function Fn_PR_IdentifyType(i_identifyType varchar2,i_identifynumber varchar2) return varchar2 is
   v_identifyType varchar2(5);
begin
  v_identifyType:=nvl(i_identifyType,'99');
  if v_identifyType='01' then v_identifyType:='99';end if;
  if Pak_PR_Utils.Fn_PR_CheckIdNumber(i_identifynumber)=1 then v_identifyType:='01';end if;
  return v_identifyType;
end Fn_PR_IdentifyType;

Function Fn_PR_InsuredName(i_insuredName varchar2) return varchar2  is
   v_insuredName varchar2(500);
begin
  v_insuredName:=trim(regexp_replace(i_insuredName, '([=`~@#$%^&*+|}{":<>?？，;''。!]+)|(\[|\])+ ',''));
  v_insuredName:=nvl(TO_SINGLE_BYTE(v_insuredName),'未知');
  return v_insuredName;
end Fn_PR_InsuredName;

Function Fn_PR_ClassCodeType(i_ClassCode varchar2,i_RiskCode varchar2) return varchar2  is
   v_ClassCode varchar2(4);
   counts   Number;
Begin
  execute Immediate 'Select count(1)  FROM ldcodemapping Where CODETYPE=''CD000039'' and BASICCODE = '||i_RiskCode||'  '  Into counts;
  If(counts>0) Then
    v_ClassCode:=i_RiskCode;
  End If;
  If(counts=0) Then 
   v_ClassCode:=i_ClassCode;
  End If; 
  return v_ClassCode;
end Fn_PR_ClassCodeType;


Function Fn_PR_InsuredCodeByName(i_PolicyNo varchar2,i_insuredName varchar2) return Varchar2 Is 
  v_insuredcode Varchar2(20);
  
  Begin
    Select insuredcode Into v_insuredcode From ywuser.prpcinsured Where policyno=i_PolicyNo And insuredname=i_insuredName And insuredflag='1' And rownum=1;
    
  Return   v_insuredcode;
  
End Fn_PR_InsuredCodeByName;

Function Fn_PR_defDateTime(i_date Date) return Date Is
  datelength   Number;
  v_date   Varchar2(20);
  
  Begin
    if i_date is null then return  to_date('1900-01-01 00:00:00','yyyy-mm-dd hh24:mi:ss');end if;
    Select length(i_date) Into datelength FROM dual;
    If datelength<=10   Then
      Return to_date(to_char(i_date,'yyyy-mm-dd')||' 00:00:00','yyyy-MM-dd hh24:mi:ss');
    Else Return to_date(to_char(i_date,'yyyy-MM-dd  hh24:mi:ss'),'yyyy-MM-dd  hh24:mi:ss');
    End If;
      
End Fn_PR_defDateTime;


Function Fn_PR_defDate(i_date Date) return Date Is
  
  Begin
    if i_date is null then return  to_date(to_char('1900-01-01','yyyy-mm-dd'),'yyyy-MM-dd');end if;
    Return to_date(to_char('1900-01-01','yyyy-mm-dd'),'yyyy-MM-dd');
End Fn_PR_defDate;
end Pak_PR_Utils;
/


spool off
