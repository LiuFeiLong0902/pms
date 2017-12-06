package com.sram.action;

import java.util.List;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionContext;
import com.sram.base.BaseAction;
import com.sram.entity.Dept;
import com.sram.entity.Emp;
import com.sram.entity.Probation;
import com.sram.entity.Role;
import com.sram.util.DeptUtil;
import com.sram.util.PageBean;

@SuppressWarnings({ "serial" })
@Controller
@Scope("prototype")
public class EmpAction extends BaseAction {
	
	private String name;
	private String password;
	private Emp emp;
	private PageBean pageBean;
	
	
	/** 登陆界面 */
	public String loginUI() {
		return "loginUI";
	}
	
	/** 登录 */
	public String login() {
		// 查询
		Emp emp = empService.getByNameAndPassword(name, password);
		
		if (emp == null) {
			ActionContext.getContext().put("loginError", "用户名或密码错误! ");
			return "loginUI";
		} else {
			Object obj = emp.getRoles();
			System.out.println(obj); // 仅仅getXxx()并不会发出相应的HQL语句
			ActionContext.getContext().getSession().put("emp", emp);
			return "toIndex";
		}
	}
	
	/** 注销 */
	public String logout() {
		ActionContext.getContext().getSession().remove("emp");
		return "loginUI";
	}
	
	
	/** 员工列表 */
	@SuppressWarnings("unchecked")
	public String list() {
		if (pageBean == null) {
			// 表示由左侧菜单开始查询或者添加后跳到列表页
			this.pageBean = new PageBean();
			this.pageBean.setPageSize(3);
		}

		StringBuffer hql = new StringBuffer();
		hql.append(" where 1=1 ");
		this.pageBean = empService.getPageBean(this.pageBean.getPageSize(), 1, 0, hql.toString());

		List<Emp> emps = (List<Emp>) pageBean.getRecordList();
		ActionContext.getContext().put("emps", emps);
		
		return "list";
	}
	
	
	/** 条件查询员工列表 */
	public String listByConditions() {
		StringBuffer hql = new StringBuffer();
		hql.append(" where 1=1 ");

		if (!"".equals(emp.getEmpStatus())) {
			// 表示处理状态条件被选
			hql.append(" and empStatus='" + emp.getEmpStatus() + "'");
		}

		this.pageBean = empService.getPageBean(
				this.pageBean.getPageSize(), 
				this.pageBean.getCurrPage(), 
				0, hql.toString());
		
		// 如果按员工状态查询,则将条件放在上下文中
		ActionContext.getContext().put("empStatus", emp.getEmpStatus());
		ActionContext.getContext().put("emps", pageBean.getRecordList());
		
		return "listByConditions";
	}
	
	
	/** 新员工入职UI */
	public String addUI() {
		// 得到部门
		List<Dept> topList = deptService.getTopDepts(); // 顶级部门
		List<Dept> depts = DeptUtil.getAllDepts(topList); // 所有部门
		
		// 得到岗位
		List<Role> roles = roleService.list();
		
		ActionContext.getContext().put("roles", roles);
		ActionContext.getContext().put("depts", depts);
		
		return "addUI";
	}
//	/** 得到省市 
//	 * @throws IOException */
//	public String getProvince() throws IOException {
//		@SuppressWarnings("unchecked")
//		Map<String, List<String>> province = (Map<String, List<String>>) ActionContext
//				.getContext().getApplication().get("province");
//		
//		try {
//			JSONArray array = JSONArray.fromObject(province);
//			getResponse().getWriter().print(array.toString());
//		} catch (Exception e) {
//			e.printStackTrace();
//		} finally {
//			getResponse().getWriter().close();
//		}
//		
//		return null;
//	}
	
	
	/** 入职 */
	public String add() {
		if (emp.getEntryType().equals(Emp.ENTRY_TYPE_DIRECT)) {
			// 直接入职
			emp.setEmpStatus(Emp.EMP_STATUS_INSERVICE); // 在职
			emp.setConversionDate(emp.getHiredate()); // 转正日期
			empService.add(emp);
		} else {
			emp.setEmpStatus(Emp.EMP_STATUS_PROBATION); // 试用期
			// 试用期表添加相应记录
			Probation probation = new Probation();
			probation.setEmp(emp);
			empService.add(emp);
			probationService.add(probation);
		}
		
		return list();
	}
	
	
	/** 查看信息 */
	public String getInfo() {
		emp = empService.getById(this.emp.getId());
		
		return "info";
	}
	
	
	/** 默认方法,用于action的跳转 */
	@Override
	public String execute() throws Exception {
		List<Emp> emps = empService.list();
		ActionContext.getContext().put("emps", emps);
		
		return "list";
	}
	
	

	// -------------------------------
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Emp getEmp() {
		return emp;
	}

	public void setEmp(Emp emp) {
		this.emp = emp;
	}

	public PageBean getPageBean() {
		return pageBean;
	}

	public void setPageBean(PageBean pageBean) {
		this.pageBean = pageBean;
	}
}
