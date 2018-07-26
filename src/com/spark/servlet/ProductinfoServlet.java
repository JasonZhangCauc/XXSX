package com.spark.servlet;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.spark.bean.Product;
import com.spark.bean.User;
import com.spark.dao.ProductDao;
import com.spark.dao.UserDao;
import com.spark.service.CartService;
import com.spark.service.ProductService;

/**
 * Servlet implementation class ProductinfoServlet
 */
@WebServlet("/ProductinfoServlet")
public class ProductinfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductinfoServlet() {
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
		
		//System.out.println(productId);
		String action = request.getParameter("action");
		if("submitCart".equals(action)){
			UserDao userDao=new UserDao();
			CartService cartService=new CartService();
			//获得userId
			HttpSession session=request.getSession();
			String username=(String)session.getAttribute("userInfo");
			System.out.println(username);
			int userId=userDao.getUserIdByName(username);
			
			//获得商品的数量
			int num=Integer.parseInt(request.getParameter("ProductNum"));
			System.out.println(num);
			//获得商品的Id
			System.out.println(request.getParameter("ProductId"));
			int productId=Integer.parseInt(request.getParameter("ProductId"));
			System.out.println(productId);
			
			//获取当前
			if(cartService.isCartExit(userId)){//判断用户是否有购物车
				if(cartService.isProExit(userId, productId)){//判断用户是否存在购物车关于该商品的列表项
					cartService.UpdateNum(num, userId);//存在则更新购物车列表
				}else{
					//不存在则新建商品列表
					cartService.addPro(userId, num, productId);
				}
			}else{
				//根据UserId新建购物车加商品列表
				cartService.addCartAndPro(userId, num, productId);
			}
		}else{
			String productId=request.getParameter("goodsid");
			ProductService productService=new ProductService();
			ProductDao productDao=new ProductDao();
			Product product=productDao.getProductByProductId(productId(productId));
			if(productService.isEmptyProduct(productId(productId))){
				
			}else{
				//向详情页传图片参数
//				String head=request.getContextPath()+File.separator+"goodsimg";
//				String url1=head+File.separator+product.getPicture1();
//				System.out.println(url1);
//				request.setAttribute("pic1", url1);
//				String url2=head+File.separator+product.getPicture2();
//				request.setAttribute("pic2", url2);
//				String url3=head+File.separator+product.getPicture3();
//				request.setAttribute("pic3", url3);
				String head=request.getContextPath()+File.separator+"goodsimg";
				String url1=product.getPicture1();
				//System.out.println(url1);
				request.setAttribute("pic1", url1);
				String url2=product.getPicture2();
				request.setAttribute("pic2", url2);
				String url3=product.getPicture3();
				request.setAttribute("pic3", url3);
				
				//详情页传文本
				request.setAttribute("product",product);
				request.getRequestDispatcher("Goodsdetail.jsp").forward(request, response);
				//request.setAttribute("Productinfor",product);
			}
		}
		
	}
	public int productId(String productId){
		int Reasult=Integer.parseInt(productId);
		return Reasult;
	}
}
