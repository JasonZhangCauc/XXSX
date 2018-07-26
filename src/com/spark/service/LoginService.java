package com.spark.service;

import com.spark.bean.User;
import com.spark.dao.LoginDao;
/*
 * liyang
 */
public class LoginService {
	public boolean isValidUser(String userName,String passWord) {
		
		LoginDao loginDao = new LoginDao();
		User user = loginDao.selectByNameAndPwd(userName, passWord);
		
		if(user==null) {
			return false;
		}
		
		return true;
	}
}
