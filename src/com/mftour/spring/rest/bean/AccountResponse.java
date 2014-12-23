package com.mftour.spring.rest.bean;


import com.mftour.spring.base.JsonBaseBean;
import com.mftour.spring.model.Accounts;

public class AccountResponse extends JsonBaseBean {
	private Accounts account;

	public Accounts getAccount() {
		return account;
	}

	public void setAccount(Accounts account) {
		this.account = account;
	}
	
}
