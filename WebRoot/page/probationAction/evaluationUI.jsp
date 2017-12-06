<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<HTML>
	<HEAD>
		<base href="<%=basePath %>">
		<META http-equiv=Content-Type content="text/html; charset=utf-8">
		<LINK href="css/YHChannelApply.files/Style.css" type=text/css
			rel=stylesheet>
		<LINK href="css/YHChannelApply.files/Manage.css" type=text/css
			rel=stylesheet>
		<link type="text/css" href="themes/base/jquery.ui.all.css"
			rel="stylesheet" />
		<script type="text/javascript" src="js/jquery-1.4.2.js"></script>
		<script type="text/javascript" src="external/jquery.bgiframe-2.1.1.js"></script>
		<script type="text/javascript" src="ui/jquery.ui.core.js"></script>
		<script type="text/javascript" src="ui/jquery.ui.widget.js"></script>
		<script type="text/javascript" src="ui/jquery.ui.mouse.js"></script>
		<script type="text/javascript" src="ui/jquery.ui.draggable.js"></script>
		<script type="text/javascript" src="ui/jquery.ui.position.js"></script>
		<script type="text/javascript" src="ui/jquery.ui.resizable.js"></script>
		<script type="text/javascript" src="ui/jquery.effects.core.js"></script>
		<script type="text/javascript" src="ui/jquery.effects.blind.js"></script>
		<script type="text/javascript" src="ui/jquery.effects.explode.js"></script>
		<link type="text/css" href="demos.css" rel="stylesheet" />
		<script type="text/javascript" src="js/jquery-1.8.2.js"></script>
		<script type="text/javascript" src="js/framework.js"></script>
		<link href="css/import_basic.css" rel="stylesheet" type="text/css" />
		<link rel="stylesheet" type="text/css" id="skin" />
		<META content="MSHTML 6.00.2900.3492" name=GENERATOR>
	</HEAD>
<BODY>
	<TABLE cellSpacing=0 cellPadding=0 width="98%" border=0>
			<TR>
				<TD width=15>
					<IMG src="css/YHChannelApply.files/new_019.jpg" border=0>
				</TD>
				<TD width="100%" background=css/YHChannelApply.files/new_020.jpg
					height=20></TD>
				<TD width=15>
					<IMG src="css/YHChannelApply.files/new_021.jpg" border=0>
				</TD>
			</TR>
	</TABLE>
		<TABLE cellSpacing=0 cellPadding=0 width="98%" border=0>
				<TR>
					<TD width=15 background=css/YHChannelApply.files/new_022.jpg>
						<IMG src="css/YHChannelApply.files/new_022.jpg" border=0>
					</TD>
					<TD vAlign=top width="100%" bgColor=#ffffff>
						<TABLE cellSpacing=0 cellPadding=5 width="100%" border=0>
							<TR>
								<TD class=manageHead>
									当前位置：人事管理系统 &gt; 试用期管理
								</TD>
							</TR>
							<TR>
								<TD height=2></TD>
							</TR>
						</TABLE>
						<TABLE borderColor="#ffffff" cellSpacing=0 cellPadding=0
							width="100%" align=center border=1>
							<TR>
								<TD>
		<TABLE id=grid style="BORDER-TOP-WIDTH: 0px; FONT-WEIGHT: normal; BORDER-LEFT-WIDTH: 0px; BORDER-LEFT-COLOR: #c0c0c0; BORDER-BOTTOM-WIDTH: 0px; BORDER-BOTTOM-COLOR: #cccccc; WIDTH: 100%; BORDER-TOP-COLOR: #cccccc; FONT-STYLE: normal; BACKGROUND-COLOR: #cccccc; BORDER-RIGHT-WIDTH: 0px; TEXT-DECORATION: none; BORDER-RIGHT-COLOR: #cccccc" cellSpacing=1 cellPadding=2 rules=all border=1>
			<TR>
				<td>
					<a href=""><br></a>&nbsp; 
				</td>
			</TR>
				<TR style="FONT-WEIGHT: bold; FONT-STYLE: normal; BACKGROUND-COLOR: #fff0f0; TEXT-DECORATION: none" align="center">
				<TD height="15"></TD>
				</TR>
		</TABLE>
		
		<form action="probationAction_update" method="post">
		<input type="hidden" name="probation.id" value="<s:property value='probation.id' />" />
		<input type="hidden" name="probation.emp.id" value="<s:property value='#emp.id' />" />
		<table width="100%">
			<tr height="35">
				<td width="30%" align="right">员工姓名：</td>
				<td><input type="text" value="<s:property value='#emp.name' />" disabled /></td>
			</tr>
			<tr height="35">
				<td width="30%" align="right">部门名称：</td>
				<td><input type="text" value="<s:property value='#emp.dept.name' />" disabled /></td>
			</tr>
			<tr height="35">
				<td width="30%" align="right">岗位名称：</td>
				<td>
					<s:iterator value="#emp.roles">
						<input type="checkbox" disabled checked />${name }&nbsp;
					</s:iterator>
				</td>
			</tr>
			<tr height="35">
				<td width="30%" align="right">考核结果：</td>
				<td>
					<select name="probation.result">
						<option value="允许入职">允许入职</option>
						<option value="不予录用">不予录用</option>
					</select>
				</td>
			</tr>
			<tr>
				<td width="30%" align="right">描述：</td>
				<td><textarea name="probation.comment" cols="20"></textarea></td>
			</tr>
			<tr align="center" height="35">
				<td colspan="2">
				<input type="submit" name="button" value=" 保 存 "> 
				<input type="button" value=" 返 回 " onclick="location.href='probationAction_list'"> 
				</td>
			</tr>
		</table>
		</form>
		
					</TD>
				</TR>
		</TABLE>
	</TD>
	<TD width=15 background=css/YHChannelApply.files/new_023.jpg>
		<IMG src="css/YHChannelApply.files/new_023.jpg" border=0>
	</TD>
</TR>
</TABLE>
	<TABLE cellSpacing=0 cellPadding=0 width="98%" border=0>
			<TR>
				<TD width=15>
					<IMG src="css/YHChannelApply.files/new_024.jpg" border=0>
				</TD>
				<TD align="center" width="100%"
					background=css/YHChannelApply.files/new_025.jpg height=15></TD>
				<TD width=15>
					<IMG src="css/YHChannelApply.files/new_026.jpg" border=0>
				</TD>
			</TR>
	</TABLE>
</HTML>



