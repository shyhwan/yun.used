package yunseunghwan.used.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import yunseunghwan.used.domain.Comment;
import yunseunghwan.used.service.CommentService;

@RestController
@RequestMapping("comment")
public class CommentController {
	@Autowired private CommentService commentService;
	
	@GetMapping("list")
	public List<Comment> commentList() {
		return commentService.getComments();
	} 

}
  