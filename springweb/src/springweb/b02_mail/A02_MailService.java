package springweb.b02_mail;

import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service
public class A02_MailService {
	// container에서 만들었던  JavaMailSender 호출..
	@Autowired(required=false)
	protected JavaMailSender mailSender;
	
	// 메일 전송시 처리할 내용..
	public void sendMail(Mail email) throws Exception {
		// 1. 전송할 내용을 MimeMessage로 처리.
		MimeMessage msg = mailSender.createMimeMessage();
		
		// 2. 발신자 지정 :
		msg.setFrom(new InternetAddress(email.getSender()));
		// 3. 제목 지정.
		msg.setSubject(email.getSubject());
		// 4. 내용 지정..
		msg.setText(email.getContent());
		// 5. 수신자 지정..
		msg.setRecipient(RecipientType.TO, 
				new InternetAddress(email.getReceiver()));
		mailSender.send(msg);
		
	}
	
	
	
	
	
}
