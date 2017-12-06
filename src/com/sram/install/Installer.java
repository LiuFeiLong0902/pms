package com.sram.install;


import javax.annotation.Resource;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.sram.entity.Emp;
import com.sram.entity.Privilege;


@Component
public class Installer {

	@Resource
	private SessionFactory sessionFactory;

	@Transactional
	public void install() {
		Session session = sessionFactory.getCurrentSession();

		// ===================================================
		// 一、超级管理员
		Emp emp= new Emp();
		emp.setName("admin");
		emp.setPassword("admin");
		session.save(emp); // 保存

		// ===================================================
		// 二、权限数据
		Privilege menu, menu1, menu2, menu3;
		menu = new Privilege("系统管理", null, null);
		menu1 = new Privilege("岗位管理", "roleAction_list", menu);
		menu2 = new Privilege("部门管理", "deptAction", menu);
		menu3 = new Privilege("员工管理", "empAction_list", menu);

		session.save(menu);
		session.save(menu1);
		session.save(menu2);
		session.save(menu3);

		session.save(new Privilege("岗位列表", "roleAction_list", menu1));
		session.save(new Privilege("岗位删除", "roleAction_delete", menu1));
		session.save(new Privilege("岗位添加", "roleAction_add", menu1));
		session.save(new Privilege("岗位修改", "roleAction_edit", menu1));

		session.save(new Privilege("部门列表", "deptAction_list", menu2));
		session.save(new Privilege("部门删除", "deptAction_delete", menu2));
		session.save(new Privilege("部门添加", "deptAction_add", menu2));
		session.save(new Privilege("部门修改", "deptAction_edit", menu2));

		session.save(new Privilege("员工列表", "empAction_list", menu3));
		session.save(new Privilege("员工添加", "empAction_add", menu3));
		session.save(new Privilege("员工初始化密码", "empAction_initPassword", menu3));
	} 

	public static void main(String[] args) {
		System.out.println("正在执行安装...");

		ApplicationContext ac = new ClassPathXmlApplicationContext("applicationContext.xml");
		Installer installer = (Installer) ac.getBean("installer");
		installer.install();

		System.out.println("== 安装完毕 ==");
	}
}
