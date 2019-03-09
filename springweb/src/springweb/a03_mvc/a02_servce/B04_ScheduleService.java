package springweb.a03_mvc.a02_servce;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import springweb.a03_mvc.a03_dao.B03_HirachDao;
import springweb.a03_mvc.a03_dao.B04_ScheduleDao;
import springweb.z01_vo.Hira;
import springweb.z01_vo.Schedule;

@Service
public class B04_ScheduleService {
	@Autowired(required=false)
	private B04_ScheduleDao dao;
	public ArrayList<Schedule> schelist(){
		return dao.schelist();
	}
	public void insert(Schedule insert) {
		dao.insert(insert);
	}	

}
