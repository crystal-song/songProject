package com.mftour.spring.model;

public class TBinding implements java.io.Serializable{
	private static final long serialVersionUID = -8032736954676846625L;
	
	 private Long id;
	    private String platformNo;    //商户编号
	    private String requestNo;  //请求流水号
	    private String notifyUrl ;     //业务名称
	    private String callbackUrl;   //返回码
	    private String platformUserNo; //平台用户编号
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
		public String getNotifyUrl() {
			return notifyUrl;
		}
		public void setNotifyUrl(String notifyUrl) {
			this.notifyUrl = notifyUrl;
		}
		public String getCallbackUrl() {
			return callbackUrl;
		}
		public void setCallbackUrl(String callbackUrl) {
			this.callbackUrl = callbackUrl;
		}
		public String getPlatformUserNo() {
			return platformUserNo;
		}
		public void setPlatformUserNo(String platformUserNo) {
			this.platformUserNo = platformUserNo;
		}
	
	
	
	
	
	
	
	


}
