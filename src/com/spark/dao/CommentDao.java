package com.spark.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.spark.bean.Comment;
import com.spark.util.ConnectionFactory;

public class CommentDao {
	/*
	 * 获取评论的总数
	 */
	public int getAmount(int productId){
		int result=0;
		PreparedStatement pStatement = null;
		Connection connection = ConnectionFactory.getConnection();
		String sql = "select count(*) from comment where Productid =?";
		try {
			pStatement=connection.prepareStatement(sql);
			pStatement.setInt(1,productId);
			ResultSet rs=pStatement.executeQuery();
			while (rs.next()) {
				result=rs.getInt(1);
			}
		}catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		return result;
	}
	/*
	 * 获取一定大小的评论数据
	 */
	public List<Comment> getComment(int productId,int start){
		List<Comment> ComList=new ArrayList<Comment>();
		Comment comment=null;
		PreparedStatement pStatement = null;
		Connection connection = ConnectionFactory.getConnection();
		String sql = "select Commentid,Userid,Productid,Commentdetail,Point from comment where Productid =? limit "+start+","+5;
		try {
			pStatement=connection.prepareStatement(sql);
			pStatement.setInt(1,productId);
			ResultSet rs=pStatement.executeQuery();
			while (rs.next()) {
				comment=new Comment();
				comment.setCommentId(rs.getInt(1));
				comment.setUserId(rs.getInt(2));
				comment.setProductId(rs.getInt(3));
				comment.setCommentdetail(rs.getString(4));
				comment.setPoint(rs.getInt(5));
				ComList.add(comment);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return ComList;
	}
	/*
	 * 获取评论及打分
	 */
	public List<String[]> getCommentdetail(int productId){
		List<String[]> commentList=new ArrayList<String[]>();
		
		PreparedStatement pStatement = null;
		Connection connection = ConnectionFactory.getConnection();
		String sql = "select Commentdetail,Point from comment where Productid =? ";
		try {
			//预编译
			pStatement=connection.prepareStatement(sql);
			pStatement.setInt(1, productId);
			//执行
			ResultSet rs=pStatement.executeQuery();
			while(rs.next()){
				String[] per=new String[2];
				per[0]=rs.getString(1);
				per[1]=""+rs.getInt(2);
				commentList.add(per);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return commentList;
	}
	/*
	 * 获取评论的平均值
	 */
	public int getAveragePoint(int productId){
		int totalPoint=0;
		int count=0;
		PreparedStatement pStatement = null;
		Connection connection = ConnectionFactory.getConnection();
		String sql = "select Point from comment where Productid =? ";
		try {
			//预编译
			pStatement=connection.prepareStatement(sql);
			pStatement.setInt(1, productId);
			//执行
			ResultSet rs=pStatement.executeQuery();
			while(rs.next()){
				count++;
				totalPoint+=rs.getInt(1);
			}
			if(count==0){
				return 0;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return totalPoint/count;
	}
}
