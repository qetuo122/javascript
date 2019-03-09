package springweb.z02_util;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.web.servlet.view.document.AbstractExcelView;

import springweb.z01_vo.Emp;
// springweb.z02_util.EmpXlsViewer
// 엑셀 다운로드 할 수 있는 view 상속
public class EmpXlsViewer extends AbstractExcelView{

	@Override
	protected void buildExcelDocument(Map<String, Object> model, 
			                          HSSFWorkbook workbook, 
			                          HttpServletRequest req,
			                          HttpServletResponse res) throws Exception {
		// TODO Auto-generated method stub
		String modelNm = "emplist";
		// 1. 다운로드할 파일명. // attachment;filename="emplist.xls";
		res.setHeader("Content-Disposition", "attachment; filename=\""+modelNm+".xls\";"); 
		// 2. excel 구조에 따른 데이터 처리..
//				0) workbook 선언, 첫번째 sheet이름 정의

		// 		1) worksheet 생성하기
		HSSFSheet sheet=workbook.createSheet();
		workbook.setSheetName(0, modelNm);
//					- sheet의 크기 지정
		sheet.setColumnWidth(1, 256*20);
//		title 생성 배열 선언..
		String [] titles = {"사원번호","사원명","직책","관리자번호","입사일","급여","보너스","부서번호"};
		//HSSFRow titleRow  = sheet.createRow(0);

		/*
		//    	2) row (행단위) HSSFRow
		// 		3) cell(열단위) HSSFCell
		for(int idx=0;idx<titles.length;idx++) {
			// cell단위 열에 데이터 넣기.
			// 1. HSSFCell 생성..
			HSSFCell  cell = titleRow.createCell(idx);
			// 2. 데이터 입력하기..
			cell.setCellValue(titles[idx]);
		}
		*/
		// 타이틀 설정
		makeData(titles,sheet.createRow(0));		
		// 동일한 패턴으로
		List<Emp> emplist = (List<Emp>)model.get(modelNm);
		System.out.println("emplist 크기:"+emplist.size());
		Emp emp;
		for(int idx=0;idx<emplist.size();idx++) {
			emp = emplist.get(idx);
			titles[0] = ""+emp.getEmpno();
			titles[1] = emp.getEname();
			titles[2] = emp.getJob();
			titles[3] = ""+emp.getMgr();
			titles[4] = ""+emp.getHiredate();
			titles[5] = ""+emp.getSal();
			titles[6] = ""+emp.getComm();
			titles[7] = ""+emp.getDeptno();
			dataRow= sheet.createRow(idx+1);
			makeData(titles,dataRow);
			
		}
		
		
	}
	// 열단위 
	private HSSFRow dataRow;
	// 행단위
	private HSSFCell data;
	// 각 행에 열데이터 처리 메서드..
	private void makeData(String[] datas, HSSFRow dataRow) {
		// 각 배열에 데이터를 할당 처리..
		for(int idx=0;idx<datas.length;idx++) {
			// 열 데이터를 가져와서..
			data = dataRow.createCell(idx);
			// 열당 열의 값을 할당..
			data.setCellValue(datas[idx]);
		}
	}
	
	
	
	

}
