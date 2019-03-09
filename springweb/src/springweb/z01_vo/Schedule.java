package springweb.z01_vo;

public class Schedule {
	/*
	NO NUMBER,
	refno NUMBER,
	content varchar2(500),
	fromDate DATE,
	toDate DATE
	*/
	private int no;
	private int refno;
	private String content;
	private String fromDate;
	private String toDate;
	private String manager;
	private int level;
	public Schedule() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Schedule(int no, int refno, String content, String fromDate, String toDate, String manager, int level) {
		super();
		this.no = no;
		this.refno = refno;
		this.content = content;
		this.fromDate = fromDate;
		this.toDate = toDate;
		this.manager = manager;
		this.level = level;
	}

	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getRefno() {
		return refno;
	}
	public void setRefno(int refno) {
		this.refno = refno;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getFromDate() {
		return fromDate;
	}
	public void setFromDate(String fromDate) {
		this.fromDate = fromDate;
	}
	public String getToDate() {
		return toDate;
	}
	public void setToDate(String toDate) {
		this.toDate = toDate;
	}
	public String getManager() {
		return manager;
	}
	public void setManager(String manager) {
		this.manager = manager;
	}

	public int getLevel() {
		return level;
	}

	public void setLevel(int level) {
		this.level = level;
	}
	
	
	
}
