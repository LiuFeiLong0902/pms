package com.sram.service;

import java.io.Serializable;
import java.util.List;

import com.sram.entity.Dept;

public interface DeptService {
	
	/** 添加部门 */
	Serializable add(Dept dept);
	
	/** 更新部门 */
	void update(Dept dept);
	
	/** 删除部门 */
	void delete(int id);
	
	/** 通过id查找部门 */
	Dept getById(int id);
	
	/** 查找所有 */
	List<Dept> list();
	
	/** 获得部门Json串 */
	public String getTreeJsonString(int id);
	
	/** 只更新name */
	void updateName(Dept dept);
	
	/** 获得top级部门 */
	List<Dept> getTopDepts();
	
}
