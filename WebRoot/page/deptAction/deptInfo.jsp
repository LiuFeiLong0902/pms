<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<HTML >
<HEAD>
<base href="<%=basePath %>">
<META http-equiv=Content-Type content="text/html; charset=utf-8">
<LINK href="css/YHChannelApply.files/Style.css" type=text/css rel=stylesheet>
<LINK href="css/YHChannelApply.files/Manage.css" type=text/css rel=stylesheet>

<%@include file="../../inc.jsp"%>

<link rel="stylesheet" href="css/demo.css" type="text/css" />
<link rel="stylesheet" href="css/zTreeStyle/zTreeStyle.css" type="text/css"/>

<base href="<%=basePath%>" />
<script type="text/javascript" src="js/jquery.ztree.core-3.4.js"></script>
<script type="text/javascript" src="js/jquery.ztree.excheck-3.4.js"></script>
<script type="text/javascript" src="js/jquery.ztree.exedit-3.4.js"></script>

<script type="text/javascript">
var setting = {
	async: {
		enable: true,
		url:"deptAction_async",
		autoParam:["id", "name=n", "level=lv"],
		otherParam:{"otherParam":"zTreeAsyncTest"}
	},
	view: {
		addHoverDom: addHoverDom,
		removeHoverDom: removeHoverDom,
		selectedMulti: false
	},
	edit: {
		enable: true,
		editNameSelectAll: true
	},
	data: {
		simpleData: {
			enable: true
		}
	},
	callback: {
		onRename: onRename,
		onRemove: onRemove,
		onClick: deptInfo,
		beforeRemove: judge
	}
};

//重命名的时候
function onRename(e, treeId, treeNode) {
	var queryString = {
				"dept.id":treeNode.id,
				"dept.name":treeNode.name,
				"dept.parent.id":treeNode.pId
	};
	$.post('deptAction_update', queryString ,function(data){
		if("success" == data){
			alert("修改成功");
		}else if ("failure" == data) {
     		alert("修改失败");    
     	} else {
     		alert(data);
     	}   
	}); 
}

// 删除前判断
function judge(treeId, treeNode) {
	var isDelete;
	$.ajax({
		type : "post",
		url : "deptAction_findById",
		data : {"dept.id" : treeNode.id},
		dataType : "json",
		async : false,
		success : function(data) {
			if (data.dept.emps.length > 0 || data.dept.children.length > 0) {
				alert("删除失败!\n该部门下尚有员工或者还有子部门.");
				isDelete = false;
			} else {
				isDelete = true;
			}
		},
		error:function(XMLHttpRequest, textStatus, errorThrown) {
			alert(errorThrown);
			isDelete = false;
		    // 通常 textStatus 和 errorThrown 之中
		    // 只有一个会包含信息
		    this; // 调用本次AJAX请求时传递的options参数
		}
	});
	
	return isDelete;
}

//删除节点
function onRemove(e, treeId, treeNode) {
	var queryString = {"dept.id":treeNode.id};
	$.post('deptAction_delete', queryString ,function(data){
		if("success" == data){
			alert("删除成功");
		}else if ("failure" == data) {
			alert("删除失败");    
		} else {
			alert(data);
		}     
	}); 
}


var newCount = 1;
function addHoverDom(treeId, treeNode) {
	var sObj = $("#" + treeNode.tId + "_span");
	if (treeNode.editNameFlag || $("#addBtn_"+treeNode.id).length>0) return;
	var addStr = "<span class='button add' id='addBtn_" + treeNode.id
		+ "' title='add node' onfocus='this.blur();'></span>";
	sObj.after(addStr);
	var btn = $("#addBtn_"+treeNode.id);
	if (btn) btn.bind("click", function(){
		var zTree = $.fn.zTree.getZTreeObj("treeDemo");
		
		//向后台添加数据
		var queryString = {"dept.name":"新部门" + (newCount++),"dept.parent.id":treeNode.id};
		$.post('deptAction_add', queryString ,function(data){
				var dataJason = $.parseJSON(data);
              	zTree.addNodes(treeNode, {
              			"id":dataJason.id, 
              			"pId":treeNode.id, 
              			"name":dataJason.name, 
              			"parent":dataJason.parent.id
              	});
        }) ; 
		
		return false;
	});
};

function removeHoverDom(treeId, treeNode) {
	$("#addBtn_"+treeNode.id).unbind().remove();
};

$(document).ready(function(){
	$.fn.zTree.init($("#treeDemo"), setting);
});

// 点击回调事件
function deptInfo(event, treeId, treeNode) {
	$.post("deptAction_findById", {"dept.id": treeNode.id}, function(data) {
		$("#id").html(data.dept.id);
		$("#name").html(data.dept.name);
		$("#description").val(data.dept.description);
		$("#empCount").html(data.dept.emps.length);
	});
}

