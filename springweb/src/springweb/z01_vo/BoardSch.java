package springweb.z01_vo;

// springweb.z01_vo.BoardSch
public class BoardSch {
	// 페이징 처리를 위해 필요한 데이터..
	// 1. 데이터 베이스에서 가져올 내용.
	//  1) 총데이터 건수.. 15건   1페5건   총페이지 3..
	private int count;	
	// 2.View에서 요청값으로 넘겨줘할 데이터
	// 	1) 1페이지당 출력할 데이터 건수
	private int pageSize; 
	// 	2) 어떤 페이지를 보여줄 것인가?  1페이지? 2페이지? 3페이지?
	private int curPage;
	// 3. 로직처리..
	//  1) 총 페이지 수.. 총데이터건수/한번에보여줄페이지수.
	private int pageCount;
	// 	2) 페이징 처리를 위한 마지막 결과 데이터.
	private int start; // 페이지에 시작번호를 처리하기 위한 데이터.
	private int end; // 페이지에 마지막번호를 처리하기 위한 데이터
	//  3) 하단의 페이지 block 설정하기.
//			- block의 크기
	private int blockSize;// 화면에 나타날 block의 크기를 지정
//			- block의 시작번호..
	private int startBlock;
//			- block의 마지막번호
	private int endBlock;
	// 조회를 위해 필요한 데이터
	private String title;
	private String writer;
	public BoardSch() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getCurPage() {
		return curPage;
	}
	public void setCurPage(int curPage) {
		this.curPage = curPage;
	}
	public int getPageCount() {
		return pageCount;
	}
	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}
	public int getStart() {
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	public int getEnd() {
		return end;
	}
	public void setEnd(int end) {
		this.end = end;
	}
	public int getBlockSize() {
		return blockSize;
	}
	public void setBlockSize(int blockSize) {
		this.blockSize = blockSize;
	}
	public int getStartBlock() {
		return startBlock;
	}
	public void setStartBlock(int startBlock) {
		this.startBlock = startBlock;
	}
	public int getEndBlock() {
		return endBlock;
	}
	public void setEndBlock(int endBlock) {
		this.endBlock = endBlock;
	}
	
}
