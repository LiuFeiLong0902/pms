package com.sram.action;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionContext;
import com.sram.base.BaseAction;
import com.sram.entity.DeptChange;
import com.sram.entity.Probation;

@SuppressWarnings("serial")
@Controller
@Scope("prototype")
public class HomeAction extends BaseAction {

	public String home() throws Exception {
		return "home";
	}

	public String top() throws Exception {
		return "top";
	}

	public String left() throws Exception {
		int dcCount = deptChangeService.getAllCount(" where approveStatus = '" + DeptChange.APPROVE_STATUS_WAITING + "'");
		if (dcCount > 0){
			ActionContext.getContext().put("dcCount", "[" + dcCount + "]");
		}
		
		int pCount = probationService.getAllCount(" where probationStatus = '" + Probation.PROBATION_STATUS_WAITING + "'");
		if (pCount > 0){
			ActionContext.getContext().put("pCount", "[" + pCount + "]");
		}
		
		return "left";
	}

	public String right() throws Exception {
		return "right";
	}

}
