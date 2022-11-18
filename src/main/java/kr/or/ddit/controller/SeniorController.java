package kr.or.ddit.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.dto.SeniorVO;
import kr.or.ddit.service.SeniorService;

@Controller
@RequestMapping("/senior")
public class SeniorController {
	
	@Autowired
	private SeniorService seniorService;
	
	@GetMapping("main")
	public String seniorMain() throws Exception {
		String url = "senior/main";
		return url;
	}

	@GetMapping("list")
	public String seniorRecruitList(HttpServletRequest request) throws Exception {
		String url = "senior/list";
		
		List<SeniorVO> senior = seniorService.getAllSeniorList();
		request.setAttribute("seniorList", senior);
		
		return url;
	}

}
