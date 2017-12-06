package com.sram.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.stereotype.Repository;

import com.sram.base.BaseDaoImpl;
import com.sram.dao.DeptDao;
import com.sram.entity.Dept;

@Repository("deptDao")
public class DeptDaoImpl extends BaseDaoImpl<Dept> implements DeptDao {
	
	
	public String getTreeJsonString(int id) {
		Session session = getSession();

		Dept dept;
		if (id == 0) {
			Query query = session.createQuery("from Dept d where d.parent = null");
			dept = (Dept) query.uniqueResult();
		} else {
			dept = (Dept) session.get(Dept.class, id);
		}
		StringBuffer sb = new StringBuffer();
		sb.append("[");
		printNode(dept, sb);
		sb.append("}]");
		return sb.toString();
	}

	
	/** 拼凑json串 */
	public void printNode(Dept dept, StringBuffer sb) {
		if (dept == null) {
			return;
		}
		sb.append("{\"id\":\"" + dept.getId() + "\"");
		sb.append(",\"name\":\"" + dept.getName() + "\"");
		sb.append(",\"open\":\"true\"");
		int i = 0;

		for (Dept child : dept.getChildren()) {
			if (i == 0) {
				sb.append(",\"children\":[");
			}
			printNode(child, sb);

			if (i == dept.getChildren().size() - 1) {
				sb.append("}]");
			} else {
				sb.append("},");
			}

			i++;
		}

	}


	@Override
	public void updateName(Dept dept) {
		Query query = getSession().createQuery("update Dept d set d.name=? where d.id=" + dept.getId());
		query.setParameter(0, dept.getName());
		query.executeUpdate();
	}


	@SuppressWarnings("unchecked")
	@Override
	public List<Dept> getTopDepts() {
		Session session = getSession();
		Query query = session.createQuery("from Dept d where d.parent = 1"); 
		return query.list();
	}
}
