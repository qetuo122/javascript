package springweb.b01_calendar;

import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import springweb.z01_vo.Calendar;
// springweb.b01_calendar.A03_CalendarDao
@Repository
public interface A03_CalendarDao {
	
	public ArrayList<Calendar> list();
	public int getId();
	public void insert(Calendar ins);
	public void update(Calendar upt);
	public void delete(int id);
	
}
