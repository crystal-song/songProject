package com.mftour.spring.model;

import java.sql.Timestamp;
import java.math.BigDecimal;

public class Yeepays {
	private Integer id;
	private String action;
	private String request_json;
	private String requestXml;
	private String requestSign;
	private String requestYeepayService;
	private String requestPlatformNo;
	private Timestamp requesTime;
	private String contextJson;
	private String respMethod;
	private String respXml;
	private String respJson;
	private String respSign;
	private Integer respCode;
	private String requestNo;
	
	public String getRequestNo() {
		return requestNo;
	}

	public void setRequestNo(String requestNo) {
		this.requestNo = requestNo;
	}

	public BigDecimal getReward() {
		return reward;
	}

	public void setReward(BigDecimal reward) {
		this.reward = reward;
	}

	private BigDecimal reward;

	private String projectId;

	public String getProjectId() {
		return projectId;
	}

	public void setProjectId(String projectId) {
		this.projectId = projectId;
	}

	private String respMsg;
	private Timestamp respTime;
	private Boolean done;
	private BigDecimal amount;

	public String getProjectName() {
		return projectName;
	}

	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}

	private String  projectName;

	public BigDecimal getAmount() {
		return amount;
	}

	public void setAmount(BigDecimal amount) {
		this.amount = amount;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getAction() {
		return action;
	}
	public void setAction(String action) {
		this.action = action;
	}
	public String getRequest_json() {
		return request_json;
	}
	public void setRequest_json(String request_json) {
		this.request_json = request_json;
	}
	public String getRequestXml() {
		return requestXml;
	}
	public void setRequestXml(String requestXml) {
		this.requestXml = requestXml;
	}
	public String getRequestSign() {
		return requestSign;
	}
	public void setRequestSign(String requestSign) {
		this.requestSign = requestSign;
	}
	public String getRequestYeepayService() {
		return requestYeepayService;
	}
	public void setRequestYeepayService(String requestYeepayService) {
		this.requestYeepayService = requestYeepayService;
	}
	public String getRequestPlatformNo() {
		return requestPlatformNo;
	}
	public void setRequestPlatformNo(String requestPlatformNo) {
		this.requestPlatformNo = requestPlatformNo;
	}
	public Timestamp getRequesTime() {
		return requesTime;
	}
	public void setRequesTime(Timestamp requesTime) {
		this.requesTime = requesTime;
	}
	public String getContextJson() {
		return contextJson;
	}
	public void setContextJson(String contextJson) {
		this.contextJson = contextJson;
	}
	public String getRespMethod() {
		return respMethod;
	}
	public void setRespMethod(String respMethod) {
		this.respMethod = respMethod;
	}
	public String getRespXml() {
		return respXml;
	}
	public void setRespXml(String respXml) {
		this.respXml = respXml;
	}
	public String getRespJson() {
		return respJson;
	}
	public void setRespJson(String respJson) {
		this.respJson = respJson;
	}
	public String getRespSign() {
		return respSign;
	}
	public void setRespSign(String respSign) {
		this.respSign = respSign;
	}
	public Integer getRespCode() {
		return respCode;
	}
	public void setRespCode(Integer respCode) {
		this.respCode = respCode;
	}
	public String getRespMsg() {
		return respMsg;
	}
	public void setRespMsg(String respMsg) {
		this.respMsg = respMsg;
	}
	public Timestamp getRespTime() {
		return respTime;
	}
	public void setRespTime(Timestamp respTime) {
		this.respTime = respTime;
	}
	public Boolean getDone() {
		return done;
	}
	public void setDone(Boolean done) {
		this.done = done;
	}
	
	
	
}
