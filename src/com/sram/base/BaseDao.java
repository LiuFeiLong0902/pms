package com.sram.base;

import java.io.Serializable;
import java.util.List;

import com.sram.util.PageBean;

public interface BaseDao<T> {
	
	/**
	 * 增加实体
	 * @param entity
	 * @return 主键
	 */
	Serializable add(T entity);

	/** 更新实体 */
	void update(T entity);

	/** 删除记录 */
	void delete(int id);

	/** 查询实体 */
	T getById(int id);
	
	/** 查询所有 */
	List<T> list();

	/** 分页查询实体 */
	PageBean getPageBean(int pageSize, int currPage, int recordCount);
	
	/** 带条件的分页查询 */
	public PageBean getPageBean(int pageSize, int currPage, int recordCount, String hql);
	
	/** 查询总记录数 */
	int getAllCount();
	
	/** 按条件查询记录数目 */
	int getAllCount(String hql);
}
