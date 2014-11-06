package com.yeepay.bha.example.bean;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement(name = "request")
@XmlAccessorType(XmlAccessType.FIELD)
public class BHAEstablishmentRegistration extends BHABaseRequest{
	
	private String platformUserNo; //平台用户编号
	private String enterpriseName; //企业名称
	private String bankLicense;   //开户银行许可证
	private String orgNo;          //组织机构代码
	private String businessLicense;//营业执照编号
	private String taxNo;          //税务登记号
	private String legal;         //法人姓名
	private String legalIdNo;      //法人身份证号 
	private String contact;       //企业联系人  
	private String contactPhone;   //联系人手机号
	private String email;          //联系人邮箱
	private String memberClassType;//会员类型
	public String getPlatformUserNo() {
		return platformUserNo;
	}
	public void setPlatformUserNo(String platformUserNo) {
		this.platformUserNo = platformUserNo;
	}
	public String getEnterpriseName() {
		return enterpriseName;
	}
	public void setEnterpriseName(String enterpriseName) {
		this.enterpriseName = enterpriseName;
	}
	public String getBankLicense() {
		return bankLicense;
	}
	public void setBankLicense(String bankLicense) {
		this.bankLicense = bankLicense;
	}
	public String getOrgNo() {
		return orgNo;
	}
	public void setOrgNo(String orgNo) {
		this.orgNo = orgNo;
	}
	public String getBusinessLicense() {
		return businessLicense;
	}
	public void setBusinessLicense(String businessLicense) {
		this.businessLicense = businessLicense;
	}
	public String getTaxNo() {
		return taxNo;
	}
	public void setTaxNo(String taxNo) {
		this.taxNo = taxNo;
	}
	public String getLegal() {
		return legal;
	}
	public void setLegal(String legal) {
		this.legal = legal;
	}
	public String getLegalIdNo() {
		return legalIdNo;
	}
	public void setLegalIdNo(String legalIdNo) {
		this.legalIdNo = legalIdNo;
	}
	public String getContact() {
		return contact;
	}
	public void setContact(String contact) {
		this.contact = contact;
	}
	public String getContactPhone() {
		return contactPhone;
	}
	public void setContactPhone(String contactPhone) {
		this.contactPhone = contactPhone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getMemberClassType() {
		return memberClassType;
	}
	public void setMemberClassType(String memberClassType) {
		this.memberClassType = memberClassType;
	}
	

}
