package springweb.a03_mvc.a02_servce;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import springweb.a03_mvc.a03_dao.B02_ExamDao;
import springweb.z01_vo.Exambank;


@Service
public class B02_ExamService {

	@Autowired(required=false)
	private B02_ExamDao dao;
	
	public ArrayList<Exambank> list(){
		return dao.list();
	}
	
}
