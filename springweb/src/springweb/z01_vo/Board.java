package springweb.z01_vo;

import java.util.ArrayList;
import java.util.Date;

import org.springframework.web.multipart.MultipartFile;
// springweb.z01_vo.Board
public class Board {
	private int num;
	private int no;
	private int refno;
	private String title;
	private String content;
	private String writer;
	private int readcnt;
	private Date credte;
	private Date uptdte;
	private String etc;
	private int level;
	// form에 name="report"인 파일 요소를 업로드 처리할 수 있는 객체..
	private MultipartFile[] report;
	
	private ArrayList<String> fnames;
	
	
	public Board() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Board(int no, int refno, String title, String content, String writer, int readcnt, Date credte, Date uptdte,
			String etc) {
		super();
		this.no = no;
		this.refno = refno;
		this.title = title;
		this.content = content;
		this.writer = writer;
		this.readcnt = readcnt;
		this.credte = credte;
		this.uptdte = uptdte;
		this.etc = etc;
	}
	
	
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
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
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public int getReadcnt() {
		return readcnt;
	}
	public void setReadcnt(int readcnt) {
		this.readcnt = readcnt;
	}
	public Date getCredte() {
		return credte;
	}
	public void setCredte(Date credte) {
		this.credte = credte;
	}
	public Date getUptdte() {
		return uptdte;
	}
	public void setUptdte(Date uptdte) {
		this.uptdte = uptdte;
	}
	public String getEtc() {
		return etc;
	}
	public void setEtc(String etc) {
		this.etc = etc;
	}
	public int getLevel() {
		return level;
	}
	public void setLevel(int level) {
		this.level = level;
	}
	public MultipartFile[] getReport() {
		return report;
	}
	public void setReport(MultipartFile[] report) {
		this.report = report;
	}
	public ArrayList<String> getFnames() {
		return fnames;
	}
	public void setFnames(ArrayList<String> fnames) {
		this.fnames = fnames;
	}
	
}
