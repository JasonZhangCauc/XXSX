package com.spark.service;

import java.util.ArrayList;

import com.spark.bean.Order;
import com.spark.bean.Orderdetail;
import com.spark.bean.ProductOfOrderdetail;
import com.spark.dao.CartDetailDao;
import com.spark.dao.OrderDao;
import com.spark.dao.OrderDetailDao;

public class CreateAccountService {
	
	/*
	 * liyang
	 * trid:1trid:2
	 */
	public ArrayList<ProductOfOrderdetail> getProductListBydetailIdString(String urlString){
		
		ArrayList<ProductOfOrderdetail> productList = new ArrayList<>();
		CartDetailDao cartDetailDao = new CartDetailDao();

		String[] id = urlString.split("trid:");
		for (int i = 1; i < id.length; i++) {
			productList.add(cartDetailDao.getOrderdetailByCartDetailId(Integer.parseInt(id[i])));
		}
		
		return productList;
		
	}
	
	public String[] getCartDetailIdByUrl(String url) {
		CartDetailDao cartDetailDao = new CartDetailDao();

		String[] id = url.split("trid:");
		return id;
	}
	
	public void deleteCartDetailById(String[] id) {
		CartDetailDao cartDetailDao = new CartDetailDao();
		for(int i=1;i<id.length;i++) {
			cartDetailDao.deleteDetailByCartDetailId(Integer.parseInt(id[i]));
		}
	}
	
	public void setOrder(Order order,ArrayList<ProductOfOrderdetail> productList) {
		
		OrderDao orderDao = new OrderDao();
		OrderDetailDao orderDetailDao = new OrderDetailDao();
		
		orderDao.setOrder(order);
		int orderId = orderDao.getOrderId(order);
		for(ProductOfOrderdetail product : productList) {
			Orderdetail orderdetail = new Orderdetail(orderId, product.getProductId(), product.getNum());
			orderDetailDao.setOrderDetail(orderdetail);
		}
	}
}
