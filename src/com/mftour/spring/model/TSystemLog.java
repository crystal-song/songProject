package com.mftour.spring.model;

public class TSystemLog implements java.io.Serializable {

	private static final long serialVersionUID = -1140360051584731919L;

	private Long logId;// 主键
	private String logModule;// 操作模块
	private String logDescribe;// 操作描述
	private String logCreatetime;// 操作时间
	private String logInputusr;// 操作人
	private Integer logType;// 操作类型 1成功 0失败 2普通信息
	private String logIp;// 操作IP

	public Long getLogId() {
		return logId;
	}

	public void setLogId(Long logId) {
		this.logId = logId;
	}

	public String getLogModule() {
		return logModule;
	}

	public void setLogModule(String logModule) {
		this.logModule = logModule;
	}

	public String getLogDescribe() {
		return logDescribe;
	}

	public void setLogDescribe(String logDescribe) {
		this.logDescribe = logDescribe;
	}

	public String getLogCreatetime() {
		return logCreatetime;
	}

	public void setLogCreatetime(String logCreatetime) {
		this.logCreatetime = logCreatetime;
	}

	public String getLogInputusr() {
		return logInputusr;
	}

	public void setLogInputusr(String logInputusr) {
		this.logInputusr = logInputusr;
	}

	public Integer getLogType() {
		return logType;
	}

	public void setLogType(Integer logType) {
		this.logType = logType;
	}

	public String getLogIp() {
		return logIp;
	}

	public void setLogIp(String logIp) {
		this.logIp = logIp;
	}

}
