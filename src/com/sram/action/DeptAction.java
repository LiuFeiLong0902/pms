package com.sram.action;

import java.io.IOException;
import java.util.List;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionContext;
import com.sram.base.BaseAction;
import com.sram.entity.Dept;
import com.sram.util.HexNumberUtil;

@SuppressWarnings("serial")
@Controller
@Scope("prototype")
public class DeptAction extends BaseAction {

	private Dept dept;
	
	
	/** 构建部门的JSON对象 */
	private String findDeptsJSON() {
		StringBuffer sb = new StringBuffer();
		List<Dept> depts = deptService.list();

		sb.append("[");
		for (Dept dept : depts) {
			sb.append("{\"name\":\"" + dept.getName() + "\",\"value\":"
					+ dept.getEmps().size() + ",\"color\":\"#"
					+ HexNumberUtil.getHexString() + "\"},");
		}
		sb = sb.deleteCharAt(sb.length() - 1);
		sb.append("]");
		
		return sb.toString();
	}

	
	/** 部门3D柱状图 */
	public String createDeptColumn3D() {

		try {
			response.getWriter().print(this.findDeptsJSON());
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				response.getWriter().close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

		return "view";
	}

	/** 部门列表 */
	public String list() {
		List<Dept> depts = deptService.list();

		ActionContext.getContext().put("depts", depts);

		return "list";
	}

	/**
	 * 增加部门
	 * 
	 * @throws IOException
	 */
	public String add() throws IOException {
		deptService.add(dept);
		String jsonString = "{\"id\":" + dept.getId() + ",\"name\":\""
				+ dept.getName() + "\",\"parent\":{" + "\"id\":"
				+ dept.getParent().getId() + "}}";
		try {
			getResponse().getWriter().print(jsonString);
		} catch (IOException e) {
			e.printStackTrace();
			getResponse().getWriter().print("{}");
		}

		getResponse().getWriter().close();

		return null;
	}

	/**
	 * 更新部门
	 * 
	 * @throws IOException
	 */
	public String update() throws IOException {
		try {
			/*
			 * String name = dept.getName(); // 获取新名字 dept =
			 * deptService.getById(this.dept.getId()); // 查到该持久化对象
			 * dept.setName(name); // 更新名字
			 */

			deptService.updateName(this.dept);
			response.getWriter().print("success");
		} catch (Exception e) {
			e.printStackTrace();
			response.getWriter().print("failure");
		} finally {
			response.getWriter().close();
		}

		return null;
	}

	/** 删除部门 */
	public String delete() throws Exception {
		try {
			deptService.delete(dept.getId());
			getResponse().getWriter().print("success");
		} catch (Exception e) {
			getResponse().getWriter().print("failure");
		} finally {
			response.getWriter().close();
		}

		return null;
	}

	/**
	 * 获得部门的json串
	 * 
	 * @throws IOException
	 */
	public String async() throws IOException {
		String jsonString = deptService.getTreeJsonString(0);
		try {
			getResponse().getWriter().print(jsonString);
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			getResponse().getWriter().close();
		}

		return null;
	}

	/** 得到指定的部门 */
	public String findById() {
		dept = deptService.getById(this.dept.getId());

		return "view";
	}

	/** 修改描述 */
	public String updateDescription() {
		String description = dept.getDescription();
		dept = deptService.getById(this.dept.getId());
		
		try {
			dept.setDescription(description);
			deptService.update(dept);
		} catch (Exception e) {
			e.printStackTrace();
		}


		return "view";
	}

	@Override
	public String execute() throws Exception {
		return super.execute();
	}

	// --------------------------------------------------

	public Dept getDept() {
		return dept;
	}

	public void setDept(Dept dept) {
		this.dept = dept;
	}

}