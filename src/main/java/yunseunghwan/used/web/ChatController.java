package yunseunghwan.used.web;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import yunseunghwan.used.domain.Chat;
import yunseunghwan.used.domain.Message;
import yunseunghwan.used.service.ChatService;
import yunseunghwan.used.service.MessageService;

@RestController
@RequestMapping("chat")
public class ChatController {
	@Autowired private ChatService chatService;
	@Autowired private MessageService messageService;
	
	@GetMapping
	public ModelAndView chats(ModelAndView mv, HttpSession session) {
		if(session.getAttribute("userId") != null) {
			mv.setViewName("chat/list");
		} else {
			mv.setViewName("user/login");
		}
		return mv;
	}
	
	@GetMapping("list")
	public List<Chat> chatList(HttpSession session) {
		String traderId = (String) session.getAttribute("userId");
		return chatService.getChats(traderId);
	}

	@PostMapping("add")
	public void startChat(@RequestBody Chat chat) {
		chatService.addChat(chat);
	}
	
	@GetMapping("room")
	public ModelAndView chatRoom(String userId, int tradeNum, ModelAndView mv, HttpSession session) {
		return chatService.getChat(userId, tradeNum, mv, session);
	}
	
	@GetMapping("log/{roomNum}")
	public List<Message> messageLog(@PathVariable int roomNum) {
		return messageService.getMsgs(roomNum);
	}
	
	@PostMapping("sendMsg")
	public void sendMsg(@RequestBody Message message) {
		messageService.addMsg(message);
	}
}
