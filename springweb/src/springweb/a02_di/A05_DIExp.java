package springweb.a02_di;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

import springweb.z01_vo.Man;
import springweb.z01_vo.Mart;
import springweb.z01_vo.duckworld.AnnoDuck;
import springweb.z01_vo.duckworld.Duck;

public class A05_DIExp {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		String rs ="springweb\\a02_di\\diexp05.xml";
		AbstractApplicationContext ctx = new GenericXmlApplicationContext(rs);
		Man m01 = ctx.getBean("m01",Man.class);
		m01.show();
/*		
Mart와 Product 클래스를 autowire 처리하여 출력하세요.
*/
		Mart mart01 = ctx.getBean("mart01",Mart.class);
		mart01.buy();
		Duck duck01 = ctx.getBean("duck01", Duck.class);
		duck01.flying();
		AnnoDuck duck02 = ctx.getBean("duck02", AnnoDuck.class);
		duck02.setKind("청둥오리2");
		duck02.flying();
		
		
	}

}
