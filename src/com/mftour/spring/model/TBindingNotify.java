package com.mftour.spring.model;

public class TBindingNotify implements java.io.Serializable{
	private static final long serialVersionUID = -8032736664366846625L;
	
	   private Long id;
	    private String requestNo; 
	    private String platformNo;    //商户编号
	    private String bizType;     //服务名称
	    private String code;   //返回码
	    private String message; //描述
	    private String platformUserNo;
	    private String bankCardNo;
	    private String cardStatus;
	    private String bank;
		public Long getId() {
			return id;
		}
		public void setId(Long id) {
			this.id = id;
		}
		public String getRequestNo() {
			return requestNo;
		}
		public void setRequestNo(String requestNo) {
			this.requestNo = requestNo;
		}
		public String getPlatformNo() {
			return platformNo;
		}
		public void setPlatformNo(String platformNo) {
			this.platformNo = platformNo;
		}
		public String getBizType() {
			return bizType;
		}
		public void setBizType(String bizType) {
			this.bizType = bizType;
		}
		public String getCode() {
			return code;
		}
		public void setCode(String code) {
			this.code = code;
		}
		public String getMessage() {
			return message;
		}
		public void setMessage(String message) {
			this.message = message;
		}
		public String getPlatformUserNo() {
			return platformUserNo;
		}
		public void setPlatformUserNo(String platformUserNo) {
			this.platformUserNo = platformUserNo;
		}
		public String getBankCardNo() {
			return bankCardNo;
		}
		public void setBankCardNo(String bankCardNo) {
			this.bankCardNo = bankCardNo;
		}
		public String getCardStatus() {
			return cardStatus;
		}
		public void setCardStatus(String cardStatus) {
			this.cardStatus = cardStatus;
		}
		public String getBank() {
			return bank;
		}
		public void setBank(String bank) {
			this.bank = bank;
		}
	
   
}
