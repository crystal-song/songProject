package com.mftour.spring.model;

public class TLoansucceed implements java.io.Serializable{
	private static final long serialVersionUID = -8032736664666548825L;
	 private Long id;
	    private String platformNo;    //商户编号
	    private String bizType;  //业务名称
	    private String code ;     //返回码
	    private String message;   //描述
	    private String requestNo; //请求流水号
	    private String orderNo; //标的号
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
		public String getOrderNo() {
			return orderNo;
		}
		public void setOrderNo(String orderNo) {
			this.orderNo = orderNo;
		}
	    
	  
}
