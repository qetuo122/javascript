package springweb.a05_ajax;

import java.util.ArrayList;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import springweb.a03_mvc.a02_servce.A01_EmpService;
import springweb.z01_vo.Emp;
import springweb.z01_vo.Person;

@Controller
@RequestMapping("/ajax.do")
public class A01_AjaxCtrl {
	@Autowired(required=false)
	private A01_EmpService service;
	
	
	// 초기 화면 호출../ajax.do?method=form
	@RequestMapping(params="method=form")
	public String ajaxForm() {
		return "a05_ajax/a01_initForm";
	}
	// method=level01
	@ResponseBody  // return한 문자열을 client에 전달할 때, 활용된다.
	@RequestMapping(params="method=level01")
	public String level01(Emp sch) {
		// 요청값  : ename=A&job=D&sal=1000
		// 1. 요청값 받는 형식
		//    1) level01(@RequestParam("ename") String ename )
		//    2) Emp sch 로 받을려면..
		//         setEname(String s), setJob(String s)가 구현 되어 있으면.
		//         객체로 받는다..
		//       - 주의(sal=1000)
		//         void setSal(String s) : 받을 수 있는    String s = "1000";
		//         sal=& 값을 넘기지 않거나, sal=himan
		//         void setSal(int num ) : 받을 수 없다, Emp 객체로 받지 못한다.
		//           int num = ""; int num = "himan";
		//         숫자데이터를 넘기지 못할때는 default  sal=0
		System.out.println("요청값:"+sch.getEname());
		System.out.println("요청값:"+sch.getJob());
		// 간단한 데이터를 확인할 때, 주로 활용한다. 
		// @ResponseBody 는 문자열로 데이터를 넘길 때 활용한다.
		
		return "^^ gogo!!"+sch.getEname()+","+sch.getJob();
	}
	@RequestMapping(params="method=level02")
	public String level02(Emp sch, Model d) {
		d.addAttribute("emplist", service.emplist(sch));	
		
		// ArrayList를 [{}] json문자열 형식으로 pageJsonReport 변환처리..
		return "pageJsonReport";
	}

	@RequestMapping(params="method=level03",method = {RequestMethod.GET, RequestMethod.POST})
	public String level03(@RequestParam("list") String list,
			Model d) throws ParseException {
		// 문자열 json 배열 ==> ArrayList형태로 변환처리..
		// 1. JSONParser를 통해서  객체로 변환처리..  [{"name":"홍길동"},{"name":"신길동"}]
		// 2. JSONArray로  typecasting을 통해서 배열로 json 배열로 변환..
		// 3. JSONObject를 통해서  {"name":"홍길동"}  배열 안에 있는 객체를 뽑아낸다.
		//     array.get(idx)를 통해서 
		// 4. ob.get("속성") json 안에 속성으로  가져 온다.
		// JSONArray, 
		JSONParser parser = new JSONParser();
		Object obj = parser.parse( list ); 
		JSONArray array = (JSONArray)obj;
		System.out.println(array.size());
		ArrayList<Person> plist = new ArrayList<Person>();
		// [{"name":"홍길동","fav":["낚시","게임","운동"]},{"name":"신길동"}]
		for(int idx=0;idx<array.size();idx++) {
			JSONObject ob =(JSONObject)array.get(idx);
			Person p = new Person();
			p.setName((String)ob.get("name"));
			// 실수는 (Double)
			// 정수는 (Long)
			Long ageW = (Long) ob.get("age");
			p.setAge( ageW.intValue() );
			p.setLoc((String)ob.get("loc"));
			JSONArray arr = (JSONArray)ob.get("fav");
			System.out.println("배열크기:"+arr.size());
			//   객체.fruits="사과^바나나".split("^")
			ArrayList<String> faList = new ArrayList<String>();
			for(int idx2=0;idx2<arr.size();idx2++) {
				faList.add((String)arr.get(idx2));
				//System.out.println((String)arr.get(idx2));
			}
			System.out.println("fav크기:"+faList.size());
			//System.out.println("배열:"+(JSONArray)ob.get("fav"));
			
			
			plist.add(p);
			
			
			System.out.println(ob.get("name")+":"+ob.get("age")+":"+ob.get("loc"));	
		}
		
		
		
		System.out.println("요청 처리 크기:"+plist.size());
		// DB 처리를 통해서 요청값 mapping 처리 완료..

		
		return "pageJsonReport";
	}	
}
