package com.sram.service;

import java.io.Serializable;
import java.util.List;

import com.sram.entity.Role;

public interface RoleService {
	
	/** 增加一个岗位 */
	Serializable add(Role role);
	
	/** 更新一个岗位  */
	void update(Role role);
	
	/** 删除 */
	void delete(int id);
	
	/** 通过id查找角色 */
	Role getById(int id);
	
	/** 所有岗位 */
	List<Role> list();
}
