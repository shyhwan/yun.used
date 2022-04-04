package yunseunghwan.used.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import yunseunghwan.used.dao.ChatDao;
import yunseunghwan.used.dao.TradeDao;
import yunseunghwan.used.dao.UserDao;
import yunseunghwan.used.domain.Chat;
import yunseunghwan.used.domain.Trade;
import yunseunghwan.used.domain.User;

@Service
public class ChatServiceImpl implements ChatService{
	@Autowired private ChatDao chatDao;
	@Autowired private UserDao userDao;
	@Autowired private TradeDao tradeDao;
	
	@Override
	public List<Chat> getChats(String traderId) {	
		return chatDao.selectChats(traderId);
	}
	
	@Override
	public ModelAndView getChat(String userId, int tradeNum, ModelAndView mv, HttpSession session) {
		if(session.getAttribute("userId") != null) {
			Chat chatVal = chatDao.checkRoom(userId, tradeNum);
			User user = userDao.selectUser(userId);
			String traderId = null;
			User trader = null;
			
			if(chatVal == null) {
				Trade trade = tradeDao.selectTrade(tradeNum);
				traderId = trade.getTraderId();
				trader = userDao.selectUser(traderId);
			} else {
				traderId = chatVal.getTraderId();			
				trader = userDao.selectUser(chatVal.getTraderId());
				mv.addObject("chatRoom", chatVal);
			}

			if(userId == traderId) {			
				mv.addObject("traderNickName", user.getNickName());
			} else {			
				mv.addObject("traderNickName", trader.getNickName());
			}
			mv.setViewName("chat/room");
		} else {
			mv.setViewName("user/login");
		}
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
