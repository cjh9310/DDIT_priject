package kr.or.ddit.controller;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
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
import kr.or.ddit.dto.AllimVO;
import kr.or.ddit.dto.BookmarkVO;
import kr.or.ddit.dto.CareerVO;
import kr.or.ddit.dto.CertificateVO;
import kr.or.ddit.dto.EducationVO;
import kr.or.ddit.dto.MemberVO;
import kr.or.ddit.dto.RecruitVO;
import kr.or.ddit.service.AdviceService;
import kr.or.ddit.service.AllimService;
import kr.or.ddit.service.CareerService;
import kr.or.ddit.service.CertificateService;
import kr.or.ddit.service.EducationService;
import kr.or.ddit.service.MemberService;
import kr.or.ddit.service.OpenRecService;
import kr.or.ddit.service.RecruitService;
import kr.or.ddit.handler.webSocketListener;

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
	
	@Autowired
	private AllimService allimService;

	@GetMapping("list")
	public String talentMain(Criteria cri, String open_conm ,HttpServletRequest request) throws Exception {
		String url = "talent/list";
		HttpSession session = request.getSession();
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		String id = loginUser.getId();
		cri.setId(id);
		cri.setPerPageNum(18);
		Map<String, Object> dataMap = memberService.getTalentListByScroll(cri);
		//. 여기부터
		
		Map<String, Object> dataMap2 = null;
		Map<String, Object> dataMap3 = null;
		
		// 회사 이름 따옴
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
	public Map<String, Object> talnetScrollList(Criteria cri, int pageNum, HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		String id = loginUser.getId();
		cri.setId(id);
		cri.setPerPageNum(18);
		cri.setPage(pageNum);
		Map<String, Object> dataMap = memberService.getTalentListByScroll(cri);
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
	
	@PostMapping("/openAdviceRegist")
	@ResponseBody
	public AdviceVO openAdviceRegist(AdviceVO advice, AllimVO allim, webSocketListener handler ) throws Exception {
		
		advice.getIndId();
		allim.getFromId();
		allim.getToId();
		System.out.println("찾아줘바"+allim.getToId());
		System.out.println("찾아줘"+advice.getOpenSeqno());
		System.out.println("찾아줘"+allim.getOpenSeqno());
		adviceService.registAdvice(advice);
		allimService.registAllim(allim);
		handler.AdviceAllim(allim);
		
		
//		String detail = adviceSerivce.registAdvice(indId);
		
		
		return advice;
	}
	
	@PostMapping("/recruitAdviceRegist")
	@ResponseBody
	public AdviceVO recruitAdviceRegist(AdviceVO advice, AllimVO allim, webSocketListener handler ) throws Exception {
		
		advice.getIndId();
		allim.getFromId();
		allim.getToId();
		allim.getRecWantedtitle();
		System.out.println("찾아줘" + allim.getRecWantedtitle());
		adviceService.registAdvice(advice);
		allimService.registAllim(allim);
		handler.AdviceAllim(allim);
		
//		String detail = adviceSerivce.registAdvice(indId);
		
		
		return advice;
	}

}
