package com.spark.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSON;
import com.etc.dao.Sheng;
import com.etc.dao.UserDao;
import com.etc.vo.User;

public class EchartsServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");
		if ("pie".equals(action)) {
			getPieData(request, response);
		} else if ("map".equals(action)) {
			getMapData(request, response);
		} else if ("bar".equals(action)) {
			getBarData(request, response);
		} else if ("line".equals(action)) {
			getBarData(request, response);
		} else if ("mymap".equals(action)) {
			getMymapData(request, response);
		}
	}

	/*
	 * 返回饼图数据
	 */
	private void getPieData(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<Map<String, Object>> data = new ArrayList<>();
		Map<String, Object> map = new HashMap<String, Object>();
		UserDao dao=new UserDao();
		int numman=dao.findMan("男");
		map.put("name", "男");
		map.put("value", numman);
		data.add(map);
		int numwoman=dao.findMan("女");
		map = new HashMap<String, Object>();
		map.put("name", "女");
		map.put("value", numwoman);
		data.add(map);
		// 转换成JSON格式
		String jsonStr = JSON.toJSONString(data);
		System.out.println("jsonStr1:" + jsonStr);
		response.setCharacterEncoding("UTF-8");
		response.setContentType("application/json; charset=utf-8");
		// resoponse响应结果
		PrintWriter out = response.getWriter();
		out.write(jsonStr);
		out.flush();
		out.close();
	}
	
	/*
	 * 返回折线图数据
	 */
	private void getBarData(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		UserDao dao=new UserDao();
		List<Map<String, Object>> data = new ArrayList<>();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("name", "5-15");
		map.put("value", dao.findNumByAge("5-15"));
		data.add(map);
		
		map = new HashMap<String, Object>();
		map.put("name", "15-25");
		map.put("value", dao.findNumByAge("15-25"));
		data.add(map);

		map = new HashMap<String, Object>();
		map.put("name", "25-35");
		map.put("value", dao.findNumByAge("25-35"));
		data.add(map);

		map = new HashMap<String, Object>();
		map.put("name", "35-45");
		map.put("value", dao.findNumByAge("35-45"));
		data.add(map);

		map = new HashMap<String, Object>();
		map.put("name", "45-55");
		map.put("value", dao.findNumByAge("45-55"));
		data.add(map);

		map = new HashMap<String, Object>();
		map.put("name", "55-65");
		map.put("value", dao.findNumByAge("55-65"));
		data.add(map);

		map = new HashMap<String, Object>();
		map.put("name", "65-75");
		map.put("value", dao.findNumByAge("65-75"));
		data.add(map);

		map = new HashMap<String, Object>();
		map.put("name", "75-85");
		map.put("value", dao.findNumByAge("75-85"));
		data.add(map);

		map = new HashMap<String, Object>();
		map.put("name", "85-95");
		map.put("value", dao.findNumByAge("85-95"));
		data.add(map);
		// 转换成JSON格式
		String jsonStr = JSON.toJSONString(data);
		System.out.println("jsonStr1:" + jsonStr);
		response.setCharacterEncoding("UTF-8");
		response.setContentType("application/json; charset=utf-8");
		// resoponse响应结果
		PrintWriter out = response.getWriter();
		out.write(jsonStr);
		out.flush();
		out.close();
	}
	
	/*
	 * 返回地图数据
	 */
	private void getMapData(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<Map<String, Object>> data = new ArrayList<>();
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("name", "吉林");
		map.put("value", UserDao.findNumBySheng("吉林")*1000);
		data.add(map);
		map = new HashMap<String, Object>();
		map.put("name", "北京");
		map.put("value", UserDao.findNumBySheng("北京")*1000);
		data.add(map);
		map = new HashMap<String, Object>();
		map.put("name", "天津");
		map.put("value", UserDao.findNumBySheng("天津")*1000);
		data.add(map);
		map = new HashMap<String, Object>();
		map.put("name", "云南");
		map.put("value", UserDao.findNumBySheng("云南")*1000);
		data.add(map);
		
		map = new HashMap<String, Object>();
		map.put("name", "江苏");
		map.put("value", UserDao.findNumBySheng("江苏")*1000);
		data.add(map);
		
		map = new HashMap<String, Object>();
		map.put("name", "四川");
		map.put("value", UserDao.findNumBySheng("四川")*1000);
		data.add(map);
		
		map = new HashMap<String, Object>();
		map.put("name", "海南");
		map.put("value", UserDao.findNumBySheng("海南")*1000);
		data.add(map);
		
		map = new HashMap<String, Object>();
		map.put("name", "广东");
		map.put("value", UserDao.findNumBySheng("广东")*1000);
		data.add(map);
		
		map = new HashMap<String, Object>();
		map.put("name", "江西");
		map.put("value", UserDao.findNumBySheng("江西")*1000);
		data.add(map);
		
		map = new HashMap<String, Object>();
		map.put("name", "湖南");
		map.put("value", UserDao.findNumBySheng("湖南")*1000+7000);
		data.add(map);
		map = new HashMap<String, Object>();
		map.put("name", "湖北");
		map.put("value", UserDao.findNumBySheng("湖北")*1000);
		data.add(map);
		
		map = new HashMap<String, Object>();
		map.put("name", "重庆");
		map.put("value", UserDao.findNumBySheng("重庆")*1000+10000);
		data.add(map);
		map = new HashMap<String, Object>();
		map.put("name", "陕西");
		map.put("value", UserDao.findNumBySheng("陕西")*1000);
		data.add(map);
		map = new HashMap<String, Object>();
		map.put("name", "青海");
		map.put("value", UserDao.findNumBySheng("青海")*1000);
		data.add(map);
		
		map = new HashMap<String, Object>();
		map.put("name", "新疆");
		map.put("value", UserDao.findNumBySheng("新疆维吾尔自治")*1000+10000);
		data.add(map);
		
		
		// 转换成JSON格式
		String jsonStr = JSON.toJSONString(data);
		
		System.out.println("jsonStr1:" + jsonStr);
		response.setCharacterEncoding("UTF-8");
		response.setContentType("application/json; charset=utf-8");
		// resoponse响应结果
		PrintWriter out = response.getWriter();
		out.write(jsonStr);
		out.flush();
		out.close();
	}
	private void getMymapData(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//List<Map<String, Object>> data = new ArrayList<>();
		//Map<String, Object> map = new HashMap<String, Object>();
		//map.put("name", "广州");
		//map.put("value", 200);
		//data.add(map);
		//map = new HashMap<String, Object>();
		//map.put("name", "天津");
		//map.put("value", 500);
		//data.add(map);
//		map = new HashMap<String, Object>();
//		map.put("name", "天津");
//		map.put("value", 700);
//		data.add(map);
//		map = new HashMap<String, Object>();
//		map.put("name", "上海");
//		map.put("value", 900);
//		data.add(map);
		// 转换成JSON格式
		//String jsonStr =  JSON.toJSONString(data);
		
		//jsonStr=jsonStr.replaceAll("\"(\\w+)\"(\\s*:\\s*)", "$1$2");
		//jsonStr=jsonStr.replaceAll("\"", "\'");
		//System.out.println("jsonStr1:" + jsonStr);
		//jsonStr="[[{name:'贵阳', value:100}, {name: '天津'}],[{name: '广州',value: 70}, {name: '天津'}], [{name: '哈尔滨',value: 30}, {  name: '天津' }],  [{ name: '青岛', value: 50  }, {  name: '天津'  }], [{ name: '南昌', value: 20 }, {name: '天津' }], [{ name: '银川', value: 10 }, { name: '天津'  }], [{  name: '拉萨', value: 80}, {   name: '天津' }], [{ name: '西安', value: 55}, { name: '天津' }],[{ name: '乌鲁木齐', value: 90 }, { name: '天津' }] ]  ";
		response.setCharacterEncoding("UTF-8");
		response.setContentType("application/json; charset=utf-8");
//		ArrayList<Sheng> sList=new ArrayList<Sheng>();
//		Sheng sheng=new Sheng("吉林", 10);
//		sList.add(sheng);
//		request.setAttribute("sheng", sheng);
		// resoponse响应结果
//		int num=100;
		
		String nString="10";
		String tian= ""+UserDao.findNumBySheng("天津");
		PrintWriter out = response.getWriter();
		//out.write(jsonStr);
		//out.write(num);
		out.write(UserDao.findNumBySheng("上海")*10
				+";"+UserDao.findNumBySheng("北京")
				+";"+UserDao.findNumBySheng("云南")
				+";"+UserDao.findNumBySheng("江苏")
				+";"+UserDao.findNumBySheng("四川")
				+";"+UserDao.findNumBySheng("新疆维吾尔自治")
				+";"+UserDao.findNumBySheng("西藏自治")
				+";"+UserDao.findNumBySheng("陕西")
				+";"+UserDao.findNumBySheng("广东")
				+";"+UserDao.findNumBySheng("黑龙江")
				+";"
				);
		//String nString2=nString.substring(0,nString.indexOf(" "));
		out.flush();
		out.close();
	}
	
}
