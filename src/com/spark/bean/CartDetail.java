package com.spark.bean;

/*
 * liyang
 */
public class CartDetail {
	
	private int cartDetailId;
	private int cartId;
	private int productId;
	private int num;
	
	public CartDetail(int cartDetailId,int CartId,int productId,int num) {
		this.cartDetailId = cartDetailId;
		this.cartId = CartId;
		this.productId = productId;
		this.num = num;
	}
	
	public int getCartDetailId() {
		return cartDetailId;
	}
	public void setCartDetailId(int cartDetailId) {
		this.cartDetailId = cartDetailId;
	}
	public int getCartId() {
		return cartId;
	}
	public void setCartId(int cartId) {
		this.cartId = cartId;
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
