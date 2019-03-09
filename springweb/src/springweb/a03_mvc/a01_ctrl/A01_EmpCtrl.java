package springweb.a03_mvc.a01_ctrl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import springweb.a03_mvc.a02_servce.A01_EmpService;
import springweb.z01_vo.Emp;

@Controller
public class A01_EmpCtrl {
	// http://localhost:7080/springweb/emplist.do
	@Autowired(required=false)
	private A01_EmpService service;
	@RequestMapping("/emplist.do")
	public String empList(Emp sch, Model d) {
		// 1. 요청 값을 받아서 service에 전달
		//     ename=himan&job=cleark ==> sch.setEname("himan")\
		//                            ==> sch.setJob("cleark")
		System.out.println("조회");

		// view단에 보내줄 모델객체 선언..
		// 2. 화면에 보낼 모델객체를 mapping  key와 value로 처리된다.
		d.addAttribute("list", service.emplist(sch));
		
		// 3. view 지정해서, 모델을 view넘기면서 view를 호출한다.
		//    1) bean?  .jsp 냐? 
		return "a03_mvc\\a01_empList";
	}
	// emplistExcel.do emplistPdf.do
	@RequestMapping("/emplistExcel.do")
	public String emplistExcel(Emp sch, Model d) {
		System.out.println("엑셀다운로드");
		
		d.addAttribute("emplist", service.emplist(sch));
		// view를 excel 다운로드하는 view 호출..		
		return "exlEmp";
	}	
	@RequestMapping("/emplistPdf.do")
	public String emplistPdf(Emp sch, Model d) {
		System.out.println("pdf다운로드");
		d.addAttribute("emplist", service.emplist(sch));
		// view를 pdf 다운로드하는 view 호출..		
		return "pdfEmp";
	}		
	
}
