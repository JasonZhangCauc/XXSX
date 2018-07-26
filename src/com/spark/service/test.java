package com.spark.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.spark.util.ConnectionFactory;

public class test {
	public static void main(String[] args) {
		
		int orderId = 0;
		
		PreparedStatement preparedStatement = null;
		Connection connection = ConnectionFactory.getConnection();
		
		String sql = "SELECT Orderid FROM orderall WHERE Userid=? AND Ordersettime=? AND Receivename=? AND Readdress=?";
		
		try {
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setInt(1, 1);
			preparedStatement.setString(2, "2018-07-16 10:57:48");
			preparedStatement.setString(3, "456");
			preparedStatement.setString(4, "北京市/北京市/东城区 546");
			
			ResultSet resultSet = preparedStatement.executeQuery();
			
			System.out.println("sql:"+sql);
			while (orderId==0) {
				if(resultSet.next()) {
					orderId = resultSet.getInt(1);
					System.out.println("orderid:"+orderId);
				}
			}
			
		} catch (SQLException e) {
			System.err.println("获取订单Id失败");
			e.printStackTrace();
		}
		
		System.out.println("id:"+orderId);
	}
}
