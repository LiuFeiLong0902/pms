package com.sram.service;

import java.util.List;

import com.sram.entity.Probation;
import com.sram.util.PageBean;

public interface ProbationService {
	
	/** 添加试用期管理记录 */
	int add(Probation probation);
	
	/** 更新试用期管理记录,即改变员工的试用期状态 */
	void update(Probation probation);
	
	/** 查找指定的试用期管理记录 */
	Probation getById(int id);
	
	/** 所有试用期记录 */
	List<Probation> list();
	
	/** 分页查找记录 */
	PageBean getPageBean(int pageSize, int currPage, int recordCount, String hql);
	
	/** 按条件查询记录数目 */
	int getAllCount(String hql);

}
