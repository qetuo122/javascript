package springweb.z01_vo;
// springweb.z01_vo.Calendar
public class Calendar {
	private int id;
	private String title;
	private String start;
	private String end;
	private String url;
	private String content;
	
	public Calendar() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Calendar(int id, String title, String start, String end, String url) {
		super();
		this.id = id;
		this.title = title;
		this.start = start;
		this.end = end;
		this.url = url;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getStart() {
		return start;
	}
	public void setStart(String start) {
		this.start = start;
	}
	public String getEnd() {
		return end;
	}
	public void setEnd(String end) {
		this.end = end;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	
	
}
