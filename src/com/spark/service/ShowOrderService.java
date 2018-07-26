package com.spark.service;


import java.util.ArrayList;

import com.spark.bean.Order;
import com.spark.bean.Orderdetail;
import com.spark.dao.OrderDao;
import com.spark.dao.OrderDetailDao;
import com.spark.dao.ProductDao;
import com.spark.dao.UserDao;

public class ShowOrderService {
	public float getPriceByOrderid(int orderid) {
		float totalprice=0;
		ArrayList<Orderdetail> orderdetailList = new ArrayList<>();
		OrderDetailDao orderDetailDao = new OrderDetailDao();
		ProductDao productDao = new ProductDao();
		orderdetailList = orderDetailDao.getOrderDetailByOrderid(orderid);
		
		for(Orderdetail orderdetail:orderdetailList) {
			int productid = orderdetail.getProductId();
			int num = orderdetail.getNum();
			float price = productDao.getPriceByProductid(productid);
			totalprice = totalprice+num*price;
		
		}
		//totalprice.setMaximumFractionDigits(2);
		//return totalprice.format(2);
		return (float)(Math.round(totalprice*100))/100;
	}
	
	public String getOrdersettimeByOrderid(int orderid) {
		String time = "";
		OrderDao orderDao = new OrderDao();
		time = orderDao.getOrdersettimeByOrderid(orderid);
		return time;
	}
	
	public String getOrderstateByOrderid(int orderid) {
		String state = "";
		OrderDao orderDao = new OrderDao();
		state = orderDao.getOrderstateByOrderid(orderid);
		return state;
	}
	
	public int getNumByOrderid(int orderid) {
		int num = 0;
		ArrayList<Orderdetail> orderdetailList = new ArrayList<>();
		OrderDetailDao orderDetailDao = new OrderDetailDao();
		orderdetailList = orderDetailDao.getOrderDetailByOrderid(orderid);	
		for(Orderdetail orderdetail:orderdetailList) {
			 num = num+orderdetail.getNum();
		}
		return num;
	}
	
	public ArrayList<String> getPicListByOrderid(int orderid){
		OrderDetailDao orderDetailDao = new OrderDetailDao();
		ArrayList<String> picList = new ArrayList<>();
		ArrayList<Orderdetail> orderdetailList = new ArrayList<>();
		orderdetailList = orderDetailDao.getOrderDetailByOrderid(orderid);
		ProductDao productDao =new ProductDao();
		for(Orderdetail orderdetail:orderdetailList) {
			int productid = orderdetail.getProductId();
			String url = productDao.getPic1UrlByProductid(productid);
			picList.add(url);
		}
		
		
		return picList;
	}
	
	public ArrayList<Order> getOrderListByUserName(String userName){
		
		ArrayList<Order> orderList = new ArrayList<>();
		ArrayList<Integer> orderIdList = new ArrayList<>();
		
		UserDao userDao = new UserDao();
		OrderDao orderDao = new OrderDao();
		
		int userId = userDao.getUserIdByName(userName);
		orderIdList = orderDao.getOrderidByUserid(userId);
		
		for(Integer orderId:orderIdList) {
			Order order = new Order();
			order.setOrderSetTime(orderDao.getOrdersettimeByOrderid(orderId));
			order.setOrderState(orderDao.getOrderstateByOrderid(orderId));
		    order.setOrderId(orderId);
			orderList.add(order);
		}
		
		return orderList;
		
	}
}

















