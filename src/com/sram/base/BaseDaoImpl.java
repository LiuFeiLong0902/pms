package com.sram.base;

import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.util.Collections;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.sram.util.PageBean;

@SuppressWarnings("unchecked")
public  class BaseDaoImpl<T> implements BaseDao<T> {
	
	@Resource
	protected SessionFactory sessionFactory;
	private Class<T> clazz;
	
	public BaseDaoImpl() {
		// 通过反射得到T的真实类型
		ParameterizedType pt = (ParameterizedType) this.getClass().getGenericSuperclass();
		this.clazz = (Class<T>) pt.getActualTypeArguments()[0];
	}

	/** 增加实体 */
	@Override
	public Serializable add(T entity) {
		return this.getSession().save(entity);
	}
	
	/** 更新实体 */
	@Override
	public void update(T entity) {
		this.getSession().update(entity);
	}

	/** 删除实体 */
	@Override
	public void delete(int id) {
		Object obj = this.getSession().get(clazz, id);
		this.getSession().delete(obj);
	}

	/** 通过id查找实体 */
	@Override
	public T getById(int id) {
		getSession().flush();
		getSession().clear();
		
		if (id == 0) {
			return null;
		}
		return (T) getSession().get(clazz, id);
	}
	
	/** 查询所有 */
	@Override
	@Deprecated
	public List<T> list() {
		Session session = getSession();
		Query query = session.createQuery("from " + clazz.getSimpleName() + " order by id desc");

		// 清空session缓存,避免某些字段无法回显
		session.flush();
		session.clear();
		
		return (List<T>) query.list();
	}

	/** 分页查询 */
	@Override
	@Deprecated
	public PageBean getPageBean(int pageSize, int currPage, int recordCount) {
		Session session = getSession();
		
		Query query = session.createQuery("from " + clazz.getSimpleName());
		query.setFirstResult((currPage - 1) * pageSize);
		query.setMaxResults(pageSize);
		
		List<T> recordList = query.list();
		
		PageBean pageBean = new PageBean(pageSize, currPage, recordList, recordCount);
		
		return pageBean;
	}
	
	/** 带条件的分页查询 */
	@Override
	public PageBean getPageBean(int pageSize, int currPage, int recordCount, String hql) {
		Session session = getSession();
		session.flush();
		session.clear();
		
		Query query = session.createQuery("from " + clazz.getSimpleName() + hql);
		query.setFirstResult((currPage - 1) * pageSize);
		query.setMaxResults(pageSize);
		
		List<T> recordList = query.list();
		
		PageBean pageBean = new PageBean(pageSize, currPage, recordList, recordCount);
		
		return pageBean;
	}
	
	/** 查询实体数量  */
	@Override
	@Deprecated
	public int getAllCount() {
		Query query = getSession().createQuery("select count(*) from " + clazz.getSimpleName());
		Long recordCount = (Long) query.uniqueResult();
		
		return recordCount.intValue();
	}
	
	@Override
	public int getAllCount(String hql) {
		Query query = getSession().createQuery("select count(*) from " + clazz.getSimpleName() + hql);
		Long recordCount = (Long) query.uniqueResult();
		
		return recordCount.intValue();
	}

	/** 通过id数组查询实体 */
	public List<T> getByIds(List<Integer> ids) {
		if (ids == null || ids.size() == 0) {
			return Collections.EMPTY_LIST;
		}
		
		Query query = getSession().createQuery("from " + clazz.getSimpleName() + " where id in (:ids)");
		query.setParameterList("ids", ids);
		
		return query.list();
	}
	
	protected Session getSession() {
		return this.sessionFactory.getCurrentSession();
	}

}