// 修改或建立描述
function editDescription() {
	$.post("deptAction_updateDescription",
		{
			"dept.description": $("#description").val(),
			"dept.id" : $("#id").text()
		},
		function(data) {
			alert($("#name").text() + " 的描述修改成功!\n新的描述是：" + data.dept.description);
	});
}

</script>
	
<style type="text/css">
.ztree li span.button.add {
	margin-left:2px; 
	margin-right: -1px; 
	background-position:-144px 0; 
	vertical-align:top; 
	vertical-align:middle;
}

.myDiv {
	position:absolute;
	left:400px;
	top:85px;
}
</style>

</HEAD>


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
          <TD class=manageHead>当前位置：人事管理系统 &gt; 部门管理</TD></TR>
        <TR>
      </TABLE>
      <TABLE borderColor="#ffffff" cellSpacing=0 cellPadding=0 width="100%"  align=center border=0>
        <TBODY>
        <TR>
          <TD>
            <TABLE id=grid 
            style="BORDER-TOP-WIDTH: 0px; FONT-WEIGHT: normal; BORDER-LEFT-WIDTH: 0px; BORDER-LEFT-COLOR: #c0c0c0; BORDER-BOTTOM-WIDTH: 0px; BORDER- BOTTOM-COLOR: #cccccc; WIDTH: 100%; BORDER-TOP-COLOR: #cccccc; FONT-STYLE: normal; BACKGROUND-COLOR: #white; BORDER-RIGHT-WIDTH: 0px; TEXT-DECORATION: none; BORDER-RIGHT-COLOR: #cccccc" 
            cellSpacing=1 cellPadding=2 rules=all border=0>
           <tr>
           </tr>
              <TBODY>
             <!-- 粉色的 -->
              <TR  style="FONT-WEIGHT: bold; FONT-STYLE: normal; BACKGROUND-COLOR: #fff0f0; TEXT-DECORATION: none">
              	<td height="15"></td>
              </TR>
      			<tr>
      			<td>
      		<TABLE id=grid style="border-color: rgb(204, 204, 204) rgb(204, 204, 204) rgb(204, 204, 204) rgb(192, 192, 192); border-width: 0px; font-weight: normal; font-style: normal;  text-decoration: none;" cellSpacing=1 cellPadding=2 rules=all border=1 width="799" height="39">
				<TR style="FONT-WEIGHT: bold; FONT-STYLE: normal; TEXT-DECORATION: none" align="center">
				</TR>
				<TR>
					<td>
					<div class="content_wrap">
						<div class="zTreeDemoBackground left">
							<ul id="treeDemo" class="ztree"></ul>
						</div>
						</div>				
					</td>
				</TR>
      		</TABLE>
      			</td>
      			</tr>
		<tr>
  		 <TD>
  		 <!-- 主题内容 -->
    		<div class="myDiv">
          <table border="1" cellpadding="10" cellspacing="10">
          	<tr height="30">
          		<td colspan="2">
	          		<font color="red">当前仅可以修改部门描述：</font>
          		</td>
          	</tr>
           	<tr height="30">
				<td align="right">部门编号： </td>
				<td id="id"></td>
			</tr>
           	<tr height="30">
				<td align="right">部门名称：</td>
				<td id="name"></td>
			</tr>
			<tr >
				<td align="right">描述：</td>
				<td>
					<textarea rows="2" cols="25" id="description"></textarea>
				<!-- <input type="text" id="description" value="${dept.description }" /> -->
				</td>
			</tr>
		<tr height="30">
			<td align="right">部门下员工数：</td>
			<td id="empCount"></td>
		</tr>
		<tr height="30">
			<td colspan="2" align="center">
			<img src="images/a.jpg" onclick="editDescription()"></img>
			</td>
		</tr>
            </table>
            </div>
            </td></tr>
           </TBODY></TABLE></TD></TR>     
   </TBODY></TABLE></TD>
    <TD width=15 background=css/YHChannelApply.files/new_023.jpg><IMG 
      src="css/YHChannelApply.files/new_023.jpg" border=0> </TD></TR></TBODY></TABLE>
<TABLE cellSpacing=0 cellPadding=0 width="98%" border=0>
  <TBODY>
  <TR>
    <TD width=15><IMG src="css/YHChannelApply.files/new_024.jpg" border=0></TD>
    <TD align="center" width="100%" background=css/YHChannelApply.files/new_025.jpg height=15></TD>
    <TD width=15><IMG src="css/YHChannelApply.files/new_026.jpg" 
  border=0></TD></TR></TBODY></TABLE>
</BODY></HTML>
