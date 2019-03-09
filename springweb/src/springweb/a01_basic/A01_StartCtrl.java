package springweb.a01_basic;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/*
# spring의 controller의 선언 규칙..
// 1. 클래스에 conroller라는 표시로 annotation을 선언해준다.
// 2. dispatcher-servlet.xml 에 등록 해준다.(추후에 자동등록이 될 수 있다)
//  springweb.a01_basic.A01_StartCtrl
*/
@Controller
public class A01_StartCtrl {
	
	// Value(설정된key) : 해당 매핑된 변수 driver로 할당되어 사용할 수 있다.
	@Value("${driver}")
	private String driver;
	// 요청 url로 바로 메서드마다 mapping 처리..
	// http://localhost:7080/springweb/start.do
	@RequestMapping("/start.do")
	public String start() {
		System.out.println("드라이버:"+driver);
		// view단 호출..
		return "a01_basic\\a01_startView";
	}
/* 연습예제..
 A02_Exp.java   /call01.do  a02_startView 호출.
 * 	
*/	
//	login.do?id=@@@&pass=@@
	@RequestMapping("/login.do")
	public String login(@RequestParam("id") String id,
						@RequestParam("pass") String pass,
						Model d) {
		// 로그인 실패시.
		String page="a01_basic\\a01_startView";
		if(id!=null&&pass!=null) {
			if(id.equals("himan")&&pass.equals("7777")) {
				d.addAttribute("result", "로그인 성공");
				page="a01_basic\\a02_mainView";
			}else {
				d.addAttribute("result", "로그인 실패");
			}
		}
		return page;
	}
/*
계산기 처리..
[    ][연산자선택][   ]
       [결과]	
    2 X 3 = 6	
*/	
	@RequestMapping("/calForm.do")
	public String calForm() {
		return "a01_basic\\a03_calcu";
	}		
	@RequestMapping("/calcu.do")
	public String cal(@RequestParam("num01") int num01,
						@RequestParam("num02") int num02,
						@RequestParam("cal") int cIdx,
						Model d) {
		int [] cal = {num01+num02,num01-num02,num01*num02,num01/num02};
		String [] calStr = {" + "," - "," X "," / "};
		d.addAttribute("result", num01 +calStr[cIdx]+num02 
				+ " = "+cal[cIdx]);
		
		return "a01_basic\\a03_calcu";
	}	
	
}
