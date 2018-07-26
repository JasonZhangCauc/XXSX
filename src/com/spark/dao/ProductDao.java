package com.spark.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.spark.bean.Product;
import com.spark.util.ConnectionFactory;

public class ProductDao {

	
	/*
	 * liyang
	 */
	public float getPriceByProductid(int productId) {
		
		float price = 0;
		PreparedStatement pStatement = null;
		Connection connection = ConnectionFactory.getConnection();
		String sql = "select Price from product where Productid =? ";
		
		try {
			pStatement = connection.prepareStatement(sql);
			pStatement.setInt(1,productId);
			//执行查询
			ResultSet rs = pStatement.executeQuery();
			//取得查询结果
			if (rs.next()) {
				price = rs.getFloat(1);
			}
		} catch (SQLException e) {
			System.err.println("通过商品ID获取单价失败");
			e.printStackTrace();
		}
		return price;
	}
	
	/*
	 * liyang
	 */
	public String getProductNameByProductid(int productId) {
		
		String productName = "";
		PreparedStatement pStatement = null;
		Connection connection = ConnectionFactory.getConnection();
		String sql = "select Productname from product where Productid =? ";
		
		try {
			pStatement = connection.prepareStatement(sql);
			pStatement.setInt(1,productId);
			//执行查询
			ResultSet rs = pStatement.executeQuery();
			//取得查询结果
			if (rs.next()) {
				productName = rs.getString(1);
			}
		} catch (SQLException e) {
			System.err.println("通过商品ID获取对应商品名失败");
			e.printStackTrace();
		}
		return productName;
		
	}
	
	/*
	 * liyang
	 */
	public String getPic1UrlByProductid(int productId) {
		
		String picUrl = "";
		PreparedStatement pStatement = null;
		Connection connection = ConnectionFactory.getConnection();
		String sql = "select Picture1 from product where Productid =? ";
		
		try {
			pStatement = connection.prepareStatement(sql);
			pStatement.setInt(1,productId);
			//执行查询
			ResultSet rs = pStatement.executeQuery();
			//取得查询结果
			if (rs.next()) {
				picUrl = rs.getString(1);
			}
		} catch (SQLException e) {
			System.err.println("通过商品ID获取对应商品第一个图片名失败");
			e.printStackTrace();
		}
		return picUrl;
		
	}
		//通过商品的id获得商品
		public Product getProductByProductId(int productId){
			//Product product=new Product();
			Product product=new Product();
			PreparedStatement pStatement = null;
			Connection connection = ConnectionFactory.getConnection();
			//String sql="select Productname,Smallid,Describe,Price";
			String sql = "select Productid, Productname, Smallid, Productdescribe, Price, Picture1, Picture2, Picture3, Productplace, Productbanner, Shippingaddress, Remarks, Amount from product where Productid=? ";
			try {
				pStatement = connection.prepareStatement(sql);
				pStatement.setInt(1,productId);
				//执行查询
				ResultSet rs = pStatement.executeQuery();
				//取得查询结果
				if (rs.next()) {
					product.setProductId(rs.getInt(1));
					product.setProductName(rs.getString(2));
					product.setSmallId(rs.getInt(3));
					product.setDescrible(rs.getString(4));
					product.setPrice(rs.getFloat(5));
					product.setPicture1(rs.getString(6));
					product.setPicture2(rs.getString(7));
					product.setPicture3(rs.getString(8));
					product.setProductPlace(rs.getString(9));
					product.setProductBanner(rs.getString(10));
					product.setShippingAddress(rs.getString(11));
					product.setRemarks(rs.getString(12));
					product.setAmount(rs.getInt(13));
				}
			} catch (SQLException e) {
				System.err.println("获得相关商品失败");
				e.printStackTrace();
			}
			return product;
		}
}
