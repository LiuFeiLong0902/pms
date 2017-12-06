package com.sram.service;

import java.util.List;

import com.sram.entity.DeptChange;
import com.sram.util.PageBean;


public interface DeptChangeService {
	
	/** 所有部门调动记录 ,无分页*/
	List<DeptChange> list();
	
	/** 添加 */
	Integer add(DeptChange deptChange);
	
	/** 更新,审核 */
	void update(DeptChange deptChange);
	
	/** 查找指定的部门调动记录 */
	DeptChange getById(int id);
	
	/** 分页查询所有部门调动记录 */
	PageBean getPageBean(int pageSize, int currPage, int recordCount, String hql);
	
	/** 按条件查询记录数目 */
	int getAllCount(String hql);

}
