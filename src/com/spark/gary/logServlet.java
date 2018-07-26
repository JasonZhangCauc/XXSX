package com.spark.gary;

import java.io.IOException;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSON;


/**
 * Servlet implementation class logServlet
 */
@WebServlet("/logServlet")
public class logServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
	static Connection conn=null;
	static PreparedStatement pstat=null;
	static ResultSet rs=null;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public logServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String keyword=request.getParameter("keyword");
		System.out.println(keyword);
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			String url="jdbc:mysql://rm-bp1a713byhw75z9552o.mysql.rds.aliyuncs.com:3306/spark?useSSL=false&serverTimezone=GMT";
			String username="test4";
			String password="123";
			
			ArrayList<Shopitem> arr=new ArrayList<Shopitem>();
			conn=DriverManager.getConnection(url,username,password);
			
			String sql="select Productid,Picture1,Productname,Price from product limit "+keyword+",4";
			System.out.println("sql"+sql);
		
			pstat=conn.prepareStatement(sql);
			ResultSet rs=pstat.executeQuery();
			Shopitem shopitem=null;
			while(rs.next())	
			{
				shopitem=new Shopitem();
				shopitem.Productid=rs.getString(1);
				shopitem.Picture1=rs.getString(2);
				shopitem.Productname=rs.getString(3);
				shopitem.Price=rs.getString(4);
				arr.add(shopitem);	
			}
			
			String ss = JSON.toJSONString(arr); 
			response.setContentType("application/json; charset=utf-8");
			PrintWriter out = null ;
			out = response.getWriter();
			out.append(ss);
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		
	}

	private String getParemeter(String string) {
		// TODO Auto-generated method stub
		return null;
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
