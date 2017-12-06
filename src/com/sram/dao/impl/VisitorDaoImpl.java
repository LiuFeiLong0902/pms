package com.sram.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.stereotype.Repository;

import com.sram.base.BaseDaoImpl;
import com.sram.dao.VisitorDao;
import com.sram.entity.Visitor;

@Repository("visitorDao")
public class VisitorDaoImpl extends BaseDaoImpl<Visitor> implements VisitorDao{

	@SuppressWarnings("unchecked")
	@Override
	public List<Visitor> getByConditions(String name, String profession,
			String confirm) {
		
		Session session=getSession();
		String hql="from Visitor v where 1=1";
		if(!name.equals("")&&!profession.equals("")&&!confirm.equals("")){
			hql+=" and v.name='"+name+"' and v.profession='"+profession+"' and v.confirm='"+confirm+"'";
		}
		if(!name.equals("")&&!profession.equals("")&&confirm.equals("")){
			hql+=" and v.name='"+name+"' and v.profession='"+profession+"' ";
		}
		if(!name.equals("")&&profession.equals("")&&!confirm.equals("")){
			hql+=" and v.name='"+name+"' and v.confirm='"+confirm+"'";
		}
		if(name.equals("")&&!profession.equals("")&&!confirm.equals("")){
			hql+=" and v.profession='"+profession+"' and v.confirm='"+confirm+"'";
		}
		if(!name.equals("")&&profession.equals("")&&confirm.equals("")){
			hql+=" and v.name='"+name+"' ";
		}
		if(name.equals("")&&!profession.equals("")&&confirm.equals("")){
			hql+="  and v.profession='"+profession+"' ";
		}
		if(name.equals("")&&profession.equals("")&&!confirm.equals("")){
			hql+="  and v.confirm='"+confirm+"'";
		}
		Query query= session.createQuery(hql);
		List<Visitor> list =query.list();		
		return list;
	}

	@Override
	public void updateTwo(Visitor visitor) {
		Query query = getSession().createQuery("update Visitor v set v.state=?,v.confirm=? where v.id=" + visitor.getId());
		query.setParameter(0, visitor.getState());
		query.setParameter(1, visitor.getConfirm());
		query.executeUpdate();
		
	}
	

	

	

}
