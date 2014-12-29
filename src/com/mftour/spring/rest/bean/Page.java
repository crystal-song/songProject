package com.mftour.spring.rest.bean;

import java.util.List;

import com.mftour.spring.base.JsonBaseBean;

public class Page<T> extends JsonBaseBean{
	private List<T> list;
	private int page;
	private int pagesize;
	private int pagecount;
	private int cout;
	public List<T> getList() {
		return list;
	}
	public void setList(List<T> list) {
		this.list = list;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getPagesize() {
		return pagesize;
	}
	public void setPagesize(int pagesize) {
		this.pagesize = pagesize;
	}
	public int getPagecount() {
		return pagecount;
	}
	public void setPagecount(int pagecount) {
		this.pagecount = pagecount;
	}
	public int getCout() {
		return cout;
	}
	public void setCout(int cout) {
		this.cout = cout;
	}
	
	
}
