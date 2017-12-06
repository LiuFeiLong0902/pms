<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<HTML >
<HEAD>
<base href="<%=basePath %>">
<LINK href="css/YHChannelApply.files/Style.css" type=text/css rel=stylesheet>
<LINK href="css/YHChannelApply.files/Manage.css" type=text/css rel=stylesheet>

<%@include file="../../inc.jsp"%>
<script type="text/javascript" src="js/Calendar.js"></script>
<SCRIPT type="text/javascript">
	var msg = "<s:property value="#msg" />"
	if (msg == "已提交") {
		alert("您的简历已经成功提交，\n请耐心等待审核结果");
	} else if (msg == "提交失败") {
		alert("对不起，您的简历提交失败.\n请检查您的信息。");
	}
</SCRIPT>
</HEAD>

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
        <TR><TD class=manageHead>当前位置： &gt; 简历填写 </TD></TR>
        <TR><TD style="height: 30" bgcolor="#C1F4FF"></TD></TR></TABLE>
			<form action="visitorAction_addVisitor" method="post" enctype="multipart/form-data"  >
           		<fieldset style="width: 600;margin-left: 233">
						<legend style='font-size:15;font-family: "华文楷体" '>基本资料</legend>					
								<table border="1" align="left">
									<tr><td bgcolor="#C1F4FF" style="width: 85">姓名</td><td><input type="text" name="visitor.name" value="${visitor.name }"/></td>
									<td style="width: 75" bgcolor="#C1F4FF">宗教信仰</td>
									<td style="width: 75"><select style="width: 100%;" name="visitor.zongJiao" >
									<option value="佛教"  <s:property value="visitor.zongJiao== '佛教' ? 'selected' : ''" />>佛教</option>
									<option value="道教"   <s:property value="visitor.zongJiao== '道教' ? 'selected' : ''" />>道教</option>
									<option value="其他"   <s:property value="visitor.zongJiao== '其它' ? 'selected' : ''" />>其他</option>
									</select></td>
									<td rowspan="6" >上传图片
									<input type="file" name="file" id="file" value="浏览">									
									</td></tr>
									<tr><td bgcolor="#C1F4FF">年龄</td><td><input type="text" name="visitor.age" value="${visitor.age}"/></td>
									<td bgcolor="#C1F4FF">政治面貌</td><td><select style="width: 100%;" name="visitor.politics">
									<option value="团员" <s:property value="visitor.politics== '团员' ? 'selected' : ''" />>团员</option>
									<option value="党员"  <s:property value="visitor.politics== '党员' ? 'selected' : ''" />>党员</option>
									<option value="预备党员"  <s:property value="visitor.politics== '预备党员' ? 'selected' : ''" />>预备党员</option>
									<option value="其他"  <s:property value="visitor.politics== '其他' ? 'selected' : ''" />>其他</option>
									</select></td><td></td></tr>
									<tr><td bgcolor="#C1F4FF">生日</td><td>
										<input type="text" name="visitor.birthday" onfocus="SelectDate(this)" 
											readonly="readonly" value='<s:date name="visitor.birthday" format="yyyy年MM月dd日" />' /></td>
									<td bgcolor="#C1F4FF">国籍</td><td><select style="width: 100%;" name="visitor.citizenship">
									<option value="中国" <s:property value="visitor.citizenship == '中国' ? 'selected' : ''" />>中国</option>
									<option value="其他" <s:property value="visitor.citizenship == '其它' ? 'selected' : ''" />>其他</option>									
									</select></td><td></td></tr>
									<tr><td bgcolor="#C1F4FF">籍贯</td><td><input type="text" name="visitor.hometown" value="${visitor.hometown}"/></td>
									<td bgcolor="#C1F4FF">民族</td><td>
									<select style="width:100%;" name="visitor.nation">
										<option value="汉族" <s:property value="visitor.nation == '汉族' ? 'selected' : ''" /> >汉族</option>
										<option value="维吾尔族" <s:property value="visitor.nation == '维吾尔族' ? 'selected' : ''" /> >维吾尔族</option>
										<option value="其他" <s:property value="visitor.nation == '其他' ? 'selected' : ''" /> >其他
									</select></td><td></td></tr>
									<tr><td bgcolor="#C1F4FF">参加工作时间</td><td><input type="text" name="visitor.workTime" value="${visitor.workTime }"/></td>
									<td bgcolor="#C1F4FF">性别</td><td ><select style="width: 100%;" name="visitor.sex">
									<option value="男" <s:property value="visitor.sex == '男' ? 'selected' : ''" />>男</option>
									<option value="女" <s:property value="visitor.sex == '女' ? 'selected' : ''" />>女</option>								
									</select></td></tr>
									<tr><td bgcolor="#C1F4FF">身份证</td><td><input type="text" name="visitor.idCard" value="${visitor.idCard}"/></td>
									<td bgcolor="#C1F4FF">应聘职位</td><td><input type="text" name="visitor.profession" style="width: 115" value="${visitor.profession}"/></td></tr>									
								</table>
				</fieldset>	
				<fieldset style="width: 600;margin-left: 233">
				<legend style='font-size:15;font-family: "华文楷体" '>联系方式</legend>
				<table border="1" align="left">
					<tr><td bgcolor="#C1F4FF" style="width: 75">地址</td><td><input type="text" name="visitor.address" value="${visitor.address }"/></td>
					<td width="75" bgcolor="#C1F4FF">电话号码</td><td colspan="2"><input type="text" name="visitor.tel" value="${visitor.tel }"/></td></tr>
					<tr><td bgcolor="#C1F4FF">邮编</td><td><input type="text" name="visitor.postcode" value="${visitor.postcode }"/></td>
					<td bgcolor="#C1F4FF">电子邮箱</td><td><input type="text" name="visitor.email" value="${visitor.email }"/></td></tr>					
				</table>
				</fieldset>	
				<fieldset style="width: 600;margin-left: 233">
				<legend style='font-size:15;font-family: "华文楷体" '>教育背景</legend>
				<table align="left" border="1">
				<tr><td bgcolor="#C1F4FF" >毕业学校</td>
				<td style="size: 200"><input size="52" type="text" name="visitor.school" value="${visitor.school }"/></td>
				<td rowspan="3" style="width: 150"><input style='background-image: url("images/sitebackup.gif");width: 60;height: 60;color: blue;' type="submit" value="保存"/></td>
				</tr>
				<tr><td bgcolor="#C1F4FF" width="75">学历</td><td><input size="52" type="text" name="visitor.edu" value="${visitor.edu }"/></td></tr>
				<tr><td bgcolor="#C1F4FF">专业</td><td><input size="52" type="text" name="visitor.career" value="${visitor.career }"/></td></tr>
				</table>
			</fieldset>					 											
			</form>
			<table style="width: 100%">
			<TR style="height: 30"><TD bgcolor="#C1F4FF" style="size: 100"></TD>
			</TR></table>																									
          </TD>
    <TD width=15 background=css/YHChannelApply.files/new_023.jpg><IMG 
      src="css/YHChannelApply.files/new_023.jpg" border=0> </TD></TR></TBODY></TABLE>
<TABLE cellSpacing=0 cellPadding=0 width="98%" border=0>
  <TBODY>
  <TR>
    <TD width=15><IMG src="css/YHChannelApply.files/new_024.jpg" border=0></TD>
    <TD  width="100%" background=css/YHChannelApply.files/new_025.jpg  height=15></TD>
    <TD width=15><IMG src="css/YHChannelApply.files/new_026.jpg" 
  border=0></TD></TR></TBODY></TABLE>

</BODY>
</HTML>


