package controller;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import entity.comment;
import service.CommentService;

@Controller
public class Comment_controller {
	@Autowired
	@Qualifier("commentService")
	private CommentService commentService;
	
	@CrossOrigin
	@RequestMapping(value="comment/getAllComment.action")
	@ResponseBody 
	public List<comment> getAllComment(HttpServletRequest request) {
		List<comment> comments = this.commentService.getAllComment();
		return comments;
	}
	
	@CrossOrigin
	@RequestMapping(value="comment/newComment.action")
	@ResponseBody 
	public Integer newComment(comment comment,HttpServletRequest request) {
		SimpleDateFormat formatter= new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date comment_date = new Date(System.currentTimeMillis());
		comment.setTime(formatter.format(comment_date).toString());
		int rows = this.commentService.newComment(comment);
		return rows;
	}
	
	@CrossOrigin
	@RequestMapping(value="comment/getCommentbyUser.action")
	@ResponseBody 
	public List<comment> getCommentbyUser(String userName,HttpServletRequest request) {
		List<comment> comments = this.commentService.getCommentbyUser(userName);
		return comments;
	}
	
	@CrossOrigin
	@RequestMapping(value="comment/deleteComment.action")
	@ResponseBody 
	public Integer deleteComment(String time,HttpServletRequest request) {
		return this.commentService.deleteComment(time);
	}
}
