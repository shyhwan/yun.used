package yunseunghwan.used.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;

import yunseunghwan.used.domain.Chat;

public interface ChatService {
	List<Chat> getChats(String traderId);
	ModelAndView getChat(int roomNum, ModelAndView mv, HttpSession session);
	void addChat(Chat chat, ModelAndView mv, HttpSession session);
}
