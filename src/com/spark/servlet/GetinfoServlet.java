package com.spark.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class GetinfoServlet
 */
@WebServlet("/GetinfoServlet")
public class GetinfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetinfoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		//doPost(request, response);
//		String goodsId=(String) request.getAttribute("goodsid");
//		request.getParameter("goodsid");
		//System.out.println(request.getQueryString());
		request.getRequestDispatcher("goodsid");
		//System.out.println(request.getAttribute("goodsid"));
		request.getRequestDispatcher("GoodsDetail.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		String goodsId=(String) request.getAttribute("goodsid");
		System.out.println(goodsId);
		request.getRequestDispatcher("Goodsdetail.jsp").forward(request, response);
	}

}
