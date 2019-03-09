package springweb.z01_vo;

import java.util.Date;
// springweb.z01_vo.Exambank
public class Exambank {
	private int no;
	private String extype;
	private String content;
	private String coranswer;
	private Date credte;
	public Exambank() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Exambank(int no, String extype, String content, String coranswer, Date credte) {
		super();
		this.no = no;
		this.extype = extype;
		this.content = content;
		this.coranswer = coranswer;
		this.credte = credte;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getExtype() {
		return extype;
	}
	public void setExtype(String extype) {
		this.extype = extype;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getCoranswer() {
		return coranswer;
	}
	public void setCoranswer(String coranswer) {
		this.coranswer = coranswer;
	}
	public Date getCredte() {
		return credte;
	}
	public void setCredte(Date credte) {
		this.credte = credte;
	}
	
}
/*
	NO NUMBER PRIMARY KEY,
	extype VARCHAR2(3),
	content varchar2(1000),
	coranswer varchar2(500),
	credte DATE
 * */
