package com.spark.bean;

public class Comment {
	private int commentId;
	private int userId;
	private int productId;
	private String Commentdetail;
	private int point;
	public int getCommentId() {
		return commentId;
	}
	public void setCommentId(int commentId) {
		this.commentId = commentId;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public int getProductId() {
		return productId;
	}
	public void setProductId(int productId) {
		this.productId = productId;
	}
	public String getCommentdetail() {
		return Commentdetail;
	}
	public void setCommentdetail(String commentdetail) {
		Commentdetail = commentdetail;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	@Override
	public String toString() {
		return "Comment [commentId=" + commentId + ", userId=" + userId + ", productId=" + productId
				+ ", Commentdetail=" + Commentdetail + ", point=" + point + "]";
	}
	
}
