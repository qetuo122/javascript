package springweb.a03_mvc.a01_ctrl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import springweb.a03_mvc.a02_servce.B02_ExamService;

@Controller
@RequestMapping("/exambank.do")
public class B02_ExamCtrl {
	@Autowired(required=false)
	private B02_ExamService service;		
	
	
	// /exambank.do?method=list
	
	
	@RequestMapping(params="method=list")
	public String list(Model d) {
		d.addAttribute("exlist", service.list());
		return "a03_mvc/b02_exambankList";
	}

}
