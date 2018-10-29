package cn.appsys.tools;

import java.util.List;

/**
 * 
 * @author Li
 *
 */
public class PageBean {

	public PageBean(int dataTotal, int pageCur, int pageSize) {
		this.dataTotal = dataTotal;
		this.pageSize = pageSize;
		// 如果当前页数小于1
		if (pageCur < 1) {
			System.out.println("重设");
			this.pageCur = 1;
		} else {
			this.pageCur = pageCur;
		}
		// 计算出总页数
		pageTotal = dataTotal % pageSize == 0 ? (dataTotal / pageSize) : (dataTotal / pageSize) + 1;
		// 如果当前页数超量
		if (this.pageCur > pageTotal) {
			this.pageCur = 1;
		}
	}

	private int pageCur; // 当前页码
	private int pageSize; // 每一页显示的数据条数
	private int dataTotal; // 总数据条数
	private int pageTotal; // 总页数

	private List list; // 一页的数据

	public int getPageCur() {
		return pageCur;
	}

	public void setPageCur(int pageCur) {
		this.pageCur = pageCur;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getDataTotal() {
		return dataTotal;
	}

	public void setDataTotal(int dataTotal) {
		this.dataTotal = dataTotal;
	}

	public int getPageTotal() {
		return pageTotal;
	}

	public void setPageTotal(int pageTotal) {
		this.pageTotal = pageTotal;
	}

	public List getList() {
		return list;
	}

	public void setList(List list) {
		this.list = list;
	}

}