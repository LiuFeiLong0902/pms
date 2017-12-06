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
		function box(box){
			alert(box);	
					$.ajax({
			    	type:"POST",
			    	url:"visitorAction_boxSome",
			    	data:{"box":box},
			    	dataType:"json"		    	  
				});				
			}
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
          <TD class=manageHead>当前位置：人事管理系统 &gt; 简历管理 </TD></TR>
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
           <tr>
           	<td>
           	</td>
              <td><a href="visitorAction_deleteSome"><img src="images/delete.gif" width="10" height="10" /> 删除  </a> &nbsp; </td>
           </tr>
              <TBODY>
             
              <TR  style="FONT-WEIGHT: bold; FONT-STYLE: normal; BACKGROUND-COLOR: #fff0f0; TEXT-DECORATION: none">
                <TD style="width: 75"> </TD>
                <TD style="width: 75">姓名</TD>
                <TD  style="width: 45">年龄</TD>
                <TD style="width: 45">性别</TD>
                <TD style="width: 100">应聘职位</TD>
                <TD style="width: 75">手机号码</TD>
                <TD style="width: 105">邮箱</TD>
                <TD style="width: 75">专业</TD>
                <td style="width: 100">状态</td>
                <td style="width: 100">结果</td>           
                 <td style="width: 150">管理</td>               
                </TR>
      <s:iterator value="#visitorList" var="visitorList">
      
              <TR style="FONT-WEIGHT: normal; FONT-STYLE: normal; BACKGROUND-COLOR: white; TEXT-DECORATION: none">
               <TD><INPUT id="box" type=checkbox value='<s:property value="#visitorList.id"/>' onchange="box(this.value);"> </TD> 
                <TD><s:property value="#visitorList.name"/></TD>          
                <TD><s:property value="#visitorList.age"/></TD>
                <TD><s:property value="#visitorList.sex"/></TD>
                <TD><s:property value="#visitorList.profession"/></TD>
                <TD><s:property value="#visitorList.tel"/></TD>
                <td><s:property value="#visitorList.email"/></td>
                <td><s:property value="#visitorList.edu"/></td>           
                <td><s:property value="#visitorList.confirm"/></td>
                <td><s:property value="#visitorList.state"/></td>         
                  <TD>  
                  	<s:if test='#visitorList.confirm.equals("未审核")'>              
                  		<A href='visitorAction_getOne?id=<s:property value="#visitorList.id"/>'><img src="images/mime.gif" width="10" height="10" />审核</A>&nbsp;&nbsp;
                  	</s:if>	            
                  	
                  		<A  href='visitorAction_deleteVisitor?id=<s:property value="#visitorList.id"/>'>
                  			<img src="images/pic12.gif" width="10" height="10" />删除
                  		</A>
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

