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
/* 删除岗位 */
function delRole(id) {
	$("#dialog-message").html("<span class='message'>确认要删除吗?</span>");
	$("#dialog-message").dialog ({
		resizable : false,
		height : 140,
		modal : true,
		buttons : {
			'删除' : function() {
				$.post("roleAction_delete", {
					"role.id":id
				}, function(data) {
					/*
					var message = "删除成功";
					if ("success" != data) {
						message = "删除失败";
						return;
					} 
					*/
					
					$("#dialog-message").html("<span class='message'>" + data + "</span>");
					$("#dialog-message").dialog( {
						modal : true,
						buttons : {
							"确定" : function() {
								$(this).dialog("close");
								location.href="roleAction_list";
							}
						}
					});
				});
				$(this).dialog('close');
			},
			'取消' : function() {
				$(this).dialog('close');
			}
		}
	});
}
</script>
</head>

<body>

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
          <TD class=manageHead>当前位置：系统管理 &gt; 岗位管理 &gt; 岗位列表</TD></TR>
        <TR>
          <TD height=2></TD></TR>
      </TABLE>
      <TABLE borderColor=#cccccc cellSpacing=0 cellPadding=0 width="100%" align=center border=0>
        <TBODY>
        <TR>
          <TD height=25>


<!-- ~~~~~~~~~~~~~~~~~~~~~~~~ 模糊查询  ~~~~~~~~~~~~~~~~~~~~   -->
<FORM id="conditions" name="conditions" method=post>
<TABLE cellSpacing=0 cellPadding=2 border=0 width="100%">
<TBODY>
<TR>
	<TD width="8%">筛选数据：</TD>
	<TD width="8%">
		<SELECT id=sClient  name=sClient> 
			<OPTION value="" selected>全部广告商</OPTION> 
			<OPTION value=lenovo>罗宝网</OPTION>
		</SELECT>
	</TD>
	<TD width="8%">
		<SELECT id=sFlag name=sFlag> 
			<OPTION value=0 selected>全部状态</OPTION> 
			<OPTION value=1>新申请</OPTION>
			<OPTION value=2>审核通过</OPTION>
		</SELECT>
	</TD>
	<TD width="6%">渠道商</TD>
	<TD width="6%"><INPUT class=textbox id=sChannel2 style="WIDTH: 90px;hight: 30px" maxLength=50 name=sChannel2></TD>
	<TD width="6%">起始日期</TD>
	<TD width="6%"><INPUT class=textbox id=sStart2 style="WIDTH: 90px" name=sStart2></TD>
	<TD width="6%">截止日期</TD>
	<TD width="6%"><INPUT class=textbox id=sEnd2 style="WIDTH: 90px" name=sEnd2></TD>
	<TD width="6%"><INPUT class=button id=sButton2 type=submit value=" 筛选 " name=sButton2></TD>
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
<TABLE class="grid" cellSpacing=1 cellPadding=2 rules=all border=1 width="100%">
	<TR style="FONT-WEIGHT: bold; FONT-STYLE: normal; BACKGROUND-COLOR: #eeeeee; TEXT-DECORATION: none" >
		<td>岗位名称</td>
		<td>岗位描述</td>
		<td>详细</td>
		<td>操作</td>
	</TR>
	<s:iterator value="#roles">
		<TR style="FONT-WEIGHT: normal; FONT-STYLE: normal; BACKGROUND-COLOR: white; TEXT-DECORATION: none">
			<TD>${name }</TD>
			<TD>${description }</TD>
			<TD><A href="roleAction_editUI?role.id=${id}">修改</A></TD>
			<TD>
				<a href="javascript:void(0)" onclick="delRole(${id})">删除</a>&nbsp;
				<a href="roleAction_setPrivilegeUI?role.id=${id}">设置权限</a>
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
	<td align="left"><img src="images/001.gif" width="14" height="14" />
	<a href="page/roleAction/add.jsp">添加</a>&nbsp;&nbsp;
	</td>
	</TR>


<!-- ~~~~~~~~~~ 分页  ~~~~~~~~~~~~~~~~~ -->
<TR>
	<TD>
		<SPAN id=pagelink>
			共[<B>84</B>]条记录    当前是[6]页
			[<A href="#">前一页</A>] 
			<A class="" href="#">1</A> 
			<A class="" href="#">2</A> 
			<A class="" href="#">3</A> 
			<B>4</B> 
			<A class="" href="#">5</A> 
			<A class="" href="#">6</A> 
			[<A class="" href="#">后一页</A>] 
			<SELECT>
				<OPTION value=1>第1页</OPTION>
				<OPTION value=2>第2页</OPTION>
				<OPTION value=3>第3页</OPTION>
				<OPTION value=4 selected>第4页</OPTION>
				<OPTION value=5>第5页</OPTION>
				<OPTION value=6>第6页</OPTION></SELECT>
		</SPAN>
</TD>
</TR>
   </TBODY></TABLE></TD>
    <TD width=15 background=images/new_023.jpg><IMG 
      src="images/new_023.jpg" border=0> </TD></TR></TBODY></TABLE>
<TABLE cellSpacing=0 cellPadding=0 width="98%" border=0>
  <TR>
    <TD width=15><IMG src="images/new_024.jpg" border=0></TD>
    <TD width="100%" background=images/new_025.jpg height=15></TD>
    <TD width=15><IMG src="images/new_026.jpg" 
  border=0></TD></TR></TBODY></TABLE>
  
  

<!-- 弹出层 -->
<div id="dialog-message" align="center"></div>

  
</body>
</html>
