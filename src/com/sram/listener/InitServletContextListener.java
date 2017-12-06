package com.sram.listener;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.sram.entity.Privilege;
import com.sram.service.PrivilegeService;

public class InitServletContextListener implements ServletContextListener {

	@Override
	public void contextInitialized(ServletContextEvent e) {
		ServletContext application = e.getServletContext();

		// 得到Service的实例对象
		ApplicationContext ac = WebApplicationContextUtils.getWebApplicationContext(application);
		PrivilegeService privilegeService = (PrivilegeService) ac.getBean("privilegeService");
		
		// 准备所有顶级权限的集合（顶级菜单）
		List<Privilege> topPrivilegeList = privilegeService.findTopList();
		application.setAttribute("topPrivilegeList", topPrivilegeList);
		System.out.println("-- 已准备好顶级权限的数据 --");
		
		// 准备所有权限URL的集合
		List<String> allPrivilegeUrls = privilegeService.getAllPrivilegeUrls();
		application.setAttribute("allPrivilegeUrls", allPrivilegeUrls);
		System.out.println("-- 已准备好所有权限的URL数据 --");
		
		// 准备省市
		Map<String, List<String>> province = new HashMap<String, List<String>>();
		List<String> bj = new ArrayList<String>();
		bj.add("朝阳区");
		bj.add("丰台区");
		bj.add("昌平区");
		List<String> sx = new ArrayList<String>();
		sx.add("太原");
		sx.add("忻州");
		sx.add("运城");
		List<String> ah = new ArrayList<String>();
		ah.add("合肥");
		ah.add("亳州");
		ah.add("阜阳");
		List<String> nmg = new ArrayList<String>();
		nmg.add("呼和浩特");
		nmg.add("通辽");
		nmg.add("鄂尔多斯");
		province.put("北京", bj);
		province.put("山西", sx);
		province.put("安徽", ah);
		province.put("内蒙古", nmg);
		application.setAttribute("province", province);
		System.out.println("-- 已准备好所有省市 --");
	}

	@Override
	public void contextDestroyed(ServletContextEvent arg0) {
	}

}
