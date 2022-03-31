package yunseunghwan.used.dao.map;

import java.util.List;

import yunseunghwan.used.domain.Comment;

public interface CommentMap {
	List<Comment> selectTradeComments(int tradeNum);
	List<Comment> selectBlindComments(int blindNum);
	List<Comment> selectReportComments(int reportNum);
	void insertTradeComment(Comment comment);
	void insertBlindComment(Comment comment);
	void insertReportComment(Comment comment);
	void deleteComment(int commentNum);
}