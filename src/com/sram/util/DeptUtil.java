package com.sram.util;

import java.util.ArrayList;
import java.util.List;

import com.sram.entity.Dept;

public class DeptUtil {
	
	/**
	 * 遍历部门树，得到所有的部门列表，并修改了名称以表示层次。
	 * 
	 * @param topList
	 * @return
	 */
	public static List<Dept> getAllDepts(List<Dept> topList) {
		List<Dept> list = new ArrayList<Dept>();
		walkDeptTrees(topList, "┣", list);
		return list;
	}

	/*
	 * 遍历部门树，把遍历出来的部门都放到指定的集合中
	 */
	private static void walkDeptTrees(List<Dept> topList, String prefix, List<Dept> list) {
		for (Dept top : topList) {
			// 顶点
			Dept copy = new Dept(); // 原对象是在Session中的对象，是持久化状态，所以要使用副本。
			copy.setId(top.getId());
			copy.setName(prefix + top.getName());
			list.add(copy);
			// 子树
			walkDeptTrees(top.getChildren(), "　" + prefix, list); // 使用的是全角的空格
		}
	}
}
