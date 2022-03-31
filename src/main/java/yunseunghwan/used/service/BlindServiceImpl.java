package yunseunghwan.used.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import yunseunghwan.used.dao.BlindDao;
import yunseunghwan.used.domain.Blind;
import yunseunghwan.used.domain.User;

@Service
public class BlindServiceImpl implements BlindService{
	@Autowired private BlindDao blindDao;
	
	@Override
	public List<Blind> getBlinds() {
		return blindDao.selectBlinds();
	}
	
	@Override
	public ModelAndView getBlind(Blind blind, ModelAndView mv, HttpSession session) {
		User user = (User) session.getAttribute("user");
		Blind blindVal = blindDao.selectBlind(blind);
		String userId = blindVal.getUserId();	
		
		mv.addObject("user", user);
		mv.addObject("blind", blindVal);
		mv.addObject("writeUserId", userId);
		return mv;
	}
	
	@Override
	public void addBlind(Blind blind) {
		blindDao.insertBlind(blind);
	}
	
	@Override
	public void fixBlind(Blind blind) {
		blindDao.updateBlind(blind);
	}
	
	@Override
	public void delBlind(int blindNum) {
		blindDao.deleteBlind(blindNum);
	}
}
