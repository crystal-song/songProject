package com.mftour.spring.model;

public class TYeePay implements java.io.Serializable {

	private static final long serialVersionUID = -8032666954373348825L;

	private Long id;
	private String platformNo; // 商户编号
	private String requestNo; // 请求流水号
	private String service; // 服务名称
	private String code; // 返回码
	private String description; // 描述

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

	public String getService() {
		return service;
	}

	public void setService(String service) {
		this.service = service;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

}
