package com.mftour.spring.model;

import java.math.BigDecimal;
import java.sql.Timestamp;

public class Rewards {
	private String userId;
	private BigDecimal amount;
	private Boolean used;
	private Timestamp expireTime;
	private Timestamp giveTime;
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
	public Boolean getUsed() {
		return used;
	}
	public void setUsed(Boolean used) {
		this.used = used;
	}
	public Timestamp getExpireTime() {
		return expireTime;
	}
	public void setExpireTime(Timestamp expireTime) {
		this.expireTime = expireTime;
	}
	public Timestamp getGiveTime() {
		return giveTime;
	}
	public void setGiveTime(Timestamp giveTime) {
		this.giveTime = giveTime;
	}
	
}
