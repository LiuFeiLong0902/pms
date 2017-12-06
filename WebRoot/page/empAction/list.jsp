<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
<base href="<%=basePath%>">
<%@include file="../../inc.jsp"%>

<link href="css/skin.css" rel="stylesheet" type="text/css" />
<link href="css/KJ.css" rel="stylesheet" type="text/css" />
<LINK href="css/Style.css" type=text/css rel=stylesheet>
<LINK href="css/Manage.css" type=text/css rel=stylesheet>
<link rel="stylesheet" type="text/css" href="css/style1.css"/>
<link rel="stylesheet" type="text/css" href="css/divStyle.css"/>
<link rel="stylesheet" type="text/css" href="css/validator3.5.css"/>

<script type="text/javascript">
	function switchPageSize(pageSize) {
		location.href="empAction_list?pageBean.pageSize=" + pageSize;
	}
	
	function jumpTo(currPage) {
		var empStatus = "<s:property value='#empStatus' />";
		var pageSize = "<s:property value='pageBean.pageSize' />";
		
		$("#11").val(empStatus);
		$("#33").val(currPage);
		$("#44").val(pageSize);
		$("#hidden").submit();
	}	
</script>
</head>

<body>

<form id="hidden" action="empAction_listByConditions" method="post">
	<input type="hidden" id="11" name="emp.empStatus" />
	<input type="hidden" id="33" name="pageBean.currPage" />
	<input type="hidden" id="44" name="pageBean.pageSize" />
</form>

<TABLE cellSpacing=0 cellPadding=0 width="98%" border=0>
  <TBODY>
  <TR>
    <TD width=15><IMG src="images/new_019.jpg" border=0></TD>
    <TD width="100%" background=images/new_020.jpg height=20></TD>
    <TD width=15><IMG src="images/new_021.jpg" 
  border=0></TD></TR></TBODY></TABLE>
<TABLE cellSpacing=0 cellPadding=0 width="98%" border=0>
  <TR>
    <TD width=15 background=images/new_022.jpg><IMG 
      src="images/new_022.jpg" border=0> </TD>
    <TD vAlign=top width="100%" bgColor=#ffffff>
      <TABLE cellSpacing=0 cellPadding=5 width="100%" border=0>
        <TR>
          <TD class=manageHead>当前位置：系统管理 &gt; 员工管理 &gt; 员工列表</TD></TR>
        <TR>
          <TD height=2></TD></TR>
      </TABLE>
      <TABLE borderColor=#cccccc cellSpacing=0 cellPadding=0 width="100%" align=center border=0>
        <TBODY>
        <TR>
          <TD height=25>


<!-- ~~~~~~~~~~~~~~~~~~~~~~~~ 模糊查询  ~~~~~~~~~~~~~~~~~~~~   -->
<FORM id="conditions" action="empAction_listByConditions" method=post>
<input type="hidden" name="pageBean.pageSize" value="${pageBean.pageSize }" />
<input type="hidden" name="pageBean.currPage" value="1" />

<TABLE cellSpacing=0 cellPadding=2 border=0 width="100%">
<TBODY>
<TR>
	<TD width="8%">筛选数据：</TD>
	<TD width="14%">
		用工状态: 
		<SELECT name="emp.empStatus"> 
			<OPTION value="">全部状态</OPTION> 
			<OPTION value="离职"
				<s:property value="#empStatus=='离职' ? 'selected' : ''" /> >离职
			</OPTION>
			<OPTION value="在职"
				<s:property value="#empStatus=='在职' ? 'selected' : ''" /> >在职
			</OPTION>
			<OPTION value="试用期"
				<s:property value="#empStatus=='试用期' ? 'selected' : ''" /> >试用期
			</OPTION>
		</SELECT>
	</TD>
	<TD width="6%"><INPUT class=button type=submit value=" 筛选 " name=sButton2 /></TD>
	<td width="58%">&nbsp;</td>
