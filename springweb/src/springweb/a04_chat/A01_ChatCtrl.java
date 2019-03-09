package springweb.a04_chat;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import springweb.z01_vo.Person;

@Controller("/chat.do")
public class A01_ChatCtrl {
	@Autowired(required=false)
	private A02_ChatService service;
//	http://localhost:7080/springweb/chat.do?method=init
	@RequestMapping(params = "method=init")
	public String chat(Model d) {
		
		d.addAttribute("list", service.getCurrLogin());		
		
		return "a04_chat/a01_chatForm";
	}
	
	@RequestMapping(params = "method=getCurrLogin")
	public String getGroup(Model d) {
		System.out.println("ajax");
		System.out.println("ajax:"+service.getCurrLogin().size());
		d.addAttribute("list", service.getCurrLogin());	
		
		return "pageJsonReport";
	}
}
