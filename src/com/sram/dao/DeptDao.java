package com.sram.dao;

import java.util.List;

import com.sram.base.BaseDao;
import com.sram.entity.Dept;

public interface DeptDao extends BaseDao<Dept> {
	
	/** 通过id查找部门,返回json串 */
	public String getTreeJsonString(int id);
	
	/** 只更新name */
	void updateName(Dept dept);
	
	/** 获得top级部门 */
	List<Dept> getTopDepts();
}
