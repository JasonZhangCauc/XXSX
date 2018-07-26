package com.spark.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.spark.util.ConnectionFactory;

public class UserDao {
	
	/*
	 * liyang
	 */
	public String getUserNameById(int id) {
		
		String userName = "";
		PreparedStatement pStatement = null;
		Connection connection = ConnectionFactory.getConnection();
		String sql = "select Username from user where Id =? ";
		
		try {
			pStatement = connection.prepareStatement(sql);
			pStatement.setInt(1, id);
			//执行查询
			ResultSet rs = pStatement.executeQuery();
			//取得查询结果
			if (rs.next()) {
				userName = rs.getString(1);
			}
		} catch (SQLException e) {
			System.err.println("查询Id失败");
			e.printStackTrace();
		}
		
		return userName;
	}
	
	/*
	 * liyang
	 */
	public int getUserIdByName(String userName) {
		
		int id = 0;
		PreparedStatement pStatement = null;
		Connection connection = ConnectionFactory.getConnection();
		String sql = "select Id from user where Username =? ";
		
		try {
			pStatement = connection.prepareStatement(sql);
			pStatement.setString(1, userName);
			//执行查询
			ResultSet rs = pStatement.executeQuery();
			//取得查询结果
			if (rs.next()) {
				id = rs.getInt(1);
			}
		} catch (SQLException e) {
			System.err.println("查询userName失败");
			e.printStackTrace();
		}
		
		return id;
	}
	

}
