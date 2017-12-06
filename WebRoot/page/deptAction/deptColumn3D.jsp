<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath %>">
<%@include file="../../inc.jsp"%>
<script type="text/javascript" src="js/ichart.1.1.min.js"></script>
<script type="text/javascript" src="js/ichart.1.1.src.js"></script>
<script type="text/javascript">

//定义数据
function getColumn3D() {
	var data;
	
	// 发出AJAX请求，获得部门的JSON串
	$.ajax({
		type : "post",
		url : "deptAction_createDeptColumn3D",
		async : false,
		dataType : "text",
		success : function(depts) {
			data = $.parseJSON(depts);
			//alert(data);					
		},
		error:function(XMLHttpRequest, textStatus, errorThrown) {
			alert(errorThrown);
			isDelete = false;
		    // 通常 textStatus 和 errorThrown 之中
		    // 只有一个会包含信息
		    this; // 调用本次AJAX请求时传递的options参数
		}
	});
		
	var chart = new iChart.Column3D({
		render : 'canvasDiv',
		data: data,
		title : {
			text : '我公司部门员工分布柱状图',
			color : '#3e576f'
		},
		width : 820,
		height : 400,
		padding: 20,
		shadow: true,
		shadow_color:'#080808',
		background_color:'#eceeef',
		sub_option:{ // 柱形的配置项。
			label : {
				color : '#2c2e2a',
				padding : 10
			}
		},
		coordinate:{ // 坐标系的配置项。
			left_board:false,
			scale:[{
				position:'left',
				start_scale:0,
				end_scale:15,
				scale_space:5,
				listeners:{
					parseText:function(t,x,y){
						return {text:t+"人   "}
					}
				}
			}],
		},
		legend: { // 图例的配置项.设置为false表示禁用图例。(默认为false)
			background_color:iChart.toRgba('#213e49',0.6),
			border:{radius:5},
			enable: true,
			align: 'right',
			valign: 'top',
			row: 'max',
			color:'#fefefe',
			column: 1,
			line_height: 15
		},
		tip : { // 提示框的配置项.设置为false表示禁用提示框。(默认为false)
			enable : true
		}
	});
	chart.draw();
}
</script>
</head>

<body onload="getColumn3D()">
	<div id='canvasDiv'></div>
</body>
</html>
