package com.mftour.spring.rest.bean;
import com.mftour.spring.base.JsonBaseBean;

public class Reward extends JsonBaseBean {
 private int id;
 private String title;
 private String description;
 private String delivery_date;
 private int number;
 private float price;
 private float delivery_price;
 public float getDelivery_price() {
	return delivery_price;
}
public void setDelivery_price(float delivery_price) {
	this.delivery_price = delivery_price;
}
private int campaign_id;
 private boolean visible_flag;
 private String image_url;
 private boolean collect_shipping_flag;
 private boolean include_claimed;
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public String getTitle() {
	return title;
}
public void setTitle(String title) {
	this.title = title;
}
public String getDescription() {
	return description;
}
public void setDescription(String description) {
	this.description = description;
}
public String getDelivery_date() {
	return delivery_date;
}
public void setDelivery_date(String delivery_date) {
	this.delivery_date = delivery_date;
}
public int getNumber() {
	return number;
}
public void setNumber(int number) {
	this.number = number;
}
public float getPrice() {
	return price;
}
public void setPrice(float price) {
	this.price = price;
}
public int getCampaign_id() {
	return campaign_id;
}
public void setCampaign_id(int campaign_id) {
	this.campaign_id = campaign_id;
}
public boolean isVisible_flag() {
	return visible_flag;
}
public void setVisible_flag(boolean visible_flag) {
	this.visible_flag = visible_flag;
}
public String getImage_url() {
	return image_url;
}
public void setImage_url(String image_url) {
	this.image_url = image_url;
}
public boolean isCollect_shipping_flag() {
	return collect_shipping_flag;
}
public void setCollect_shipping_flag(boolean collect_shipping_flag) {
	this.collect_shipping_flag = collect_shipping_flag;
}
public boolean isInclude_claimed() {
	return include_claimed;
}
public void setInclude_claimed(boolean include_claimed) {
	this.include_claimed = include_claimed;
}
}
