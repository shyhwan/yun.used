package yunseunghwan.used.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import yunseunghwan.used.dao.CommentDao;
import yunseunghwan.used.domain.Comment;

@Service
public class CommentServiceImpl implements CommentService{
	@Autowired private CommentDao commentDao;
	
	@Override
	public List<Comment> getComments() {
		return commentDao.selectComments();
	} 
	  
	@Override
	public Comment getComment(int commentNum) {
		return commentDao.selectComment(commentNum);
	}
	
	@Override
	public void addComment(Comment comment) {
		commentDao.insertComment(comment);
	}
	
	@Override
	public void fixComment(Comment comment) {
		commentDao.editComment(comment);
	}
	
	@Override
	public void delComment(int commentNum) {
		commentDao.deleteComment(commentNum);
	}
}
