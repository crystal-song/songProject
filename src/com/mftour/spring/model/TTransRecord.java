package com.mftour.spring.model;

public class TTransRecord implements java.io.Serializable {
	private static final long serialVersionUID = -8032768954376668825L;
	private Long id;
	private String userName;
	private String requestNo;
	private String transDate;			//交易时间
	private String projectName;
	private String transAmount;
	private String type;
	
	public TTransRecord() {
		super();
	}
	
	public TTransRecord(String userName, String requestNo, String transDate,
			String projectName, String transAmount, String type) {
		super();
		this.userName = userName;
		this.requestNo = requestNo;
		this.transDate = transDate;
		this.projectName = projectName;
		this.transAmount = transAmount;
		this.type = type;
	}

	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getRequestNo() {
		return requestNo;
	}
	public void setRequestNo(String requestNo) {
		this.requestNo = requestNo;
	}
	public String getTransDate() {
		return transDate;
	}
	public void setTransDate(String transDate) {
		this.transDate = transDate;
	}
	public String getProjectName() {
		return projectName;
	}
	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}
	
	public String getTransAmount() {
		return transAmount;
	}
	public void setTransAmount(String transAmount) {
		this.transAmount = transAmount;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	
}
