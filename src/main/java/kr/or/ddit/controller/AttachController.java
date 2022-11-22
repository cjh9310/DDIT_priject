package kr.or.ddit.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.dto.AttachVO;
import kr.or.ddit.service.AttachService;


@Controller
@RequestMapping("/attach")
public class AttachController {
	
	@Autowired
	private AttachService attachService;
	
	
	@GetMapping("getFile")
	public String getFile(int attNo,HttpServletRequest request, 
								  HttpServletResponse response,Model model) throws Exception {
		
		String url="downloadFile";
		
		AttachVO attach = attachService.getAttachByAttNo(attNo);
		

		model.addAttribute("savedPath", attach.getUploadpath());
		model.addAttribute("fileName", attach.getFilename());		
	
		return url;
	}
	
}
