package yunseunghwan.used.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import yunseunghwan.used.domain.Comment;
import yunseunghwan.used.service.CommentService;

@RestController
@RequestMapping("comment")
public class CommentController {
	@Autowired private CommentService commentService;
	
	@GetMapping("list/trede/{tradeNum}")
	public List<Comment> getTradeCommentList(@PathVariable int tradeNum) {
		return commentService.getTradeComments(tradeNum);
	} 
	
	@GetMapping("list/blind/{blindNum}")
	public List<Comment> getBlindCommentList(@PathVariable int blindNum) {
		return commentService.getBlindComments(blindNum);
	} 
	
	@GetMapping("list/report/{reportNum}")
	public List<Comment> getReportCommentList(@PathVariable int reportNum) {
		return commentService.getReportComments(reportNum);
	} 
	
	@PostMapping("add")
	public void addComment(@RequestBody Comment comment) {
		System.out.println(comment);
		
		if(comment.getTradeNum() != 0) {
			commentService.addTradeComment(comment);
		} else if(comment.getBlindNum() != 0) {
			commentService.addBlindComment(comment);
		} else {
			commentService.addReportComment(comment);
		}
	}

	@DeleteMapping("del/{commentNum}")
	public void delComment(@PathVariable int commentNum) {
		System.out.println(commentNum);
		commentService.delComment(commentNum);
	}
}
  