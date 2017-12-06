package com.sram.service;

import java.util.List;

import com.sram.entity.Visitor;

public interface VisitorService {
	public int add(Visitor visitor);
	public void delete(int id);
	public void update(Visitor visitor);
	public Visitor getOne(int id);
	public List<Visitor> list();
	public List<Visitor> getByConditions(String name,String profession,String state);
	public void updateTwo(Visitor visitor);

}
