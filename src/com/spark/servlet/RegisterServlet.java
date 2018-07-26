package com.spark.servlet;




import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.Map;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

import com.spark.util.ConnectionFactory;
import com.spark.util.StringUtils;
import com.spark.bean.User;
import com.sun.org.apache.bcel.internal.generic.NEW;



/**
 *   登陆SERVLET
 */
public class RegisterServlet extends HttpServlet{
	static int num=1;
	static String ssstring=null;
	ArrayList<User> list = new ArrayList<User>();
	private static final long serialVersionUID = 1L;
	private static Logger log = Logger.getLogger(RegisterServlet.class);
	//重写doGet方法
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("I AM GET ");
		doPost(request,response);
	}
	
	//重写doPost方法传递用户信息
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		

		System.out.println("I AM POST ");
		ConnectionFactory cFactory=new ConnectionFactory();
		Connection con =cFactory.getConnection(); //创建一个数据库连接
		PreparedStatement pre = null; //预编译语句对象 
		ResultSet result = null; //创建一个结果集对象
		response.setContentType("text/html");
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		try {
			
			String test=null;
			
			System.out.println("register dopost内连接数据库成功");
			//String sql = "SELECT * FROM T_STUDENT WHERE USER_NAME='"+userName+"'";
			
			

			String userName = request.getParameter("uid");
			String password = request.getParameter("psw1");
			String repassword = request.getParameter("psw2");
			String age1=request.getParameter("qx");//age
			int age=Integer.parseInt(age1);
			String email = request.getParameter("email");
			String address = request.getParameter("city");
			String sex = request.getParameter("sex");
			
			log.debug("user:: userName:"+userName+";"
					+" password:"+password+";"
					+" age:"+age+";"
					+" email:"+email+";"
					+" address:"+address+";"
					+" sex:"+sex);
			String sqlname = "SELECT Username FROM user  ";
			pre  = con.prepareStatement(sqlname);
			result = pre.executeQuery();
//			while(result.next()){
//				ssstring=	result.getString("Username");
//				if(userName.contains(ssstring)) {
//					
////					response.sendRedirect("exist.jsp");
//					request.getRequestDispatcher("exist.jsp").forward(request,response);
//					return;
//				}
//			}
			String sql="insert into user(Username,Userpassword,email,sex,address,age)"+"values(?,?,?,?,?,?)";
			pre  = con.prepareStatement(sql);
			pre.setString(1, userName);
            pre.setString(2, password);
            pre.setString(3, email);
            pre.setString(4, sex);
            pre.setString(5, address);
            pre.setInt(6, age);
            pre.executeUpdate();
			//result = pre.executeQuery();
            //response.sendRedirect("./Login.jsp");
            request.getRequestDispatcher("./Login.jsp").forward(request,response);
            PrintWriter  out=response.getWriter();
            out.print("<h1 aling='center'>");
            out.print(userName+"注册成功！");
            out.print("</h1>");
            out.flush();
            out.close();
    		
    		
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			try{
				if(result!=null){
					result.close();
				}
				if(pre!=null){
					pre.close();
				}
				if(con!=null){
					con.close();
				}
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		
		
	}
	

	public void destroy() {
		System.out.println("I AM loginServlet destory" );

	}

	public void init() throws ServletException {
		System.out.println("I AM loginServlet init " );
	}
	
	
}
