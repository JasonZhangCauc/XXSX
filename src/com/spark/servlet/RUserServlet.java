package com.spark.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.spark.util.ConnectionFactory;

public class RUserServlet extends HttpServlet {
	static String ssstring=null;
    public void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException {
        doPost(request,response);
    }

    public void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
        response.setContentType("text/html;charset=utf-8");
        //定义输出流
        PrintWriter out = response.getWriter();
        //获取前端页面输入数据
        String username = request.getParameter("username");
      //  System.out.println(username1);
        //String username = request.getParameter("uid");
        //测试打印，测试接收前台数据是否成功
        
        System.out.println("username"+username);
        
        ConnectionFactory cFactory=new ConnectionFactory();
		Connection con =cFactory.getConnection(); //创建一个数据库连接
		PreparedStatement pre = null; //预编译语句对象 
		ResultSet result = null; //创建一个结果集对象
		response.setContentType("text/html");
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String sqlname = "SELECT Username FROM user  ";
		try {
			pre  = con.prepareStatement(sqlname);
			result = pre.executeQuery();
			while(result.next()){
				//ssstring=result.getString("Username");
				ssstring=result.getString(1);
				if(username.equals(ssstring)) {
					 out.println(false);
					return;
				}
				
			}
			out.println(true);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
        
//        //进行比较并作出响应。
//        if(username==null || username.equals("")) {
//            out.println("请输入用户名 ");
//        } else if("ssssss".equals(username)) {
//            out.println(false);
//        } else {
//            out.println(true);
//        }

    }
}