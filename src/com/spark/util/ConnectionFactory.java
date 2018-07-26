package com.spark.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionFactory {
	
	public static Connection getConnection() {
		
		Connection connection = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://rm-bp1a713byhw75z9552o.mysql.rds.aliyuncs.com:3306/spark";
			String username = "test";
			String password = "123";
			connection = DriverManager.getConnection(url, username, password);
		} catch (ClassNotFoundException | SQLException e) {
			System.err.println("连接数据库失败");
			e.printStackTrace();
		}
		
		return connection;
		
	}
}
