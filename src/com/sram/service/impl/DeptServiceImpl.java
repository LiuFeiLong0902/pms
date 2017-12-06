package com.sram.service.impl;

import java.io.Serializable;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sram.dao.DeptDao;
import com.sram.entity.Dept;
import com.sram.service.DeptService;

@Service("deptService")
@Transactional
public class DeptServiceImpl implements DeptService {
	
	@Resource
	private DeptDao deptDao;

	@Override
	public Serializable add(Dept dept) {
		return deptDao.add(dept);
	}

	@Override
	public void update(Dept dept) {
		deptDao.update(dept);
	}

	@Override
	public void delete(int id) {
		deptDao.delete(id);
	}

	@Override
	public Dept getById(int id) {
		return deptDao.getById(id);
	}

	@Override
	public List<Dept> list() {
		return deptDao.list();
	}
	
	
	/** 获得部门Json串 */
	public String getTreeJsonString(int id) {
		return deptDao.getTreeJsonString(id);
	}

	@Override
	public void updateName(Dept dept) {
		deptDao.updateName(dept);
	}

	@Override
	public List<Dept> getTopDepts() {
		return deptDao.getTopDepts();
	}

}
