package yunseunghwan.used.service;

import java.util.List;

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
	public ModelAndView getChat(String userId, int tradeNum, ModelAndView mv) {
		Chat chatVal = chatDao.checkRoom(userId, tradeNum);
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
	public void addChat(Chat chat) {
		Chat getChat = chatDao.checkRoom(chat.getUserId(), chat.getTradeNum());
		
		if(getChat == null) {
			chatDao.insertChat(chat);			
		}
	}
}
