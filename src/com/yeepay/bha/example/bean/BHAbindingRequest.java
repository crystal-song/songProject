package com.yeepay.bha.example.bean;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlRootElement;


@XmlRootElement(name = "request")
@XmlAccessorType(XmlAccessType.FIELD)
public class BHAbindingRequest  extends BHABaseRequest {

	/**
	 * 外部用户标识
	 */
	private String platformUserNo;

	public String getPlatformUserNo() {
		return platformUserNo;
	}

	public void setPlatformUserNo(String platformUserNo) {
		this.platformUserNo = platformUserNo;
	}
	
	
}
