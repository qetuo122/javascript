package springweb.a03_mvc.a03_dao;

import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import springweb.z01_vo.Hira;
// springweb.a03_mvc.a03_dao.B03_HirachDao
@Repository
public interface B03_HirachDao {
	
	public ArrayList<Hira> hiralist();
	public void insert(Hira insert);
}
