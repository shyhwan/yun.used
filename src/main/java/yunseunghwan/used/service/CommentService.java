package yunseunghwan.used.service;

import java.util.List;

import yunseunghwan.used.domain.Comment;

public interface CommentService {
	List<Comment> getComments();
	Comment getComment(int commentNum);
	void addComment(Comment comment);
	void fixComment(Comment comment);
	void delComment(int commentNum);
}
   