package yunseunghwan.used.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import yunseunghwan.used.dao.ChatDao;
import yunseunghwan.used.dao.UserDao;
import yunseunghwan.used.domain.Chat;
import yunseunghwan.used.domain.User;

@Service
public class ChatServiceImpl implements ChatService{
	@Autowired private ChatDao chatDao;
	@Autowired private UserDao userDao;
	
	@Override
	public List<Chat> getChats(String traderId) {	
		return chatDao.selectChats(traderId);
	}
	
	@Override
	public ModelAndView getChat(int roomNum, ModelAndView mv, HttpSession session) {
		String userId = (String) session.getAttribute("usreId");
		Chat chatVal = chatDao.selectChat(roomNum);
		String traderId = chatVal.getTraderId();
		User trader = userDao.selectUser(chatVal.getTraderId());
		User user = userDao.selectUser(chatVal.getUserId());
		
		if(userId == traderId) {			
			mv.addObject("traderNickName", user.getNickName());
		} else {			
			mv.addObject("traderNickName", trader.getNickName());
		}
		mv.addObject("chatRoom", chatVal);
		mv.setViewName("chat/room");
		return mv;
	}
	
	@Override
	public ModelAndView addChat(Chat chat, ModelAndView mv) {
		Chat getChat = chatDao.checkRoom(chat.getUserId(), chat.getTradeNum());
		
		if(getChat == null) {
			chatDao.insertChat(chat);			
		}
		getChat = chatDao.checkRoom(chat.getUserId(), chat.getTradeNum());
		
		mv.addObject("chatRoom", getChat);
		mv.setViewName("chat/room");
		return mv;
	}
}
