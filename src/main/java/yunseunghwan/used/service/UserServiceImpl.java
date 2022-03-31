package yunseunghwan.used.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import yunseunghwan.used.dao.UserDao;
import yunseunghwan.used.domain.User;
import yunseunghwan.used.domain.UserDto;

@Service
public class UserServiceImpl implements UserService{
	@Autowired private UserDao userDao;
	
	@Override
	public User loginUser(User user, HttpServletRequest req) {	
		User userProfile = (User) userDao.loginUser(user);
		HttpSession session = req.getSession(false);
		if(session != null) {
			session.invalidate();
		}
		
		session = req.getSession();
		if(userProfile != null) {
			session.setAttribute("userId", userProfile.getUserId());
			session.setAttribute("nickName", userProfile.getNickName());
			session.setAttribute("user", userProfile);
			session.setMaxInactiveInterval(3600);
		}
		
		return userProfile;
	}
	
	@Override
	public void outSession(HttpSession session) {
		session.invalidate();
	}
	
	@Override
	public UserDto findId(UserDto user) {
		return userDao.findId(user);
	}
	
	@Override
	public UserDto findPw(UserDto user) {
		return userDao.findPw(user);
	}
	
	@Override
	public UserDto checkUserId(UserDto user) {
		return userDao.checkUserId(user);
	}
	
	@Override
	public UserDto checkUserNickName(UserDto user) {
		return userDao.checkUserNickName(user);
	}
	
	@Override
	public UserDto checkUserPw(UserDto user) {
		return userDao.checkUserPw(user);
	}
	
	@Override
	public List<User> getUsers() {
		return userDao.selectUsers();
	}
	
	@Override
	public ModelAndView getAdminUser(User user, ModelAndView mv) {		
		User userVal = userDao.selectUser(user.getUserId());
		mv.addObject("user", userVal);
		mv.setViewName("admin/user/userManager");
		return mv;
	}

	@Override
	public ModelAndView getConnectUser(HttpSession session, ModelAndView mv) {
		User user = (User)session.getAttribute("user");

		if(user != null) {			
			mv.setViewName("user/profile");
			mv.addObject(session.getAttribute("user"));
		} else {
			mv.setViewName("user/login");
		}

		return mv;
	}
	
	@Override
	public User getUser(String userId) {
		return userDao.selectUser(userId);
	}
	
	@Override
	public void addUser(User user) {
		userDao.insertUser(user);
	}
	
	@Override
	public User fixUser(User user, HttpServletRequest req) {
		User userProfile = (User) req.getSession().getAttribute("user");
		
		if(user.getPw().isEmpty()) {
			user.setPw(userProfile.getPw());
		}
		userDao.updateUser(user);
		User fixUser = loginUser(user, req);
		
		return fixUser;
	}
	
	@Override
	public void delUser(String userId) {
		userDao.deleteUser(userId);
	}
}
