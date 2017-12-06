package com.sram.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sram.dao.DeptChangeDao;
import com.sram.entity.DeptChange;
import com.sram.service.DeptChangeService;
import com.sram.util.PageBean;

@Service("deptChangeService")
@Transactional
public class DeptChangeServiceImpl implements DeptChangeService {
	
	@Resource
	private DeptChangeDao deptChangeDao;

	@Override
	public List<DeptChange> list() {
		return deptChangeDao.list();
	}

	@Override
	public Integer add(DeptChange deptChange) {
		return (Integer) deptChangeDao.add(deptChange);
	}

	@Override
	public void update(DeptChange deptChange) {
		deptChangeDao.update(deptChange);
	}

	@Override
	public DeptChange getById(int id) {
		return deptChangeDao.getById(id);
	}

	@Override
	public PageBean getPageBean(int pageSize, int currPage, int recordCount, String hql) {
		
		
		return null;
	}

	@Override
	public int getAllCount(String hql) {
		return deptChangeDao.getAllCount(hql);
	}

}
