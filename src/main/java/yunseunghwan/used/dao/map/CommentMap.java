package yunseunghwan.used.dao.map;

import java.util.List;

import yunseunghwan.used.domain.Comment;

public interface CommentMap {
	List<Comment> selectComments();
	Comment selectComment(int commentNum);
	void insertComment(Comment comment);
	void deleteComment(int commentNum);
	void editComment(Comment comment);
}