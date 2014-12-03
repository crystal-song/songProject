package com.mftour.spring.model;

import java.util.Date;

public class TInvestmentInfo implements java.io.Serializable {

	    private Long id;
	    private String enterpriseNumber;   //项目编号
	    private String investor;           //投资者
	    private String identityCard;       //身份证号码   
	    private Double investmentAmount;   //投资金额
	    private String administratorName;  //添加人       
	    private String writeTime;          //添加时间
	    private String state;
	    private String requestNo;
	    private String code;
		public Long getId() {
			return id;
		}
		public void setId(Long id) {
			this.id = id;
		}
		public String getEnterpriseNumber() {
			return enterpriseNumber;
		}
		public void setEnterpriseNumber(String enterpriseNumber) {
			this.enterpriseNumber = enterpriseNumber;
		}
		public String getInvestor() {
			return investor;
		}
		public void setInvestor(String investor) {
			this.investor = investor;
		}
		public String getIdentityCard() {
			return identityCard;
		}
		public void setIdentityCard(String identityCard) {
			this.identityCard = identityCard;
		}
		
		public Double getInvestmentAmount() {
			return investmentAmount;
		}
		public void setInvestmentAmount(Double investmentAmount) {
			this.investmentAmount = investmentAmount;
		}
		public String getAdministratorName() {
			return administratorName;
		}
		public void setAdministratorName(String administratorName) {
			this.administratorName = administratorName;
		}
		public String getWriteTime() {
			return writeTime;
		}
		public void setWriteTime(String writeTime) {
			this.writeTime = writeTime;
		}
		public String getState() {
			return state;
		}
		public void setState(String state) {
			this.state = state;
		}
		
		public String getRequestNo() {
			return requestNo;
		}
		public void setRequestNo(String requestNo) {
			this.requestNo = requestNo;
		}
		public String getCode() {
			return code;
		}
		public void setCode(String code) {
			this.code = code;
		}
		
		
	    
	    
	    

}
