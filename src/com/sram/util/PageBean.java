package com.sram.util;

import java.util.List;

public class PageBean {
	// 传递的参数或是配置的参数
	private int pageSize; // 每页的记录数
	private int currPage; // 当前页数

	// 查询数据库
	private List<?> recordList; // 本页的数据列表
	private int recordCount; // 所有的记录数

	// 计算
	private int pageCount; // 总页数
	private int begin; // 开始页的索引
	private int end; // 结束页的索引

	/**
	 * 只接受4个必要的属性，会自动计算出其它属性的值
	 * 
	 * @param pageSize
	 * @param currPage
	 * @param recordList
	 * @param recordCount
	 */
	public PageBean(int pageSize, int currPage, List<?> recordList, int recordCount) {
		this.currPage = currPage;
		this.pageSize = pageSize;
		this.recordList = recordList;
		this.recordCount = recordCount;

		// 计算pageCount
		this.pageCount = (recordCount + pageSize - 1) / pageSize;
		
		// 计算begin和end
		// 总页码小于5时全部显示
		if (pageCount < 5) {
			this.begin = 1;
			this.end = pageCount;
		}
		// 总页码大于5时，就显示当前页附近的5个页码
		else {
			// 默认显示前2页 +当前页 + 后两页
			this.begin = currPage - 2;
			this.end = currPage + 2;

			// 如果前面不足2个页码时显示前5页
			if (this.begin < 1) {
				this.begin = 1;
				this.end = 5;
			}
			// 如果后面给不足2个页码时，显示后5页
			if (this.end > pageCount) {
				this.begin = this.pageCount - 4;
				this.end = pageCount;
			}
		}
	}

	/**
	 * 
	 */
	public PageBean() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getCurrPage() {
		return currPage;
	}

	public void setCurrPage(int currPage) {
		this.currPage = currPage;
	}

	public List<?> getRecordList() {
		return recordList;
	}

	public void setRecordList(List<?> recordList) {
		this.recordList = recordList;
	}

	public int getRecordCount() {
		return recordCount;
	}

	public void setRecordCount(int recordCount) {
		this.recordCount = recordCount;
	}

	public int getPageCount() {
		return pageCount;
	}

	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}

	public int getBegin() {
		return begin;
	}

	public void setBegin(int begin) {
		this.begin = begin;
	}

	public int getEnd() {
		return end;
	}

	public void setEnd(int end) {
		this.end = end;
	}
}
