<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
<base href="<%=basePath%>">
<link href="css/skin.css" rel="stylesheet" type="text/css" />
<link href="css/KJ.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery-1.4.4.js"></script>
<script type="text/javascript">
	
</script>
</head>

<body>
<br />
当前位置:<a href="page/my/my.jsp">【我的信息】</a> &gt; 【申请部门调转 】 
<hr />

<form method="post">
<TABLE align="center" cellSpacing=0 cellPadding=0 width="70%"
	border=1 style="outline:#104e8b solid thin;">
<TR style="BACKGROUND-IMAGE:url(images/bg_header.gif); BACKGROUND-REPEAT:repeat-x" height=47>
	<td colspan="3">
		<SPAN class="span1"></SPAN>
		<SPAN class="span2">申请部门调转</SPAN>
		<SPAN class="span3"></SPAN>
	</td>
</TR>
<tr>
	<td>
		<table id="emps" border="1" width="100%" cellpadding="5" bordercolor="#B9D3EE"
			style="border-collapse:collapse; text-align:center">
			<tr>
				<td width="30%">原部门</td>
				<td>
					<select name="formerDept">
						<option value="技术部">技术部</option>
						<option value="技术部1" disabled>&nbsp;&nbsp; |-技术部1</option>
						<option value="技术部2" disabled>&nbsp;&nbsp; |-技术部2</option>
						<option value="人事部" disabled>人事部</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>调转后部门</td>
				<td>
					<select name="latterDept">
						<option value="技术部" disabled>技术部</option>
						<option value="技术部1">&nbsp;&nbsp; |-技术部1</option>
						<option value="技术部2">&nbsp;&nbsp; |-技术部2</option>
						<option value="人事部">人事部</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>调转原因</td>
				<td>
					<textarea rows="1" cols="30" name="reason">换个环境...</textarea>
				</td>
			</tr>
			<tr>
				<td align="center" colspan="2">
					<input type="button" value="确认提交" />&nbsp;&nbsp;
					<input type="reset"" value="重置" />&nbsp;&nbsp;
				</td>
			</tr>
		</table>
	</td>
</tr>
</TABLE>
</form>
<br />
<div id="pageInfo" align="center" style="font-size:20px;"></div>
</body>
</html>
