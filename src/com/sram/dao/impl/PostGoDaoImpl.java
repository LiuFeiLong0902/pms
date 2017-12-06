package com.sram.dao.impl;

import java.util.List;

import org.hibernate.Query;

import org.hibernate.Session;
import org.springframework.stereotype.Repository;

import com.sram.base.BaseDaoImpl;
import com.sram.dao.PostGoDao;
import com.sram.entity.PostGo;

@Repository("postGoDao")
public class PostGoDaoImpl extends BaseDaoImpl<PostGo> implements PostGoDao{

	@Override
	public List<PostGo> getByConditions(String name, String position) {
		Session session=getSession();
		String hql="from PostGo c where 1=1 ";
		if(!name.equals("")&&!position.equals("")){
			hql+=" and c.name='"+name+"' and c.position='"+position+"'";
		}
		if(!name.equals("")&&position.equals("")){
			hql+=" and c.name='"+name+"'";
		}
		if(name.equals("")&&!position.equals("")){
			hql+=" and c.position='"+position+"'";
		}
		Query query= session.createQuery(hql);
		@SuppressWarnings("unchecked")
		List<PostGo> list =query.list();
		return list;
	}

}
