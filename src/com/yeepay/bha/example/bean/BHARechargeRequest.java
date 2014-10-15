package com.yeepay.bha.example.bean;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlRootElement;


@XmlRootElement(name = "request")
@XmlAccessorType(XmlAccessType.FIELD)
public class BHARechargeRequest extends BHALoginRequest {

	/**
	 * 充值金额
	 */
	private String amount;

	/**
	 * 收费方式
	 */
	private String feeMode;

	public String getAmount() {
		return amount;
	}

	public void setAmount(String amount) {
		this.amount = amount;
	}

	public String getFeeMode() {
		return feeMode;
	}

	public void setFeeMode(String feeMode) {
		this.feeMode = feeMode;
	}

}
