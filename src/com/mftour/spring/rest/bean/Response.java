package com.mftour.spring.rest.bean;

import com.mftour.spring.base.JsonBaseBean;

public class Response extends JsonBaseBean{
	private String response = "";

	public String getResponse() {
		return response;
	}

	public void setResponse(String response) {
		this.response = response;
	}
}
