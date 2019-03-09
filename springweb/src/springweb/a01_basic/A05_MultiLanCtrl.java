package springweb.a01_basic;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.LocaleResolver;

import springweb.z01_vo.Code;

@Controller
@RequestMapping("/multi.do")
public class A05_MultiLanCtrl {
	// dispatcher-servlet.xml에 선언된 bean객체 자동 wire처리..
	@Autowired(required=false)
	private LocaleResolver localResolver;
//	/multi.do?method=init
	@RequestMapping(params="method=init")
	public String show() {
		return "a01_basic/a13_multilang";
	}
//	method=lang&lang=
	@RequestMapping(params="method=lang")
	public String lang(@RequestParam("lang")String lang,
			HttpServletRequest req, HttpServletResponse res
			) {
		System.out.println("선택한 언어:"+lang);
//		선택된 언어를 dispatcher-servlet.xml에 있는 localeResolver에서 처리..
		localResolver.setLocale(req, res, new Locale(lang));
		
		
		return "a01_basic/a13_multilang";
	}
	
	
	
//	화면단에서 code값으로 불러들일 때, 사용할 수 있다.
	@ModelAttribute("chLan")
	public Code[] chLan() {
		Code[] chLan = {new Code("ko","ko"),new Code("en","en")};
		
		return chLan;
	}
	
	
	
}
