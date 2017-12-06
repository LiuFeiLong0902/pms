package com.sram.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionContext;
import com.sram.base.BaseAction;
import com.sram.entity.Emp;
import com.sram.entity.Role;
import com.sram.entity.Visitor;

@SuppressWarnings("serial")
@Controller
@Scope("protorype")
public class VisitorAction extends BaseAction {

	// 单例模式 by 王良宇
	private VisitorAction() {
	}

	public static List<String> rList = new ArrayList<String>();

	public static VisitorAction getRList() {
		return (VisitorAction) rList;
	}

	String box;

	public String getBox() {
		return box;
	}

	public void setBox(String box) {
		this.box = box;
	}

	private Visitor visitor;
	private File file;
	private String fileFileName;

	public File getFile() {
		return file;
	}

	public void setFile(File file) {
		this.file = file;
	}

	public String getFileFileName() {
		return fileFileName;
	}

	public void setFileFileName(String fileFileName) {
		this.fileFileName = fileFileName;
	}

	public Visitor getVisitor() {
		return visitor;
	}

	public void setVisitor(Visitor visitor) {
		this.visitor = visitor;
	}

	// +
	public String addVisitor() throws IOException {
		String path = ServletActionContext.getServletContext().getRealPath("/upload");

		File uploadFile = new File(path, fileFileName);

		OutputStream os = new FileOutputStream(uploadFile);// 目标目录
		InputStream is = new FileInputStream(file);// 临时目录

		byte[] buffer = new byte[1024 * 5];
		int length = 0;
		while ((length = is.read(buffer)) != -1) {
			os.write(buffer, 0, length);
		}

		is.close();
		os.close();
		visitor.setConfirm("未审核");
		String image = "upload/" + fileFileName;
		visitor.setImage(image);
		int count = visitorService.add(visitor);
		
		if (count > 0) {
			ActionContext.getContext().put("msg", "已提交");
		} else {
			ActionContext.getContext().put("msg", "提交失败");
		}

		return "back";

	}

	// -
	public String deleteVisitor() {
		int id = Integer.parseInt(ServletActionContext.getRequest().getParameter("id"));
		visitorService.delete(id);
		return visitorList();

	}

	public String getOne() {
		int id = Integer.parseInt(ServletActionContext.getRequest().getParameter("id"));
		Visitor listone = visitorService.getOne(id);
		ActionContext.getContext().put("listone", listone);
		
		return "getOne";
	}

	// 改一状态------------审核 confirm 通过与否state
	public String updateTwo() {
		visitor.setConfirm("已审核");
		visitorService.updateTwo(visitor);
		return visitorList();

	}

	// 查list
	public String visitorList() {
		List<Visitor> visitorList = visitorService.list();
		ActionContext.getContext().put("visitorList", visitorList);
		return "visitorList";

	}

	// 条件查询
	public String seeByCondition() {
		String name = visitor.getName();
		String profession = visitor.getProfession();
		String confirm = visitor.getConfirm();
		List<Visitor> visitorList = visitorService.getByConditions(name,
				profession, confirm);
		ActionContext.getContext().put("visitorList", visitorList);
		return "seeByCondition";

	}

	/** 游客登录 */
	public String login() {
		Emp emp = new Emp();
		emp.setName("游客");
		List<Role> roles = new ArrayList<Role>();
		Role role = roleService.getById(4);
		roles.add(role);
		emp.setRoles(roles);

		ActionContext.getContext().getSession().put("emp", emp);

		return "login";
	}

	//

	public String boxSome() {
		if (rList.contains(box)) {
			rList.remove(box);
		} else {
			rList.add(box);
		}
		ActionContext.getContext().put("rList", rList);
		return null;
	}

	// 多个删除

	public String deleteSome() {
		System.out.println(rList);
		for (int i = 0; i < rList.size(); i++) {
			visitorService.delete(Integer.parseInt(rList.get(i)));
		}
		rList = new ArrayList<String>();
		return visitorList();
	}

}
