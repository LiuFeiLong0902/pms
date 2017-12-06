<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
<base href="<%=basePath%>">
<%@include file="../../inc.jsp"%>

<link href="css/skin.css" rel="stylesheet" type="text/css" />
<link href="css/KJ.css" rel="stylesheet" type="text/css" />
<LINK href="css/Style.css" type=text/css rel=stylesheet>
<LINK href="css/Manage.css" type=text/css rel=stylesheet>
<link rel="stylesheet" type="text/css" href="css/style1.css"/>
<link rel="stylesheet" type="text/css" href="css/divStyle.css"/>
<link rel="stylesheet" type="text/css" href="css/validator3.5.css"/>

<script type="text/javascript">
function switchPageSize(pageSize) {
	location.href="probationAction_list?pageBean.pageSize=" + pageSize;
}

function jumpTo(currPage) {
	var probationStatus = "<s:property value='probation.probationStatus' />";
	var result = "<s:property value='probation.result' />";
	var pageSize = "<s:property value='pageBean.pageSize' />";
	
	$("#11").val(probationStatus);
	$("#22").val(result);
	$("#33").val(currPage);
	$("#44").val(pageSize);
	$("#hidden").submit();
	
	/*
	location.href="probationAction_listByConditions?"
			+ "probation.probationStatus=" + probationStatus
			+ "&probation.result=" + result
			+ "&pageBean.currPage=" + currPage
			+ "&pageBean.pageSize=" + pageSize;
	*/
	
	/*
	$.post(
		"probationAction_listByConditions",
		{
			"probation.probationStatus" : "<s:property value='probation.probationStatus' />",
			"probation.result" : "<s:property value='probation.result' />",
			"pageBean.currPage" : currPage,
			"pageBean.pageSize" : "<s:property value='pageBean.pageSize' />"
		},
		function(data) {
			alert(data);
			process(data);
		},
		"html"
	);
	*/
}

function relateToResult(status) {
	if ("待处理" == status) {
		$("#result").empty();
		$("#result").append("<option value=''>全部结果</option>");
	} else {
		$("#result").empty();
		$("#result").append("<option value=''>全部结果</option>");
		$("#result").append("<option value='允许入职'>允许入职</option>");
		$("#result").append("<option value='不予录用'>不予录用</option>");
	}
}
</script>
</head>

<body>
<form id="hidden" action="probationAction_listByConditions" method="post">
	<input type="hidden" id="11" name="probation.probationStatus" />
	<input type="hidden" id="22" name="probation.result" />
	<input type="hidden" id="33" name="pageBean.currPage" />
	<input type="hidden" id="44" name="pageBean.pageSize" />
</form>

<TABLE cellSpacing=0 cellPadding=0 width="98%" border=0>
  <TBODY>
  <TR>
    <TD width=15><IMG src="images/new_019.jpg" border=0></TD>
    <TD width="100%" background=images/new_020.jpg height=20></TD>
    <TD width=15><IMG src="images/new_021.jpg" 
  border=0></TD></TR></TBODY></TABLE>
<TABLE cellSpacing=0 cellPadding=0 width="98%" border=0>
  <TR>
    <TD width=15 background=images/new_022.jpg><IMG 
      src="images/new_022.jpg" border=0> </TD>
    <TD vAlign=top width="100%" bgColor=#ffffff>
      <TABLE cellSpacing=0 cellPadding=5 width="100%" border=0>
        <TR>
          <TD class=manageHead>当前位置：试用期管理 &gt; 待审核的员工</TD></TR>
        <TR>
          <TD height=2></TD></TR>
      </TABLE>
      <TABLE borderColor=#cccccc cellSpacing=0 cellPadding=0 width="100%" align=center border=0>
        <TBODY>
        <TR>
          <TD height=25>


<!-- ~~~~~~~~~~~~~~~~~~~~~~~~ 模糊查询  ~~~~~~~~~~~~~~~~~~~~   -->
<FORM method=post action="probationAction_listByConditions">
<input type="hidden" name="pageBean.pageSize" value="${pageBean.pageSize }" />
<input type="hidden" name="pageBean.currPage" value="1" />
<TABLE cellSpacing=0 cellPadding=2 border=0 width="100%">
<TBODY>
<TR>
	<TD width="8%">筛选数据：</TD>
	<TD width="14%">
		<img src="images/to.gif" /> 审批状态
		<SELECT name="probation.probationStatus" onchange="relateToResult(this.value)"> 
			<OPTION value="">全部状态</OPTION> 
			<OPTION value="待处理" 
				<s:property value="probation.probationStatus == '待处理' ? 'selected' : '' "/> >待处理</OPTION>
			<OPTION value="已处理"
				<s:property value="probation.probationStatus == '已处理' ? 'selected' : '' "/>  >已处理</OPTION>
		</SELECT>
	</TD>
	<TD width="14%">
		<img src="images/to.gif" /> 处理结果
		<SELECT id="result" name="probation.result"> 
			<OPTION value="">全部结果</OPTION> 
			<OPTION value="允许入职"
				<s:property value="probation.result == '允许入职' ? 'selected' : '' "/>  >允许入职</OPTION>
			<OPTION value="不予录用"
				<s:property value="probation.result == '不予录用' ? 'selected' : '' "/>  >不予录用</OPTION>
		</SELECT>
	</TD>
	<TD width="6%"><INPUT class=button id=sButton2 type=submit value=" 筛选 "></TD>
	<td width="58%">&nbsp;</td>
