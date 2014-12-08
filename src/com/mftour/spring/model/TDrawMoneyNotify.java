package com.mftour.spring.model;

public class TDrawMoneyNotify  implements java.io.Serializable{
	private static final long serialVersionUID = -1140366651584731919L;
	
	private Long id;
    private String platformNo;    //商户编号
    private String bizType; 
    private String code;   //返回码
    private String message; //描述
    private String requestNo;
    private String platformUserNo;
    private String cardNo ;
    private String bank;
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
	public String getCardNo() {
		return cardNo;
	}
	public void setCardNo(String cardNo) {
		this.cardNo = cardNo;
	}
	public String getBank() {
		return bank;
	}
	public void setBank(String bank) {
		this.bank = bank;
	}
	
	

}
