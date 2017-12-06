package com.sram.entity;

import java.util.Date;

public class Probation {
	
	/** 已处理 */
	public static final String PROBATION_STATUS_PROCESSED = "已处理";
	/** 待处理 */
	public static final String PROBATION_STATUS_WAITING = "待处理";
	/** 允许入职 */
	public static final String PROBATION_RESULT_PASS = "允许入职";
	/** 不予录用 */
	public static final String PROBATION_RESULT_DECLINE = "不予录用";
	
	
	private int id;
	private String result;
	private Date processDate;
	private String comment;
	private String probationStatus = Probation.PROBATION_STATUS_WAITING;
	
	private Emp emp;  

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	public Date getProcessDate() {
		return processDate;
	}

	public void setProcessDate(Date processDate) {
		this.processDate = processDate;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public Emp getEmp() {
		return emp;
	}

	public void setEmp(Emp emp) {
		this.emp = emp;
	}

	public String getProbationStatus() {
		return probationStatus;
	}

	public void setProbationStatus(String probationStatus) {
		this.probationStatus = probationStatus;
	}
	
	
}
