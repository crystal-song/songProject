package com.mftour.spring.model;

public class TProduct implements java.io.Serializable {

	private static final long serialVersionUID = -8032736954376546625L;

	
	    private Long id;
	    private String projectName;  //产品名称
	    private String enterpriseNumber;  //企业编号
	    private Integer qualityRating;   //信用等级
	    private Double yearIncome;     //年化收益率         1
	    private String repaymentTime;  //偿还日期
	    private String repaymentWay;    //还款方式          5
	    private Integer financingMoney;   //融资金额         3
	    private Integer financingPeriod; //融资周期         2
	    private Double financingProgress; //融资进度        4
	    private String projectIntroduce;  //项目介绍
	    private Double realityMoney;   //实际金额   
	    private Integer projectStatus;  //项目状态
	    private String companyProfile;    //公司介绍
	    private String enterpriseCertificate;  //企业证书
	    
	    private String guaranteeInstitution;  //担保机构
	    private String collateralOpinion;   //担保意见
	    private String guaranteeInstitutionIntroduce; //担保机构介绍
	    private String fundUse;    //资金用途
	    private String repaymentSource;  //偿还来源
	    private String guarantee;   //抵押物信息
	    private String riskControl; //风险控制
	    private String businessScope; //营业范围
	    private String stateOfOperation; //经营状况
	    private Integer recommendType;
	    private String  projectPicture;
	    private String  existType;
	    private String  releaseTime;
	    private String  targetPlatformUserNo;
	    private Integer buyType;
	    
	    
	    
	    
	   
	  
	   
	    
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
		
		
		
		public Integer getFinancingPeriod() {
			return financingPeriod;
		}
		public void setFinancingPeriod(Integer financingPeriod) {
			this.financingPeriod = financingPeriod;
		}
		public String getProjectIntroduce() {
			return projectIntroduce;
		}
		public void setProjectIntroduce(String projectIntroduce) {
			this.projectIntroduce = projectIntroduce;
		}
		public Integer getProjectStatus() {
			return projectStatus;
		}
		public void setProjectStatus(Integer projectStatus) {
			this.projectStatus = projectStatus;
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
		
		
		
		
		public Double getRealityMoney() {
			return realityMoney;
		}
		public void setRealityMoney(Double realityMoney) {
			this.realityMoney = realityMoney;
		}
		public Integer getFinancingMoney() {
			return financingMoney;
		}
		public void setFinancingMoney(Integer financingMoney) {
			this.financingMoney = financingMoney;
		}
		
		public Double getFinancingProgress() {
			return financingProgress;
		}
		public void setFinancingProgress(Double financingProgress) {
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
		public String getGuaranteeInstitution() {
			return guaranteeInstitution;
		}
		public void setGuaranteeInstitution(String guaranteeInstitution) {
			this.guaranteeInstitution = guaranteeInstitution;
		}
		
		public String getCollateralOpinion() {
			return collateralOpinion;
		}
		public void setCollateralOpinion(String collateralOpinion) {
			this.collateralOpinion = collateralOpinion;
		}
		public String getFundUse() {
			return fundUse;
		}
		public void setFundUse(String fundUse) {
			this.fundUse = fundUse;
		}
		public String getRepaymentSource() {
			return repaymentSource;
		}
		public void setRepaymentSource(String repaymentSource) {
			this.repaymentSource = repaymentSource;
		}
		public String getGuarantee() {
			return guarantee;
		}
		public void setGuarantee(String guarantee) {
			this.guarantee = guarantee;
		}
		public String getRiskControl() {
			return riskControl;
		}
		public void setRiskControl(String riskControl) {
			this.riskControl = riskControl;
		}
		public String getBusinessScope() {
			return businessScope;
		}
		public void setBusinessScope(String businessScope) {
			this.businessScope = businessScope;
		}
		public String getStateOfOperation() {
			return stateOfOperation;
		}
		public void setStateOfOperation(String stateOfOperation) {
			this.stateOfOperation = stateOfOperation;
		}
		public String getGuaranteeInstitutionIntroduce() {
			return guaranteeInstitutionIntroduce;
		}
		public void setGuaranteeInstitutionIntroduce(
				String guaranteeInstitutionIntroduce) {
			this.guaranteeInstitutionIntroduce = guaranteeInstitutionIntroduce;
		}
		public Integer getRecommendType() {
			return recommendType;
		}
		public void setRecommendType(Integer recommendType) {
			this.recommendType = recommendType;
		}
		public String getProjectPicture() {
			return projectPicture;
		}
		public void setProjectPicture(String projectPicture) {
			this.projectPicture = projectPicture;
		}
		public String getExistType() {
			return existType;
		}
		public void setExistType(String existType) {
			this.existType = existType;
		}
		public String getReleaseTime() {
			return releaseTime;
		}
		public void setReleaseTime(String releaseTime) {
			this.releaseTime = releaseTime;
		}
		public String getTargetPlatformUserNo() {
			return targetPlatformUserNo;
		}
		public void setTargetPlatformUserNo(String targetPlatformUserNo) {
			this.targetPlatformUserNo = targetPlatformUserNo;
		}
		public Integer getBuyType() {
			return buyType;
		}
		public void setBuyType(Integer buyType) {
			this.buyType = buyType;
		}

}
