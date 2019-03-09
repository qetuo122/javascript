package springweb.a03_mvc.a02_servce;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import springweb.a03_mvc.a03_dao.A01_EmpDao;
import springweb.z01_vo.Dept;
import springweb.z01_vo.Emp;

@Service
public class A01_EmpService {
	// Autowired :  spring container(dispatcher.xml)에서
	// 라고 선언하면, 메모리에 해당 객체가 있으면 바로 할당이 된다.
	// 그래서 spring에서는 dao = new XXXX()가 필요 없다.
	// 만일에 객체가 컨터이너에 없더라도 에러가 발생하지 않게 할 수 있는데.
	// 	required=false 옵션이다.
	@Autowired(required=false)
	private A01_EmpDao dao;
	
	public ArrayList<Emp> emplist(Emp sch){
		return dao.emplist(sch);
	}
	public ArrayList<Dept> deptlist(Dept sch){
		return dao.deptlist(sch);
	}
}
