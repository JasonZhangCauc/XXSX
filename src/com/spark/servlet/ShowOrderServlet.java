package com.spark.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.spark.bean.Order;
import com.spark.dao.OrderDao;
import com.spark.dao.UserDao;
import com.spark.service.ShowOrderService;

public class ShowOrderServlet extends HttpServlet{
	
	private  static ArrayList<Order> orderList;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		ShowOrderService service = new ShowOrderService();

		HttpSession session  = req.getSession();
		UserDao userDao = new UserDao();
		String ueserName = session.getAttribute("userInfo").toString();
		
		
		orderList = service.getOrderListByUserName(ueserName);		
		System.out.println("orderList:"+ orderList.get(0).getOrderId());
		System.out.println("size:"+orderList.size());
		req.setAttribute("orderLists", orderList);
		req.getRequestDispatcher("Order.jsp").forward(req, resp);

	}
	

}
