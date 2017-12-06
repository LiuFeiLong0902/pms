package com.sram.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


import com.sram.dao.VisitorDao;
import com.sram.entity.Visitor;
import com.sram.service.VisitorService;

@Service("visitorService")
@Transactional
public class VisitorServiceImpl implements VisitorService{
	private VisitorDao visitorDao;
	
	@Resource
	public void setVisitorDao(VisitorDao visitorDao) {
		this.visitorDao = visitorDao;
	}



	@Override
	public List<Visitor> getByConditions(String name, String profession,String state) {
		
		return visitorDao.getByConditions(name, profession, state);
	}



	@Override
	public int add(Visitor visitor) {
		visitorDao.add(visitor);
		return 1;
	}



	@Override
	public void delete(int id) {
		visitorDao.delete(id);
	}




	@Override
	public void update(Visitor visitor) {
		
		visitorDao.update(visitor);
	}



	@Override
	public List<Visitor> list() {
		return visitorDao.list();
	}



	@Override
	public Visitor getOne(int id) {
		return visitorDao.getById(id);
		
	}



	@Override
	public void updateTwo(Visitor visitor) {
		visitorDao.updateTwo(visitor);
		
	}

	

}
