package springweb.z02_util;

import java.io.File;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class DownloadCtrl {
	// 파일이 있는 폴드 지정.
	@Value("${upload}")
	private String upload;
	// /down.do?fname=파일명
	@RequestMapping("/down.do")
	public String download(@RequestParam("fname") String fname,
							Model d) {
		System.out.println(upload+fname);
		d.addAttribute("downloadFile", new File(upload+fname));
		
		return "download";
	}
	
	
}
