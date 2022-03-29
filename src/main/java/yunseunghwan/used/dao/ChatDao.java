package yunseunghwan.used.dao;

import java.util.List;

import yunseunghwan.used.domain.Chat;

public interface ChatDao {
	List<Chat> selectChats(String traderId);
	Chat selectChat(int roomNum);
	void insertChat(Chat chat);
	Chat checkRoom(String userId, int tradeNum);
}
