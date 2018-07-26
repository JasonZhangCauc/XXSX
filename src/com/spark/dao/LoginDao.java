package com.spark.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.spark.bean.User;
import com.spark.util.ConnectionFactory;

public class LoginDao {
	
	/*
	 * liyang
	 */
	public User selectByNameAndPwd(String userName,String passWord) {
		
		User user = null;
		PreparedStatement pStatement = null;
		Connection connection = ConnectionFactory.getConnection();
		
		String sql = "select Id,Username, Userpassword,Email from user where Username =? and Userpassword=?";

		try {
			pStatement = connection.prepareStatement(sql);
			pStatement.setString(1, userName);
			pStatement.setString(2, passWord);
			//执行查询
			ResultSet rs = pStatement.executeQuery();
			//取得查询结果
			if (rs.next()) {
				user = new User(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4));
			}
		} catch (SQLException e) {
			System.err.println("查询Username、Password失败");
			e.printStackTrace();
		}
			
		return user;
	}
}
