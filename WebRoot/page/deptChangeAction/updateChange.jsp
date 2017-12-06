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
	<SCRIPT type="text/javascript" src="js/jquery/jquery-1.8.2.js"></SCRIPT>
	<script type="text/javascript">
		function result(result){
			document.getElementById("rs").value=result;
		}
	</script>
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
          <TD class=manageHead>当前位置： &gt; &gt; 审核结果 </TD></TR>
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
           <tr><td style="background-image: url('images/1.gif');width: 150"></td>
           	<td align="center">
         		 <form action="deptChangeAction_updateChange" method="post">
         		            <input type="hidden" name="deptChange.id" value="${deptChange.id}"/>
         		            <input type="hidden" name="deptChange.emp.id" value="${deptChange.emp.id}"/>
         		            <input type="hidden" name="deptChange.processDate" value="${deptChange.processDate}"/>
         		            <input type="hidden" name="deptChange.formerDept.id" value="${deptChange.formerDept.id}"/>
         		            <input type="hidden" name="deptChange.latterDept.id" value="${deptChange.latterDept.id}"/>
         		            <input type="hidden" name="deptChange.reason" value="${deptChange.reason}"/>			
           			<table border="1">    
           			<tr><td style="width: 200">申请人</td><td style="width: 200">${deptChange.emp.name }</td></tr>
           			<tr><td style="size: 50">申请日期</td><td><s:date format="yyyy-MM-dd" name="deptChange.processDate"/></td></tr>
           				<tr><td style="size:50">前部门</td><td>${deptChange.formerDept.name }</td></tr>
           				<tr><td style="size: 50">后部门</td><td>${deptChange.latterDept.name }</td></tr>
           				 <tr><td style="size: 50">申请原因</td><td>${deptChange.reason }</td></tr>
					<tr><td align="center"><input onchange="result(this.value);" type="radio" name="deptChange.processResult" value="未通过" checked/>未通过			
					</td><td align="center"><input  onchange="result(this.value);" type="radio" name="deptChange.processResult" value="通过"/>通过  							
           			</td></tr></table>		
               <input style="background-image: url('images/back2.jpg');" id="rs" type="submit" value="未通过"/>
             </form>
           	 </td>
           	 <td style="background-image: url('images/1.gif');width: 150"></td>
           </tr>
           </TABLE>
           
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


