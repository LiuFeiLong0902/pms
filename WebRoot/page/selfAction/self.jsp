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
<link rel="stylesheet" type="text/css" href="css/ui-lightness/jquery-ui-1.8.7.custom.css" media="screen"/>
<link rel="stylesheet" type="text/css" href="css/ui.jqgrid.css" media="screen"/>

<link href="css/skin.css" rel="stylesheet" type="text/css" />
<LINK href="css/Style.css" type=text/css rel=stylesheet>
<LINK href="css/Manage.css" type=text/css rel=stylesheet>

<link rel="stylesheet" type="text/css" href="css/style1.css"/>
<link rel="stylesheet" type="text/css" href="css/divStyle.css"/>
<link rel="stylesheet" type="text/css" href="css/validator3.5.css"/>

<script type="text/javascript">

</script>
</head>

<body>

<TABLE cellSpacing=0 cellPadding=0 width="80%" align="center"  border=0>
  <TBODY>
  <TR>
    <TD width=15><IMG src="images/new_019.jpg" border=0></TD>
    <TD width="100%" background=images/new_020.jpg height=20></TD>
    <TD width=15><IMG src="images/new_021.jpg" 
  border=0></TD></TR></TBODY></TABLE>
<TABLE cellSpacing=0 cellPadding=0 border=0 width="80%" align="center" >
  <TR>
    <TD width=15 background=images/new_022.jpg><IMG 
      src="images/new_022.jpg" border=0> </TD>
    <TD vAlign=top width="100%" bgColor=#ffffff>
      <TABLE cellSpacing=0 cellPadding=5 width="100%" border=0 width="80%" align="center" >
        <TR>
          <TD class=manageHead>当前位置：员工管理 &gt; 员工信息 <br></TD></TR>
        <TR>
          <TD align="center">
         <div class="box1">
         
         
<!-- 表单元素 -->
<form action="empAction_add" method="post">
	<input type="hidden" name="emp.password" value="wc" />
<p>&nbsp;</p>


<!-- 基本信息 -->
<fieldset>
	<legend>基本信息</legend>
	<table class="tableStyle" align="center" width="85%">
		<tr>
			<td width="15%" align="right">姓名：</td>
			<td width="30%" align="left">${emp.name }</td>
			<td width="10%" align="right">性别：</td>
			<td align="left">${emp.sex }</td>
			<td rowspan="3" width="20%"><font size="24" color="red">${emp.empStatus }</font></td>
			</tr>
			<tr><td colspan="4" height="11">&nbsp;</td></tr>
			<tr>
			<td width="16%" align="right">联系电话：</td>
			<td width="30%" align="left">${emp.tel }</td>
			<td width="16%" align="right">入职类型：</td>
			<td align="left">${emp.entryType }</td>
		</tr>
		
	</table>
</fieldset>
<br/>


<!-- 详细信息 -->
<fieldset>
	<legend align="top">详细信息</legend>
	<table class="tableStyle" align="center" width="85%">
		<tr align="left">
			<td width="16%" align="right">岗位：</td>
			<td align="left">
				<s:iterator value="emp.roles">
					<input type="checkbox" disabled checked />${name }
				</s:iterator>
			</td>
			<td width="16%" align="right">部门：</td>
			<td width="30%" align="left">${emp.dept.name }</td>
		</tr>
		<tr><td colspan="4" height="11">&nbsp;</td></tr>
		<tr>
			<td width="13%" align="right">入职日期：</td>
			<td width="30%" align="left"><s:date name="emp.hiredate" format="yyyy年MM月dd日" /></td>
			<td width="14%" align="right">转正日期：</td>
			<td width="40%" align="left"><s:date name="emp.conversionDate" format="yyyy年MM月dd日" /></td>
		</tr>
	</table>
</fieldset>
<br/>


<!-- 其他信息 -->
<fieldset>
	<legend>其他信息</legend>
	<table class="tableStyle" align="center" width="84%">
		<tr>
			<td width="14%" align="right">出生日期：</td>
			<td align="left" width="25%"><s:date name="emp.birth" format="yyyy年MM月dd日" /></td>
			<td width="12%" align="right">民族：</td>
			<td width="30%" align="left">${emp.nation }</td>
		</tr>
		<tr>
			<td colspan="4" height="11">&nbsp;</td>
		</tr>
		<tr>
			<td width="14%" align="right">身份证号：</td>
			<td>${emp.idCard }</td> 
			<td align="right">学历：</td>
			<td align="left">${emp.diploma }</td>
		</tr>
		<tr><td colspan="4" height="11">&nbsp;</td></tr>
		<tr>
			<td align="right">籍&nbsp;贯：</td>
			<td align="left">${emp.province }省&nbsp;${emp.city }市</td>
		</tr>
	</table>
	<table>
	<tr><td><a href="deptChangeAction_addUI?emp.id=${emp.id }">申请部门调动</a></td></tr>
	</table>
</fieldset>

<!-- 提交
<div class="padding_top10">
	<table class="tableStyle">
		<tr>
			<td colspan="4">
				<input class=botton_fh value=返回 type=button onclick="location.href='empAction_list'" /> 
			</td>
		</tr>
	</table>
</div>
 -->
</form>
			
			
		</div>
          </TD></TR>
      </TABLE><br></TD>
    <TD width=15 background=images/new_023.jpg><IMG 
      src="images/new_023.jpg" border=0> </TD></TR></TBODY></TABLE>
<TABLE cellSpacing=0 cellPadding=0 width="80%" align="center" border=0>
  <TR>
    <TD width="15" align="right"><IMG src="images/new_024.jpg" border=0></TD>
    <TD width="100%" background=images/new_025.jpg height=15></TD>
    <TD width="15"><IMG src="images/new_026.jpg" 
  border=0></TD></TR></TBODY></TABLE>
  
  

<!-- 弹出层 -->
<div id="dialog-message" align="center"></div>

  
</body>
</html>
