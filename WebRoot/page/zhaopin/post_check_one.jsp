<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<HTML ><HEAD>
<base href="<%=basePath %>">
<LINK href="css/YHChannelApply.files/Style.css" type=text/css rel=stylesheet>
<LINK href="css/YHChannelApply.files/Manage.css" type=text/css rel=stylesheet>

<%@include file="../../inc.jsp"%>

<BODY>
<TABLE cellSpacing=0 cellPadding=0 width="98%" border=0 bordercolor="red" >
  <TBODY>
  <TR>
    <TD width=15><IMG src="css/YHChannelApply.files/new_019.jpg" border=0></TD>
    <TD width="100%" background=css/YHChannelApply.files/new_020.jpg height=20></TD>
    <TD width=15><IMG src="css/YHChannelApply.files/new_021.jpg" 
  border=0></TD></TR></TBODY></TABLE>
<TABLE cellSpacing=0 cellPadding=0 width="98%" border=0 >
  <TBODY>
  <TR>
    <TD width=15 background=css/YHChannelApply.files/new_022.jpg>
    <IMG src="css/YHChannelApply.files/new_022.jpg" border=0> </TD>
    <TD vAlign=top width="100%" bgColor=#ffffff>
      <TABLE cellSpacing=0 cellPadding=5 width="100%" border=0>
        <TR>
          <TD class=manageHead>当前位置：&gt;查看单个招聘信息 </TD></TR>
        <TR>
          <TD height=2></TD></TR></TABLE>
      <TABLE borderColor="#ffffff" cellSpacing=0 cellPadding=0 width="100%" 
      align=center border=0>
       <TBODY>
        <TR>
          <TD>
            <TABLE id=grid
            style="BORDER-TOP-WIDTH: 0px; FONT-WEIGHT: normal; BORDER-LEFT-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px;  WIDTH: 100%; FONT-STYLE: normal; BORDER-RIGHT-WIDTH: 0px; TEXT-DECORATION: none;" 
            cellSpacing=1 cellPadding=2 rules=all border=0>
            <s:iterator value="#onelist" var="postGo">
        
           <tr>
           	<td align="center">
           		<fieldset style="width: 600">
						<legend style='font-size:15;'>招聘详细信息</legend>
					<table border="2">
						<tr><td style="width: 40;height: 25;" bgcolor="#C1F4FF">标&nbsp;&nbsp;&nbsp;&nbsp;题</td><td style="width: 1000;"><s:property value="#postGo.title"/></td></tr>
						<tr><td style="width: 40;height: 25;" bgcolor="#C1F4FF">开始时间</td><td><s:date name="#postGo.startTime" format="yyyy年MM月dd日"/></td></tr>
						<tr><td style="width: 40;height: 25;" bgcolor="#C1F4FF">结束时间</td><td><s:date name="#postGo.endTime" format="yyyy年MM月dd日"/></td></tr>
						<tr><td style="width: 40;height: 25;" bgcolor="#C1F4FF">招聘职位</td><td><s:property value="#postGo.position"/></td></tr>
						<tr><td style="width: 40;height: 25;" bgcolor="#C1F4FF">招聘人数</td><td><s:property value="#postGo.num"/></td></tr>
						<tr><td style="width: 40;height: 25;" bgcolor="#C1F4FF">登记人</td><td ><s:property value="#postGo.name"/></td></tr>
						<tr><td style="width: 40;height: 25;" bgcolor="#C1F4FF">招聘条件</td><td ><s:property value="#postGo.requirement"/></td></tr>
						<tr><td style="width: 40;height: 25;" bgcolor="#C1F4FF">备注</td><td><s:property value="#postGo.remark"/></td></tr>															
					</table>				
				</fieldset>	
           	 </td>
           </tr>
               </s:iterator>
           </TABLE></TD></TR>
      
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


