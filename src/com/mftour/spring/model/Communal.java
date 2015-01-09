package com.mftour.spring.model;

public class Communal {
	private Integer id;
	private String keyss;
	private String valuess;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getKeyss() {
		return keyss;
	}
	public void setKeyss(String keyss) {
		this.keyss = keyss;
	}
	public String getValuess() {
		return valuess;
	}
	public void setValuess(String valuess) {
		this.valuess = valuess;
	}
	public Communal() {
		super();
	}
	public Communal(String keyss, String valuess) {
		super();
		this.keyss = keyss;
		this.valuess = valuess;
	}
	
}
