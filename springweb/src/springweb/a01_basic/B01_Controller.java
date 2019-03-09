package springweb.a01_basic;

import java.util.ArrayList;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import springweb.z01_vo.Code;
import springweb.z01_vo.Person;

@Controller  // dispatcher-servlet.xml에서 메모리로 해당 객체를
//   서버가 시작하는 객체가 생성이 된다.
public class B01_Controller {
	// 스프링에서 지원하는 기본 handler mapping에 의해서
	// 특정  controller에 특정 메서드가 호출 된다..
	// web.xml에서 .do를 했을 때만, 스프링을 호출하게 했기에
	// 반드시, fontcontroller인 dispatcherServlet으로 처리하려먼
	//  url mapping 규칙을 지켜주어야 한다.
	//  http://localhost:7080/springweb/call77.do를
	//  주소창에 호출하면 지정된 메서드가 호출된다.
	@RequestMapping("/call77.do")
	public String call77(@RequestParam("name") String name,
						 @RequestParam("age") int age,
						 Person p, Model d
			) {
		// 1. 요청값을 처리하는 process
		//    http://localhost:7080/springweb/call77.do?name=himan
		///   주소?요청key=요청값&요청key=요청값
		//    1) 요청값 처리 1 : RequestParam("요청key") 받을 데이터 형식  변수명
		System.out.println("요청값으로 받은 데이터 name:"+name);
		System.out.println("요청값으로 받은 데이터 age:"+age);
		
		//    2) 요청값 처리 2 : 요청값 처리하는 부분에 객체를 선언하고,
		//        해당객체의 메서드 중에 set요청key(데이터)
		//        void setName(String name)
		//        void setAge(int age)
		System.out.println("요청값으로 받은 데이터(객체) name:"+p.getName());
		System.out.println("요청값으로 받은 데이터 (객체) age:"+p.getAge());	
		
		// 2. view에 넘겨줄 model 데이터 처리..
		//    model은 view 넘겨줄 데이터를 key, value을 설정하는 것을 말한다.
		//   1) param Model을 선언하고, String문자열로 view 호출하는 방법..
		///     -  Model은 param 마지막에 선언하는 것이 일반적이다.
//		        -  model은 view에 넘길 데이터를 key, value형식으로 전달한다.
//				- 변수만
			d.addAttribute("call01", "안녕하세요");
			// String alias, int age, String loc
//				- 객체
			d.addAttribute("obj01", new Person("신길동",25,"서울 당산"));
			//  - 배열..
			d.addAttribute("list", new String[]{"사과","바나나","딸기"});
			//  - 배열 ArrayList객체
			ArrayList<Code> clist = new ArrayList<Code>();
			clist.add(new Code("c01","컴퓨터"));
			clist.add(new Code("c02","냉장고"));
			clist.add(new Code("c03","세탁기"));
			d.addAttribute("prods", clist);
		// 3. 어떤 view을 호출할지를 지정..
		// 4. 요청값 + model : modelAttribute();
		// 5. model + view : ModelAndView
		System.out.println("호출되었습니다!cal77.do");
		// 호출할 view 선언..
		// WEB-INF/view/a01_basic/b01_showView.jsp
		return "a01_basic/b01_showView";
	}
	@RequestMapping("/call88.do")
	public ModelAndView call88() {
		// ModelAndView : 모델과 view를 같이 처리하는 객체..
		ModelAndView mav = new ModelAndView();
		// 모델 처리..
		mav.addObject("greet01", "좋은하루!");
		mav.setViewName("a01_basic/b02_showModelView");
		
		return mav;
	}
	
	

}
