package com.mftour.spring.rest.bean;

import com.mftour.spring.base.JsonBaseBean;

public class Campasigns extends JsonBaseBean {
	private int id;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
	private float goal_dollars;
	private float fixed_payment_amount;
	private String name;
	private String datetype;
	private String main_content;
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
