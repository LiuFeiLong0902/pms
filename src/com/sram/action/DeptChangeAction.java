package com.sram.action;

import java.util.Date;
import java.util.List;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionContext;
import com.sram.base.BaseAction;
import com.sram.entity.Dept;
import com.sram.entity.DeptChange;
import com.sram.entity.Emp;
import com.sram.util.DeptUtil;

@SuppressWarnings("serial")
@Controller
@Scope("prototype")
public class DeptChangeAction extends BaseAction {
	
	private DeptChange deptChange;
	private Emp emp;
	
	public DeptChange getDeptChange() {
		return deptChange;
	}

	public void setDeptChange(DeptChange deptChange) {
		this.deptChange = deptChange;
	}

	public Emp getEmp() {
		return emp;
	}

	public void setEmp(Emp emp) {
		this.emp = emp;
	}

	public String addUI() {
		emp = empService.getById(this.emp.getId());
		// 得到部门
		List<Dept> topList = deptService.getTopDepts(); // 顶级部门
		List<Dept> depts = DeptUtil.getAllDepts(topList); // 所有部门
		ActionContext.getContext().put("depts", depts);
		return "addUI";
	}
	
	public String add() {
		emp = empService.getById(this.emp.getId());
		
		deptChange.setProcessDate(new Date());
		deptChange.setEmp(emp);
		deptChangeService.add(deptChange);
		
		// 部门列表，用于回显
		List<Dept> topList = deptService.getTopDepts(); // 顶级部门
		List<Dept> depts = DeptUtil.getAllDepts(topList); // 所有部门
		ActionContext.getContext().put("depts", depts);
		
		System.out.println(emp);
		
		return  "addback";
	}
	public String getAll(){
		List<DeptChange> dList=deptChangeService.list();
		ActionContext.getContext().put("dList", dList);
		return "getAll";
		
	}

	public String updateChange() {
		emp = empService.getById(deptChange.getEmp().getId());
		
		deptChange.setApproveStatus("已审批");
		deptChangeService.update(deptChange);
		if("通过".equals(deptChange.getProcessResult())){
			emp.setDept(deptChange.getLatterDept());
			empService.update(emp);
		}
		return getAll();
	}
	public String getById(){
		int id=Integer.parseInt(ServletActionContext.getRequest().getParameter("id"));
		deptChange=deptChangeService.getById(id);
		return "getById";
		
	}
	
}
