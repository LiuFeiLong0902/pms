package com.sram.base;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.interceptor.ServletResponseAware;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionSupport;
import com.sram.service.DeptChangeService;
import com.sram.service.DeptService;
import com.sram.service.DimissionService;
import com.sram.service.EmpService;
import com.sram.service.PostGoService;
import com.sram.service.PrivilegeService;
import com.sram.service.ProbationService;
import com.sram.service.RoleService;
import com.sram.service.VisitorService;

@SuppressWarnings("serial")
@Controller("baseAction")
public class BaseAction extends ActionSupport implements ServletResponseAware {
	
	@Resource
	protected EmpService empService;
	@Resource
	protected DeptService deptService;
	@Resource
	protected RoleService roleService;
	@Resource
	protected PrivilegeService privilegeService;
	@Resource
	protected DimissionService dimissionService;
	@Resource
	protected ProbationService probationService;
	@Resource
	protected PostGoService postGoService;
	@Resource
	protected VisitorService visitorService;
	@Resource
	protected DeptChangeService deptChangeService;
	
	
	protected HttpServletResponse response;

	@Override
	public void setServletResponse(HttpServletResponse response) {
		this.response = response;
		this.response.setCharacterEncoding("UTF-8");
		this.response.setContentType("tet/html");
	}
	
	public HttpServletResponse getResponse() {
		return response;
	}
	
}
