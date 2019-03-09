package springweb.a01_basic;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class A02_CallCtrl {
	// http://localhost:7080/springweb/call04.do
	@RequestMapping("/call04.do")
	public String callAnn(Model d) {
		d.addAttribute("msg", "반갑습니다! 감사합니다.");
		return  "a01_basic/a04_call";
	}

}
