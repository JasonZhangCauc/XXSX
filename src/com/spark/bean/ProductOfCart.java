package com.spark.bean;

/*
 * liyang
 */
public class ProductOfCart {
	
	private int cartDetailId;
	private int productId;
	private String url;
	private String productName;
	private float price;
	private int num;
	
	public int getProductId() {
		return productId;
	}
	public void setProductId(int productId) {
		this.productId = productId;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
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
	
	public ProductOfCart(int cartDetailId,int productId, String url, String productName, float price, int num) {
		this.cartDetailId = cartDetailId;
		this.productId = productId;
		this.url = url;
		this.productName = productName;
		this.price = price;
		this.num = num;
	}
	public int getCartDetailId() {
		return cartDetailId;
	}
	public void setCartDetailId(int cartDetailId) {
		this.cartDetailId = cartDetailId;
	}

	
	
}
