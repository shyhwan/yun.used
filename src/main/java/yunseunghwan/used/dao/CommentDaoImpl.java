package yunseunghwan.used.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import yunseunghwan.used.dao.map.CommentMap;
import yunseunghwan.used.domain.Comment;

@Repository
public class CommentDaoImpl implements CommentDao{
	@Autowired private CommentMap commentMap;
	
	@Override
	public List<Comment> selectTradeComments(int tradeNum) {
		return commentMap.selectTradeComments(tradeNum);
	} 
	
	@Override
	public List<Comment> selectBlindComments(int blindNum) {
		return commentMap.selectBlindComments(blindNum);
	} 
	
	@Override
	public List<Comment> selectReportComments(int reportNum) {
		return commentMap.selectReportComments(reportNum);
	} 

	@Override
	public void insertTradeComment(Comment comment) {
		commentMap.insertTradeComment(comment);
	}
	
	@Override
	public void insertBlindComment(Comment comment) {
		commentMap.insertBlindComment(comment);
	}
	
	@Override
	public void insertReportComment(Comment comment) {
		commentMap.insertReportComment(comment);
	}

	@Override
	public void deleteComment(int commentNum) {
		commentMap.deleteComment(commentNum);
	} 
}
