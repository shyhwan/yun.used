package yunseunghwan.used.service;

import java.util.List;
import yunseunghwan.used.domain.Message;

public interface MessageService {
	List<Message> getMsgs(int roomNum);
	void addMsg(Message message);
}
