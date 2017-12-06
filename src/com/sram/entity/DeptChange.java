package com.sram.entity;

import java.util.Date;

public class DeptChange {

	/** 允许 */
	public static final String PROCESS_RESULT_PASS = "允许";
	/** 拒绝 */
	public static final String PROCESS_RESULT_DECLINE = "拒绝";
	/** 已审批 */
	public static final String APPROVE_STATUS_DONE = "已审批";
	/** 待审批 */
	public static final String APPROVE_STATUS_WAITING = "待审批";

	private int id;
	private String approveStatus = DeptChange.APPROVE_STATUS_WAITING;
	private String processResult;
	private Date processDate;
	private String reason;
	private Emp emp;
	private Dept formerDept;
	private Dept latterDept;
	
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getApproveStatus() {
		return approveStatus;
	}

	public void setApproveStatus(String approveStatus) {
		this.approveStatus = approveStatus;
	}

	public String getProcessResult() {
		return processResult;
	}

	public void setProcessResult(String processResult) {
		this.processResult = processResult;
	}

	public Date getProcessDate() {
		return processDate;
	}

	public void setProcessDate(Date processDate) {
		this.processDate = processDate;
	}

	public Emp getEmp() {
		return emp;
	}

	public void setEmp(Emp emp) {
		this.emp = emp;
	}

	public Dept getFormerDept() {
		return formerDept;
	}

	public void setFormerDept(Dept formerDept) {
		this.formerDept = formerDept;
	}

	public Dept getLatterDept() {
		return latterDept;
	}

	public void setLatterDept(Dept latterDept) {
		this.latterDept = latterDept;
	}
	@Override
	public String toString() {
		return "DeptChange [id=" + id + ", approveStatus=" + approveStatus
				+ ", processResult=" + processResult + ", processDate="
				+ processDate + ", reason=" + reason + ", emp=" + emp
				+ ", formerDept=" + formerDept + ", latterDept=" + latterDept
				+ "]";
	}
	
}
