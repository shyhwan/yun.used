package yunseunghwan.used.dao.map;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import yunseunghwan.used.domain.Chat;

public interface ChatMap {
	List<Chat> selectChats(String traderId);
	Chat selectChat(int roomNum);
	void insertChat(Chat chat);
	Chat checkRoom(@Param("userId") String userId, @Param("tradeNum") int tradeNum);
}
