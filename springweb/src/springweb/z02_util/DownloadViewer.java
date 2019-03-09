package springweb.z02_util;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.util.FileCopyUtils;
import org.springframework.web.servlet.view.AbstractView;
// 웹상에서 파일을 다운로드 처리하는 view..
//springweb.z02_util.DownloadViewer
public class DownloadViewer extends AbstractView{
	
	// 생성자 선언.
	public DownloadViewer() {
		// contentType 설정. application/download
		setContentType("application/download; charset=utf-8;");
	}	

	@Override
	protected void renderMergedOutputModel(Map<String, Object> model, 
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		// TODO Auto-generated method stub
		// 파일 다운 로드를 할려면.
		// 1) 어떤 모델에 있는 내용인 지를 선언..
		File file = (File)model.get("downloadFile");
		System.out.println("뷰어에 있는 파일"+file.getName());
		// 2) 모델 안에 있는 정보를 response에 파일이 처리될 수 있게끔 설정 값처리..
		//    - 파일을 client에 전달하기위한 response객체의 설정값 처리..
//				contentType 설정.
//				contentLength로 파일의 길이(크기)
//				파일명을 encoding처리..
//				setHeader("Content-Diposition", 
//					 attachment;filename="파일명"
//				setHeader("Content-Transfer-Encoding","binary")
		response.setContentType(getContentType());
		response.setContentLength((int)file.length());
		String fileName = file.getName();
		// 엔코딩처리.
		fileName = URLEncoder.encode(fileName, 
				"utf-8").replaceAll("\\+", " ");
		response.setHeader("Content-Disposition", 
				"attachment;filename=\""+fileName+"\"");
		response.setHeader("Content-Transfer-Encoding", "binary");
//	   3) response.getOutputStream()을 통해서 File객체를 전송처리.
		OutputStream out = response.getOutputStream();
		FileInputStream fis = null;
		fis = new FileInputStream(file);
		FileCopyUtils.copy(fis, out);
		out.flush();
	}


}
