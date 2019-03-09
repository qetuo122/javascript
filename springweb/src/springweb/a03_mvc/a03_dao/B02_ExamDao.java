package springweb.a03_mvc.a03_dao;

import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import springweb.z01_vo.Exambank;
@Repository
public interface B02_ExamDao {

	public ArrayList<Exambank> list(); 
		
}
