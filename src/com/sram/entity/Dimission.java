package com.sram.entity;

import java.util.Date;

public class Dimission {

	// 静态变量
	
	/** 主动离职 */
	public static final String LEAVE_TYPE_ACTIV = "主动离职";
	/** 辞退 */
	public static final String LEAVE_TYPE_FIRE = "辞退";

	/** 已审批 */
	public static final String APPROVE_STATUS_DONE = "已审批";
	/** 待审批 */
	public static final String APPROVE_STATUS_WAITING = "待审批";

	private int id;
	private Date leaveDate = new Date();
	private String reason;
	private String leaveType;
	private String approveStatus = Dimission.APPROVE_STATUS_WAITING;

	private Emp emp;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Date getLeaveDate() {
		return leaveDate;
	}

	public void setLeaveDate(Date leaveDate) {
		this.leaveDate = leaveDate;
	}

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	public String getLeaveType() {
		return leaveType;
	}

	public void setLeaveType(String leaveType) {
		this.leaveType = leaveType;
	}

	public String getApproveStatus() {
		return approveStatus;
	}

	public void setApproveStatus(String approveStatus) {
		this.approveStatus = approveStatus;
	}

	public Emp getEmp() {
		return emp;
	}

	public void setEmp(Emp emp) {
		this.emp = emp;
	}

}
