package com.mftour.spring.rest.bean;

import com.mftour.spring.base.JsonBaseBean;

public class Campasigns extends JsonBaseBean {
	private String name;
	private String datetype;
	private int fixed_payment_amount;

	public int getFixed_payment_amount() {
		return fixed_payment_amount;
	}

	public void setFixed_payment_amount(int fixed_payment_amount) {
		this.fixed_payment_amount = fixed_payment_amount;
	}

	private int datenum;

	public String getDatetype() {
		return datetype;
	}

	public void setDatetype(String datetype) {
		this.datetype = datetype;
	}

	public int getDatenum() {
		return datenum;
	}

	public void setDatenum(int datenum) {
		this.datenum = datenum;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
}
