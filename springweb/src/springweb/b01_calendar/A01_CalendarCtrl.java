package springweb.b01_calendar;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import springweb.z01_vo.Calendar;

@Controller
@RequestMapping("/calendar.do")
public class A01_CalendarCtrl {
	@Autowired(required=false)
	private A02_CalendarService service;
	
	// http://localhost:7080/springweb/calendar.do?method=list&id=himan
	@RequestMapping(params="method=list")
	public String list() {
		System.out.println("캘린더크기:"+service.list().size());
		// ${param.id}
		return "b01_calendar/a01_fullcal";
	}
// http://localhost:7080/springweb/calendar.do?method=data
	@RequestMapping(params="method=data")
	public String getData(Model d) {
		System.out.println("calendar  요청!");
		//System.out.println("요청값:"+name);
		// pageJsonReport : ArrayList<VO> --> json 변환 처리 springlib
		d.addAttribute("list", service.list());
		return "pageJsonReport";
	}
	@RequestMapping(params="method=insert")
	public String ajaxInsert(Calendar insert) {
		// calendar.do?method=insert
		System.out.println("###입력된 Content:"+insert.getContent());
		service.insert(insert);
		return "redirect:/calendar.do?method=data";
	}
	@RequestMapping(params="method=update")
	public String ajaxUpdate(Calendar update) {

		System.out.println("수정 id:"+update.getId());
		System.out.println("수정 타이틀:"+update.getTitle());
		
		service.update(update);

		return "redirect:/calendar.do?method=data";
	}	
	@RequestMapping(params="method=delete")
	public String ajaxDelete(@RequestParam("id") int id) {

		System.out.println("삭제 id:"+id);
		service.delete(id);
		return "redirect:/calendar.do?method=data";
	}		
}
