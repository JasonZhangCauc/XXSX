package com.spark.servlet;

import java.io.IOException;
import java.net.URLEncoder;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.spark.bean.CAPTCHA;
import com.spark.service.LoginService;
import com.spark.util.CAPTCHAFactory;

/*
 * liyang
 */
public class LoginServlet extends HttpServlet{
	
	
protected int captcha_num[] = new int[4];
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("是否需要验证码传来的：" + req.getParameter("needVerifyCode"));
		String needVerifyCode = "true";
		if(req.getParameter("needVerifyCode")!=null) {
			needVerifyCode = req.getParameter("needVerifyCode");
		}
		
		if(needVerifyCode.equals("false")) {
			req.getRequestDispatcher("index.jsp").forward(req, resp);
		}else {
			CAPTCHAFactory cFactory = new CAPTCHAFactory();
			CAPTCHA ca = cFactory.nextCAPTCHA();
			captcha_num = ca.getCAPTCHA_num();
			ImageIO.write(ca.getBufferedImage(), "png", resp.getOutputStream());
		}
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//验证验证码和账号密码
		req.setCharacterEncoding("utf-8");
		LoginService loginService = new LoginService();
		String message = "";
		int MAXDAY = 10;
		String username = req.getParameter("UserName");
		String pwd = req.getParameter("Pwd");
		System.out.println(username);
		if(req.getParameter("VerifyCode").equals(""+ captcha_num[0] + captcha_num[1] + captcha_num[2] + captcha_num[3])) {
			if (loginService.isValidUser(username, pwd)) {
				//选择自动登录
				if(req.getParameter("UserNameRemeber").equals("true")) {
					Cookie usernamecookie = new Cookie("username", username);
					Cookie passwordcookie = new Cookie("password", URLEncoder.encode(pwd,"UTF-8"));
					// 分别给每一个Cookie对象单独设置有效期
					usernamecookie.setMaxAge(MAXDAY * 24 * 3600); 
					passwordcookie.setMaxAge(MAXDAY * 24 * 3600);
					resp.addCookie(usernamecookie);
					resp.addCookie(passwordcookie);

				}
				HttpSession session = req.getSession();
				session.setAttribute("userInfo", username);
				System.out.println("userInfo"+session.getAttribute("userInfo"));
				req.getRequestDispatcher("index.jsp").forward(req, resp);
			}else {
				message = "用户名或密码错误";
				req.setAttribute("message", message);
				req.getRequestDispatcher("Login.jsp").forward(req, resp);
			}
		}else {
			message = "验证码错误";
			req.setAttribute("message", message);
			req.getRequestDispatcher("Login.jsp").forward(req, resp);
		}
		
	}
}
