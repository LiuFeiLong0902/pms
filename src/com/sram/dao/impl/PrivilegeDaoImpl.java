package com.sram.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.sram.base.BaseDaoImpl;
import com.sram.dao.PrivilegeDao;
import com.sram.entity.Privilege;

@SuppressWarnings("unchecked")
@Repository("privilegeDao")
public class PrivilegeDaoImpl extends BaseDaoImpl<Privilege> implements
		PrivilegeDao {

	@Override
	public List<Privilege> findTopList() {
		return getSession()
				.createQuery("FROM Privilege p WHERE p.parent IS NULL")
				.list();
	}

	@Override
	public List<String> getAllPrivilegeUrls() {
		return getSession()
				.createQuery("SELECT DISTINCT p.url FROM Privilege p WHERE p.url IS NOT NULL")
				.list();
	}

}
