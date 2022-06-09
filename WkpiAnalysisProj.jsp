<%@ page language="java" import="com.cip.common.*, com.cip.util.*, com.cip.database.*, java.sql.*, java.util.*" errorPage="../common/Error.jsp" contentType="text/html;charset=euc-kr" %>
<%@include file="./IncKpi.jsp"%>
<%
	/***************************************************/
	/* 이 프로그램은 (주)CIP System 의 재산입니다.
	/* 프로그램명 : 부서실적현황
	/* 유      형 : 화면디자인
	/* 최초작성자 :
	/* 최초 작성일 :20210910
	/* 최종수정자 :
	/* 최종수정일 :
	/***************************************************/

	CITData lrReturnData = null;
//디자인 외 부분은 여기만 손대자!!!!!
//파일명
	String strFileName = "./WkpiAnalysisProj";
//저장 액션
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
			throw new Exception("USER-900001:공통코드의 KPI 분류  Select 오류 -> " + ex.getMessage());
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
			throw new Exception("USER-900001:공통코드의 KPI 측정주기  Select 오류 -> " + ex.getMessage());
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
			throw new Exception("USER-900001:공통코드의 KPI 지표유형  Select 오류 -> " + ex.getMessage());
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
			throw new Exception("USER-900001:공통코드의 KPI 방향성 Select 오류 -> " + ex.getMessage());
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
			throw new Exception("USER-900001:공통코드의 KPI 평가유형 Select 오류 -> " + ex.getMessage());
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
			throw new Exception("USER-900001:공통코드의 KPI 역할별 가중치 Select 오류 -> " + ex.getMessage());
		}

	}
	catch (Exception ex)
	{
		throw new Exception("SYS-100001:페이지 초기화 오류 -> " + ex.getMessage());
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

		<!-- 가우스 Dataset 및 Tranaction 객체정의 시작 //-->
		<object id=dsMAIN classid=CLSID:3267EA0D-B5D8-11D2-A4F9-00608CEBEE49>
		</object>
		<%-- <object id=dsLOV classid=CLSID:<%=gClassId_Dataset%>></object> --%>
		<%-- <object id="trans"  classid="clsid:0A2233AD-E771-11D2-973D-00104B15E56F" >
	      <param name="KeyValue" value="<%=strUpdateKeyValue%>">
		  	<param name="Action"    value="<%=strFileName%>_U.jsp">
		</object> --%>
		<!-- 가우스 Dataset 및 Tranaction 객체정의 종료 //-->
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
						<!-- 조건 테이블 시작 //-->
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr class="head_line">
								<td width="*" height="1"></td>
							</tr>
							<tr>
								<td width="100%" class="" style="background-color:gray;">
									<table width="100%" border="0" cellspacing="0" cellpadding="0">
										<tr>
											<td width="20"><img src="../images/bullet3.gif" width="20" height="5"></td>
											<td width="70" class="font_white_bold" >기준년도</td>
											<td width="25">
												<input id="btnPreMON" type="button" class="img_btnMove_L" title="이전" onclick="btnPreYEAR_onClick()" onmouseover="this.style.color=MOUSE_OVER;" onmouseout="this.style.color=MOUSE_OUT;">
											</td>
											<td width="70">
												<input id="txtAppYear" type="text" center style="width:70px">
											</td>
											<td width="25">
												<input id="btnNextMON" type="button" class="img_btnMove_R" title="다음" onclick="btnNextYEAR_onClick()" onmouseover="this.style.color=MOUSE_OVER;" onmouseout="this.style.color=MOUSE_OUT;">
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
												<input type="button" class="btn_style_n" value="전체" onclick="btnDeptSelect('')"/>
												<input type="button" class="btn_style_a" value="터널사업본부" onclick="btnDeptSelect('2510')"/>
												<input type="button" class="btn_style" value=" T B M " onclick="btnDeptSelect('2032')"/>
												<input type="button" class="btn_style" value="일반토목" onclick="btnDeptSelect('2013')"/>
												<input type="button" class="btn_style" value="일반건설(I)" onclick="btnDeptSelect('2210')"/>
												<input type="button" class="btn_style_a" value="지반기술사업본부" onclick="btnDeptSelect('2520')"/>
												<input type="button" class="btn_style" value="지반·항만" onclick="btnDeptSelect('2022')"/>
												<input type="button" class="btn_style" value="일반건설(II)" onclick="btnDeptSelect('2014')"/>
												<input type="button" class="btn_style" value="엔지니어링사업본부" onclick="btnDeptSelect('4220')"/>
											</td>
										</tr>
										<%-- <tr>
											<td width="*">
												<input type="button" class="btn_style_t" value="현장공통" onclick="btnDeptSelect('0000')"/>
												<input type="button" class="btn_style_a" value="지원본부" onclick="btnDeptSelect('1000')"/>
												<input type="button" class="btn_style" value="영업견적팀" onclick="btnDeptSelect('1197')"/>
												<input type="button" class="btn_style" value="플랜트팀" onclick="btnDeptSelect('1040')"/>
												<input type="button" class="btn_style" value="공사지원팀" onclick="btnDeptSelect('1115')"/>
												<input type="button" class="btn_style" value="품질안전팀" onclick="btnDeptSelect('1185')"/>
												<input type="button" class="btn_style" value="경영기획팀" onclick="btnDeptSelect('0105')"/>
												<input type="button" class="btn_style" value="경영지원팀" onclick="btnDeptSelect('0106')"/>
												<input type="button" class="btn_style" value="회계자금팀" onclick="btnDeptSelect('1055')"/>
												<input type="button" class="btn_style" value="자재팀" onclick="btnDeptSelect('7062')"/>
											</td>
										</tr> --%>
									</table>
								</td>
							</tr>
							<tr class="head_line">
								<td width="*" height="1"></td>
							</tr>
						</table>
						<!-- 조건 테이블 종료 //-->
						<!-- 간격조정 테이블 시작 //-->
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td height="5"></td>
							</tr>
						</table>
						<!-- 간격조정 테이블 종료 //-->
					</td>
				</tr>
				<!-- 프로그래머 디자인 시작 //-->
				<tr valign="top">
					<td width="100%" height="100%">
						<table width="100%" height="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td width="100%" height="100%">
									<!--CONVPAGE_HEAD 지우지마세요//--> <comment id="__NSID__1"> <!--CONVPAGE_TAIL 지우지마세요//-->
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
											<FC> Name='부서코드'	ID=IND_DEPT_CODE	Align=Center	Width=80  BgColor='white' edit=none show=false
											</FC>
											<FC> Name='현장코드'	ID=EXEC_DEPT_CODE	Align=Center	Width=80  BgColor='white' edit=none show=false
											</FC>
											<FC> Name='적용년도'	ID=IND_YEAR		Align=Center	Width=60 show=false HeadBgColor='#F5DF4D' BgColor='white' edit=none
											</FC>
											<FC> Name='본부'	ID=SATI_HEAD_NAME		Align=left	Width=110  HeadBgColor='#F5DF4D' BgColor='white' suppress=1 edit=none
											</FC>
											<FC> Name='부서'	ID=IND_DEPT_NAME		Align=left	Width=110 HeadBgColor='#F5DF4D' BgColor='white' suppress=2 edit=none
											</FC>
											<FC> Name='현장'	ID=EXEC_DEPT_NAME		Align=left	Width=250 HeadBgColor='#F5DF4D' BgColor='white' suppress=3 edit=none
											</FC>
											<FC> Name='No'	ID=IND_NUM		Align=center	Width=30 HeadColor='blue' HeadBgColor='#F5DF4D' BgColor='white' BgColor={decode(IND_TYPE,'04','#fdfd8b','white' )}
											</FC>
											<FC> Name='category'	ID=IND_TYPE	Align=Center	Width=80 EditStyle=combo data='<%=strIndType%>' HeadBgColor='#F5DF4D' BgColor={decode(IND_TYPE,'04','#fdfd8b','white' )} edit=none
											</FC>
											<FC> Name='지표구분'	ID=IND_KIND_TYPE Align=Center	 Width=60 EditStyle=combo data='<%=strKindType%>' HeadBgColor='#F5DF4D' BgColor={decode(IND_TYPE,'04','#fdfd8b','white' )} edit=none
											</FC>
											<FC> Name='지표명'		 ID=IND_NAME	Align=left	Width=150 HeadBgColor='#F5DF4D' BgColor={decode(IND_TYPE,'04','#fdfd8b','white' )} edit=none
											</FC>
											<C> Name='활동계획'	ID=PLAN_DESC	Align=left	Width=200 HeadColor='blue' HeadBgColor='#F5DF4D' BgColor={decode(IND_TYPE,'04','#fdfd8b','white' )}
											</C>
											<C> Name='가중치(%)'	 ID=IND_WEIGHT Align=center	Width=60 HeadColor='blue' HeadBgColor='#F5DF4D' BgColor={decode(IND_TYPE,'04','#fdfd8b','white' )}
											</C>
											<C> Name='지표설명'		ID=IND_DESC	Align=left	Width=300 HeadBgColor='#F5DF4D' BgColor={decode(IND_TYPE,'04','#fdfd8b','white' )}  edit=none
											</C>
											<C> Name='산식'				ID=IND_FOR		Width=200 HeadBgColor='#F5DF4D' BgColor={decode(IND_TYPE,'04','#fdfd8b','white' )}  edit=none
											</C>
											<C> Name='측정주기'		ID=IND_PERIOD	Align=center	Width=60 EditStyle=combo data='<%=strIndPeriod%>' HeadBgColor='#F5DF4D' BgColor={decode(IND_TYPE,'04','#fdfd8b','white' )}  edit=none
											</C>
											<C> Name='방향성'		 ID=IND_DIR_TYPE	Align=center 	Width=60 EditStyle=combo data='<%=strDirType%>' HeadBgColor='#F5DF4D' BgColor={decode(IND_TYPE,'04','#fdfd8b','white' )}  edit=none
											</C>
											<C> Name='평가유형'		ID=IND_ASSE_TYPE Align=center	Width=60 EditStyle=combo data='<%=strAsseType%>' HeadBgColor='#F5DF4D' BgColor={decode(IND_TYPE,'04','#fdfd8b','white' )}  edit=none
											</C>
											<C> Name='목표'				ID=IND_GOAL		Width=100 HeadBgColor='#F5DF4D' HeadColor='blue' BgColor={decode(IND_TYPE,'04','#fdfd8b','white' )}
											</C>


											<G> Name='실적' ID=GL03
												<C> Name='1월'	 ID=EXEC_DATA_01 Align=center	Width=80 color={decode(EXEC_DATA_01,'N/A','gray','0%','darkgray','black')}  BgColor='white' FontStyle={decode(EXEC_DATA_01,'N/A','','bold')}
												</C>
												<C> Name='2월'	 ID=EXEC_DATA_02 Align=center	Width=80 color={decode(EXEC_DATA_02,'N/A','gray','0%','darkgray','black')}  BgColor='white' FontStyle={decode(EXEC_DATA_02,'N/A','','bold')}
												</C>
												<C> Name='3월'	 ID=EXEC_DATA_03 Align=center	Width=80 color={decode(EXEC_DATA_03,'N/A','gray','0%','darkgray','black')}  BgColor='white' FontStyle={decode(EXEC_DATA_03,'N/A','','bold')}
												</C>
												<C> Name='4월'	 ID=EXEC_DATA_04 Align=center	Width=80 color={decode(EXEC_DATA_04,'N/A','gray','0%','darkgray','black')}  BgColor='white' FontStyle={decode(EXEC_DATA_04,'N/A','','bold')}
												</C>
												<C> Name='5월'	 ID=EXEC_DATA_05 Align=center	Width=80 color={decode(EXEC_DATA_05,'N/A','gray','0%','darkgray','black')}  BgColor='white' FontStyle={decode(EXEC_DATA_05,'N/A','','bold')}
												</C>
												<C> Name='6월'	 ID=EXEC_DATA_06 Align=center	Width=80 color={decode(EXEC_DATA_06,'N/A','gray','0%','darkgray','black')}  BgColor='white' FontStyle={decode(EXEC_DATA_06,'N/A','','bold')}
												</C>
												<C> Name='7월'	 ID=EXEC_DATA_07 Align=center	Width=80 color={decode(EXEC_DATA_07,'N/A','gray','0%','darkgray','black')}  BgColor='white' FontStyle={decode(EXEC_DATA_07,'N/A','','bold')}
												</C>
												<C> Name='8월'	 ID=EXEC_DATA_08 Align=center	Width=80 color={decode(EXEC_DATA_08,'N/A','gray','0%','darkgray','black')}  BgColor='white' FontStyle={decode(EXEC_DATA_08,'N/A','','bold')}
												</C>
												<C> Name='9월'	 ID=EXEC_DATA_09 Align=center	Width=80 color={decode(EXEC_DATA_09,'N/A','gray','0%','darkgray','black')}  BgColor='white' FontStyle={decode(EXEC_DATA_09,'N/A','','bold')}
												</C>
												<C> Name='10월'	 ID=EXEC_DATA_10 Align=center	Width=80 color={decode(EXEC_DATA_10,'N/A','gray','0%','darkgray','black')}  BgColor='white' FontStyle={decode(EXEC_DATA_10,'N/A','','bold')}
												</C>
												<C> Name='11월'	 ID=EXEC_DATA_11 Align=center	Width=80 color={decode(EXEC_DATA_11,'N/A','gray','0%','darkgray','black')}  BgColor='white' FontStyle={decode(EXEC_DATA_11,'N/A','','bold')}
												</C>
												<C> Name='12월'	 ID=EXEC_DATA_12 Align=center	Width=80 color={decode(EXEC_DATA_12,'N/A','gray','0%','darkgray','black')}  BgColor='white' FontStyle={decode(EXEC_DATA_12,'N/A','','bold')}
												</C>
											</G>
											<G> Name='평		가' ID=GL04 HeadBgColor='#F5DF4D'
												<C> Name='점수' ID=EVAL_VAL		Width=100  Align=center HeadBgColor='#F5DF4D' BgColor={decode(IND_TYPE,'04','#fdfd8b','white' )} FontStyle=''
												</C>
												<C> Name='점수(가중치)' ID=EVAL_VAL_S Width=100 Align=center HeadBgColor='#F5DF4D' BgColor={decode(IND_TYPE,'04','#fdfd8b','white' )} FontStyle=''
												</C>
												<C> Name='점수(80%)' ID=EVAL_VAL_80 Width=100 Align=center HeadBgColor='#F5DF4D' BgColor={decode(IND_TYPE,'04','#fdfd8b','white' )} FontStyle='bold'
												</C>
											</G>
											">
									</OBJECT><!--CONVPAGE_HEAD 지우지마세요//--></comment> <script> __WS__(__NSID__1); </script> <!--CONVPAGE_TAIL 지우지마세요//-->
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
				<!-- 프로그래머 디자인 종료 //-->
			</table>
		</div>
		<!-- 가우스 Bind 객체정의 시작 //-->
		<!-- 가우스 Bind 객체정의 종료 //-->
	</body>
</html>
<%
	try
	{
		CITCommon.finalPage();
	}
	catch (Exception ex)
	{
		throw new Exception("페이지 종료 오류 -> " + ex.getMessage());
	}
%>
