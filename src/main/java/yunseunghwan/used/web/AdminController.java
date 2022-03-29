package yunseunghwan.used.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import yunseunghwan.used.domain.User;
import yunseunghwan.used.service.UserService;

@RestController
@RequestMapping("admin")
public class AdminController {
	@Autowired private UserService userService;
	
	@GetMapping("users")
	public ModelAndView Users(ModelAndView mv) {
		mv.setViewName("admin/user/users");
		return mv;
	}
	
	@GetMapping("userList")
	public List<User> UserList() {
		return userService.getUsers();
	}
	
	@GetMapping("userManager")
	public ModelAndView UserProfile(ModelAndView mv) {
		mv.setViewName("admin/user/userManager");
		return mv;
	}
}
