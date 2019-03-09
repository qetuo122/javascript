package springweb.a03_mvc.a03_dao;

import java.util.ArrayList;

// Ctrl --> Service --> Dao(Repository)
// 프로그래머는 Dao만(인터페이스) - 입력값, return, 어떤 메서드로?
// Mybatis 모듈이 이 인터페이스 기반으로 자동으로 실제 클래스를 상속받아 처리해준다.
// 

import org.springframework.stereotype.Repository;

import springweb.z01_vo.Dept;
import springweb.z01_vo.Emp;
// springweb.a03_mvc.a03_dao.A01_EmpDao
@Repository
public interface A01_EmpDao {// namespace
	// 인터페이스에 있는 메서드로 식별하고, emplist
	// 1. 입력값
	// 2. return 값..
	// sql 와 연결 규칙만 정해주면 된다..
/*
## 실제 sql와 연결하는 연결 규칙.. DAO의 각 메서드와 sql에 있는 mapper.xml
1. Dao 인터페이스 명은   mapper.xml의 namespace로 선언..
   - 패키지명.인터페이스명
2. 각  메서드명은 mapper.xml에 id와 연결.. 
3. 입력값은  mapper.xml의 <select 의 속성 parameterType과 연결된다.  	
4. return type은  mapper.xml의  resultType이나 resultMap과 동일하여야 한다.
  	
*/	
	public ArrayList<Emp> emplist(Emp sch);
	public ArrayList<Dept> deptlist(Dept sch);
//	public Emp emplist1(Emp sch);
//	public int emplist2(Emp sch);
}
