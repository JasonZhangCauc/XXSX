package com.spark.bean;

public class Product{
	private int productId;
	private String productName;
	private int smallId;
	private String picture1;
	private String describle;
	private float price;
	private String picture2;
	private String picture3;
	private String productPlace;
	private String productBanner;
	private String shippingAddress;
	private String remarks;
	private int amount;
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
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
	public int getSmallId() {
		return smallId;
	}
	public void setSmallId(int smallId) {
		this.smallId = smallId;
	}
	public String getPicture1() {
		return picture1;
	}
	public void setPicture1(String picture1) {
		this.picture1 = picture1;
	}
	public String getDescrible() {
		return describle;
	}
	public void setDescrible(String describle) {
		this.describle = describle;
	}
	public float getPrice() {
		return price;
	}
	public void setPrice(float price) {
		this.price = price;
	}
	public String getPicture2() {
		return picture2;
	}
	public void setPicture2(String picture2) {
		this.picture2 = picture2;
	}
	public String getPicture3() {
		return picture3;
	}
	public void setPicture3(String picture3) {
		this.picture3 = picture3;
	}
	public String getProductPlace() {
		return productPlace;
	}
	public void setProductPlace(String productPlace) {
		this.productPlace = productPlace;
	}
	public String getProductBanner() {
		return productBanner;
	}
	public void setProductBanner(String productBanner) {
		this.productBanner = productBanner;
	}
	public String getShippingAddress() {
		return shippingAddress;
	}
	public void setShippingAddress(String shippingAddress) {
		this.shippingAddress = shippingAddress;
	}
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	@Override
	public String toString() {
		return "Product [productId=" + productId + ", productName=" + productName + ", smallId=" + smallId
				+ ", picture1=" + picture1 + ", describle=" + describle + ", price=" + price + ", picture2=" + picture2
				+ ", picture3=" + picture3 + ", productPlace=" + productPlace + ", productBanner=" + productBanner
				+ ", shippingAddress=" + shippingAddress + ", remarks=" + remarks + "]";
	}	
}
