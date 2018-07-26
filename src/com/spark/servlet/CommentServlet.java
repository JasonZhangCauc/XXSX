package com.spark.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSON;
import com.spark.bean.Comment;
import com.spark.service.CommentService;

/**
 * Servlet implementation class CommentServlet
 */
@WebServlet("/CommentServlet")
public class CommentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	static int a=0;
    public CommentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		CommentService commentService=new CommentService();
		//获取商品Id
		int productId=Integer.parseInt(request.getParameter("ProductId"));
		//获取页数起始指针
		//int start=Integer.parseInt(request.getParameter("start"));
		//System.out.println(start);
		//根据商品id获取评论
		if("ALLITEMS".equals(request.getParameter("action"))){
			String commenlist=JSON.toJSONString(commentService.getCommentList(productId, a));
			//System.out.println("jsonStr:"+commenlist);
			response.setCharacterEncoding("UTF-8");  
			response.setContentType("application/json; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.write(commenlist);
			out.flush();
			out.close();
		}else if("next".equals(request.getParameter("action"))){
			if(commentService.getCommentList(productId, a+5).size()>0){
				String commenlist=JSON.toJSONString(commentService.getCommentList(productId, a+5));
				System.out.println("jsonStr:"+commenlist);
				response.setCharacterEncoding("UTF-8");  
				response.setContentType("application/json; charset=utf-8");
				PrintWriter out = response.getWriter();
				out.write(commenlist);
				out.flush();
				out.close();
				a=a+5;
			}else{
				Comment comment=new Comment();
				List<Comment> list=new ArrayList<Comment>();
				comment.setCommentdetail("#END#");
				list.add(comment);
				String jsonStr=JSON.toJSONString(list);
				System.out.println("jsonStr:"+jsonStr);
				response.setCharacterEncoding("UTF-8");  
				response.setContentType("application/json; charset=utf-8");
				PrintWriter out = response.getWriter();
				out.write(jsonStr);
				out.flush();
				out.close();
			}
		}else if ("per".equals(request.getParameter("action"))) {
			System.out.println(a);
			if(a>=5){
				String commenlist=JSON.toJSONString(commentService.getCommentList(productId, a-5));
				System.out.println("jsonStr:"+commenlist);
				response.setCharacterEncoding("UTF-8");  
				response.setContentType("application/json; charset=utf-8");
				PrintWriter out = response.getWriter();
				out.write(commenlist);
				out.flush();
				out.close();
				a=a-5;
			}else{
				Comment comment=new Comment();
				List<Comment> list=new ArrayList<Comment>();
				comment.setCommentdetail("#START#");
				list.add(comment);
				String jsonStr=JSON.toJSONString(list);
				System.out.println("jsonStr:"+jsonStr);
				response.setCharacterEncoding("UTF-8");  
				response.setContentType("application/json; charset=utf-8");
				PrintWriter out = response.getWriter();
				out.write(jsonStr);
				out.flush();
				out.close();
			}
		}
	
	}

}
