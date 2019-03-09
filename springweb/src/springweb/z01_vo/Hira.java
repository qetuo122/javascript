package springweb.z01_vo;
//  springweb.z01_vo.Hira
public class Hira {
	
	private int no;
	private int refno;
	private int level;
	private String show;
	public Hira() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Hira(int no, int refno, int level, String show) {
		super();
		this.no = no;
		this.refno = refno;
		this.level = level;
		this.show = show;
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
	public String getShow() {
		return show;
	}
	public void setShow(String show) {
		this.show = show;
	}
	public int getLevel() {
		return level;
	}
	public void setLevel(int level) {
		this.level = level;
	}
	
}
