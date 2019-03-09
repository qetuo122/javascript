package springweb.a01_basic;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

// 현재 컨트롤러에서는 모두가 /callMethod.do로 호출한다.
@Controller
@RequestMapping("/callMethod.do")
public class A03_MethoCtrl {
	
	// get방식으로 호출할 때, 
	// 1. url로 호출할 때, href로 통해서 이동할 때..
	// 2. form method 속성값을 선언하지 않거나, 
	//      method="get"으로 선언할 때..
	@RequestMapping(method=RequestMethod.GET)
	public String init() {
		System.out.println("get방식으로 호출된 jsp");
		return "a02_call/a01_methodExp";
	}
	@RequestMapping(method=RequestMethod.POST)
	public String init2() {
		System.out.println("post방식으로 호출된 jsp");
		return "a02_call/a01_methodExp";
	}	
	@RequestMapping(params="method=call01")
	public String call01() {
		System.out.println("입력값 : method=call01 호출");
		return "a02_call/a01_methodExp";
	}
	@RequestMapping(params="method=call02")
	public String call02() {
		System.out.println("입력값 : method=call02 호출");
		return "a02_call/a01_methodExp";
	}
	@RequestMapping(params="method=call03")
	public String call03() {
		System.out.println("입력값 : method=call03 호출");
		return "a02_call/a01_methodExp";
	}	
	// name에 설정된 내용으로 RequestParam("num01")으로 데이터값 받아서..
	// Model  d로 view에 전달할 수 있다.
	// num01=25&num02=30 
	@RequestMapping(params="method=calcu")
	public String calcu(@RequestParam("num01") int num01,
						@RequestParam("num02") int num02,
						Model d
					) {
		System.out.println("입력값 : method=call03 호출");
		d.addAttribute("plus", num01+ " + "+num02+" = "+ (num01+num02));
		// view에  plus라는 이름으로 ${plus}으로 전달 한다..
		return "a02_call/a01_methodExp";
	}		
/*	Controller를 새로 만들고,
1. 요청이름은  /springweb/call77.do로
	get방식과 post방식으로 호출할 화면,  a02_callExp.jsp를 호출하세요.
2. params로  show=call01로  
	call01 메서드를 호출하세요..
3. params  show=calcu01 로..
	화면에  가격[   ] 갯수[   ]
	 		[총계] 를 처리하여   총계 물건 가격 @@@를 @@개 구매하여 총비용이 @@@ 입니다.
	 		를 출력하세요..
*/	
}
