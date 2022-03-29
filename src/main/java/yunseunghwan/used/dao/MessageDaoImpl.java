package yunseunghwan.used.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import yunseunghwan.used.dao.map.MessageMap;
import yunseunghwan.used.domain.Message;

@Repository
public class MessageDaoImpl implements MessageDao {
	@Autowired private MessageMap messageMap;
	
	@Override
	public List<Message> selectMsgs(int roomNum) {
		return messageMap.selectMsgs(roomNum);
	}
	
	@Override
	public void insertMsg(Message message) {
		messageMap.insertMsg(message);
	}
}
