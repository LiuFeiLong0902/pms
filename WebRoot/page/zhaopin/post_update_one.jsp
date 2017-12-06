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
<script type="text/javascript" src="js/Calendar.js"></script>

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
          <TD class=manageHead>当前位置：招聘信息 &gt; 修改信息</TD></TR>
        <TR>
          <TD height=2></TD></TR></TABLE>
      <TABLE borderColor="#ffffff" cellSpacing=0 cellPadding=0 width="100%" 
      align=center border=0>
       <TBODY>
        <TR>
          <TD>
            <TABLE id=grid
            style="BORDER-TOP-WIDTH: 0px; FONT-WEIGHT: normal; BORDER-LEFT-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px;  WIDTH: 100%; FONT-STYLE: normal; BORDER-RIGHT-WIDTH: 0px; TEXT-DECORATION: none;" 
            cellSpacing=1 cellPadding=2 rules=all border=0 >
           <tr>
           	<td align="center">
          <s:iterator value="#onelist" var="postGo">
        <form action="postGoAction_post_update" method="post">
           		<fieldset style="width: 600">
						<legend >修改信息</legend>
					<table border="2">
						<tr><td bgcolor="#c0c0c0">标&nbsp;&nbsp;&nbsp;&nbsp;题</td >
						<td style="width: 1000">
						<input type="hidden" name="postGo.id" value='<s:property value="#postGo.id"/>'/>
						<input size="100" type="text" name="postGo.title"  value='<s:property value="#postGo.title"/>'/></td></tr>
						<tr><td bgcolor="#c0c0c0">
						开始时间</td>
						<td><input size="100" type="text" name="postGo.startTime"  onfocus="SelectDate(this)" readonly="readonly"
							value='<s:date name="#postGo.startTime" format="yyyy年MM月dd日"/>'/></td></tr>
						<tr><td bgcolor="#c0c0c0">
						结束时间</td>
						<td><input size="100" type="text" name="postGo.endTime"  onfocus="SelectDate(this)" readonly="readonly"
							value='<s:date name="#postGo.endTime" format="yyyy年MM月dd日"/>'/></td></tr>
						<tr><td bgcolor="#c0c0c0">
						招聘职位</td>
						<td><input size="100" type="text" name="postGo.position" value='<s:property value="#postGo.position"/>'/></td></tr>
						<tr><td bgcolor="#c0c0c0">
						招聘人数</td>
						<td><input size="100" type="text" name="postGo.num" value='<s:property value="#postGo.num"/>'/></td></tr>
						<tr><td bgcolor="#c0c0c0">
						登记人</td>
						<td ><input size="100" type="text" name="postGo.name" value='<s:property value="#postGo.name"/>'/></td></tr>
						<tr><td bgcolor="#c0c0c0">
						招聘条件</td>
						<td ><textarea cols="100" name="postGo.requirement"  ><s:property value="#postGo.requirement"/></textarea></td></tr>
						<tr><td bgcolor="#c0c0c0">
						备注</td>
						<td><textarea cols="100" name="postGo.remark" ><s:property value="#postGo.title"/></textarea></td></tr>															
					</table>				
				</fieldset>	
               <input type="submit" value="修改"/>
             </form>
             </s:iterator>
           	 </td>
           </tr>
           </TABLE>
           </TD></TR>
         
      
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


