package yunseunghwan.used.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;

import yunseunghwan.used.domain.Blind;

public interface BlindService{
	List<Blind> getBlinds();
	ModelAndView getBlind(Blind blind, ModelAndView mv, HttpSession session);
	void addBlind(Blind blind);
	void fixBlind(Blind blind);
	void delBlind(int blindNum);
}
