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
<%@include file="../../inc.jsp"%>

<link rel="stylesheet" type="text/css" href="css/style1.css"/>
<link rel="stylesheet" type="text/css" href="css/divStyle.css"/>
<link rel="stylesheet" type="text/css" href="css/validator3.5.css"/>
<link rel="stylesheet" type="text/css" href="css/ui-lightness/jquery-ui-1.8.7.custom.css" media="screen"/>
<link rel="stylesheet" type="text/css" href="css/ui.jqgrid.css" media="screen"/>

<script type="text/javascript">
/* 离职成功 */
function addDimission() {
	var dimission_emp_id = $("#emp\\.id").val();
	var approveStatus = $("#approveStatus").val();
	var leaveType = $("#leaveType").val();
	var reason = $("#reason").val();
	
	$.post("dimissionAction_add", {
			"dimission.emp.id" : dimission_emp_id,
			"dimission.approveStatus" : approveStatus,
			"dimission.leaveType" : leaveType,
			"dimission.reason" : reason
	}, function(data) {
		$("#dialog-message").html("<span class='message'>" + data + "</span>");
		$("#dialog-message").dialog( {
			modal : true,
			buttons : {
				"确定" : function() {
					$(this).dialog("close");
					location.href="empAction_list";
				}
			}
		});
	});
	//$(this).dialog('close');
};
</script>
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
<div class=add_search>员工离职</div></td></tr>
<tr>
<td class=condition>


<!-- ~~~~~~~~~~~~~ 强制离职~~~~~~~~~~~~~~~~~~~ -->
<form method=post action="dimission_add">
<input type="hidden" id="emp.id" name="dimission.emp.id" value="${dimission.emp.id }" />
<input type="hidden" id="approveStatus" name="dimission.approveStatus" value="已审批" />
<table border=0 cellspacing=0 cellpadding=0 width=750>
	<tbody>
		<tr>
			<td style="COLOR: red" height=30 colspan=4 align=left>*请正确填写下方信息* </td>
		</tr>
	
		<tr>
			<td height=30>员工姓名：</td>
			<td width=550 colspan=3 align=left>
				<input id="title" type=text value="${dimission.emp.name }" disabled />
			</td>
		</tr>
		<tr>
			<td height=30>离职类型：</td>
			<td width=550 colspan=3 align=left>
			<select id="leaveType" name="dimission.leaveType">
				<option value="辞退">辞退</option>
				<option value="主动离职" disabled>主动离职</option>
			</select>
			</td>
		</tr>
		<tr>
			<td height=30>离职原因：</td>
			<td width=550 colspan=3 align=left>
				<textarea id="reason" cols="30" rows="3" name="dimission.reason"></textarea>
			</td>
		</tr>
		<tr>
			<td height=40 colspan=4 valign="middle">
				<input class=botton_bc value=保存 type=button onclick="addDimission()" /> 
				<input class=botton_fh value=返回 type=button onclick="location.href='empAction_list'" /> 
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

<!-- 弹出层 -->
<div id="dialog-message" align="center"></div>
</body>
</html>