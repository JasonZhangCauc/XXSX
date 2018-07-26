package com.spark.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.spark.bean.Order;
import com.spark.bean.ProductOfOrderdetail;
import com.spark.dao.UserDao;
import com.spark.service.CreateAccountService;
import com.spark.util.NowTimeFactoty;

public class CreateAccountServlet extends HttpServlet{
	
	private static ArrayList<ProductOfOrderdetail> productList;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		String detailIdString = req.getParameter("urlString");
		if(detailIdString !=null) {
			CreateAccountService createAccountService = new CreateAccountService();
			productList = createAccountService.getProductListBydetailIdString(detailIdString);
			
			//删除原数据库中对应项目
			String[] id = createAccountService.getCartDetailIdByUrl(detailIdString);
			createAccountService.deleteCartDetailById(id);
			
			req.setAttribute("productList",productList);
			req.getRequestDispatcher("CreateAccount.jsp").forward(req, resp);
		}
		
		String action =  req.getParameter("action");
		if("submitOrder".equals(action)) {
			HttpSession session  = req.getSession();
			UserDao userDao = new UserDao();
			System.out.println("session:"+session.getAttribute("userInfo").toString());
			int userId =  userDao.getUserIdByName(session.getAttribute("userInfo").toString());
			String orderSetTime = (new NowTimeFactoty()).getNowTime();
			String reAddress = req.getParameter("address");
			String reName = req.getParameter("receiveUserName");
			String phone = req.getParameter("receiveUserMobile");
			String orderState = "待支付";
			String note = req.getParameter("note");
			
			Order order = new Order(userId, orderSetTime, reName, reAddress, phone, orderState);
			order.setNote(note);
			CreateAccountService createAccountService = new CreateAccountService();
			createAccountService.setOrder(order, productList);
		}
	}

}