</TR>
</TBODY>
</TABLE>
</FORM>
</TD></TR>
<!-- ~~~~~~~~~~~~~~~~~ 记录 ~~~~~~~~~~~~~~~~~~~~~ -->
<TR>
<TD>
<p>&nbsp;</p>
<TABLE style="text-align:center;" class="grid" cellSpacing=1 cellPadding=2 rules=all border=1 width="100%">
	<TR style="FONT-WEIGHT: bold; FONT-STYLE: normal; BACKGROUND-COLOR: #eeeeee; TEXT-DECORATION: none" >
		<td>员工姓名</td>
		<td>部门</td>
		<td>岗位</td>
		<td>用工状态</td>
		<td>入职类型</td>
		<td>入职日期</td>
		<td>转正日期</td>
		<td>操作</td>
	</TR>
	<s:iterator value="#emps">
		<TR style="FONT-WEIGHT: normal; FONT-STYLE: normal; BACKGROUND-COLOR: white; TEXT-DECORATION: none">
			<TD><a href="empAction_getInfo?emp.id=${id }">${name }</a></TD>
			<TD>${dept.name }</TD>
			<TD>
				<s:iterator value="roles">
					<input type="checkbox" disabled checked />${name }&nbsp;
				</s:iterator>
			</TD>
			<td>${empStatus }</td>
			<td>${entryType }</td>
			<td><s:date name="hiredate" format="yyyy年MM月dd日" /></td>
			<td><s:date name="conversionDate" format="yyyy年MM月dd日" /></td>
			<TD>
				<s:if test="empStatus == @com.sram.entity.Emp@EMP_STATUS_INSERVICE ">
					<a href="javascript:void(0)" 
						onclick="location.href='dimissionAction_addUI?dimission.emp.id=${id}'">离职
					</a>&nbsp;
				</s:if>
				
				<s:if test="empStatus == @com.sram.entity.Emp@EMP_STATUS_PROBATION ">
				<!-- 
					<a href="probationAction_evaluationUI?probation.emp.id=${id }">试用期审核
					</a>&nbsp;
				 -->
					<a href="javascript:void(0)" 
						onclick="location.href='dimissionAction_addUI?dimission.emp.id=${id}'">离职
					</a>&nbsp;
				</s:if>
			</TD>
		</TR>
	</s:iterator>
</TABLE>
</TD>
</TR>


<!-- ~~~~~~~~~~~~~批量操作~~~~~~~~~~~~~~~~ -->
<tr>
	<td><p>&nbsp;</p></td>
</tr>
<TR>
	<td align="left"><img src="images/001.gif" width="14" height="14" />
	<a href="empAction_addUI">新员工入职</a>&nbsp;&nbsp;
	</td>
	</TR>


<!-- ~~~~~~~~~~ 分页  ~~~~~~~~~~~~~~~~~ -->
<TR>
<TD>
	<SPAN>
	共[<B><s:property value="pageBean.recordCount" /></B>]条记录   
	当前是<s:property value="pageBean.currPage" />页
	共[<B><s:property value="pageBean.pageCount" /></B>]页
	<A href="javascript:void(0)" onclick="jumpTo(1)">
		<img src="images/main_54.gif" />
	</A>
	
	<s:iterator begin="pageBean.begin" end="pageBean.end" status="status">
		<a href="javascript:void(0)" onclick="jumpTo(<s:property value='#status.index + pageBean.begin' />)">
			<s:if test="#status.index+pageBean.begin == pageBean.currPage">
				<b>[<s:property value='#status.index + pageBean.begin'/>]</b>
			</s:if>
			<s:else>
				[<s:property value='#status.index + pageBean.begin'/>]
			</s:else>
		</a>
	</s:iterator>
	
	<a href="javascript:void(0)" onclick="jumpTo(${pageBean.pageCount})">
		<img src="images/main_60.gif" />
	</a>
	每页显示
	<select name="pageSize" onchange="switchPageSize(this.value)">
	<option value="1" <s:property value="pageBean.pageSize == 1 ? 'selected' : '' "/> >1</option>
	<option value="2" <s:property value="pageBean.pageSize == 2 ? 'selected' : '' "/> >2</option>
	<option value="3" <s:property value="pageBean.pageSize == 3 ? 'selected' : '' "/> >3</option>
	<option value="4" <s:property value="pageBean.pageSize == 4 ? 'selected' : '' "/> >4</option>
	<option value="5" <s:property value="pageBean.pageSize == 5 ? 'selected' : '' "/> >5</option>
	</select>
		条记录
	</SPAN>
	
</TD>
</TR>
   </TBODY></TABLE></TD>
    <TD width=15 background=images/new_023.jpg><IMG 
      src="images/new_023.jpg" border=0> </TD></TR></TABLE>
<TABLE cellSpacing=0 cellPadding=0 width="98%" border=0>
  <TR>
    <TD width=15><IMG src="images/new_024.jpg" border=0></TD>
    <TD width="100%" background=images/new_025.jpg height=15></TD>
    <TD width=15><IMG src="images/new_026.jpg" border=0></TD></TR></TABLE>
  
  

<!-- 弹出层 -- message -->
<div id="dialog-message" align="center"></div>

  
</body>
</html>
