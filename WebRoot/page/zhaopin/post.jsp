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

<script type="text/javascript" src="js/Calendar.js"></script>
<script type="text/javascript">
	function changeConfirm(changeConfirm){
		document.getElementById("beforeConfirm").value=changeConfirm;
	}
		
</script>
	<script type="text/javascript">
	$.fx.speeds._default = 1000;
	$(function() {
		$('#dialog').dialog({
			autoOpen: false,
			height: 380,
			width:510,
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
		function box(box){
			alert(box);	
					$.ajax({
			    	type:"POST",
			    	url:"postGoAction_boxList",
			    	data:{"box":box},
			    	dataType:"json"		    	  
				});				
			}
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
          <TD class=manageHead>当前位置：人事管理系统 &gt; 招聘管理 </TD></TR>
        <TR>
          <TD height=2></TD></TR></TABLE>
      <TABLE borderColor="#ffffff" cellSpacing=0 cellPadding=0 width="100%" 
      align=center border=0>
        <TBODY>
        <TR>
          <TD height=25>
          <form action="postGoAction_checkConditions" method="post">
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
            style="BORDER-TOP-WIDTH: 0px; FONT-WEIGHT: normal; BORDER-LEFT-WIDTH: 0px;  BORDER-BOTTOM-WIDTH: 0px; BORDER-BOTTOM-COLOR: #C1F4FF; WIDTH: 100%; BORDER-TOP-COLOR: #cccccc; FONT-STYLE: normal; BACKGROUND-COLOR: #C1F4FF; BORDER-RIGHT-WIDTH: 0px; TEXT-DECORATION: none; BORDER-RIGHT-COLOR: #C1F4FF" 
            cellSpacing=1 cellPadding=2 rules=all border=0>
           
            <TR>
           <td>
				<div id="dialog" title="招聘详细信息" style='color: #C1F4FF'>
				<table align="center">
				 	<tr><TD bgcolor="#C1F4FF" width="390" height="25"></TD><td></td></tr>
				</table>				
				<form action="postGoAction_post" method="post">
					<table border="1" align="center">					
						<tr><td bgcolor="#C1F4FF">标题</td><td><input type="text" name="postGo.title"/></td></tr>
						<tr><td bgcolor="#C1F4FF">开始时间</td><td><input type="text" name="postGo.startTime" onfocus="SelectDate(this)" readonly="readonly" /></td></tr>
						<tr><td bgcolor="#C1F4FF">结束时间</td><td><input type="text" name="postGo.endTime" onfocus="SelectDate(this)" readonly="readonly" /></td></tr>
						<tr><td bgcolor="#C1F4FF">招聘职位</td><td><input type="text" name="postGo.position"/></td></tr>
						<tr><td bgcolor="#C1F4FF">招聘人数</td><td><input type="text" name="postGo.num"/></td></tr>
						<tr><td bgcolor="#C1F4FF">登记人</td><td ><input type="text" name="postGo.name"/></td></tr>
						<tr><td bgcolor="#C1F4FF">招聘条件</td><td ><textarea cols="50" name="postGo.requirement"></textarea></td></tr>
						<tr><td bgcolor="#C1F4FF">备注</td><td><textarea cols="50" name="postGo.remark"></textarea></td></tr>															
					 </table>
					 <table>
					 <tr><td bgcolor="#C1F4FF" width="370" height="25"><input style="background-image: url('images/back1.jpg');width: 50;height: 20" type="submit" value="保存"/></td>
					 <td bgcolor="#C1F4FF"><input style="background-image: url('images/back2.jpg');" id="cancel" type="button" value="取消"/></td></tr>
					 </table>				 							 
					</form>			
				</div>
				<div>	
					<table>
						<tr><td>				
				        <a id="opener" style="color: blue;"><img src="images/icon2_004.png" width="10" height="10" />添加</a>					
                  	</td></tr>	
                  </table>
                  </div>			                                     		
                </td><td><a href="postGoAction_delSome"><img src="images/pic12.gif" width="10" height="10" />删除</a> &nbsp; </td>
            </TR>
              <TBODY>
              <TR 
              style="FONT-WEIGHT: bold; FONT-STYLE: normal; BACKGROUND-COLOR: #fff0f0; TEXT-DECORATION: none">
              	 <TD style="width: 35"></TD>
                <TD style="width: 75">标题</TD>
                <TD style="width: 75">开始时间</TD>
                <TD style="width: 75">结束时间</TD>
                <TD style="width: 45">招聘人数</TD>
                <TD style="width: 55">招聘职务</TD>
                <TD style="width: 55">登记人</TD>
                 <td style="width: 75">管理</td>             
                </TR>
                <s:iterator value="#plist" var="plist">
              <TR 
              style="FONT-WEIGHT: normal; FONT-STYLE: normal; BACKGROUND-COLOR: white; TEXT-DECORATION: none">           
                <TD><INPUT id="box" type=checkbox value='<s:property value="#plist.id"/>' onchange="box(this.value);"> </TD>               
                <TD><A href='postGoAction_checkone?id=<s:property value="#plist.id" />'><s:property value="#plist.title"/></A></TD>          
                <TD><s:date name="#plist.startTime" format="yyyy年MM月dd日" /></TD>
                <TD><s:date name="#plist.endTime" format="yyyy年MM月dd日" /></TD>
                <TD><s:property value="#plist.num"/></TD>
                <TD><s:property value="#plist.position"/></TD>
                <td><s:property value="#plist.name"/></td>
                <td> 
                  		<A  href='postGoAction_checkone_one?id=<s:property value="#plist.id" />'>
                  			<img src="images/mime.gif" width="10" height="10"  />编辑
                  		</A>&nbsp;&nbsp;&nbsp;
                  		
                  		<A  href='postGoAction_post_delete_one?id=<s:property value="#plist.id" />'>
                  			<img src="images/pic12.gif" width="10" height="10"  />删除
                  		</A>           		
                    </td>
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



