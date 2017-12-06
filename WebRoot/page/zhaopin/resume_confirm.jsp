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
          <TD class=manageHead>当前位置：人事管理系统 &gt; 简历管理&gt; 简历审核 </TD></TR>
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
           	<td align="left">
          <s:iterator value="#listone" var="listone">
        <form action="visitorAction_updateTwo" method="post">
           		<fieldset style="width: 600">
						<legend style='font-size:15;font-family: "华文楷体" '>基本资料</legend>
								<table border="1" align="left">
									<tr><td ><input type="hidden" name="visitor.id" value='<s:property value="#listone.id"/>'/></td></tr>
									<tr><td style="width: 100;" bgcolor="#C1F4FF">姓名</td><td style="width: 100;"><s:property value="#listone.name"/></td>
									<td style="width: 100;" bgcolor="#C1F4FF">宗教信仰</td>
									<td  style="width: 100;"><s:property value="#listone.zongJiao"/></td>
									<td rowspan="6" colspan="4">
									<img alt="上传的头像" style="width: 100;height: 100" src="${pageContext.request.contextPath}/${listone.image}"/>
									</td></tr>
									<tr><td bgcolor="#C1F4FF">年龄</td><td><s:property value="#listone.age"/></td>
									<td bgcolor="#C1F4FF">政治面貌</td><td><s:property value="#listone.politics"/></td></tr>
									<tr><td bgcolor="#C1F4FF">生日</td><td><s:date name="#listone.birthday" format="yyyy年MM月dd日" /></td>
									<td bgcolor="#C1F4FF">国籍</td><td><s:property value="#listone.citizenship"/></td></tr>
									<tr><td bgcolor="#C1F4FF">籍贯</td><td><s:property value="#listone.hometown"/></td>
									<td bgcolor="#C1F4FF">民族</td><td><s:property value="#listone.nation"/></td></tr>
									<tr><td bgcolor="#C1F4FF">参加工作时间</td><td><s:property value="#listone.workTime"/></td>
									<td bgcolor="#C1F4FF">性别</td><td><s:property value="#listone.sex"/></td></tr>
									<tr><td bgcolor="#C1F4FF">身份证</td><td><s:property value="#listone.idCard"/></td>
									<td bgcolor="#C1F4FF">应聘职位</td><td><s:property value="#listone.profession"/></td></tr>									
								</table>
				</fieldset>	
				<fieldset style="width: 600">
				<legend style='font-size:15;font-family: "华文楷体" '>联系方式</legend>
				<table border="1" align="left">
					<tr><td style="width: 100;" bgcolor="#C1F4FF">地址</td><td style="width: 100;"><s:property value="#listone.address"/></td>
					<td style="width: 100;" bgcolor="#C1F4FF">电话号码</td><td style="width: 100;"><s:property value="#listone.tel"/></td></tr>
					<tr><td bgcolor="#C1F4FF">邮编</td><td><s:property value="#listone.postcode"/></td>
					<td bgcolor="#C1F4FF">电子邮箱</td><td><s:property value="#listone.email"/></td></tr>					
				</table>
				</fieldset>	
				<fieldset style="width: 600">
				<legend style='font-size:15;font-family: "华文楷体" '>教育背景</legend>
				<table align="left" border="1">
				<tr>
					<td style="width: 100;" bgcolor="#C1F4FF">毕业学校</td><td style="size: 100"><s:property value="#listone.school"/></td>
					<td rowspan="3" style="width: 100;" bgcolor="#C1F4FF">
					<input onchange="result(this.value);" type="radio" name="visitor.state" value="未通过" checked/>未通过
					</td>
					<td rowspan="3" style="width: 100;">
					<input  onchange="result(this.value);" type="radio" name="visitor.state" value="确定"/>确定  				
					</td>
				</tr>
				<tr><td style="width: 100;" bgcolor="#C1F4FF">学历</td><td style="width: 100;"><s:property value="#listone.edu"/></td></tr>
				<tr><td style="width: 100;" bgcolor="#C1F4FF">专业</td><td style="width: 100;"><s:property value="#listone.career"/></td></tr>
				</table>
			</fieldset>	
               <input style="background-image: url('images/back2.jpg');" id="rs" type="submit" value="未通过"/>
             </form>
             </s:iterator>
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


