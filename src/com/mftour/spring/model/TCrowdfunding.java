package com.mftour.spring.model;

public class TCrowdfunding {
	
	 private static final long serialVersionUID = -8032736954676548825L;
	 private Long id;
	 private String projectNumber; 
	 private String name;    //名称
	 private int raiseTime;  //筹集时间
	 private String raiseMoney;   //筹集资金
	 private String raiseProportion;  //筹集比例
	 private String realityMoney;   //已经筹集资金
	 private String surplusTime;     //剩余时间 
	 private String projectPicture;  //项目图片
	 private String projectIntroduction;  //项目介绍
	 private int supporter;  
	 private int like; 
	 private String releaseTime;  //发布时间
	 private String expirationTime;  //截止时间
	 
	 
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getProjectNumber() {
		return projectNumber;
	}
	public void setProjectNumber(String projectNumber) {
		this.projectNumber = projectNumber;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public int getRaiseTime() {
		return raiseTime;
	}
	public void setRaiseTime(int raiseTime) {
		this.raiseTime = raiseTime;
	}
	public String getRaiseMoney() {
		return raiseMoney;
	}
	public void setRaiseMoney(String raiseMoney) {
		this.raiseMoney = raiseMoney;
	}
	public String getRaiseProportion() {
		return raiseProportion;
	}
	public void setRaiseProportion(String raiseProportion) {
		this.raiseProportion = raiseProportion;
	}
	public String getRealityMoney() {
		return realityMoney;
	}
	public void setRealityMoney(String realityMoney) {
		this.realityMoney = realityMoney;
	}
	public String getSurplusTime() {
		return surplusTime;
	}
	public void setSurplusTime(String surplusTime) {
		this.surplusTime = surplusTime;
	}
	
	public String getProjectPicture() {
		return projectPicture;
	}
	public void setProjectPicture(String projectPicture) {
		this.projectPicture = projectPicture;
	}
	public String getProjectIntroduction() {
		return projectIntroduction;
	}
	public void setProjectIntroduction(String projectIntroduction) {
		this.projectIntroduction = projectIntroduction;
	}
	public int getSupporter() {
		return supporter;
	}
	public void setSupporter(int supporter) {
		this.supporter = supporter;
	}
	public int getLike() {
		return like;
	}
	public void setLike(int like) {
		this.like = like;
	}
	public String getReleaseTime() {
		return releaseTime;
	}
	public void setReleaseTime(String releaseTime) {
		this.releaseTime = releaseTime;
	}
	public String getExpirationTime() {
		return expirationTime;
	}
	public void setExpirationTime(String expirationTime) {
		this.expirationTime = expirationTime;
	}
	
	 
	 
	 

}
