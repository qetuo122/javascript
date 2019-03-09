package springweb.a04_chat;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class A02_ChatController {
//	http://localhost:7080/springweb/chat2.do
	@RequestMapping("/chat2.do")
	public String chat() {
		return "a04_chat/a02_chatForm";
	}
	
}
