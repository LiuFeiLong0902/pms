<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<HTML ><HEAD>
<base href="<%=basePath %>">
<META http-equiv=Content-Type content="text/html; charset=utf-8">
<LINK href="css/YHChannelApply.files/Style.css" type=text/css rel=stylesheet>
<LINK href="css/YHChannelApply.files/Manage.css" type=text/css rel=stylesheet>

<%@include file="../../inc.jsp"%>

	
<META content="MSHTML 6.00.2900.3492" name=GENERATOR></HEAD>
<BODY>
<TABLE cellSpacing=0 cellPadding=0 width="98%" border=0>
  <TBODY>
  <TR>
    <TD width=15><IMG src="css/YHChannelApply.files/new_019.jpg" border=0></TD>
    <TD width="100%" background=css/YHChannelApply.files/new_020.jpg height=20></TD>
    <TD width=15><IMG src="css/YHChannelApply.files/new_021.jpg" 
  border=0></TD></TR></TBODY></TABLE>
<TABLE cellSpacing=0 cellPadding=0 width="98%" border=0>
  <TBODY>
  <TR>
    <TD width=15 background=css/YHChannelApply.files/new_022.jpg><IMG 
      src="css/YHChannelApply.files/new_022.jpg" border=0> </TD>
    <TD vAlign=top width="100%" bgColor=#ffffff>
      <TABLE cellSpacing=0 cellPadding=5 width="100%" border=0>
        <TR>
          <TD class=manageHead>当前位置：人事管理系统 &gt; 部门调动申请页面  </TD></TR>
       </TABLE>
      <TABLE borderColor="#ffffff" cellSpacing=0 cellPadding=0 width="100%" 
      align=center border=0>
        <TBODY>
        <TR>
          <TD>
            <TABLE id=grid 
            style="BORDER-TOP-WIDTH: 0px; FONT-WEIGHT: normal; BORDER-LEFT-WIDTH: 0px; BORDER-LEFT-COLOR: #c0c0c0; BORDER-BOTTOM-WIDTH: 0px; BORDER-BOTTOM-COLOR: #cccccc; WIDTH: 100%; BORDER-TOP-COLOR: #cccccc; FONT-STYLE: normal; BACKGROUND-COLOR: #cccccc; BORDER-RIGHT-WIDTH: 0px; TEXT-DECORATION: none; BORDER-RIGHT-COLOR: #cccccc" 
            cellSpacing=1 cellPadding=2 rules=all border=0>
              <TBODY>
              <TR  style="FONT-WEIGHT: bold; FONT-STYLE: normal; BACKGROUND-COLOR: #fff0f0; TEXT-DECORATION: none">
              	<td height="15"></td> 
              </TR>
              <TR  style="FONT-WEIGHT: normal; FONT-STYLE: normal; BACKGROUND-COLOR: white; TEXT-DECORATION: none">
             <td>   <form action="deptChangeAction_add" method="post">
                 <table align="center" border="1" width="80%">
                 <tr height="30">
                 	<td width="35%" align="right">员工姓名：</td>
                 	<td>
                 		<input type="text" disabled value="${emp.name}" />
                 		<input type="hidden" name="emp.id" value="${emp.id}">
                 	</td>
                 </tr>
                 <tr height="30">
                 	<td width="35%" align="right">原有部门：</td>
                 	<td>
                 		<input type="text" disabled value="${emp.dept.name }" />
                 		<input type="hidden" value="${emp.dept.id }" name="deptChange.formerDept.id"/>
                 	</td>
                 </tr>
                 <tr height="30">
                 	<td width="35%" align="right">申请调转的部门：</td>
                 	<td>
                 	<select name="deptChange.latterDept.id">
					<s:iterator value="#depts">
						<s:if test="emp.dept.id==id">
							<option value="${id }" disabled >${name }</option>
						</s:if>
						<s:else>
							<option value="${id }" <s:property value='id == deptChange.latterDept.id ? "selected" : "" ' /> >
								${name }
							</option>
						</s:else>				
					</s:iterator>
					</select></td>
                 </tr>
                
                 <tr>
                 	<td width="35%" align="right">调转原因：</td>
                 	<td><textarea rows="4" cols="18" name="deptChange.reason">${deptChange.reason }</textarea></td>
                 </tr>
                 <tr align="center" height="30">             	
                 	<td colspan="2"><input type="submit" value=" 确定  "/>            	
                 	<input type="button" value=" 返 回 "/>
                 	 </td>
                 	
                 </tr>
                 </table>
                 </form></td>
              </TR>
           </TBODY></TABLE></TD></TR>
   </TBODY></TABLE></TD>
    <TD width=15 background=css/YHChannelApply.files/new_023.jpg><IMG 
      src="css/YHChannelApply.files/new_023.jpg" border=0> </TD></TR></TBODY></TABLE>
<TABLE cellSpacing=0 cellPadding=0 width="98%" border=0>
  <TBODY>
  <TR>
    <TD width=15><IMG src="css/YHChannelApply.files/new_024.jpg" border=0></TD>
    <TD align=middle width="100%" background=css/YHChannelApply.files/new_025.jpg 
    height=15></TD>
    <TD width=15><IMG src="css/YHChannelApply.files/new_026.jpg" 
  border=0></TD></TR></TBODY></TABLE>

</BODY></HTML>



