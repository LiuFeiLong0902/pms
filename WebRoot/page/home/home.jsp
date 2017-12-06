<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<html>
<head>
<base href="<%=basePath%>">
<title>人事管理系统</title>
<meta http-equiv=Content-Type content=text/html;charset=UTF-8>
</head>

	<frameset rows="64,*" frameborder="NO" border="0" framespacing="0">
		<frame src="homeAction_top.action" noresize frameborder="0" name="top"
			scrolling="no" marginwidth="0" marginheight="0" />
		<frameset cols="200,*" rows="560,*" id="frame">
			<frame src="homeAction_left.action" name="left" noresize="noresize" marginwidth="0"
				marginheight="0" frameborder="0" scrolling="yes" />
			<frame src="homeAction_right.action" name="main" marginwidth="0" marginheight="0"
				frameborder="0" scrolling="auto" />
		</frameset>
	</frameset>
</html>
