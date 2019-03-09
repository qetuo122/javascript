package springweb.a03_mvc.a01_ctrl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import springweb.a03_mvc.a02_servce.B04_ScheduleService;
import springweb.z01_vo.Schedule;

@Controller
@RequestMapping("/schedule.do")
public class B04_ScheduleCtrl {
	@Autowired(required=false)
	private B04_ScheduleService service;
	// /schedule.do?method=list
	@RequestMapping(params="method=list")
	public String list(Model d) {
		d.addAttribute("list", service.schelist());
		return "a03_mvc/b04_scheList";
	}
	// method=insert
	@RequestMapping(params="method=insert")
	public String insert(Schedule insert) {

		service.insert(insert);
		return "redirect:/schedule.do?method=list";
	}
}
