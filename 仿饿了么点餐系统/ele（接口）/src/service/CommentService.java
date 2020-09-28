package service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import entity.comment;

public interface CommentService {
	public List<comment> getAllComment();
	public Integer newComment(comment comment);
	public List<comment> getCommentbyUser(String userName);
	public Integer deleteComment(String time);
}
