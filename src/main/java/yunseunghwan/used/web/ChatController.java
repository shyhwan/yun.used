package yunseunghwan.used.web;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
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
	public ModelAndView chats(ModelAndView mv) {
		mv.setViewName("chat/list");
		return mv;
	}
	
	@GetMapping("list")
	public List<Chat> chatList(HttpSession session) {
		String traderId = (String) session.getAttribute("userId");
		return chatService.getChats(traderId);
	}
	
	@PostMapping("add")
	public void startChat(@RequestBody Chat chat, ModelAndView mv, HttpSession session) {
		chatService.addChat(chat, mv, session);
	}
	
	@GetMapping("room")
	public ModelAndView chatRoom(int roomNum, ModelAndView mv, HttpSession session) {
		return chatService.getChat(roomNum, mv, session);
	}
	
	@GetMapping("log")
	public List<Message> messageLog(int roomNum) {
		return messageService.getMsgs(roomNum);
	}
	
	@PostMapping("sendMsg")
	public void sendMsg(@RequestBody Message message) {
		messageService.addMsg(message);
	}
}
