package service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import dao.CommentDao;
import entity.comment;
import service.CommentService;

@Service("commentService")
@Transactional
public class CommentServiceImpl implements CommentService{
	@Autowired
	private CommentDao commentDao;

	@Override
	public List<comment> getAllComment() {
		// TODO Auto-generated method stub
		return this.commentDao.getAllComment();
	}

	@Override
	public Integer newComment(comment comment) {
		// TODO Auto-generated method stub
		return this.commentDao.newComment(comment);
	}

	@Override
	public List<comment> getCommentbyUser(String userName) {
		// TODO Auto-generated method stub
		return this.commentDao.getCommentbyUser(userName);
	}

	@Override
	public Integer deleteComment(String time) {
		// TODO Auto-generated method stub
		return this.commentDao.deleteComment(time);
	}	
}
