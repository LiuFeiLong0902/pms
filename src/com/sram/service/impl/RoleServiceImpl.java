package com.sram.service.impl;

import java.io.Serializable;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sram.dao.RoleDao;
import com.sram.entity.Role;
import com.sram.service.RoleService;

@Service("roleService")
@Transactional
public class RoleServiceImpl implements RoleService {
	
	@Resource
	private RoleDao roleDao;

	@Override
	public Serializable add(Role role) {
		return roleDao.add(role);
	}

	@Override
	public void update(Role role) {
		roleDao.update(role);
	}

	@Override
	public void delete(int id) {
		roleDao.delete(id);
	}

	@Override
	public Role getById(int id) {
		return roleDao.getById(id);
	}

	@Override
	public List<Role> list() {
		return roleDao.list();
	}

}
