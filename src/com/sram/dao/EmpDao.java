package com.sram.dao;

import com.sram.base.BaseDao;
import com.sram.entity.Emp;

public interface EmpDao extends BaseDao<Emp> {
	
	/** 通过用户名和密码查找员工  */
	Emp getByNameAndPassword(String name, String password);
}
