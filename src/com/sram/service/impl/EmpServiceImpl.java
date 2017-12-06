package com.sram.service.impl;

import java.io.Serializable;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sram.dao.EmpDao;
import com.sram.entity.Emp;
import com.sram.service.EmpService;
import com.sram.util.PageBean;

@Service("empService")
@Transactional
public class EmpServiceImpl implements EmpService {
	
	@Resource
	private EmpDao empDao;

	@Override
	public Emp getByNameAndPassword(String name, String password) {
		return empDao.getByNameAndPassword(name, password);
	}

	@Override
	public Serializable add(Emp emp) {
		return empDao.add(emp);
	}

	@Override
	public void update(Emp emp) {
		empDao.update(emp);
	}

	@Override
	public Emp getById(int id) {
		return empDao.getById(id);
	}

	@Override
	public List<Emp> list() {
		return empDao.list();
	}

	@Override
	public PageBean getPageBean(int pageSize, int currPage, int recordCount, String hql) {
		recordCount = empDao.getAllCount(hql);
		
		return empDao.getPageBean(pageSize, currPage, recordCount, hql);
	}

}
