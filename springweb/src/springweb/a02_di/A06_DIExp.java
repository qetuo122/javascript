package springweb.a02_di;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

import springweb.z01_vo.Man;
import springweb.z01_vo.Mart;
import springweb.z01_vo.duckworld.AnnoDuck;
import springweb.z01_vo.duckworld.Duck;

public class A06_DIExp {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		String rs ="springweb\\a02_di\\diexp06.xml";
		AbstractApplicationContext ctx = new GenericXmlApplicationContext(rs);
		Man m01 = ctx.getBean("man",Man.class);
		m01.setName("홍길동");
		m01.show();
		AnnoDuck an = ctx.getBean("annoDuck",AnnoDuck.class);
		an.setKind("흰색청둥오리");
		an.flying();

		
	}

}
