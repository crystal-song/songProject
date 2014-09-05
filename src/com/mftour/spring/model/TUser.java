package com.mftour.spring.model;

import com.mftour.spring.constants.enums.AuthorityEnum;
import com.mftour.spring.util.CustomDateSerializer;
import org.codehaus.jackson.map.annotate.JsonSerialize;

import java.util.Date;

/**
 * TUser entity. @author MyEclipse Persistence Tools
 */

public class TUser implements java.io.Serializable {

    // Fields
    private static final long serialVersionUID = -8032736954376548825L;
    private Long id;
    private String name;    //用户名
    private String password;  //密码
    private String email;     //邮箱
    private String realName;   //真实姓名
    private String identityCard; //身份证号码
    private String phone;       //手机号码
    private String sex;          //性别
    private String dateOfBirth;   //出生日期
    private String educationBackground;  //学历
    private String schoolOfGraduation;   //毕业院校
    private String maritalStatus;   //婚姻状态
    private String address;          //地址
    private String companyIndustry;   //公司行业
    private String companyScale;     //公司规模
    private String position;       //职位
    private String income;        //收入
    
    
    
   
    

   

    // Constructors

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

    
	
	

   
}