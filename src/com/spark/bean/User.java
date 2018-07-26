package com.spark.bean;

public class User {
	
	private int userId;
	private String userName;
	private String userPassword;
	private String email;
	
	public User(int userId , String userName,String userPassword) {
		this.userId = userId;
		this.userName = userName;
		this.userPassword = userPassword;
	}
	
	public User(int userId , String userName,String userPassword,String email) {
		this.userId = userId;
		this.userName = userName;
		this.userPassword = userPassword;
		this.email = email;
	}
	
	@Override
	public String toString() {
		return "User [id=" + userId + ", userName=" + userName + ", password=" + userPassword + ", email=" + email  + "]";
	}
	
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getUsername() {
		return userName;
	}
	public void setUsername(String username) {
		this.userName = username;
	}
	public String getUserpassword() {
		return userPassword;
	}
	public void setUserpassword(String userpassword) {
		this.userPassword = userpassword;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
}
