package springweb.a04_chat;

import java.util.ArrayList;

import org.springframework.stereotype.Repository;
// springweb.a04_chat.A03_ChatDao
/*
	public void insertChat(Chatt ins);
	public String getGroup(String name);
	public String[] getCurrLogin();
 * */
@Repository
public interface A03_ChatDao {
	
	public void insertChat(Chatt ins);
	public void logoutChat(Chatt upt);
	public ArrayList<String> getGroup(String name);
	public ArrayList<String> getCurrLogin();
	
	
}
