package com.sram.dao.impl;

import org.springframework.stereotype.Repository;

import com.sram.base.BaseDaoImpl;
import com.sram.dao.DeptChangeDao;
import com.sram.entity.DeptChange;

@Repository("deptChangeDao")
public class DeptChangeDaoImpl extends BaseDaoImpl<DeptChange> implements
		DeptChangeDao {

}
