package com.sram.dao.impl;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.stereotype.Repository;

import com.sram.base.BaseDaoImpl;
import com.sram.dao.EmpDao;
import com.sram.entity.Emp;

@Repository("empDao")
public class EmpDaoImpl extends BaseDaoImpl<Emp> implements EmpDao {

	@Override
	public Emp getByNameAndPassword(String name, String password) {
		Session session = getSession();
		Query query = session.createQuery("from Emp e where e.name = ? and e.password = ?");
		query.setParameter(0, name);
		query.setParameter(1, password);
		
		return (Emp)query.uniqueResult();
	}

}
