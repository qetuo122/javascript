package springweb.a02_di;

import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.xml.XmlBeanFactory;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;

import springweb.z01_vo.Person;

public class A00_DIExp {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		// xml에 선언한 내용을 객체에 메모리 올리기 위한 순서.
		// 1. 해당 xml 파일을 Resource 객체로 할당.
		Resource rs = new ClassPathResource("springweb\\a02_di\\diexp01.xml");
		// 2. BeanFactory를 통해 할당.
		BeanFactory bean = new XmlBeanFactory(rs);
		// 3. 해당 객체의 getBean("xml에서 선언한 id명")
		Person p = (Person)bean.getBean("p");
		//    으로 객체 호출..
		// 4. 객체의 메서드 활용..
		System.out.println("이름:"+p.getName());
		System.out.println("나이:"+p.getAge());
		System.out.println("사는 곳:"+p.getLoc());
		Person p2 = (Person)bean.getBean("p2");
		System.out.println("2이름:"+p2.getName());
		System.out.println("2나이:"+p2.getAge());
		System.out.println("2사는 곳:"+p2.getLoc());		
/*
diexp02.xml,  vo: Book 도서명 가격 출판사   A01_DIExp.java 호출하여..
		해당 정보를 출력 처리..
*/		
	}

}
