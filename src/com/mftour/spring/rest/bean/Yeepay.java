package com.mftour.spring.rest.bean;
import com.mftour.spring.base.JsonBaseBean;


public class Yeepay extends JsonBaseBean {
	private float amount;
	private float reward;
	public float getAmount() {
		return amount;
	}
	public void setAmount(float amount) {
		this.amount = amount;
	}
	public float getReward() {
		return reward;
	}
	public void setReward(float reward) {
		this.reward = reward;
	}

}
