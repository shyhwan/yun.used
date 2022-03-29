package yunseunghwan.used.dao.map;

import java.util.List;

import yunseunghwan.used.domain.Message;

public interface MessageMap {
	List<Message> selectMsgs(int roomNum);
	void insertMsg(Message message);
}