</TR>
</TBODY>
</TABLE>
</FORM>
</TD></TR>
<!-- ~~~~~~~~~~~~~~~~~ 记录 ~~~~~~~~~~~~~~~~~~~~~ -->
<TR>
<TD>
<p>&nbsp;</p>
<TABLE style="text-align:center;" class="grid" cellSpacing=1 cellPadding=2 rules=all border=1 width="100%">
	<TR style="FONT-WEIGHT: bold; FONT-STYLE: normal; BACKGROUND-COLOR: #eeeeee; TEXT-DECORATION: none" >
		<td>员工姓名</td>
		<td>部门</td>
		<td>岗位</td>
		<td>入职日期</td>
		<td>审核状态</td>
		<td>审核结果</td>
		<td>处理日期</td>
		<td>操作</td>
	</TR>
	<s:iterator value="pageBean.recordList">
		<TR style="FONT-WEIGHT: normal; FONT-STYLE: normal; BACKGROUND-COLOR: white; TEXT-DECORATION: none">
			<TD><a href="empAction_getInfo?emp.id=${emp.id }"><img src="images/user.png" /> ${emp.name }</a></TD>
			<TD>${emp.dept.name }</TD>
			<TD>
				<s:iterator value="emp.roles">
					<input type="checkbox" disabled checked />${name }&nbsp;
				</s:iterator>
			</TD>
			<td><s:date name="emp.hiredate" format="yyyy年MM月dd日" /></td>
			<td>
				<s:if test="probationStatus == @com.sram.entity.Probation@PROBATION_STATUS_WAITING">
					<img src="images/pic23.gif" />${probationStatus }
				</s:if>
				<s:else>
					<img src="images/start.gif" />${probationStatus }
				</s:else>
			</td>
			<td>
				<s:if test="result == @com.sram.entity.Probation@PROBATION_RESULT_PASS">
					<img src="images/onSuccess.gif" />${result }
				</s:if>
				<s:if test="result == @com.sram.entity.Probation@PROBATION_RESULT_DECLINE">
					<img src="images/pic12.gif" />${result }
				</s:if>
				<s:if test="result == null">
					<img src="images/onError.gif" />
				</s:if>
			</td>
			<td>
				<s:if test="processDate == null">
					<img src="images/onError.gif" />
				</s:if>
				<s:date name="processDate" format="yyyy年MM月dd日" />
			</td>
			<TD>
				<s:if test="probationStatus == @com.sram.entity.Probation@PROBATION_STATUS_WAITING">
					<a href="probationAction_evaluationUI?probation.id=${id }">
						<img src="images/listBigJt.gif" /> 试用期审核
					</a>
				</s:if>
				<s:else>
					<img src="images/onError.gif" />
				</s:else>
			</TD>
		</TR>
	</s:iterator>
</TABLE>
</TD>
</TR>


<!-- ~~~~~~~~~~~~~批量操作~~~~~~~~~~~~~~~~ -->
<tr>
	<td><p>&nbsp;</p></td>
</tr>
<TR>
	<td align="left"> &nbsp; </td>
	</TR>


<!-- ~~~~~~~~~~ 分页  ~~~~~~~~~~~~~~~~~ -->
<TR>
<TD>
	<SPAN id=pagelink>
		共[<B><s:property value="pageBean.recordCount" /></B>]条记录   
		 当前是<s:property value="pageBean.currPage" />页
		<A href="javascript:void(0)" onclick="jumpTo(1)">
			<img src="images/main_54.gif" />
		</A>
		
		<s:iterator begin="pageBean.begin" end="pageBean.end" status="status">
			<a href="javascript:void(0)" onclick="jumpTo(<s:property value='#status.index + pageBean.begin' />)">
				<s:if test="#status.index+pageBean.begin == pageBean.currPage">
					<b>[<s:property value='#status.index + pageBean.begin'/>]</b>
				</s:if>
				<s:else>
					[<s:property value='#status.index + pageBean.begin'/>]
				</s:else>
			</a>
		</s:iterator>
		<!-- 
		 -->
		
		<a href="javascript:void(0)" onclick="jumpTo(${pageBean.pageCount})">
			<img src="images/main_60.gif" />
		</a>
		每页显示
		<select name="pageSize" onchange="switchPageSize(this.value)">
			<option value="1" <s:property value="pageBean.pageSize == 1 ? 'selected' : '' "/> >1</option>
			<option value="2" <s:property value="pageBean.pageSize == 2 ? 'selected' : '' "/> >2</option>
			<option value="3" <s:property value="pageBean.pageSize == 3 ? 'selected' : '' "/> >3</option>
			<option value="4" <s:property value="pageBean.pageSize == 4 ? 'selected' : '' "/> >4</option>
			<option value="5" <s:property value="pageBean.pageSize == 5 ? 'selected' : '' "/> >5</option>
		</select>
		条记录
	</SPAN>
</TD>
</TR>
   </TBODY></TABLE></TD>
    <TD width=15 background=images/new_023.jpg><IMG 
      src="images/new_023.jpg" border=0> </TD></TR></TABLE>
<TABLE cellSpacing=0 cellPadding=0 width="98%" border=0>
  <TR>
    <TD width=15><IMG src="images/new_024.jpg" border=0></TD>
    <TD width="100%" background=images/new_025.jpg height=15></TD>
    <TD width=15><IMG src="images/new_026.jpg" 
  border=0></TD></TR></TABLE>
  
  

<!-- 弹出层 -- message -->
<div id="dialog-message" align="center"></div>

  
</body>
</html>
