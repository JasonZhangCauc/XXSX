package com.spark.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.alibaba.fastjson.JSON;
import com.spark.bean.ProductOfCart;
import com.spark.dao.UserDao;
import com.spark.service.CartService;

public class CartServlet extends HttpServlet{
	
	/*
	 * liyang
	 */
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session  = req.getSession();
		UserDao userDao = new UserDao();
		
		int userId =  userDao.getUserIdByName(session.getAttribute("userInfo").toString());
		
		CartService cartService = new CartService();
		ArrayList<ProductOfCart> productOfCarts = cartService.getProductListByUserid(userId);
		String jsonStr = JSON.toJSONString(productOfCarts);
		//jsonStr:[{"num":2,"price":24.9,"productId":4,"productName":"河北春雪水蜜桃4个150g以上/个"},{"num":3,"price":68,"productId":5,"productName":"云南元江青枣2kg50g以上/个"}]

		resp.setCharacterEncoding("UTF-8");  
		resp.setContentType("application/json; charset=utf-8");
		//resoponse响应结果
		PrintWriter out = resp.getWriter();
		out.write(jsonStr);
		out.flush();
		out.close();
		
		String action = req.getParameter("action");
		if("addProductNum".equals(action)) {
			//更新数据库加一
			addProduct(req,resp);
		}else if("decProductNum".equals(action)) {
			decProduct(req,resp);
		}else if ("deleteOneProduct".equals(action)) {
			deletePreProduct(req,resp);
		}
		
	}
	
	protected void addProduct(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String trId = req.getParameter("trId");
		
		CartService cartService = new CartService();
		cartService.addNumOFTrId(trId);

	}
	
	protected void decProduct(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String trId = req.getParameter("trId");
		
		CartService cartService = new CartService();
		cartService.decNumOFTrId(trId);

	}
	
	protected void deletePreProduct(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String trId = req.getParameter("trId");
		
		CartService cartService = new CartService();
		cartService.deleteOneProductByTrId(trId);

	}
	

	
}
