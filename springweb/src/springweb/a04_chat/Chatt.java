package springweb.a04_chat;
// 
public class Chatt {
	private int chatid;
	private String name;
	private String islogin;
	private String chgroup;
	
	
	public Chatt() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Chatt(String name, String chgroup) {
		super();
		this.name = name;
		this.chgroup = chgroup;
	}
	public Chatt(int chatid, String name, String islogin, String chgroup) {
		super();
		this.chatid = chatid;
		this.name = name;
		this.islogin = islogin;
		this.chgroup = chgroup;
	}
	public int getChatid() {
		return chatid;
	}
	public void setChatid(int chatid) {
		this.chatid = chatid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getIslogin() {
		return islogin;
	}
	public void setIslogin(String islogin) {
		this.islogin = islogin;
	}
	public String getChgroup() {
		return chgroup;
	}
	public void setChgroup(String chgroup) {
		this.chgroup = chgroup;
	}
	
}
