package springweb.a03_mvc.a01_ctrl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import springweb.a03_mvc.a02_servce.B03_HirachService;
import springweb.z01_vo.Hira;

@Controller
@RequestMapping("/hira.do")
public class B03_HirachCtrl {
	// /hira.do?method=list
	@Autowired(required=false)
	private B03_HirachService service;
	
	@RequestMapping(params="method=list")
	public String list(Model d) {
		d.addAttribute("list", service.hiralist());
		return "a03_mvc/b03_hirachExp";
	}
	// method=insert
	@RequestMapping(params="method=insert")
	public String insert(Hira insert) {
		System.out.println(insert.getShow()+":"+insert.getRefno());
		service.insert(insert);
		return "redirect:/hira.do?method=list";
	}

}
