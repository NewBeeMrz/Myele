package dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import entity.comment;

public interface CommentDao {
	public List<comment> getAllComment();
	public Integer newComment(comment comment);
	public List<comment> getCommentbyUser(@Param("userName") String userName);
	public Integer deleteComment(@Param("time") String time);
}
