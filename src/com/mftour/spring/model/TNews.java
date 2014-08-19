package com.mftour.spring.model;

public class TNews  implements java.io.Serializable {
	
	private static final long serialVersionUID = -8032736954366846625L;
	
	 private Long id;
	 private String title;  
	 private String depicts;
	 private String state;
	 private String channel;
	 private String time;
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDepicts() {
		return depicts;
	}
	public void setDepicts(String depicts) {
		this.depicts = depicts;
	}
	
	
	
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getChannel() {
		return channel;
	}
	public void setChannel(String channel) {
		this.channel = channel;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	
	 
 
	 
}
