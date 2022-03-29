package yunseunghwan.used.dao;

import java.util.List;

import yunseunghwan.used.domain.Message;

public interface MessageDao {
	List<Message> selectMsgs(int roomNum);
	void insertMsg(Message message);
}
