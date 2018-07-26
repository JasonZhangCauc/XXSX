package com.spark.service;

import java.util.List;

import com.spark.bean.Comment;
import com.spark.dao.CommentDao;

public class CommentService {
	
	public boolean isEmpComPro(int productId){
		CommentDao commentDao=new CommentDao();
		if(commentDao.getCommentdetail(productId).size()>0){
			return true;
		}
		return false;
	}
	public List<Comment> getCommentList(int productId,int start){
		CommentDao commentDao=new CommentDao();
		return commentDao.getComment(productId, start);
	}
}
