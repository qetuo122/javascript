package springweb.a03_mvc.a01_ctrl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import springweb.a03_mvc.a02_servce.A01_EmpService;
import springweb.z01_vo.Dept;

@Controller
public class A02_DeptCtrl {
	@Autowired(required=false)
	private A01_EmpService service;
	
	
	@RequestMapping("/deptList.do")
	public String deptlist(Dept sch, Model d) {
		
		System.out.println(service.deptlist(sch).size());
		d.addAttribute("dlist",service.deptlist(sch));
		
		return "a03_mvc\\a02_deptList";
	}
}
