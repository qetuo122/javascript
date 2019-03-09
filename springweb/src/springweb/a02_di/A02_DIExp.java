package springweb.a02_di;

import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.xml.XmlBeanFactory;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;

import springweb.z01_vo.Man;

public class A02_DIExp {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		// xml에 선언한 내용을 객체에 메모리 올리기 위한 순서.
		// 1. 해당 xml 파일을 Resource 객체로 할당.
		Resource rs = new ClassPathResource("springweb\\a02_di\\diexp02.xml");
		// 2. BeanFactory를 통해 할당.
		BeanFactory bean = new XmlBeanFactory(rs);
		// 3. 해당 객체의 getBean("xml에서 선언한 id명")
		Man m01 = (Man)bean.getBean("m01");
		m01.show();
	}
/*
diexp04.xml  A04_DIExp.java  
VO : Mart.java  Product.java
@@@ 마트에 가서  물건 @@@를 @@개 구매하였다.
를 위 두객체를 통해 처리할 수 있도록 하고, xml에 객체 생성, A04_DIExp.java에서 로딩
및 출력 처리하세요.


	
	
*/	
}
