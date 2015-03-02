package com.mftour.spring.rest.bean;

import com.mftour.spring.base.JsonBaseBean;

public class Campasigns extends JsonBaseBean {
	private int id;
	private String status;
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
	public String getCheckout_sidebar_content() {
		return checkout_sidebar_content;
	}

	public void setCheckout_sidebar_content(String checkout_sidebar_content) {
		this.checkout_sidebar_content = checkout_sidebar_content;
	}
	private float goal_dollars;
	private float fixed_payment_amount;
	private String name;
	private String owner_id;
	public String getOwner_id() {
		return owner_id;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public float getProgress() {
		return progress;
	}

	public void setProgress(float progress) {
		this.progress = progress;
	}

	public void setOwner_id(String owner_id) {
		this.owner_id = owner_id;
	}
	private float progress;
	private String datetype;
	private String main_content;
	private String checkout_sidebar_content;
	public String getMain_content() {
		return main_content;
	}

	public void setMain_content(String main_content) {
		this.main_content = main_content;
	}
	private int stats_number_of_contributions;
	private String main_image_file_name;

	public int getStats_number_of_contributions() {
		return stats_number_of_contributions;
	}

	public void setStats_number_of_contributions(
			int stats_number_of_contributions) {
		this.stats_number_of_contributions = stats_number_of_contributions;
	}

	public String getMain_image_file_name() {
		return main_image_file_name;
	}

	public float getGoal_dollars() {
		return goal_dollars;
	}

	public void setGoal_dollars(float goal_dollars) {
		this.goal_dollars = goal_dollars;
	}

	public float getFixed_payment_amount() {
		return fixed_payment_amount;
	}

	public void setFixed_payment_amount(float fixed_payment_amount) {
		this.fixed_payment_amount = fixed_payment_amount;
	}

	public void setMain_image_file_name(String main_image_file_name) {
		this.main_image_file_name = main_image_file_name;
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
