package com.mftour.spring.constants.enums;

/**
 * Created with IntelliJ IDEA. User: Administrator Date: 13-11-18 Time: 上午10:04
 */
public enum CollectFeeType {

	CASH(1, "现金"), //
	BANK(2, "银行"), //
	COMPANY(3, "公司承担"), ALIPAY(4, "支付宝"), ;

	private int value;
	private String desc;

	private CollectFeeType(int value, String desc) {
		this.value = value;
		this.desc = desc;
	}

	public int getValue() {
		return this.value;
	}

	public String getDesc() {
		return this.desc;
	}

	public static CollectFeeType getEnum(int value) {
		switch (value) {
		case 1:
			return CASH;
		case 2:
			return BANK;
		case 3:
			return COMPANY;
		case 4:
			return ALIPAY;
		default:
			return null;
		}
	}
}
