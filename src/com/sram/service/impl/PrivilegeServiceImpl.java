package com.sram.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sram.dao.PrivilegeDao;
import com.sram.entity.Privilege;
import com.sram.service.PrivilegeService;

@Service("privilegeService")
@Transactional
public class PrivilegeServiceImpl implements PrivilegeService {

	@Resource
	private PrivilegeDao privilegeDao;
	
	@Override
	public List<Privilege> findTopList() {
		return privilegeDao.findTopList();
	}

	@Override
	public List<String> getAllPrivilegeUrls() {
		return privilegeDao.getAllPrivilegeUrls();
	}

	@Override
	public List<Privilege> getByIds(List<Integer> ids) {
		return privilegeDao.getByIds(ids);
	}

}
