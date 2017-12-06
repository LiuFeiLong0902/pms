package com.sram.action;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionContext;
import com.sram.base.BaseAction;
import com.sram.entity.Emp;

@SuppressWarnings("serial")
@Controller
@Scope("prototype")
public class SelfAction extends BaseAction {
	
	private Emp emp;
	
	
	/** 我的个人信息 */
	public String getMyInfo() {
		Emp currEmp = (Emp) ActionContext.getContext().getSession().get("emp");
		emp = empService.getById(currEmp.getId());
		return "self";
	}
	
	
	// --------------------------------

	public void setEmp(Emp emp) {
		this.emp = emp;
	}

	public Emp getEmp() {
		return emp;
	}
}
