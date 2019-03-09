package springweb.b01_calendar;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import springweb.z01_vo.Calendar;

@Service
public class A02_CalendarService {
/*
	@Autowired(required=false)
	private A02_CalendarService service;
	
*/	
	@Autowired(required=false)
	private A03_CalendarDao dao;
	
	public ArrayList<Calendar> list(){
		return dao.list();
	}

	public void insert(Calendar ins) {
		dao.insert(ins);
	}
	public void update(Calendar upt) {
		dao.update(upt);
	}
	public void delete(int id) {
		dao.delete(id);
	}		
}
