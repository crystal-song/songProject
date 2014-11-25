package com.mftour.spring.constants.enums;

/**
 * Created with IntelliJ IDEA. User: Administrator Date: 13-11-22 Time: 上午10:56
 */
public enum AuthorityEnum {

	// 这里必须是2的次幂，便于权限管理
	SYSTEM_ADMIN(1, "系统管理员"), CUSTOM_SERVICE(2, "客服"), //
	TRAVEL_ADJUSTER(4, "计调"), //
	FINANCIAL_OFFICER(8, "财务人员"), //
	ADJUSTER_ADMIN(16, "计调主管"), //
	BUSINESS_DEVELOPER(32, "渠道专员"), //
	CASHIER(64, "出纳"), //
	;

	private int value;
	private String desc;

	private AuthorityEnum(int value, String desc) {
		this.value = value;
		this.desc = desc;
	}

	public int getValue() {
		return this.value;
	}

	public String getDesc() {
		return this.desc;
	}

	public static AuthorityEnum getEnum(int value) {
		switch (value) {
		case 1:
			return SYSTEM_ADMIN;
		case 2:
			return CUSTOM_SERVICE;
		case 4:
			return TRAVEL_ADJUSTER;
		case 8:
			return FINANCIAL_OFFICER;
		case 16:
			return ADJUSTER_ADMIN;
		case 32:
			return BUSINESS_DEVELOPER;
		case 64:
			return CASHIER;
		default:
			return null;
		}
	}
}
