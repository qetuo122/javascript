package springweb.b02_mail;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/mail.do")
public class A01_MailCtrl {
	@Autowired(required=false)
	protected A02_MailService service;
		
	// 초기 화면  http://localhost:7080/springweb/mail.do?method=form
	@RequestMapping(params = "method=form")
	public String form() {
		return "b02_mail/a01_mailForm";
	}
	@RequestMapping(params = "method=send")
	public String send(Mail send) throws Exception {
		
		System.out.println("제목:"+send.getSubject());
		service.sendMail(send);
		
		return "b02_mail/a01_mailForm";
	}

}
