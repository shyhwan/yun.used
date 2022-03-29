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
	public List<Comment> selectComments() {
		return commentMap.selectComments();
	} 
	
	@Override
	public Comment selectComment(int commentNum) {
		return commentMap.selectComment(commentNum);
	} 
	
	@Override
	public void insertComment(Comment comment) {
		commentMap.insertComment(comment);
	}
	
	@Override
	public void deleteComment(int commentNum) {
		commentMap.deleteComment(commentNum);
	} 
	
	@Override
	public void editComment(Comment comment) {
		commentMap.editComment(comment);
	}
}
