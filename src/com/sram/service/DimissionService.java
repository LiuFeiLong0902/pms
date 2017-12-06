package com.sram.service;

import java.io.Serializable;
import java.util.List;

import com.sram.entity.Dimission;
import com.sram.util.PageBean;

public interface DimissionService {

	/** 增加一条离职记录 */
	Serializable add(Dimission dimission);
	
	/** 更新一条离职记录 */
	void update(Dimission dimission);
	
	/** 删除一条离职记录 */
	void delete(int id);
	
	/** 查找一条离职记录 */
	Dimission getById(int id);
	
	/** 查找所有离职记录 */
	List<Dimission> list();
	
	/** 分页查找所有离职记录 */
	PageBean getPageBean(int pageSize, int currPage, int recordCount);
	
}
