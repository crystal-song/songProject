package com.mftour.spring.model;

public class TTransNotice {
	private Long id;
	private String rechargeNoticeType;
	private String drawNoticeType;
	private String jiangliNoticeType;
	private String userName;
	
	public TTransNotice() {
		super();
	}
	public TTransNotice(String rechargeNoticeType, String drawNoticeType,
			String jiangliNoticeType, String userName) {
		super();
		this.rechargeNoticeType = rechargeNoticeType;
		this.drawNoticeType = drawNoticeType;
		this.jiangliNoticeType = jiangliNoticeType;
		this.userName = userName;
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getRechargeNoticeType() {
		return rechargeNoticeType;
	}
	public void setRechargeNoticeType(String rechargeNoticeType) {
		this.rechargeNoticeType = rechargeNoticeType;
	}
	public String getDrawNoticeType() {
		return drawNoticeType;
	}
	public void setDrawNoticeType(String drawNoticeType) {
		this.drawNoticeType = drawNoticeType;
	}
	public String getJiangliNoticeType() {
		return jiangliNoticeType;
	}
	public void setJiangliNoticeType(String jiangliNoticeType) {
		this.jiangliNoticeType = jiangliNoticeType;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	
}
