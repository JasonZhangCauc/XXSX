package com.spark.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.spark.util.ConnectionFactory;

/*
 * liyang
 */
public class CartDao {
	
	//通过用户ID获取对应购物车ID
	public int getCartidByUserid(int userId) {
		
		int cartId = 0;
		PreparedStatement pStatement = null;
		Connection connection = ConnectionFactory.getConnection();
		String sql = "select Cartid from cart where Userid =? ";
		
		try {
			pStatement = connection.prepareStatement(sql);
			pStatement.setInt(1, userId);
			//执行查询
			ResultSet rs = pStatement.executeQuery();
			//取得查询结果
			if (rs.next()) {
				cartId = rs.getInt(1);
			}
		} catch (SQLException e) {
			System.err.println("通过用户ID获取对应购物车ID失败");
			e.printStackTrace();
		}
		
		return cartId;
	}
	
	//通过购物车Id获取用户ID
	public int getUseridByCartid(int cartId) {
		
		int userId = 0;
		PreparedStatement pStatement = null;
		Connection connection = ConnectionFactory.getConnection();
		String sql = "select Userid from cart where Cartid =? ";
		
		try {
			pStatement = connection.prepareStatement(sql);
			pStatement.setInt(1, cartId);
			//执行查询
			ResultSet rs = pStatement.executeQuery();
			//取得查询结果
			if (rs.next()) {
				userId = rs.getInt(1);
			}
		} catch (SQLException e) {
			System.err.println("通过购物车Id获取用户ID失败");
			e.printStackTrace();
		}
		
		return userId;
	}
	public int insertCart(int userId){
		int rs=0;
		PreparedStatement pStatement = null;
		Connection connection = ConnectionFactory.getConnection();
		String sql = "INSERT INTO cart(Userid) VALUES(?)";
		
		try {
			pStatement = connection.prepareStatement(sql);
			pStatement.setInt(1, userId);
			//执行查询
			rs = pStatement.executeUpdate();
		} catch (SQLException e) {
			System.err.println("通过购物车Id获取用户ID失败");
			e.printStackTrace();
		}
		return rs;
	}

}
