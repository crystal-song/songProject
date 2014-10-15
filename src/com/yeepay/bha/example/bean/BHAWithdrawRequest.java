package com.yeepay.bha.example.bean;

import java.math.BigDecimal;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlRootElement;


@XmlRootElement(name = "request")
@XmlAccessorType(XmlAccessType.FIELD)
public class BHAWithdrawRequest extends BHALoginRequest {

	private BHAFeeModeEnum feeMode;
	
	private BigDecimal amount;

	public BHAFeeModeEnum getFeeMode() {
		return feeMode;
	}

	public void setFeeMode(BHAFeeModeEnum feeMode) {
		this.feeMode = feeMode;
	}

	public BigDecimal getAmount() {
		return amount;
	}

	public void setAmount(BigDecimal amount) {
		this.amount = amount;
	}
}
