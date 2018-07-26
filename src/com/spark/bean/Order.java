package com.spark.bean;

public class Order {
	
	private int orderId;
	private int userId;
	private String orderSetTime;
	private String reName;
	private String reAddress;
	private String phone;
	private String orderState;
	private String Note;
	
	public Order(int orderId,int userId, String orderSetTime,String reName, String reAddress, String phone, String orderState) {
		this.orderId = orderId;
		this.userId = userId;
		this.orderSetTime = orderSetTime;
		this.setReName(reName);
		this.reAddress = reAddress;
		this.phone = phone;
		this.orderState = orderState;
		this.Note = " ";
	}
	
	public Order(int userId, String orderSetTime, String reName,String reAddress, String phone, String orderState) {
		this.userId = userId;
		this.orderSetTime = orderSetTime;
		this.setReName(reName);
		this.reAddress = reAddress;
		this.phone = phone;
		this.orderState = orderState;
		this.Note = " ";
	}
	
	public Order() {
		// TODO Auto-generated constructor stub
	}
	
	public int getOrderId() {
		return orderId;
	}
	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getOrderSetTime() {
		return orderSetTime;
	}
	public void setOrderSetTime(String orderSetTime) {
		this.orderSetTime = orderSetTime;
	}
	public String getReAddress() {
		return reAddress;
	}
	public void setReAddress(String reAddress) {
		this.reAddress = reAddress;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getOrderState() {
		return orderState;
	}
	public void setOrderState(String orderState) {
		this.orderState = orderState;
	}
	public String getNote() {
		return Note;
	}
	public void setNote(String note) {
		Note = note;
	}

	public String getReName() {
		return reName;
	}

	public void setReName(String reName) {
		this.reName = reName;
	}
	
	
}
