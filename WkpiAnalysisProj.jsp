<%@ page language="java" import="com.cip.common.*, com.cip.util.*, com.cip.database.*, java.sql.*, java.util.*" errorPage="../common/Error.jsp" contentType="text/html;charset=euc-kr" %>
<%@include file="./IncKpi.jsp"%>
<%
	/***************************************************/
	/* �� ���α׷��� (��)CIP System �� ����Դϴ�.
	/* ���α׷��� : �μ�������Ȳ
	/* ��      �� : ȭ�������
	/* �����ۼ��� :
	/* ���� �ۼ��� :20210910
	/* ���������� :
	/* ���������� :
	/***************************************************/

	CITData lrReturnData = null;
//������ �� �κ��� ���⸸ �մ���!!!!!
//���ϸ�
	String strFileName = "./WkpiAnalysisProj";
//���� �׼�
	String strUpdateKeyValue = "Service1()";

	String strOut = "";
	String strSql = "";
	String strAct = "";
	String strCompanyCode = "";
	String strCompanyName = "";
	String strDATE_M 		= "";

	String strIndType = "";
	String strIndPeriod = "";
	String strKindType = "";
	String strDirType = "";
	String strAsseType = "";
	String strWeightType = "";

	try
	{
		CITCommon.initPage(request, response, session);
		strCompanyCode = CITCommon.NvlString(session.getAttribute("hrms_company_code"));
		strCompanyName = CITCommon.NvlString(session.getAttribute("hrms_company_name"));
		CITData lrArgData = new CITData();

		try
		{
			strSql  = " SELECT  \n";
			strSql += "     B.CODE_LIST_ID AS CODE, B.CODE_LIST_NAME AS NAME \n";
			strSql += " FROM  \n";
			strSql += "     TCC_CODE_GROUP A \n";
			strSql += "     , TCC_CODE_LIST B \n";
			strSql += " WHERE A.CODE_GROUP_NO = B.CODE_GROUP_NO  \n";
			strSql += " AND A.CODE_GROUP_ID = 'KPI_KIND_TYPE'  \n";
			strSql += " ORDER BY B.SEQ ";
			lrReturnData = CITDatabase.selectQuery(strSql, lrArgData);
			strKindType = CITCommon.toGauceComboString(lrReturnData, "CODE", "NAME");
		}
		catch (Exception ex)
		{
			throw new Exception("USER-900001:�����ڵ��� KPI �з�  Select ���� -> " + ex.getMessage());
		}

		try
		{
			strSql  = " SELECT  \n";
			strSql += "     B.CODE_LIST_ID AS CODE, B.CODE_LIST_NAME AS NAME \n";
			strSql += " FROM  \n";
			strSql += "     TCC_CODE_GROUP A \n";
			strSql += "     , TCC_CODE_LIST B \n";
			strSql += " WHERE A.CODE_GROUP_NO = B.CODE_GROUP_NO  \n";
			strSql += " AND A.CODE_GROUP_ID = 'KPI_PROD_TYPE'  \n";
			strSql += " ORDER BY B.SEQ ";
			lrReturnData = CITDatabase.selectQuery(strSql, lrArgData);
			strIndPeriod = CITCommon.toGauceComboString(lrReturnData, "CODE", "NAME");
		}
		catch (Exception ex)
		{
			throw new Exception("USER-900001:�����ڵ��� KPI �����ֱ�  Select ���� -> " + ex.getMessage());
		}

		try
		{
			strSql  = " SELECT  \n";
			strSql += "     B.CODE_LIST_ID AS CODE, B.CODE_LIST_NAME AS NAME \n";
			strSql += " FROM  \n";
			strSql += "     TCC_CODE_GROUP A \n";
			strSql += "     , TCC_CODE_LIST B \n";
			strSql += " WHERE A.CODE_GROUP_NO = B.CODE_GROUP_NO  \n";
			strSql += " AND A.CODE_GROUP_ID = 'KPI_IND_TYPE'  \n";
			strSql += " ORDER BY B.SEQ ";
			lrReturnData = CITDatabase.selectQuery(strSql, lrArgData);
			strIndType = CITCommon.toGauceComboString(lrReturnData, "CODE", "NAME");
		}
		catch (Exception ex)
		{
			throw new Exception("USER-900001:�����ڵ��� KPI ��ǥ����  Select ���� -> " + ex.getMessage());
		}

		try
		{
			strSql  = " SELECT  \n";
			strSql += "     B.CODE_LIST_ID AS CODE, B.CODE_LIST_NAME AS NAME \n";
			strSql += " FROM  \n";
			strSql += "     TCC_CODE_GROUP A \n";
			strSql += "     , TCC_CODE_LIST B \n";
			strSql += " WHERE A.CODE_GROUP_NO = B.CODE_GROUP_NO  \n";
			strSql += " AND A.CODE_GROUP_ID = 'KPI_DIRECT_TYPE'  \n";
			strSql += " ORDER BY B.SEQ ";
			lrReturnData = CITDatabase.selectQuery(strSql, lrArgData);
			strDirType = CITCommon.toGauceComboString(lrReturnData, "CODE", "NAME");
		}
		catch (Exception ex)
		{
			throw new Exception("USER-900001:�����ڵ��� KPI ���⼺ Select ���� -> " + ex.getMessage());
		}

		try
		{
			strSql  = " SELECT  \n";
			strSql += "     B.CODE_LIST_ID AS CODE, B.CODE_LIST_NAME AS NAME \n";
			strSql += " FROM  \n";
			strSql += "     TCC_CODE_GROUP A \n";
			strSql += "     , TCC_CODE_LIST B \n";
			strSql += " WHERE A.CODE_GROUP_NO = B.CODE_GROUP_NO  \n";
			strSql += " AND A.CODE_GROUP_ID = 'KPI_ASSE_TYPE'  \n";
			strSql += " ORDER BY B.SEQ ";
			lrReturnData = CITDatabase.selectQuery(strSql, lrArgData);
			strAsseType = CITCommon.toGauceComboString(lrReturnData, "CODE", "NAME");
		}
		catch (Exception ex)
		{
			throw new Exception("USER-900001:�����ڵ��� KPI ������ Select ���� -> " + ex.getMessage());
		}

		try
		{
			strSql  = " SELECT  \n";
			strSql += "     B.CODE_LIST_ID AS CODE, B.CODE_LIST_NAME AS NAME \n";
			strSql += " FROM  \n";
			strSql += "     TCC_CODE_GROUP A \n";
			strSql += "     , TCC_CODE_LIST B \n";
			strSql += " WHERE A.CODE_GROUP_NO = B.CODE_GROUP_NO  \n";
			strSql += " AND A.CODE_GROUP_ID = 'KPI_ROLE_SCN'  \n";
			strSql += " ORDER BY B.SEQ ";
			lrReturnData = CITDatabase.selectQuery(strSql, lrArgData);
			strWeightType = CITCommon.toGauceComboString(lrReturnData, "CODE", "NAME");
		}
		catch (Exception ex)
		{
			throw new Exception("USER-900001:�����ڵ��� KPI ���Һ� ����ġ Select ���� -> " + ex.getMessage());
		}

	}
	catch (Exception ex)
	{
		throw new Exception("SYS-100001:������ �ʱ�ȭ ���� -> " + ex.getMessage());
	}
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title><%=CITCommon.getProperty("company.name")%> - <%=CITCommon.getProperty("application.name")%></title>

		<style>
			.btn_style {
				width: 120px;
				padding: 3px 3px 3px 3px;
				margin: 2px 0px 2px 0px;
				background-color: skyblue;
				border-color: skyblue;
			}

			.btn_style_n {
				width: 120px;
				padding: 3px 3px 3px 3px;
				margin: 2px 0px 2px 0px;
				background-color: #d1e8cd;
				border-color: #d1e8cd;
			}

			.btn_style_a {
				width: 120px;
				padding: 3px 3px 3px 3px;
				margin: 2px 0px 2px 0px;
				background-color: #F5DF4D;
				border-color: #F5DF4D;
			}

			.btn_style_t {
				width: 120px;
				padding: 3px 3px 3px 3px;
				margin: 2px 0px 2px 0px;
				background-color: #c0c1bc;
				border-color: #c0c1bc;
			}
		</style>

		<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
		<link href="../css/Style.css" rel="stylesheet" type="text/css">
		<script language="javascript" src="../script/Common.js"></script>
		<script language="javascript" src="../script/Standard.js"></script>
		<script language="javascript" src="../script/Gauce.js"></script>
		<script language="javascript" src="../script/DefaultActions.js"></script>
		<script language="javascript" src="<%=strFileName%>.js"></script>
		<script language="javascript">
		<!--
			var			sSelectPageName = "<%=strFileName%>_S.jsp";

			var			strCompanyCode	= "<%=CITCommon.enSC(strCompanyCode)%>";
			var			strCompanyName	= "<%=CITCommon.enSC(strCompanyName)%>";
			var			strDATE					= "<%=strDATE%>";
			var			strDATE_YM			= "<%=strDATE_YM%>";
			var			strDATE_M				= "<%=strDATE_M%>";
			var 		ssProjCode      = '<%=ssProjCode%>';
			var			ssProjName      = '<%=ssProjName%>';
			var 		ssWork_ProjCode = '<%=ssWork_ProjCode%>';
			var 		ssWork_ProjName = '<%=ssWork_ProjName%>';
		//-->
		</script>

		<!-- ���콺 Dataset �� Tranaction ��ü���� ���� //-->
		<object id=dsMAIN classid=CLSID:3267EA0D-B5D8-11D2-A4F9-00608CEBEE49>
		</object>
		<%-- <object id=dsLOV classid=CLSID:<%=gClassId_Dataset%>></object> --%>
		<%-- <object id="trans"  classid="clsid:0A2233AD-E771-11D2-973D-00104B15E56F" >
	      <param name="KeyValue" value="<%=strUpdateKeyValue%>">
		  	<param name="Action"    value="<%=strFileName%>_U.jsp">
		</object> --%>
		<!-- ���콺 Dataset �� Tranaction ��ü���� ���� //-->
	</head>
	<body onload="C_Initialize()">
		<form name="frmList" action="../common/ReportRequestProcess.jsp" target="_blank" method="post">
			<input type='hidden' name='ACT' value="REQUEST">
			<Input type='hidden' name='KEY' value="">
			<input type='hidden' name='EXPORT_TAG' value="">
			<input type='hidden' name='RUN_TAG' value="">
			<input type='hidden' name='REQUEST_NAME' value="">
			<Input type='hidden' name='REPORT_FILE_NAME' value="">
			<Input type='hidden' name='PARAMETERS' value="">
		</form>
		<iframe width="0" height="0" name="ifrmSession" src="../common/Session.jsp" frameborder="0" tabindex="-1"></iframe>
		<div id="divMainFix" class="main_div">
			<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
				<tr valign="top">
					<td width="100%">
						<!-- ���� ���̺� ���� //-->
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr class="head_line">
								<td width="*" height="1"></td>
							</tr>
							<tr>
								<td width="100%" class="" style="background-color:gray;">
									<table width="100%" border="0" cellspacing="0" cellpadding="0">
										<tr>
											<td width="20"><img src="../images/bullet3.gif" width="20" height="5"></td>
											<td width="70" class="font_white_bold" >���س⵵</td>
											<td width="25">
												<input id="btnPreMON" type="button" class="img_btnMove_L" title="����" onclick="btnPreYEAR_onClick()" onmouseover="this.style.color=MOUSE_OVER;" onmouseout="this.style.color=MOUSE_OUT;">
											</td>
											<td width="70">
												<input id="txtAppYear" type="text" center style="width:70px">
											</td>
											<td width="25">
												<input id="btnNextMON" type="button" class="img_btnMove_R" title="����" onclick="btnNextYEAR_onClick()" onmouseover="this.style.color=MOUSE_OVER;" onmouseout="this.style.color=MOUSE_OUT;">
											</td>
											<td width="*">
												&nbsp;
											</td>
										</tr>
									</table>
								</td>
							</tr>
							<tr class="head_line">
								<td width="*" height="1"></td>
							</tr>
						</table>

						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td height="5"></td>
							</tr>
						</table>

						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr class="head_line">
								<td width="*" height="1"></td>
							</tr>
							<tr>
								<td width="100%">
									<table width="100%" border="0" cellspacing="0" cellpadding="0">
										<tr>
											<td width="*">
												<input type="button" class="btn_style_n" value="��ü" onclick="btnDeptSelect('')"/>
												<input type="button" class="btn_style_a" value="�ͳλ������" onclick="btnDeptSelect('2510')"/>
												<input type="button" class="btn_style" value=" T B M " onclick="btnDeptSelect('2032')"/>
												<input type="button" class="btn_style" value="�Ϲ����" onclick="btnDeptSelect('2013')"/>
												<input type="button" class="btn_style" value="�ϹݰǼ�(I)" onclick="btnDeptSelect('2210')"/>
												<input type="button" class="btn_style_a" value="���ݱ���������" onclick="btnDeptSelect('2520')"/>
												<input type="button" class="btn_style" value="���ݡ��׸�" onclick="btnDeptSelect('2022')"/>
												<input type="button" class="btn_style" value="�ϹݰǼ�(II)" onclick="btnDeptSelect('2014')"/>
												<input type="button" class="btn_style" value="�����Ͼ�������" onclick="btnDeptSelect('4220')"/>
											</td>
										</tr>
										<%-- <tr>
											<td width="*">
												<input type="button" class="btn_style_t" value="�������" onclick="btnDeptSelect('0000')"/>
												<input type="button" class="btn_style_a" value="��������" onclick="btnDeptSelect('1000')"/>
												<input type="button" class="btn_style" value="����������" onclick="btnDeptSelect('1197')"/>
												<input type="button" class="btn_style" value="�÷�Ʈ��" onclick="btnDeptSelect('1040')"/>
												<input type="button" class="btn_style" value="����������" onclick="btnDeptSelect('1115')"/>
												<input type="button" class="btn_style" value="ǰ��������" onclick="btnDeptSelect('1185')"/>
												<input type="button" class="btn_style" value="�濵��ȹ��" onclick="btnDeptSelect('0105')"/>
												<input type="button" class="btn_style" value="�濵������" onclick="btnDeptSelect('0106')"/>
												<input type="button" class="btn_style" value="ȸ���ڱ���" onclick="btnDeptSelect('1055')"/>
												<input type="button" class="btn_style" value="������" onclick="btnDeptSelect('7062')"/>
											</td>
										</tr> --%>
									</table>
								</td>
							</tr>
							<tr class="head_line">
								<td width="*" height="1"></td>
							</tr>
						</table>
						<!-- ���� ���̺� ���� //-->
						<!-- �������� ���̺� ���� //-->
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td height="5"></td>
							</tr>
						</table>
						<!-- �������� ���̺� ���� //-->
					</td>
				</tr>
				<!-- ���α׷��� ������ ���� //-->
				<tr valign="top">
					<td width="100%" height="100%">
						<table width="100%" height="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td width="100%" height="100%">
									<!--CONVPAGE_HEAD ������������//--> <comment id="__NSID__1"> <!--CONVPAGE_TAIL ������������//-->
									<OBJECT id=gridMAIN WIDTH="100%" HEIGHT="100%" classid=clsid:1F57AEAD-DB12-11D2-A4F9-00608CEBEE49 VIEWASTEXT>
										<PARAM NAME="DataID" VALUE="dsMAIN">
										<PARAM NAME="Editable" VALUE="false">
										<PARAM NAME="ColSelect" VALUE="true">
										<PARAM NAME="ColSizing" VALUE="-1">
										<PARAM NAME="ViewSummary" VALUE="1">
										<PARAM NAME=TitleHeight  value="25">
										<PARAM NAME=RowHeight  value="25">
										<PARAM NAME=IndicatorBkColor  value="#F5DF4D">
										<PARAM NAME=IndicatorColBkColor value="#F5DF4D">
										<PARAM NAME=IgnoreSelectionColor  value="true">
										<PARAM NAME=SuppressLineExpr VALUE="3,1,red;2,1,darkgray;1,1,black">
										<PARAM NAME="Format" VALUE="
											<FC> Name='IND_SEQ'	ID=IND_SEQ	Align=Center	Width=60 show=false HeadBgColor='#F5DF4D' edit=none
											</FC>
											<FC> Name='IND_NO'	ID=IND_NO	Align=Center	Width=60 show=false HeadBgColor='#F5DF4D' edit=none
											</FC>
											<FC> Name='�μ��ڵ�'	ID=IND_DEPT_CODE	Align=Center	Width=80  BgColor='white' edit=none show=false
											</FC>
											<FC> Name='�����ڵ�'	ID=EXEC_DEPT_CODE	Align=Center	Width=80  BgColor='white' edit=none show=false
											</FC>
											<FC> Name='����⵵'	ID=IND_YEAR		Align=Center	Width=60 show=false HeadBgColor='#F5DF4D' BgColor='white' edit=none
											</FC>
											<FC> Name='����'	ID=SATI_HEAD_NAME		Align=left	Width=110  HeadBgColor='#F5DF4D' BgColor='white' suppress=1 edit=none
											</FC>
											<FC> Name='�μ�'	ID=IND_DEPT_NAME		Align=left	Width=110 HeadBgColor='#F5DF4D' BgColor='white' suppress=2 edit=none
											</FC>
											<FC> Name='����'	ID=EXEC_DEPT_NAME		Align=left	Width=250 HeadBgColor='#F5DF4D' BgColor='white' suppress=3 edit=none
											</FC>
											<FC> Name='No'	ID=IND_NUM		Align=center	Width=30 HeadColor='blue' HeadBgColor='#F5DF4D' BgColor='white' BgColor={decode(IND_TYPE,'04','#fdfd8b','white' )}
											</FC>
											<FC> Name='category'	ID=IND_TYPE	Align=Center	Width=80 EditStyle=combo data='<%=strIndType%>' HeadBgColor='#F5DF4D' BgColor={decode(IND_TYPE,'04','#fdfd8b','white' )} edit=none
											</FC>
											<FC> Name='��ǥ����'	ID=IND_KIND_TYPE Align=Center	 Width=60 EditStyle=combo data='<%=strKindType%>' HeadBgColor='#F5DF4D' BgColor={decode(IND_TYPE,'04','#fdfd8b','white' )} edit=none
											</FC>
											<FC> Name='��ǥ��'		 ID=IND_NAME	Align=left	Width=150 HeadBgColor='#F5DF4D' BgColor={decode(IND_TYPE,'04','#fdfd8b','white' )} edit=none
											</FC>
											<C> Name='Ȱ����ȹ'	ID=PLAN_DESC	Align=left	Width=200 HeadColor='blue' HeadBgColor='#F5DF4D' BgColor={decode(IND_TYPE,'04','#fdfd8b','white' )}
											</C>
											<C> Name='����ġ(%)'	 ID=IND_WEIGHT Align=center	Width=60 HeadColor='blue' HeadBgColor='#F5DF4D' BgColor={decode(IND_TYPE,'04','#fdfd8b','white' )}
											</C>
											<C> Name='��ǥ����'		ID=IND_DESC	Align=left	Width=300 HeadBgColor='#F5DF4D' BgColor={decode(IND_TYPE,'04','#fdfd8b','white' )}  edit=none
											</C>
											<C> Name='���'				ID=IND_FOR		Width=200 HeadBgColor='#F5DF4D' BgColor={decode(IND_TYPE,'04','#fdfd8b','white' )}  edit=none
											</C>
											<C> Name='�����ֱ�'		ID=IND_PERIOD	Align=center	Width=60 EditStyle=combo data='<%=strIndPeriod%>' HeadBgColor='#F5DF4D' BgColor={decode(IND_TYPE,'04','#fdfd8b','white' )}  edit=none
											</C>
											<C> Name='���⼺'		 ID=IND_DIR_TYPE	Align=center 	Width=60 EditStyle=combo data='<%=strDirType%>' HeadBgColor='#F5DF4D' BgColor={decode(IND_TYPE,'04','#fdfd8b','white' )}  edit=none
											</C>
											<C> Name='������'		ID=IND_ASSE_TYPE Align=center	Width=60 EditStyle=combo data='<%=strAsseType%>' HeadBgColor='#F5DF4D' BgColor={decode(IND_TYPE,'04','#fdfd8b','white' )}  edit=none
											</C>
											<C> Name='��ǥ'				ID=IND_GOAL		Width=100 HeadBgColor='#F5DF4D' HeadColor='blue' BgColor={decode(IND_TYPE,'04','#fdfd8b','white' )}
											</C>


											<G> Name='����' ID=GL03
												<C> Name='1��'	 ID=EXEC_DATA_01 Align=center	Width=80 color={decode(EXEC_DATA_01,'N/A','gray','0%','darkgray','black')}  BgColor='white' FontStyle={decode(EXEC_DATA_01,'N/A','','bold')}
												</C>
												<C> Name='2��'	 ID=EXEC_DATA_02 Align=center	Width=80 color={decode(EXEC_DATA_02,'N/A','gray','0%','darkgray','black')}  BgColor='white' FontStyle={decode(EXEC_DATA_02,'N/A','','bold')}
												</C>
												<C> Name='3��'	 ID=EXEC_DATA_03 Align=center	Width=80 color={decode(EXEC_DATA_03,'N/A','gray','0%','darkgray','black')}  BgColor='white' FontStyle={decode(EXEC_DATA_03,'N/A','','bold')}
												</C>
												<C> Name='4��'	 ID=EXEC_DATA_04 Align=center	Width=80 color={decode(EXEC_DATA_04,'N/A','gray','0%','darkgray','black')}  BgColor='white' FontStyle={decode(EXEC_DATA_04,'N/A','','bold')}
												</C>
												<C> Name='5��'	 ID=EXEC_DATA_05 Align=center	Width=80 color={decode(EXEC_DATA_05,'N/A','gray','0%','darkgray','black')}  BgColor='white' FontStyle={decode(EXEC_DATA_05,'N/A','','bold')}
												</C>
												<C> Name='6��'	 ID=EXEC_DATA_06 Align=center	Width=80 color={decode(EXEC_DATA_06,'N/A','gray','0%','darkgray','black')}  BgColor='white' FontStyle={decode(EXEC_DATA_06,'N/A','','bold')}
												</C>
												<C> Name='7��'	 ID=EXEC_DATA_07 Align=center	Width=80 color={decode(EXEC_DATA_07,'N/A','gray','0%','darkgray','black')}  BgColor='white' FontStyle={decode(EXEC_DATA_07,'N/A','','bold')}
												</C>
												<C> Name='8��'	 ID=EXEC_DATA_08 Align=center	Width=80 color={decode(EXEC_DATA_08,'N/A','gray','0%','darkgray','black')}  BgColor='white' FontStyle={decode(EXEC_DATA_08,'N/A','','bold')}
												</C>
												<C> Name='9��'	 ID=EXEC_DATA_09 Align=center	Width=80 color={decode(EXEC_DATA_09,'N/A','gray','0%','darkgray','black')}  BgColor='white' FontStyle={decode(EXEC_DATA_09,'N/A','','bold')}
												</C>
												<C> Name='10��'	 ID=EXEC_DATA_10 Align=center	Width=80 color={decode(EXEC_DATA_10,'N/A','gray','0%','darkgray','black')}  BgColor='white' FontStyle={decode(EXEC_DATA_10,'N/A','','bold')}
												</C>
												<C> Name='11��'	 ID=EXEC_DATA_11 Align=center	Width=80 color={decode(EXEC_DATA_11,'N/A','gray','0%','darkgray','black')}  BgColor='white' FontStyle={decode(EXEC_DATA_11,'N/A','','bold')}
												</C>
												<C> Name='12��'	 ID=EXEC_DATA_12 Align=center	Width=80 color={decode(EXEC_DATA_12,'N/A','gray','0%','darkgray','black')}  BgColor='white' FontStyle={decode(EXEC_DATA_12,'N/A','','bold')}
												</C>
											</G>
											<G> Name='��		��' ID=GL04 HeadBgColor='#F5DF4D'
												<C> Name='����' ID=EVAL_VAL		Width=100  Align=center HeadBgColor='#F5DF4D' BgColor={decode(IND_TYPE,'04','#fdfd8b','white' )} FontStyle=''
												</C>
												<C> Name='����(����ġ)' ID=EVAL_VAL_S Width=100 Align=center HeadBgColor='#F5DF4D' BgColor={decode(IND_TYPE,'04','#fdfd8b','white' )} FontStyle=''
												</C>
												<C> Name='����(80%)' ID=EVAL_VAL_80 Width=100 Align=center HeadBgColor='#F5DF4D' BgColor={decode(IND_TYPE,'04','#fdfd8b','white' )} FontStyle='bold'
												</C>
											</G>
											">
									</OBJECT><!--CONVPAGE_HEAD ������������//--></comment> <script> __WS__(__NSID__1); </script> <!--CONVPAGE_TAIL ������������//-->
								</td>
							</tr>
							<tr>
								<td width="100%">
									<table width="100%" border="0" cellspacing="0" cellpadding="0">
										<tr class="head_line">
											<td width="*" height="3"></td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
					</td>

				</tr>
				<!-- ���α׷��� ������ ���� //-->
			</table>
		</div>
		<!-- ���콺 Bind ��ü���� ���� //-->
		<!-- ���콺 Bind ��ü���� ���� //-->
	</body>
</html>
<%
	try
	{
		CITCommon.finalPage();
	}
	catch (Exception ex)
	{
		throw new Exception("������ ���� ���� -> " + ex.getMessage());
	}
%>
