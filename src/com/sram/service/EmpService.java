package com.sram.service;

import java.io.Serializable;
import java.util.List;

import com.sram.entity.Emp;
import com.sram.util.PageBean;

public interface EmpService {
	
	/** 通过用户名和密码查找用户  */
	Emp getByNameAndPassword(String name, String password);
	
	/** 增加一个员工 */
	Serializable add(Emp emp);
	
	/** 更新 */
	void update(Emp emp);
	
	/** 通过id查找员工 */
	Emp getById(int id);
	
	/** 所有员工列表 */
	List<Emp> list();

	/** 模糊查询员工列表 */
	PageBean getPageBean(int pageSize, int currPage, int recordCount, String hql);
}
