package com.mftour.spring.model;

public class TTransferInfo implements java.io.Serializable {
	private static final long serialVersionUID = -8032768954376668825L;
	private Long id;
	private String platformNo;
	private String requestNo;
	private String platformUserNo;
	private String orderNo; // 标的号
	private String transferAmount; // 标的金额
	private String targetPlatformUserNo;
	private String paymentAmount;
	private String expired;
	private String callbackUrl;
	private String notifyUrl;
	private String code;
	private String enterpriseNumber;			//企业编号
	private String projectName;					//项目名称
	private Double interestRate;
	private String transDate;			//交易时间

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getPlatformNo() {
		return platformNo;
	}

	public void setPlatformNo(String platformNo) {
		this.platformNo = platformNo;
	}

	public String getRequestNo() {
		return requestNo;
	}

	public void setRequestNo(String requestNo) {
		this.requestNo = requestNo;
	}

	public String getPlatformUserNo() {
		return platformUserNo;
	}

	public void setPlatformUserNo(String platformUserNo) {
		this.platformUserNo = platformUserNo;
	}

	public String getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}

	public String getTransferAmount() {
		return transferAmount;
	}

	public void setTransferAmount(String transferAmount) {
		this.transferAmount = transferAmount;
	}

	public String getTargetPlatformUserNo() {
		return targetPlatformUserNo;
	}

	public void setTargetPlatformUserNo(String targetPlatformUserNo) {
		this.targetPlatformUserNo = targetPlatformUserNo;
	}

	public String getPaymentAmount() {
		return paymentAmount;
	}

	public void setPaymentAmount(String paymentAmount) {
		this.paymentAmount = paymentAmount;
	}

	public String getExpired() {
		return expired;
	}

	public void setExpired(String expired) {
		this.expired = expired;
	}

	public String getCallbackUrl() {
		return callbackUrl;
	}

	public void setCallbackUrl(String callbackUrl) {
		this.callbackUrl = callbackUrl;
	}

	public String getNotifyUrl() {
		return notifyUrl;
	}

	public void setNotifyUrl(String notifyUrl) {
		this.notifyUrl = notifyUrl;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getEnterpriseNumber() {
		return enterpriseNumber;
	}

	public void setEnterpriseNumber(String enterpriseNumber) {
		this.enterpriseNumber = enterpriseNumber;
	}

	public String getProjectName() {
		return projectName;
	}

	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}

	public Double getInterestRate() {
		return interestRate;
	}

	public void setInterestRate(Double interestRate) {
		this.interestRate = interestRate;
	}

	public String getTransDate() {
		return transDate;
	}

	public void setTransDate(String transDate) {
		this.transDate = transDate;
	}
	
}
