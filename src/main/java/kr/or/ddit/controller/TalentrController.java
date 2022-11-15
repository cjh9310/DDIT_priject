package kr.or.ddit.controller;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.command.Criteria;
import kr.or.ddit.dto.AdviceVO;
import kr.or.ddit.dto.BookmarkVO;
import kr.or.ddit.dto.CareerVO;
import kr.or.ddit.dto.CertificateVO;
import kr.or.ddit.dto.EducationVO;
import kr.or.ddit.dto.MemberVO;
import kr.or.ddit.dto.RecruitVO;
import kr.or.ddit.service.AdviceService;
import kr.or.ddit.service.CareerService;
import kr.or.ddit.service.CertificateService;
import kr.or.ddit.service.EducationService;
import kr.or.ddit.service.MemberService;
import kr.or.ddit.service.OpenRecService;
import kr.or.ddit.service.RecruitService;

@Controller
@RequestMapping("/talent")
public class TalentrController {

	@Autowired
	private OpenRecService openRecService;
	
	@Autowired
	private RecruitService recruitService;
	
	@Autowired
	private MemberService memberService;

	@Autowired
	private EducationService educationService;

	@Autowired
	private CareerService careerService;

	@Autowired
	private CertificateService certificateService;
	
	@Autowired
	private AdviceService adviceService;

	@GetMapping("list")
	public String talentMain(String id,String open_conm ,HttpServletRequest request) throws Exception {
		String url = "talent/list";

		Map<String, Object> dataMap = memberService.getTalentListByScroll(1, 18);
		//. 여기부터
		HttpSession session = request.getSession();
		MemberVO loginUser = null;
		try {			
			loginUser = (MemberVO) session.getAttribute("loginUser");
		} catch (Exception e) {
			url = "redirect:/index.do";// TODO: handle exception
		}
		
		Map<String, Object> dataMap2 = null;
		Map<String, Object> dataMap3 = null;
		
		open_conm = loginUser.getCoNm();
		
		dataMap2 = openRecService.getOpenRecListByConm(open_conm);
		dataMap3 = recruitService.getRecruitListByConm(open_conm);
		
		
		request.setAttribute("dataMap2", dataMap2);
		request.setAttribute("dataMap3", dataMap3);
		// 여기까지 500뜨
		request.setAttribute("dataMap", dataMap);
		return url;
	}

	@RequestMapping(value = "/scrollList", method = RequestMethod.GET, produces = "application/json;charset=utf-8")
	@ResponseBody
	public Map<String, Object> talnetScrollList(int startNum, int endNum, HttpServletRequest request) throws Exception {
		Map<String, Object> dataMap = memberService.getTalentListByScroll(startNum, endNum);
		return dataMap;
	}

	@RequestMapping(value = "/getListByAjax", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> talentDetail(String id) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();

//		첫번쨰테이블의VO 첫번째테이블 = 첫번째테이블의서비스.그의메소드(사용자정보);
//		List<두번쨰테이블의VO> 두번째테이블 = 두번째테이블의서비스.그의메소드(사용자정보);
//		List<세번째테이블VO> 세번째테이블 = 세번째테이블의서비스.그의메소드(사용자정보);
//
//		dataMap.put("첫번째테이블", 첫번째테이블);
//		dataMap.put("두번째테이블", 두번째테이블);
//		dataMap.put("세번째테이블", 세번째테이블);
//		Map<String, Object> dataMap = educationService.getEducationListById(id);
		System.out.println(id);
		Map<String, Object> education = educationService.getEducationListById(id);
		Map<String, Object> career = careerService.getCareerListById(id);
		Map<String, Object> certificate = certificateService.getCertificateListById(id);

		dataMap.put("education", education);
		dataMap.put("career", career);
		dataMap.put("certificate", certificate);

		return dataMap;
	}
	
	/*
	 * @PostMapping("/regist")
	 * 
	 * @ResponseBody public String openAdviceRegist(AdviceVO advice,
	 * RedirectAttributes rttr) throws Exception { String url =
	 * "redirect:/talent/list";
	 * 
	 * adviceSerivce.registAdvice(advice); rttr.addFlashAttribute("from", "regist");
	 * 
	 * return url; }
	 */
	
	@PostMapping("/openAdviceRegist")
	@ResponseBody
	public AdviceVO openAdviceRegist(AdviceVO advice) throws SQLException {
		
		String indId = advice.getIndId();
		System.out.println("aaaaaaaaaaaaaaaaaaaaaaaas" +indId);
		adviceService.registAdvice(advice);
		
		System.out.println(advice);
		
//		String detail = adviceSerivce.registAdvice(indId);
		
		
		return advice;
	}
	
	
	

}
