package com.mftour.spring.model;

import java.math.BigDecimal;
import java.sql.Timestamp;

public class ProductRepays {
	private Integer id;
	private Integer period;
	private String userId;
	private BigDecimal amount ;
	private BigDecimal interest;
	private Boolean repayed;
	private Timestamp endTime;
	private Timestamp repayTime;
	private String enterpriseNumber;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getPeriod() {
		return period;
	}
	public void setPeriod(Integer period) {
		this.period = period;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public BigDecimal getAmount() {
		return amount;
	}
	public void setAmount(BigDecimal amount) {
		this.amount = amount;
	}
	public BigDecimal getInterest() {
		return interest;
	}
	public void setInterest(BigDecimal interest) {
		this.interest = interest;
	}
	public Boolean getRepayed() {
		return repayed;
	}
	public void setRepayed(Boolean repayed) {
		this.repayed = repayed;
	}
	public Timestamp getEndTime() {
		return endTime;
	}
	public void setEndTime(Timestamp endTime) {
		this.endTime = endTime;
	}
	public Timestamp getRepayTime() {
		return repayTime;
	}
	public void setRepayTime(Timestamp repayTime) {
		this.repayTime = repayTime;
	}
	public String getEnterpriseNumber() {
		return enterpriseNumber;
	}
	public void setEnterpriseNumber(String enterpriseNumber) {
		this.enterpriseNumber = enterpriseNumber;
	}


}
