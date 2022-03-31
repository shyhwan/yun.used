package yunseunghwan.used.service;

import java.util.List;

import yunseunghwan.used.domain.Comment;

public interface CommentService {
	List<Comment> getTradeComments(int tradeNum);
	List<Comment> getBlindComments(int blindNum);
	List<Comment> getReportComments(int reportNum);
	void addTradeComment(Comment comment);
	void addBlindComment(Comment comment);
	void addReportComment(Comment comment);
	void delComment(int commentNum);
}
   