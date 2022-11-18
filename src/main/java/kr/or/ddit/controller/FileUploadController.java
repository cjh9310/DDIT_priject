package kr.or.ddit.controller;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.or.ddit.command.FileUploadCommand;
import kr.or.ddit.dto.MemberVO;

@Controller
public class FileUploadController {

	// String url이 GetMapping의 주소와 동일하면 생략할 수 있다.
	// 핸들러매퍼가 알아서 인식해줌
	
	private /*파일저장폴더설정*/
	String idenPictureUploadPath = "d:\\team1\\src\\uploadImage\\idenPicture\\".replace("/", File.separator);
	
	private /*파일저장폴더설정*/
	String licenceFileUploadPath = "d:\\team1\\src\\uploadImage\\BusinessLicense\\".replace("/", File.separator);
	
	//방식1 (추천)     								업로드시 한글파일 깨짐 방지
	@PostMapping(value="/futurelab/ai1/idenPictureUpload", produces="text/plain; charset=utf-8")
	@ResponseBody
	public String uploadByMultipartFile(MultipartFile file, Model model, HttpServletRequest request)throws Exception {
		
		HttpSession session = request.getSession();
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		String id = loginUser.getId();
		
		File saveFile = new File(idenPictureUploadPath + id, id + ".jpg");
		saveFile.mkdirs();
		
		/*파일저장*/  // 파일저장때문에 try catch문 사용하게됨.
		file.transferTo(saveFile);
		model.addAttribute("orginalFileName",file.getOriginalFilename());
		model.addAttribute("uploadedFileName",saveFile.getName());
		model.addAttribute("uploadPath",saveFile.getAbsolutePath());
		
		return "idenPictureUploadSuccess";
	}
	
	@PostMapping(value="/comember/mypage/licenceFileUpload", produces="text/plain; charset=utf-8")
	@ResponseBody
	public String uploadByLicenceFile(MultipartFile file, Model model, HttpServletRequest request)throws Exception {
		
		HttpSession session = request.getSession();
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		String id = loginUser.getId();
		
		File saveFile = new File(licenceFileUploadPath + id, id + ".jpg");
		saveFile.mkdirs();
		
		/*파일저장*/  // 파일저장때문에 try catch문 사용하게됨.
		file.transferTo(saveFile);
		model.addAttribute("orginalFileName",file.getOriginalFilename());
		model.addAttribute("uploadedFileName",saveFile.getName());
		model.addAttribute("uploadPath",saveFile.getAbsolutePath());
		
		return "idenPictureUploadSuccess";
	}
	
}
