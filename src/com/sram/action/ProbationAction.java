package com.sram.action;

import java.util.Date;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionContext;
import com.sram.base.BaseAction;
import com.sram.entity.Emp;
import com.sram.entity.Probation;
import com.sram.util.PageBean;

@SuppressWarnings("serial")
@Controller()
@Scope("prototype")
public class ProbationAction extends BaseAction {

	private Probation probation;
	private PageBean pageBean;

	/** 添加试用期记录UI */
	public String evaluationUI() {
		probation = probationService.getById(probation.getId());
		Emp emp = empService.getById(probation.getEmp().getId());
		ActionContext.getContext().put("emp", emp);

		return "evaluationUI";
	}
	
	
	/** 正式添加 */
	public String update() {
		//probation = probationService.getById(probation.getId());
		probation.setProbationStatus(Probation.PROBATION_STATUS_PROCESSED);
		probation.setProcessDate(new Date());
		
		// 需要改变试用期员工的用工状态和转正时间
		if (Probation.PROBATION_RESULT_PASS.equals(probation.getResult())) {
			Emp emp = empService.getById(probation.getEmp().getId());
			emp.setEmpStatus(Emp.EMP_STATUS_INSERVICE);
			emp.setConversionDate(probation.getProcessDate());
			empService.update(emp);
		}
		
		probationService.update(probation);
		System.out.println(probation);
		
		return list();
	}

	
	/** 所有试用期员工 */
	public String list() {
		if (pageBean == null) {
			// 表示由左侧菜单开始查询或者添加后跳到列表页
			this.pageBean = new PageBean();
			this.pageBean.setPageSize(3);
		}

		StringBuffer hql = new StringBuffer();
		hql.append(" where 1=1 ");
		this.pageBean = probationService.getPageBean(this.pageBean.getPageSize(), 1, 0, hql.toString());

		return "list";
	}
	

	/** 按条件查询试用期员工 */
	public String listByConditions() {
		StringBuffer hql = new StringBuffer();
		hql.append(" where 1=1 ");

		if (!"".equals(probation.getProbationStatus())) {
			// 表示处理状态条件被选
			hql.append(" and probationStatus='" + probation.getProbationStatus() + "'");
		}
		if (!"".equals(probation.getResult())) {
			// 表示处理结果条件被选
			hql.append(" and result='" + probation.getResult() + "'");
		}

		this.pageBean = probationService.getPageBean(
				this.pageBean.getPageSize(), this.pageBean.getCurrPage(), 0,
				hql.toString());
		
		return "listByConditions";
	}

	// ----------------------------------

	public Probation getProbation() {
		return probation;
	}

	public void setProbation(Probation probation) {
		this.probation = probation;
	}

	public PageBean getPageBean() {
		return pageBean;
	}

	public void setPageBean(PageBean pageBean) {
		this.pageBean = pageBean;
	}

}
