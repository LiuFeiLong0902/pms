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

<script type="text/javascript">
	function changeConfirm(changeConfirm){
		document.getElementById("beforeConfirm").value=changeConfirm;
	}
</script>
	<script type="text/javascript">
	// increase the default animation speed to exaggerate the effect
	$.fx.speeds._default = 1000;
	$(function() {
		$('#dialog').dialog({
			autoOpen: false,
			height: 400,
			width:500,
			show: 'blind',
			hide: 'explode'
		});
		
		$('#opener').click(function() {
			$('#dialog').dialog('open');
			return false;
		});
		$('#cancel').click(function() {
			$('#dialog').dialog('close');
			return false;
		});
		
	});	

	
	
	
	</script>
<META content="MSHTML 6.00.2900.3492" name=GENERATOR></HEAD>
<BODY>
           <div>

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
          <TD class=manageHead>当前位置： &gt; 所有招聘信息 </TD></TR>
        <TR>
          <TD height=2></TD></TR></TABLE>
      <TABLE borderColor="#ffffff" cellSpacing=0 cellPadding=0 width="100%" 
      align=center border=0>
        <TBODY>
        <TR>
          <TD height=25>
          <form action="postGoAction_checkConditions2" method="post">
            <TABLE cellSpacing=0 cellPadding=2 border=0>
              <TBODY>
              <TR> 
              <TD>输入查询条件：</TD><td></td>         
                <TD>招聘职位:</TD>
                <TD><INPUT class=textbox id=sChannel2 style="WIDTH: 70px" 
                  maxLength=50 name="postGo.position"></TD>
                <TD>登记人:</TD>
                <TD><INPUT class=textbox id=sStart2 style="WIDTH: 70px" 
                  name="postGo.name"></TD>            
                <TD><INPUT class=button type="reset" style="WIDTH: 70px" name=sEnd2></TD>
                <TD><INPUT class=button type="submit" style="WIDTH: 70px" value=" 查询 "></TD>                    
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
                
                <TD style="width: 75">标题</TD>
                <TD style="width: 75">开始时间</TD>
                <TD style="width: 75">结束时间</TD>
                <TD style="width: 75">招聘人数</TD>
                <TD style="width: 75">招聘职务</TD>
                <TD style="width: 75">登记人</TD>
                           
                </TR>
                <s:iterator value="#plist" var="plist">
              <TR 
              style="FONT-WEIGHT: normal; FONT-STYLE: normal; BACKGROUND-COLOR: white; TEXT-DECORATION: none">
                
                <TD>
               		<A href='postGoAction_checkone?id=<s:property value="#plist.id" />'>
                		<s:property value="#plist.title"/>
                	</A>
               </TD>          
                <TD><s:date name="#plist.startTime" format="yyyy年MM月dd日"/></TD>
                <TD><s:date name="#plist.endTime" format="yyyy年MM月dd日"/></TD>
                <TD><s:property value="#plist.num"/></TD>
                <TD><s:property value="#plist.position"/></TD>
                <td><s:property value="#plist.name"/></td>
                <!--TD><IMG alt=申请通过 src="css/YHChannelApply.files/start.gif"  border=0> </TD>  -->
             
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
    <TD align=middle width="100%" background=css/YHChannelApply.files/new_025.jpg 
    height=15></TD>
    <TD width=15><IMG src="css/YHChannelApply.files/new_026.jpg" 
  border=0></TD></TR></TBODY></TABLE>
  </div>	
</BODY></HTML>



