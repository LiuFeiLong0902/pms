<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
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
	<script type="text/javascript">
		
	</script>	
<BODY>
<TABLE cellSpacing=0 cellPadding=0 width="98%" border=0 bordercolor="red">
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
          <TD class=manageHead>当前位置： &gt; 部门调换 申请</TD></TR>
        <TR>
          <TD height=2></TD></TR></TABLE>
      <TABLE borderColor="#ffffff" cellSpacing=0 cellPadding=0 width="100%" 
      align=center border=0>
        <TBODY>
        <TR>
          <TD height=25>
          <form action="visitorAction_seeByCondition" method="post">
            <TABLE cellSpacing=0 cellPadding=2 border=0>      
              <TBODY>
              <TR>              
              <TD>输入查询条件：</TD>        
                <TD>姓名:</TD>
                <TD><INPUT name="visitor.name" class=textbox id=sChannel2 style="WIDTH: 70px"  maxLength=50 ></TD>
                <TD>应聘职位:</TD>
                <TD><INPUT class=textbox id=sStart2 style="WIDTH: 70px" 
                  name="visitor.profession"></TD>
                <TD>状态:</TD>
                   <TD><INPUT class=textbox id=sStart2 style="WIDTH: 70px" 
                 name="visitor.confirm"></TD>
                <TD><INPUT class=button type="reset" style="WIDTH: 70px" name=sEnd2></TD>
                <TD><INPUT class=button id=sButton2 type=submit style="WIDTH: 70px" value=" 查询 " name=sButton2></TD>
                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>        
                </TR>
                </TBODY>
                </TABLE>
                </form>
                </TD></TR>
        <TR>
          <TD>
            <TABLE id=grid 
            style="BORDER-TOP-WIDTH: 0px; FONT-WEIGHT: normal; BORDER-LEFT-WIDTH: 0px; BORDER-LEFT-COLOR: #c0c0c0; BORDER-BOTTOM-WIDTH: 0px; BORDER-BOTTOM-COLOR: #cccccc; WIDTH: 100%; BORDER-TOP-COLOR: #cccccc; FONT-STYLE: normal; BACKGROUND-COLOR: #cccccc; BORDER-RIGHT-WIDTH: 0px; TEXT-DECORATION: none; BORDER-RIGHT-COLOR: #cccccc" 
            cellSpacing=1 cellPadding=2 rules=all border=0>
         
              <TBODY>
             
              <TR  style="FONT-WEIGHT: bold; FONT-STYLE: normal; BACKGROUND-COLOR: #fff0f0; TEXT-DECORATION: none">
                <TD style="width: 75">申请人</TD>
                <TD  style="width: 100">申请日期</TD>
                <TD style="width: 75">前部门</TD>
                <TD style="width: 75">后部门</TD>
                <TD style="width: 105">原因</TD>
                <TD style="width: 75">审核状态</TD>
                <td style="width: 75">审核结果</td>           
                 <td style="width: 150">管理</td>               
                </TR>
      <s:iterator value="#dList" var="dList">
      
              <TR style="FONT-WEIGHT: normal; FONT-STYLE: normal; BACKGROUND-COLOR: white; TEXT-DECORATION: none">
                <TD><s:property value="#dList.emp.name"/></TD>          
                <TD><s:date name="#dList.processDate" format="yyyy年MM月dd日"/></TD>
                <TD><s:property value="#dList.formerDept.name"/></TD>
                <TD><s:property value="#dList.latterDept.name"/></TD>
                <TD><s:property value="#dList.reason"/></TD>
                <td><s:property value="#dList.approveStatus"/></td>
                <td><s:property value="#dList.processResult"/></td>                  
                  <TD>  
                  	<s:if test='#dList.approveStatus.equals("待审批")'>              
                  		<A href='deptChangeAction_getById?id=<s:property value="#dList.id"/>'><img src="images/mime.gif" width="10" height="10" />审核</A>&nbsp;&nbsp;
                  	</s:if>	            
                  	<s:if test='#dList.approveStatus.equals("已审批")'> 
                  			<img src="images/duigou.gif" width="10" height="10" />
             		</s:if>
                  </TD>   
                  </TR>
 				</s:iterator>         
           </TBODY></TABLE></TD></TR>     
   </TBODY></TABLE></TD>
    <TD width=15 background=css/YHChannelApply.files/new_023.jpg><IMG 
      src="css/YHChannelApply.files/new_023.jpg" border=0> </TD></TR></TBODY></TABLE>
<TABLE cellSpacing=0 cellPadding=0 width="98%" border=0>
  <TBODY>
  <TR>
    <TD width=15><IMG src="css/YHChannelApply.files/new_024.jpg" border=0></TD>
    <TD align=middle width="100%" background=css/YHChannelApply.files/new_025.jpg height=15></TD>
    <TD width=15><IMG src="css/YHChannelApply.files/new_026.jpg" 
  border=0></TD></TR></TBODY></TABLE>

</BODY></HTML>

