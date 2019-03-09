package springweb.a01_basic;

import java.util.ArrayList;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import springweb.z01_vo.Code;
import springweb.z01_vo.Member;

@Controller
public class A03_CallView {
	@RequestMapping("callView.do")
	public String call() {
		// dispatcher-servlet.xml에서
		// prefix로.. 경로 지정.
		// suffix로..  .jsp를 
		// 설정 했기 때문에, 상위 경로와 .jsp는 생략해야함..
		return "a01_basic/a05_call";
	}
	@RequestMapping("login2.do")
	public String login2(Member login, Model d) {
		System.out.println("아이디:"+login.getId());
		System.out.println("패스워드:"+login.getPass());
		String result="로그인 실패";
		if(login.getId().equals("himan") 
				&& login.getPass().equals("7777")) {
			result="로그인 성공";
		}
		d.addAttribute("msg", result);
		
		return "a01_basic/a05_call";
	}
	@RequestMapping("memRegForm.do")
	public String form() {
		return "a01_basic/a05_memForm";
	}
	// ModelAttribute : 공통되는 코드나 데이터를 현재 controller을 불러 줄때 활용해야 되는 경우
	// 사용한다.
	@ModelAttribute("hobby")
	public ArrayList<String> getHobby(){
		ArrayList<String> list = new ArrayList<String>();
		list.add("운동");
		list.add("등산");
		list.add("독서");
		list.add("게임");
		list.add("음악감상");
		list.add("기타");
		return list;
	}
	@ModelAttribute("gender")
	public ArrayList<Code> getGender(){
		ArrayList<Code> list = new ArrayList<Code>();
		list.add(new Code("M","남자"));
		list.add(new Code("F","여자"));
		return list;
	}	
	
	
	
	
}
