package springweb.a03_mvc.a01_ctrl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import springweb.a03_mvc.a02_servce.B01_BoardService;
import springweb.z01_vo.Board;
import springweb.z01_vo.BoardSch;

@Controller
@RequestMapping("/board.do")
public class B01_BoardCtrl {
	@Autowired(required=false)
	private B01_BoardService service;	
	// 게시판 초기 list 화면 호출.
	// http://localhost:7080/springweb/board.do?method=list
	// ModelAttribute는 요청값을 처리할 뿐만아니라, Model로 기능을 해야할 때,
	// 선언한다.
	@RequestMapping(params = "method=list")
	public String list(@ModelAttribute("sch") BoardSch sch, Model d) {
		d.addAttribute("blist", service.list(sch));
	
		return "a03_mvc/b01_boardList";
	}
	
	@RequestMapping(params = "method=insForm")
	public String insForm(@ModelAttribute("board")Board b) {
		return "a03_mvc/b02_boardForm";
	}
	@RequestMapping(params = "method=insert")
	public String insert(Board insert) {
		System.out.println("입력할 title:"+ insert.getTitle());
		System.out.println("업로드한 파일.."+
				insert.getReport()[0].getOriginalFilename());
		
		// 입력 처리 후에 가야할 controller 호출
		service.insBoard(insert);
		return "redirect:/board.do?method=list";
	}	
	// method=detail
	@RequestMapping(params="method=detail")
	public String detail(@RequestParam("no") int no, Model d) {
		System.out.println("상세 key :"+no);
		d.addAttribute("board", service.getBoard(no));
		return "a03_mvc/b03_boardDetail";
	}
	// method=update
	@RequestMapping(params="method=update")
	public String update(Board update) {
		System.out.println("수정:"+update.getTitle());
		// forward는 해당 controller에 요청값을 같이 보낼 수 있다.
		service.updateBoard(update);
		return "forward:/board.do?method=detail";
	}
	
	@RequestMapping(params="method=delete")
	public String delete(@RequestParam("no") int no) {
		System.out.println("삭제:"+no);
		service.deleteBoard(no);
		return "redirect:/board.do?method=list";
	}	
	
	

}
