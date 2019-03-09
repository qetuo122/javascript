package springweb.a03_mvc.a03_dao;

import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import springweb.z01_vo.Board;
import springweb.z01_vo.BoardSch;
@Repository
public interface B01_BoardDao {
	// namespace : springweb.a03_mvc.a03_dao.B01_BoardDao
	// id : list
	// resultMap = "boardMap"	
	public ArrayList<Board> list(BoardSch sch);
	// 총데이터 건수
	public int tot(BoardSch sch);
	// dao --> service --> controller
	public void insBoard(Board insert);
	// 파일 등록 정보 처리..
	public void insReport(String fname);
	// 게시판 고유번호로 파일리스트를 가져오는 처리.
	public ArrayList<String> getFiles(int no);
	// 
	public void uptReadCnt(int no);
	public Board getBoard(int no);
	public void updateBoard(Board upt);
	public void deleteBoard(int no);

	
	
		
}
