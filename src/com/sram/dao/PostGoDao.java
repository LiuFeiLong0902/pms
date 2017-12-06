package com.sram.dao;

import java.util.List;

import com.sram.base.BaseDao;
import com.sram.entity.PostGo;

public interface PostGoDao extends BaseDao<PostGo>{
	public List<PostGo> getByConditions(String name,String position);


}
