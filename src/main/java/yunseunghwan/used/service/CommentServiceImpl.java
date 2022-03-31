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
	public List<Comment> getTradeComments(int tradeNum) {
		return commentDao.selectTradeComments(tradeNum);
	} 
	
	@Override
	public List<Comment> getBlindComments(int blindNum) {
		return commentDao.selectBlindComments(blindNum);
	} 
	
	@Override
	public List<Comment> getReportComments(int reportNum) {
		return commentDao.selectReportComments(reportNum);
	} 

	@Override
	public void addTradeComment(Comment comment) {
		commentDao.insertTradeComment(comment);
	}
	
	@Override
	public void addBlindComment(Comment comment) {
		commentDao.insertBlindComment(comment);
	}
	
	@Override
	public void addReportComment(Comment comment) {
		commentDao.insertReportComment(comment);
	}

	@Override
	public void delComment(int commentNum) {
		commentDao.deleteComment(commentNum);
	}
}
