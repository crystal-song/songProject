package com.mftour.spring.model;

public class TChannel implements java.io.Serializable {

	private static final long serialVersionUID = -8032736954676846625L;

	private Long id;
	private String name;
	private String time;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

}
