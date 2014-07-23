package com.mftour.spring.model;

public class TProduct implements java.io.Serializable{

	
	private static final long serialVersionUID = -8032736954376546625L;
	
	    private Long id;
	    private String projectName;  //产品名称
	    private String enterpriseNumber;  //企业编号
	    private Integer qualityRating;   //信用等级
	    private Double yearIncome;     //年化收益率
	    private String repaymentTime;  //偿还日期
	    private String repaymentWay;    //还款方式
	    private String financingMoney;   //融资金额    
	    private String financingProgress; //融资进度
	    private String companyProfile;    //公司介绍
	    private String enterpriseCertificate;  //企业证书
	    
	    
	    
		public Long getId() {
			return id;
		}
		public void setId(Long id) {
			this.id = id;
		}
		public String getProjectName() {
			return projectName;
		}
		public void setProjectName(String projectName) {
			this.projectName = projectName;
		}
		public String getEnterpriseNumber() {
			return enterpriseNumber;
		}
		public void setEnterpriseNumber(String enterpriseNumber) {
			this.enterpriseNumber = enterpriseNumber;
		}
		
		
		public Integer getQualityRating() {
			return qualityRating;
		}
		public void setQualityRating(Integer qualityRating) {
			this.qualityRating = qualityRating;
		}
		public Double getYearIncome() {
			return yearIncome;
		}
		public void setYearIncome(Double yearIncome) {
			this.yearIncome = yearIncome;
		}
		public String getRepaymentTime() {
			return repaymentTime;
		}
		public void setRepaymentTime(String repaymentTime) {
			this.repaymentTime = repaymentTime;
		}
		public String getRepaymentWay() {
			return repaymentWay;
		}
		public void setRepaymentWay(String repaymentWay) {
			this.repaymentWay = repaymentWay;
		}
		public String getFinancingMoney() {
			return financingMoney;
		}
		public void setFinancingMoney(String financingMoney) {
			this.financingMoney = financingMoney;
		}
		public String getFinancingProgress() {
			return financingProgress;
		}
		public void setFinancingProgress(String financingProgress) {
			this.financingProgress = financingProgress;
		}
		public String getCompanyProfile() {
			return companyProfile;
		}
		public void setCompanyProfile(String companyProfile) {
			this.companyProfile = companyProfile;
		}
		public String getEnterpriseCertificate() {
			return enterpriseCertificate;
		}
		public void setEnterpriseCertificate(String enterpriseCertificate) {
			this.enterpriseCertificate = enterpriseCertificate;
		}
	    
	    
	    
	   
}
