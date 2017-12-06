package com.sram.service.impl;

import java.io.Serializable;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sram.dao.DimissionDao;
import com.sram.entity.Dimission;
import com.sram.service.DimissionService;
import com.sram.util.PageBean;

@Service("dimissionService")
@Transactional
public class DimissionServiceImpl implements DimissionService {
	
	@Resource
	private DimissionDao dimissionDao;

	@Override
	public Serializable add(Dimission dimission) {
		return dimissionDao.add(dimission);
	}

	@Override
	public void update(Dimission dimission) {
		dimissionDao.update(dimission);
	}

	@Override
	public void delete(int id) {
		dimissionDao.delete(id);
	}

	@Override
	public Dimission getById(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Dimission> list() {
		return dimissionDao.list();
	}

	@Override
	public PageBean getPageBean(int pageSize, int currPage, int recordCount) {
		return null;
	}

}
