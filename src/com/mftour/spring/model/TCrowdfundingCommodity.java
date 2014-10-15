package com.mftour.spring.model;

public class TCrowdfundingCommodity  implements java.io.Serializable{
	
	private static final long serialVersionUID = -8032736967366846625L;
	
	 private Long id;
	 private String projectNumber; 
	 private int sustainMoney;   //支持金额
	 private int supporter;        //支持者
	 private int limitQuantity;  //限制人数
	 private String productInfo;   //产品信息
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
	public int getSustainMoney() {
		return sustainMoney;
	}
	public void setSustainMoney(int sustainMoney) {
		this.sustainMoney = sustainMoney;
	}
	public int getSupporter() {
		return supporter;
	}
	public void setSupporter(int supporter) {
		this.supporter = supporter;
	}
	public int getLimitQuantity() {
		return limitQuantity;
	}
	public void setLimitQuantity(int limitQuantity) {
		this.limitQuantity = limitQuantity;
	}
	public String getProductInfo() {
		return productInfo;
	}
	public void setProductInfo(String productInfo) {
		this.productInfo = productInfo;
	}
	
	 
	
	

}
