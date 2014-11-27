package com.mftour.spring.model;

public class TDrawMoney implements java.io.Serializable{
	private static final long serialVersionUID = -8032736884676846625L;
	
	 private Long id;
	    private String platformNo;    //商户编号
	    private String platformUserNo;  //平台用户编号
	    private String requestNo;  //请求流水号
	    private String notifyUrl ;     //服务器通知URL
	    private String callbackUrl;   //页面回跳URL
	    private String amount; //提现金额
	   
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
		public String getPlatformUserNo() {
			return platformUserNo;
		}
		public void setPlatformUserNo(String platformUserNo) {
			this.platformUserNo = platformUserNo;
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
		public String getAmount() {
			return amount;
		}
		public void setAmount(String amount) {
			this.amount = amount;
		}
	
	
	
	
	

}
