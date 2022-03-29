package yunseunghwan.used.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import yunseunghwan.used.dao.MessageDao;
import yunseunghwan.used.domain.Message;

@Service
public class MessageServiceImpl implements MessageService{
	@Autowired private MessageDao messageDao;
	
	@Override
	public List<Message> getMsgs(int roomNum) {
		return messageDao.selectMsgs(roomNum);
	}
	
	@Override
	public void addMsg(Message message) {
		messageDao.insertMsg(message);
	}
}
