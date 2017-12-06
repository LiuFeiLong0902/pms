<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<html>
<head>
<base href="<%=basePath%>">
<title>添加</title>

<link rel="stylesheet" type="text/css" href="css/style1.css"/>
<link rel="stylesheet" type="text/css" href="css/divStyle.css"/>
<link rel="stylesheet" type="text/css" href="css/validator3.5.css"/>
<link rel="stylesheet" type="text/css" href="css/ui-lightness/jquery-ui-1.8.7.custom.css" media="screen"/>
<link rel="stylesheet" type="text/css" href="css/ui.jqgrid.css" media="screen"/>
<script type=text/javascript src="js/jquery-1.4.4.min.js"></script>

</head>

<body>
<table style="BACKGROUND-COLOR: #ffffff" border=0 cellspacing=0 cellpadding=0 width="100%">
<tbody>
<tr>
<td class=center_top_left width=15></td>
<td class=center_top_bg width=1197></td>
<td class=center_top_right width=15><img src="images/center_top_right.gif"/></td>
<td class=list_last_td_background width=2>&nbsp;</td></tr>
<tr>
<td class=center_bottom colspan=3>
<div style="HEIGHT: 434px" id=contentDiv class=center_content>
<table style="MARGIN-BOTTOM: 5px" border=0 cellspacing=0 cellpadding=0 width="100%">
<tbody>
<tr>
<td class=add>
<div class=add_search>添加岗位</div></td></tr>
<tr>
<td class=condition align="center">


<!-- ~~~~~~~~~~~~~ 添加岗位 ~~~~~~~~~~~~~~~~~~~ -->
<form method=post action="roleAction_edit" >
<table border=0 cellspacing=0 cellpadding=0 width=750>
	<tbody>
		<tr>
			<td style="COLOR: red" height=30 colspan=4 align=left>*请正确填写下方信息* </td>
		</tr>
	
		<tr>
			<td height=30 align=left>岗位名称：</td>
			<td width=550 colspan=3 align=left>
				<input type="hidden" name="role.id" value="<s:property value='#role.id'/>" />
				<input id="title" type=text name="role.name" value="<s:property value='#role.name'/>" />
			</td>
		</tr>
		<tr><td>&nbsp;</td></tr>
		<tr>
			<td height=30 align=left>岗位描述：</td>
			<td width=550 colspan=3 align=left>
				<textarea cols="30" rows="3" name="role.description"><s:property value="#role.description"/></textarea>
			</td>
		</tr>
		<tr>
			<td height=40 colspan=4 valign="middle">
				<input class=botton_bc value=保存 type=submit /> 
				<input class=botton_fh value=返回 type=button onclick="location.href='roleAction_list'" /> 
			</td>
		</tr>
	</tbody>
</table>
</form>


</td>
</tr>
</tbody>
</table>
</div>
</td>
<td class=list_last_td_background width=2>&nbsp;</td></tr></tbody></table>
</body>