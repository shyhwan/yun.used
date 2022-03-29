package yunseunghwan.used.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import yunseunghwan.used.dao.map.ChatMap;
import yunseunghwan.used.domain.Chat;

@Repository
public class ChatDaoImpl implements ChatDao{
	@Autowired private ChatMap chatMap;
	
	@Override
	public List<Chat> selectChats(String traderId) {
		return chatMap.selectChats(traderId);
	}
	
	@Override
	public Chat selectChat(int roomNum) {
		return chatMap.selectChat(roomNum);
	}
	
	@Override
	public void insertChat(Chat chat) {
		chatMap.insertChat(chat);
	}
	
	@Override
	public Chat checkRoom(String userId, int tradeNum) {
		return chatMap.checkRoom(userId, tradeNum);
	}
}
