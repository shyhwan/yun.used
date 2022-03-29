package yunseunghwan.used.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import yunseunghwan.used.domain.User;
import yunseunghwan.used.domain.UserDto;
import yunseunghwan.used.service.UserService;

@RestController
@RequestMapping("user")
public class UserController {
	@Autowired private UserService userService;
	 
	@GetMapping("login")
	public ModelAndView login(ModelAndView mv) {
		mv.setViewName("user/login");		
		return mv;
	}

	@PostMapping("checkUser")
	public ModelAndView loginUser(User user, HttpServletRequest req, ModelAndView mv) {
		User userProfile = userService.loginUser(user, req);
		
		if(userProfile == null) {
			mv.addObject("errMsg", "아이디 또는 비밀번호가 틀렸습니다.");
			mv.setViewName("user/login");
		} else mv.setViewName("redirect:/used");
		return mv;
	}
	
	@GetMapping("logout")
	public ModelAndView logout(HttpSession session, ModelAndView mv) {
		userService.outSession(session);
		mv.setViewName("redirect:/used");		
		return mv;
	}
	
	@GetMapping("findId")
	public ModelAndView findId(ModelAndView mv) {
		mv.setViewName("user/findId");		
		return mv;
	}
	
	@PostMapping("checkId")
	public ModelAndView foundId(ModelAndView mv, UserDto user) {
		UserDto userDto = userService.findId(user);
		
		if(userDto == null) {
			mv.setViewName("user/findId");
			mv.addObject("message", "이름 혹은 연락처가 틀립니다.");
		} else {
			mv.setViewName("user/foundId");
			mv.addObject(userDto);
		}		
		return mv;
	}
	
	@GetMapping("findPw")
	public ModelAndView findPw(ModelAndView mv) {
		mv.setViewName("user/findPw");		
		return mv;
	}
	
	@PostMapping("checkPw")
	public ModelAndView foundPw(ModelAndView mv, UserDto user) {
		UserDto userDto = userService.findPw(user);
		
		if(userDto == null) {
			mv.setViewName("user/findPw");
			mv.addObject("message", "아이디 혹은 연락처가 틀립니다.");
		} else {
			mv.setViewName("user/foundPw");
			mv.addObject(userDto);
		}
		return mv;
	}
	
	@GetMapping("join")
	public ModelAndView join(ModelAndView mv) {
		mv.setViewName("user/join");		
		return mv;
	}
	
	@PostMapping("checkUserId")
	public UserDto checkUserId(@RequestBody UserDto user) {
		UserDto userDto = userService.checkUserId(user);
		return userDto;
	}
	
	@PostMapping("checkUserNickName")
	public UserDto checkUserNickName(@RequestBody UserDto user) {
		UserDto userDto = userService.checkUserNickName(user);
		return userDto;
	}
	
	@PostMapping("checkUserPw")
	public UserDto checkUserPw(@RequestBody UserDto user) {
		UserDto userDto = userService.checkUserPw(user);
		return userDto;
	}
	
	@PostMapping("joinIn")
	public void joinUser(@RequestBody User user) {
		userService.addUser(user);
	}
	
	@GetMapping("greeting")
	public ModelAndView greeting(ModelAndView mv) {
		mv.setViewName("user/greeting");		
		return mv;
	}
	
	@GetMapping("mypage")
	public ModelAndView mypage(ModelAndView mv, HttpSession session) {
		if(session.getAttribute("userId") != null) {
			mv.setViewName("user/mypage");
		} else {
			mv.setViewName("user/login");
		}
		return mv;
	}
	
	@GetMapping("profile")
	public ModelAndView profile(HttpSession session, ModelAndView mv) {
		userService.getConnectUser(session, mv);
		return mv;
	}
	
	@PostMapping("fixUser")
	public User fixuser(@RequestBody User user, HttpServletRequest req) {
		return userService.fixUser(user, req);
	}
	
	@DeleteMapping("delUser/{userId}")
	public void delUser(@PathVariable String userId, HttpSession session) {
		userService.delUser(userId);
		userService.outSession(session);
	}
}