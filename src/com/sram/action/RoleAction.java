package com.sram.action;

import java.util.ArrayList;
import java.util.List;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionContext;
import com.sram.base.BaseAction;
import com.sram.entity.Privilege;
import com.sram.entity.Role;

@SuppressWarnings("serial")
@Controller
@Scope("prototype")
public class RoleAction extends BaseAction {
	
	private List<Integer> privilegeIds;
	private Role role;
	
	/** 岗位列表 */
	public String list() {
		List<Role> roles = roleService.list();
		
		ActionContext.getContext().put("roles", roles);
		
		return "list";
	}
	
	/** 添加岗位 */
	public String add() {
		roleService.add(role);
		return list();
	}
	
	/** 修改岗位 */
	public String editUI() {
		Role role = roleService.getById(this.role.getId());
		ActionContext.getContext().put("role", role);
		
		return "edit";
	}
	
	/** 修改岗位 */
	public String edit() {
		roleService.update(role);
		
		return list();
	}
	
	
	/** 设置权限UI */
	public String setPrivilegeUI() {
		// 准备数据
		Role role = roleService.getById(this.role.getId());
		ActionContext.getContext().put("role", role);

		List<Privilege> topPrivilegeList = privilegeService.findTopList();
		ActionContext.getContext().put("topPrivilegeList", topPrivilegeList);

		// 准备回显的数据
		int length = role.getPrivileges().size(); // 该角色拥有的权限数量
		privilegeIds = new ArrayList<Integer>();
		for (int i = 0; i < length; i++) {
			privilegeIds.add(role.getPrivileges().get(i).getId());
		}
		
		return "setPrivilegeUI";
	}
	
	
	/** 设置权限 */
	public String setPrivilege() {
		// 准备数据
		Role role = roleService.getById(this.role.getId());
		List<Privilege> privileges = privilegeService.getByIds(privilegeIds);
		// role装载权限
		role.setPrivileges(privileges);
		roleService.update(role);
		
		return list();
	}
	
	
	/** 删除岗位 */
	public String delete() throws Exception {
		List<Privilege> privileges = roleService.getById(role.getId()).getPrivileges();
		
		if (privileges != null && privileges.size() != 0) {
			getResponse().getWriter().print("删除失败!<br />该职位下还有员工.");
		} else {
			roleService.delete(role.getId());
			getResponse().getWriter().print("删除成功!");
		}
		getResponse().getWriter().close();
		
		return null;
	}

	
	// ---------------------------------
	
	public Role getRole() {
		return role;
	}

	public void setRole(Role role) {
		this.role = role;
	}

	public List<Integer> getPrivilegeIds() {
		return privilegeIds;
	}

	public void setPrivilegeIds(List<Integer> privilegeIds) {
		this.privilegeIds = privilegeIds;
	}

}
