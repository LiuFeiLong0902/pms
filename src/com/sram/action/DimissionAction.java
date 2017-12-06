package com.sram.action;

import java.io.IOException;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionContext;
import com.sram.base.BaseAction;
import com.sram.entity.Dimission;
import com.sram.entity.Emp;

@SuppressWarnings("serial")
@Controller
@Scope("prototype")
public class DimissionAction extends BaseAction {
	
	private Dimission dimission;
	private Emp emp;
	
	
	/** 添加离职记录界面 */
	public String addUI() {
		Emp emp = empService.getById(dimission.getEmp().getId());
		dimission.setEmp(emp);
		ActionContext.getContext().put("dimission", dimission);
		
		return "forcedDimission";
	}
	
	
	/** 添加离职记录 
	 * @throws IOException */
	public String add() throws IOException {
		try {
			// 先将emp的状态变为离职
			Emp emp = empService.getById(dimission.getEmp().getId());
			emp.setEmpStatus(Emp.EMP_STATUS_LEAVED);
			empService.update(emp);
			
			int id = (Integer) dimissionService.add(dimission);
			if (id > 0) {
				response.getWriter().print("离职成功");
			}
		} catch (Exception e) {
			e.printStackTrace();
			response.getWriter().print("离职失败");
		} finally {
			response.getWriter().close();
		}
		
		return null;
	}


	// -----------------------------------------------
	
	public Dimission getDimission() {
		return dimission;
	}


	public void setDimission(Dimission dimission) {
		this.dimission = dimission;
	}


	public Emp getEmp() {
		return emp;
	}


	public void setEmp(Emp emp) {
		this.emp = emp;
	}

}
