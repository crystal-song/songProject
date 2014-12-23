package com.mftour.spring.model;


import java.sql.Timestamp;


/**
 * TUser entity. @author MyEclipse Persistence Tools
 */

public class TUser implements java.io.Serializable {

	// Fields
	private static final long serialVersionUID = -8032736954376548825L;
	private Long id;
	private String name; // 用户名
	private String password; // 密码
	private String email; // 邮箱
	private String realName; // 真实姓名
	private String identityCard; // 身份证号码
	private String phone; // 手机号码
	private String sex; // 性别
	private String dateOfBirth; // 出生日期
	private String educationBackground; // 学历
	private String schoolOfGraduation; // 毕业院校
	private String maritalStatus; // 婚姻状态
	private String address; // 地址
	private String companyIndustry; // 公司行业
	private String companyScale; // 公司规模
	private String position; // 职位
	private String income; // 收入
	private String regState; // 注册状态 f(失败)，s(成功)
	private String identityCardPic1; // 身份证正面图片
	private String identityCardPic2; // 身份证反面图片
	private String captcha; // 手机验证码
	private String sendTime; // 发送时间
	private Integer messageCount; // 发送短信的次数
	private String answer; // 密码保护答案
	private Timestamp regTime;
	private String randomCode;
	private String ref;

	public String getRef() {
		return ref;
	}

	public void setRef(String ref) {
		this.ref = ref;
	}

	/**
	 * default constructor
	 */
	public TUser() {
	}

	// Property accessors

	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getRealName() {
		return realName;
	}

	public void setRealName(String realName) {
		this.realName = realName;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getDateOfBirth() {
		return dateOfBirth;
	}

	public void setDateOfBirth(String dateOfBirth) {
		this.dateOfBirth = dateOfBirth;
	}

	public String getEducationBackground() {
		return educationBackground;
	}

	public void setEducationBackground(String educationBackground) {
		this.educationBackground = educationBackground;
	}

	public String getSchoolOfGraduation() {
		return schoolOfGraduation;
	}

	public void setSchoolOfGraduation(String schoolOfGraduation) {
		this.schoolOfGraduation = schoolOfGraduation;
	}

	public String getMaritalStatus() {
		return maritalStatus;
	}

	public void setMaritalStatus(String maritalStatus) {
		this.maritalStatus = maritalStatus;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getCompanyIndustry() {
		return companyIndustry;
	}

	public void setCompanyIndustry(String companyIndustry) {
		this.companyIndustry = companyIndustry;
	}

	public String getCompanyScale() {
		return companyScale;
	}

	public void setCompanyScale(String companyScale) {
		this.companyScale = companyScale;
	}

	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	public String getIncome() {
		return income;
	}

	public void setIncome(String income) {
		this.income = income;
	}

	public String getIdentityCard() {
		return identityCard;
	}

	public void setIdentityCard(String identityCard) {
		this.identityCard = identityCard;
	}

	public String getRegState() {
		return regState;
	}

	public void setRegState(String regState) {
		this.regState = regState;
	}

	public String getIdentityCardPic1() {
		return identityCardPic1;
	}

	public void setIdentityCardPic1(String identityCardPic1) {
		this.identityCardPic1 = identityCardPic1;
	}

	public String getIdentityCardPic2() {
		return identityCardPic2;
	}

	public void setIdentityCardPic2(String identityCardPic2) {
		this.identityCardPic2 = identityCardPic2;
	}

	public String getCaptcha() {
		return captcha;
	}

	public void setCaptcha(String captcha) {
		this.captcha = captcha;
	}

	public String getSendTime() {
		return sendTime;
	}

	public void setSendTime(String sendTime) {
		this.sendTime = sendTime;
	}

	public Integer getMessageCount() {
		return messageCount;
	}

	public void setMessageCount(Integer messageCount) {
		this.messageCount = messageCount;
	}

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}
	public Timestamp getRegTime() {
		return regTime;
	}

	public void setRegTime(Timestamp regTime) {
		this.regTime = regTime;
	}

	public String getRandomCode() {
		return randomCode;
	}

	public void setRandomCode(String randomCode) {
		this.randomCode = randomCode;
	}


}