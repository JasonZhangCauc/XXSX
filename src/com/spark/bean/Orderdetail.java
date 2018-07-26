package com.spark.bean;

public class Orderdetail {
	
	private int orderDetailId;
	private int orderId;
	private int productId;
	private int num;
	
	public Orderdetail(int orderDetailId, int orderId, int productId, int num) {
		this.orderDetailId = orderDetailId;
		this.orderId = orderId;
		this.productId = productId;
		this.num = num;
	}
	
	public Orderdetail( int orderId, int productId, int num) {
		this.orderId = orderId;
		this.productId = productId;
		this.num = num;
	}
	
	public int getOrderDetailId() {
		return orderDetailId;
	}
	public void setOrderDetailId(int orderDetailId) {
		this.orderDetailId = orderDetailId;
	}
	public int getOrderId() {
		return orderId;
	}
	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}
	public int getProductId() {
		return productId;
	}
	public void setProductId(int productId) {
		this.productId = productId;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	
	
}
