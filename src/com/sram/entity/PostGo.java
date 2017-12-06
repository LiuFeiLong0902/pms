package com.sram.entity;

import java.util.Date;

public class PostGo {
	private int id;
	private String title;
	private Date startTime;
	private Date endTime;
	private String position;
	private int num;
	private String requirement;
	private String remark;
	private String name;
	
	
	@Override
	public String toString() {
		return "PostGo [endTime=" + endTime + ", id=" + id + ", name=" + name
				+ ", num=" + num + ", position=" + position + ", remark="
				+ remark + ", requirement=" + requirement + ", startTime="
				+ startTime + ", title=" + title + "]";
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Date getStartTime() {
		return startTime;
	}
	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}
	public Date getEndTime() {
		return endTime;
	}
	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getRequirement() {
		return requirement;
	}
	public void setRequirement(String requirement) {
		this.requirement = requirement;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	
	

	

}
