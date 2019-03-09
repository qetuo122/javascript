package springweb.a01_basic;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import springweb.z01_vo.Member;

// controller에서 세션을 설정할 수 있다.
// 1. controller 하단에 annotation으로 SessionAttribute("세션명")을 설정.
// 2. session 설정할 객체를 위에 선언한 세션명과 동일하게 modelAttribute로 선언한다.
// 3. 요청값과 해당 데이터 처리하는 modelattribute이름을  세션명과 동일하게 한다.
@Controller
@SessionAttributes("member")
public class A04_SessionCtrl {
	@ModelAttribute("member")
	public Member getMember() {
		return new Member();
	}
	@RequestMapping("/sesLogin.do")
	public String login(@ModelAttribute("member") Member m) {
		String page="a01_basic/a10_loginForm";
		if(m!=null && m.getId()!=null && m.getPass()!=null
			&& m.getId().equals("himan")
			&&m.getPass().equals("7777")) {
			m.setName("홍길동");
			m.setAuth("일반회원");
			m.setPoint(80000);
			page="a01_basic/a11_mainForm";
		}
		return page;
	}
	

}
