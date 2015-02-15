package com.mftour.spring.rest.bean;
import com.mftour.spring.base.JsonBaseBean;

public class Payment extends JsonBaseBean{
	private int id;
	private String created_at;

	private String title;
	private float amount;
	private float user_fee_amount;
	private String province;
	private String city;
	private String code;
	private String detail;
	private String name;
	private String phone;
	private Integer reward_id;
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Integer getReward_id() {
		return reward_id;
	}
	public void setReward_id(Integer reward_id) {
		this.reward_id = reward_id;
	}

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getProvince() {
		return province;
	}
	public void setProvince(String province) {
		this.province = province;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getCreated_at() {
		return created_at;
	}
	public void setCreated_at(String created_at) {
		this.created_at = created_at;
	}
	public float getAmount() {
		return amount;
	}
	public void setAmount(float amount) {
		this.amount = amount;
	}
	public float getUser_fee_amount() {
		return user_fee_amount;
	}
	public void setUser_fee_amount(float user_fee_amount) {
		this.user_fee_amount = user_fee_amount;
	}
	
}
