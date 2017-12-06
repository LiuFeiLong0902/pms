package com.sram.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sram.dao.ProbationDao;
import com.sram.entity.Probation;
import com.sram.service.ProbationService;
import com.sram.util.PageBean;

@Service("probationService")
@Transactional
public class ProbationServiceImpl implements ProbationService {
	
	@Resource
	private ProbationDao probationDao;

	@Override
	public int add(Probation probation) {
		return (Integer) probationDao.add(probation);
	}

	@Override
	public Probation getById(int id) {
		return probationDao.getById(id);
	}

	@Override
	public List<Probation> list() {
		return probationDao.list();
	}

	@Override
	public PageBean getPageBean(int pageSize, int currPage, int recordCount, String hql) {
		recordCount = probationDao.getAllCount(hql);
		
		return probationDao.getPageBean(pageSize, currPage, recordCount, hql);
	}

	@Override
	public void update(Probation probation) {
		probationDao.update(probation);
	}

	@Override
	public int getAllCount(String hql) {
		return probationDao.getAllCount(hql);
	}

}
