package com.sram.service;

import java.util.List;

import com.sram.entity.PostGo;

public interface PostGoService {
	public int add(PostGo postGo);
	public void delete(int id);
	public void update(PostGo postGo);
	public PostGo getById(int id);
	public List<PostGo> list();
	public List<PostGo> getByConditions(String name,String position);

}
