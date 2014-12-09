package com.mftour.spring.util;

public class File {
    private String platformNo;    
    private String callbackUrl;   
    private String notifyUrl;
    private String onSubmit;
    private String url;
    private String basePath;
	public String getBasePath() {
		return basePath;
	}
	public void setBasePath(String basePath) {
		this.basePath = basePath;
	}
	public String getPlatformNo() {
		return platformNo;
	}
	public void setPlatformNo(String platformNo) {
		this.platformNo = platformNo;
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
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getOnSubmit() {
		return onSubmit;
	}
	public void setOnSubmit(String onSubmit) {
		this.onSubmit = onSubmit;
	} 
	
	
   
}
