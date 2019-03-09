package springweb.a02_di;

import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.xml.XmlBeanFactory;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;

import springweb.z01_vo.Mart;

public class A04_DIExp {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		// xml에 선언한 내용을 객체에 메모리 올리기 위한 순서.
		// 1. 해당 xml 파일을 Resource 객체로 할당.
		Resource rs = new ClassPathResource("springweb\\a02_di\\diexp04.xml");
		// 2. BeanFactory를 통해 할당.
		BeanFactory bean = new XmlBeanFactory(rs);
		// 3. 해당 객체의 getBean("xml에서 선언한 id명")
		Mart m01 = (Mart)bean.getBean("mart01");
		m01.buyList();
	}
/* 확인예제.
	Accounts 은행계좌 객체  
		계좌명
	SaveOrDraw  :수입지출내역..(날짜, 내역, 구분, 금액)
		계좌명 @@@
	날짜   내용     입금    출금   잔액
	
	
	
*/	
}
