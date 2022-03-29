package yunseunghwan.used.dao;

import java.util.List;

import yunseunghwan.used.domain.Comment;

public interface CommentDao {
	List<Comment> selectComments();
	Comment selectComment(int commentNum);
	void insertComment(Comment comment);
	void deleteComment(int commentNum);
	void editComment(Comment comment);
}
 