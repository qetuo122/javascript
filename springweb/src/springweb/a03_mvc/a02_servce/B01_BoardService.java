package springweb.a03_mvc.a02_servce;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import springweb.a03_mvc.a03_dao.B01_BoardDao;
import springweb.z01_vo.Board;
import springweb.z01_vo.BoardSch;


@Service
public class B01_BoardService {

	@Autowired(required=false)
	private B01_BoardDao dao;
	
	public ArrayList<Board> list(BoardSch sch){
//		1. 총데이터 건수(DB)
		sch.setCount(dao.tot(sch));
		
//		2. 화면에서 받아야 할 데이터..
//			1) 한 페이지에서 나타날 데이터 건수..
//				- default 페이지 수를 5로 정하자.
		if( sch.getPageSize() == 0) {
			sch.setPageSize(5);
		}
		System.out.println("현재 페이지당 데이터 건수:"+sch.getPageSize());
//		    2) 총페이지 수
//				전체데이터건수/한페이지당 나타날 데이터건수
//				ex) 15/5 ==> 3  20/5 ==> 4  
//		            17/5 ==> 4  27/5 ==> 6
//				자바는  정수형/정수형 ==> 정수형(int로 내림)
//		                          실수/정수, 정수/실수 ==> 실수
		sch.setPageCount( (int)Math.ceil( sch.getCount() / (double)sch.getPageSize() ) );
		
//			3) 현재 페이지 번호..: 초기에 현재 페이지 번호 설정.
//				화면에서 받는 데이터..
		if(sch.getCurPage()==0) {
			sch.setCurPage(1);
		}
		System.out.println("현재페이지 번호:"+sch.getCurPage());
		// 시작 번호, 마지막번호
		// 	현재페이지번호       한페이지당보일데이터건수 
		//   1  5   1 2 3 4 5
		//   2  5   6 7 8 9 10
		//   3  5   11 12 13 14 15
		//   1  3   1 2 3
		//   2  3   4 5 6 
		//  마지막번호 = 현재페이지번호 * 한페이지당보일데이터건수
		//  시작번호 = (현재페이지번호-1) *  한페이지당보일데이터건수 + 1)
		sch.setStart((sch.getCurPage()-1)*sch.getPageSize()+1);
		sch.setEnd(sch.getCurPage()*sch.getPageSize());
		System.out.println("시작번호:"+sch.getStart());
		System.out.println("마지막번호:"+sch.getEnd());
		// 페이지 block 처리하기..
		// 1) 초기 default block size 설정하기..
		sch.setBlockSize(5);
//		   2) block의 시작 번호와 마지막 번호
//			1 2 3 4 5 ->    1, 5     blocknum 1
//		 <- 6 7 8 9 10 ->   6, 10    blocknum 2
//		 <- 11 12 13        11, 13   blocknum 3
//		   3) 블럭 번호는  현재페이지/block크기를 올림..
		int blockNum = (int)Math.ceil(sch.getCurPage()/(double)sch.getBlockSize());
//		   4) 블럭의 시작번호 : (블럭번호-1)*블럭의크기+1
		sch.setStartBlock( (blockNum -1)*sch.getBlockSize()+1);
//         5) 블럭의 마지막번호 : 블럭번호 * 블럭의 크기	
//		       해당 마지막번호가 마지막페이지보다 많을 때는 마지막페이지번호가 블럭의 마지막번호가 된다.
		int endBlock = blockNum * sch.getBlockSize();
		sch.setEndBlock(endBlock>sch.getPageCount()?
				sch.getPageCount():endBlock);
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		// BoardSch에 start, end값을 할당하기 위해 처리..
		return dao.list(sch);
	}
	public void insBoard(Board insert) {
		// 1. 파일 업로드 처리..
		upload(insert.getReport());
		
		
		
		
		dao.insBoard(insert);
		// 2. 파일 데이터 처리(등록처리)
		// insReport
		for(MultipartFile file: insert.getReport()) {
			dao.insReport(file.getOriginalFilename());
		}
	}
	public Board getBoard(int no) {
		dao.uptReadCnt(no);
		
		Board one = dao.getBoard(no);
		System.out.println("타이틀:"+one.getTitle());
		// 파일이 등록되지 않는 게시물에 대한 처리..
		ArrayList<String> fnames = dao.getFiles(no);
		if(fnames!=null && fnames.size()>0) {
			//System.out.println(dao.getFiles(no).size());
			one.setFnames(fnames);
		}
		
		return one;
	}
	public void updateBoard(Board upt) {
		dao.updateBoard(upt);
	}
	public void deleteBoard(int no) {
		dao.deleteBoard(no);
	}
	// 파일 물리적 업로드 처리 메서드..
	// 1. 파일 서버 경로 지정..
	@Value("${tmpupload}")
	private String tmpupload;
	@Value("${upload}")
	private String upload;
	private void upload(MultipartFile[] reports) {
		String fileName=null;
		/*
		파일 업로드 단계.
		1. MultipartFile를  실제물리파일로 변경..
			1) new File("임시경로명"+파일명)
			2) MultipartFile.transferTo(파일객체);
		2. 임시위치에 있는 파일을 다운로드와 고정 위치로 복사 처리..
			Files.copy(임시경로파일, 실제 webcontent하위에 파일위치로 변경)
		*/
		File tmpFile=null;
		File file=null;
		try {	
			if( reports!=null&&reports.length>0) {
				for(MultipartFile report:reports) {
					// 1. 파일이름 가져오기.
					fileName=report.getOriginalFilename();
					// 2. 임시저장한 파일객체.
					tmpFile = new File(tmpupload+fileName);
					file = new File(upload+fileName);
					// 3. MultipartFiler객체가 지정된 경리와 파일명에 있는 위치로 생성처리.
					//		io 발생(실제 파일이 만들어 지기 때문에 Exception을 처리하여야한다.
					report.transferTo(tmpFile);
					// 4. 임시파일을 웹서버의 위치에 복사처리..
					Files.copy(tmpFile.toPath(), file.toPath());
				}
			}
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		
		
	}
	
	
}
