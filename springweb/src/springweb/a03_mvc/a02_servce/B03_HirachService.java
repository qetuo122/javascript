package springweb.a03_mvc.a02_servce;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import springweb.a03_mvc.a03_dao.B03_HirachDao;
import springweb.z01_vo.Hira;

@Service
public class B03_HirachService {
	@Autowired(required=false)
	private B03_HirachDao dao;
	
	public ArrayList<Hira> hiralist(){
		return dao.hiralist();
	}
	public void insert(Hira insert) {
		dao.insert(insert);
	}
}
