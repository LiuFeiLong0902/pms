package com.sram.service;

import java.util.List;

import com.sram.entity.Privilege;

public interface PrivilegeService {
	/**
	 * 查询所有顶级权限的集合
	 * 
	 * @return
	 */
	List<Privilege> findTopList();

	/**
	 * 查询所有权限URL的集合（不能有null，不能重复）
	 * 
	 * @return
	 */
	List<String> getAllPrivilegeUrls();
	
	/** 通过id集合查找权限 */
	List<Privilege> getByIds(List<Integer> ids);

}
