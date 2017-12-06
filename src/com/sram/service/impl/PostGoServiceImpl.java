package com.sram.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sram.dao.PostGoDao;
import com.sram.entity.PostGo;
import com.sram.service.PostGoService;



@Service("postGoService")
@Transactional
public class PostGoServiceImpl implements PostGoService{
	private PostGoDao postGoDao;
	@Resource
	public void setPostGoDao(PostGoDao postGoDao) {
		this.postGoDao = postGoDao;
	}

	@Override
	public int add(PostGo postGo) {
		postGoDao.add(postGo);
		return 1;
	}



	@Override
	public List<PostGo> getByConditions(String name, String position) {
		
		return postGoDao.getByConditions(name, position);
	}

	@Override
	public PostGo getById(int id) {
		
		return postGoDao.getById(id);
	}

	@Override
	public void update(PostGo postGo) {
		
		postGoDao.update(postGo);
	}

	@Override
	public List<PostGo> list() {

		return postGoDao.list();
	}

	@Override
	public void delete(int id) {
		postGoDao.delete(id);
	}



}
