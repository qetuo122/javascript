package springweb.z02_util;

import java.awt.Color;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.view.document.AbstractPdfView;

import com.lowagie.text.Cell;
import com.lowagie.text.Document;
import com.lowagie.text.Font;
import com.lowagie.text.Paragraph;
import com.lowagie.text.Table;
import com.lowagie.text.pdf.BaseFont;
import com.lowagie.text.pdf.PdfWriter;

import springweb.z01_vo.Emp;
// springweb.z02_util.EmpPdfViewer
public class EmpPdfViewer extends AbstractPdfView{
	// 사용할 글자체.
	private String fontPath = "c:\\windows\\Fonts\\HYBSRB.ttf";
	// 모델명 지정.
	private String modelN = "emplist";
	
	@Override
	protected void buildPdfDocument(Map<String, Object> model,
			Document document, PdfWriter writer, 
			HttpServletRequest req,
			HttpServletResponse res) throws Exception {
		// TODO Auto-generated method stub
		// 문서의 타이틀을 지정과 여백지정 처리.
		document.addTitle("사원정보");
		document.addSubject("사원정보 리스트");
		document.setMargins(0, 0, 0, 0);
		// 모델에 정의된 데이터 가져오기..
		List<Emp> emplist = (List<Emp>)model.get(modelN);
		String [] titles = {"사원번호","사원명","직책","관리자번호",
				"입사일","급여","보너스","부서번호"};
		// 테이블 지정하여 화면에 출력..
		Table table = new Table(titles.length, emplist.size()+1);
		// 1. 패딩과 배경색상 설정..
		table.setPadding(5);
		table.setBackgroundColor(Color.pink);
		// 2. 기본 글자체 설정.
		BaseFont bkkorean = BaseFont.createFont(fontPath, 
					BaseFont.IDENTITY_H, BaseFont.EMBEDDED);
		Font font = new Font(bkkorean);
		// 3. title의 설정(header)
		//    1) 테이블에 Cell내용을 추가 처리..
		Cell cell = null;
		for(String title:titles) {
			cell = new Cell(new Paragraph(title, font));
			cell.setHeader(true);
			cell.setHorizontalAlignment("center");
			table.addCell(cell);
		}
		// 헤더 부분 종료
		table.endHeaders();
		// 데이터 처리..
		for(Emp emp:emplist) {
			table.addCell(""+emp.getEmpno());
			table.addCell(""+emp.getEname());
			table.addCell(""+emp.getJob());
			table.addCell(""+emp.getMgr());
			table.addCell(""+emp.getHiredate());
			table.addCell(""+emp.getSal());
			table.addCell(""+emp.getComm());
			table.addCell(""+emp.getDeptno());
		}
		document.add(table);
	}
	
}
