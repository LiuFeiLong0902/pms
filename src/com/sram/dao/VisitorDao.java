package com.sram.dao;

import java.util.List;

import com.sram.base.BaseDao;
import com.sram.entity.Visitor;

public interface VisitorDao extends BaseDao<Visitor>{
	
	public List<Visitor> getByConditions(String name,String profession,String confirm);
	public void updateTwo(Visitor visitor);

}
