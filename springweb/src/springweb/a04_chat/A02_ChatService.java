package springweb.a04_chat;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class A02_ChatService {
	@Autowired(required=false)
	private A03_ChatDao dao;
	public void insertChat(Chatt ins) {
		dao.insertChat(ins);
	}
	public void logoutChat(Chatt upt) {
		dao.logoutChat(upt);
	}
	public ArrayList<String> getGroup(String name) {
		return dao.getGroup(name);
	}
	public ArrayList<String>	 getCurrLogin() {
		return dao.getCurrLogin();
	}
}
