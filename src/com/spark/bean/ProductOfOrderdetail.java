package com.spark.bean;

public class ProductOfOrderdetail {
	
	private int cartDetailId;
	private int productId;
	private String productName;
	private float price;
	private int num;
	
	public int getProductId() {
		return productId;
	}
	public void setProductId(int productId) {
		this.productId = productId;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public float getPrice() {
		return price;
	}
	public void setPrice(float price) {
		this.price = price;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getCartDetailId() {
		return cartDetailId;
	}
	public void setCartDetailId(int cartDetailId) {
		this.cartDetailId = cartDetailId;
	}
	
	public ProductOfOrderdetail(int cartDetailId,int productId, String productName, float price, int num) {
		this.setCartDetailId(cartDetailId);
		this.productId = productId;
		this.productName = productName;
		this.price = price;
		this.num = num;
	}
}
