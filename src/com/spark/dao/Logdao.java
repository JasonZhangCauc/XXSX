package com.spark.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.spark.util.ConnectionFactory;

public class Logdao {
	public int getBigIdByProductId(int ProductId){
		int bigId=0;
		PreparedStatement pStatement = null;
		Connection connection = ConnectionFactory.getConnection();
		String sql = "select bigid from product where Productid =? ";
		
		try {
			pStatement = connection.prepareStatement(sql);
			pStatement.setInt(1, ProductId);
			//执行查询
			ResultSet rs = pStatement.executeQuery();
			//取得查询结果
			if (rs.next()) {
				bigId=rs.getInt(1);
			}
		} catch (SQLException e) {
			System.err.println("查询bigId失败");
			e.printStackTrace();
		}
		return bigId;
	}
	public String getBigNameByProductId(int ProductId){
		String bigName=null;
		PreparedStatement pStatement = null;
		Connection connection = ConnectionFactory.getConnection();
		String sql = "select Bigname from bigproduct where Bigid =? ";
		
		try {
			pStatement = connection.prepareStatement(sql);
			pStatement.setInt(1, getBigIdByProductId(ProductId));
			//执行查询
			ResultSet rs = pStatement.executeQuery();
			//取得查询结果
			if (rs.next()) {
				bigName=rs.getString(1);
			}
		} catch (SQLException e) {
			System.err.println("查询Bigname失败");
			e.printStackTrace();
		}
		return bigName;
	}
}
