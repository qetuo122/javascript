package springweb.a03_mvc.a03_dao;

import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import springweb.z01_vo.Schedule;

@Repository
public interface B04_ScheduleDao {
//	springweb.a03_mvc.a03_dao.B04_ScheduleDao
	public ArrayList<Schedule> schelist();
	public void insert(Schedule insert);
}
