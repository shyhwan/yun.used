package yunseunghwan.used.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;

import yunseunghwan.used.domain.User;
import yunseunghwan.used.domain.UserDto;

public interface UserService {
	User loginUser(User user, HttpServletRequest req);
	void outSession(HttpSession session);
	UserDto findId(UserDto user);
	UserDto findPw(UserDto user);
	UserDto checkUserId(UserDto user);
	UserDto checkUserNickName(UserDto user);
	UserDto checkUserPw(UserDto user);
	List<User> getUsers();
	ModelAndView getAdminUser(User user, ModelAndView mv, HttpSession session);
	ModelAndView getConnectUser(HttpSession session, ModelAndView mv);
	User getUser(String userId);
	void addUser(User user);
	User fixUser(User user, HttpServletRequest req);
	void delUser(String userId);
}
