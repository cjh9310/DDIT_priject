package kr.or.ddit.controller;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.command.Criteria;
import kr.or.ddit.dto.AllimVO;
import kr.or.ddit.dto.CorporationVO;
import kr.or.ddit.dto.MemberVO;
import kr.or.ddit.dto.OpenRecVO;
import kr.or.ddit.dto.RecruitVO;
import kr.or.ddit.dto.SupplyRecVO;
import kr.or.ddit.handler.webSocketListener;
import kr.or.ddit.service.AllimService;
import kr.or.ddit.service.CareerService;
import kr.or.ddit.service.CertificateService;
import kr.or.ddit.service.CorporationService;
import kr.or.ddit.service.EducationService;
import kr.or.ddit.service.LetterService;
import kr.or.ddit.service.OpenRecService;
import kr.or.ddit.service.SupplyRecService;

@Controller
@RequestMapping("/openrec")
public class OpenrecController {
	
	private static final Logger log = LoggerFactory.getLogger(OpenrecController.class);
	
	@Autowired
	private OpenRecService openRecService;
	@Autowired
	private CorporationService corporationService; 
	@Autowired
	private EducationService educationService;
	@Autowired
	private CareerService careerService;
	@Autowired
	private CertificateService certificateService;
	@Autowired
	private LetterService letterService;
	@Autowired
	private SupplyRecService supplyRecService;
	@Autowired
	private AllimService allimService;
	
	@GetMapping("list")
	public String openrecList(Criteria cri, HttpServletRequest request) throws Exception {
		String url = "openrec/list";
		HttpSession session = request.getSession();
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		String id = loginUser.getId();
		cri.setId(id);
		cri.setPerPageNum(18);
		Map<String, Object> dataMap = openRecService.getOpenRecList(cri);
		
		request.setAttribute("dataMap", dataMap);
		return url;
	}
	
	@GetMapping("detail")
	public String openrecDetail(int openSeqno, String openConm, HttpServletRequest request) throws Exception {
		String url = "openrec/detail";
		HttpSession session = request.getSession();
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		String id = loginUser.getId();
		OpenRecVO openRecParam = new OpenRecVO();
		openRecParam.setId(id);
		openRecParam.setOpenSeqno(openSeqno);
		OpenRecVO openRec = openRecService.getOpenRecListByDetail(openRecParam);
		CorporationVO corporation = corporationService.getCoInfoVo(openConm);
		request.setAttribute("openRec", openRec);
		request.setAttribute("corporation", corporation);
		return url;
	}
	
	@GetMapping("supply")
	public String openRecSupply(int openSeqno, HttpServletRequest request) throws Exception {
		String url = "openrec/supply";
		
		HttpSession session = request.getSession();
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		String id = loginUser.getId();
		
		OpenRecVO openrecParam = new OpenRecVO();
		openrecParam.setId(id);
		openrecParam.setOpenSeqno(openSeqno);
		
		OpenRecVO openrec = openRecService.getOpenRecListByDetail(openrecParam);
		Map<String, Object> eduMap = educationService.getEducationListById(id);
		Map<String, Object> crrMap = careerService.getCareerListById(id);
		Map<String, Object> cerMap = certificateService.getCertificateListById(id);
		Map<String, Object> letMap = letterService.getLetterListByIndId(id);
		
		request.setAttribute("openrec", openrec);
		request.setAttribute("eduMap", eduMap);
		request.setAttribute("crrMap", crrMap);
		request.setAttribute("cerMap", cerMap);
		request.setAttribute("letMap", letMap);
		
		return url;
	}
	
	@PostMapping("supply/check")
	@ResponseBody
	public String recruitSupplyCheck(@RequestParam("openSeqno") int openSeqno, HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		String indId = loginUser.getId();
		Map<String, Object> parameterMap = new HashMap<String, Object>();
		parameterMap.put("openSeqno", openSeqno);
		parameterMap.put("indId", indId);
		
		int count = supplyRecService.getCountSupplyOpenRecById(parameterMap);
		
		if(count == 0) {
			return "SupplyAllowed";
		} else {
			return "SupplyNotAllowed";
		}
	}
	
	@PostMapping("/supply/submit")
	@ResponseBody
	public String recruitSupplySubmit(int openSeqno, @RequestParam List<String> letTitle, @RequestParam List<String> letContent, HttpSession session) throws Exception {
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		String indId = loginUser.getId();
		
		SupplyRecVO supplyRec = new SupplyRecVO();
		supplyRec.setIndId(indId);
		supplyRec.setOpenSeqno(openSeqno);
		
		Map<String, List<String>> letterMap = new HashMap<String, List<String>>();
		letterMap.put("titleList", letTitle);
		letterMap.put("contentList", letContent);
		
		supplyRecService.supplyOpenRec(supplyRec, letterMap);
		
		return "openrecSupplySuccess";
	}
	
	@RequestMapping(value="/companyInfo")
	@ResponseBody
	public Map<String, Object> companyInfo() throws SQLException, Exception {
		Map<String, Object> dataMap = null;
		return dataMap;
	}
	
	@RequestMapping(value = "/scrollList", method = RequestMethod.GET, produces = "application/json;charset=utf-8")
	@ResponseBody
	public Map<String, Object> openRecScrollList(Criteria cri, int pageNum, HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		String id = loginUser.getId();
		cri.setId(id);
		cri.setPerPageNum(18);
		cri.setPage(pageNum);
		Map<String, Object> dataMap = openRecService.getOpenRecList(cri);
		return dataMap;
	}

	@GetMapping("calendar")
	public String openrecCalendar(HttpServletRequest request) throws Exception {
		String url = "openrec/calendar";
		
		Map<String, Object> dataMap = null;
		
		dataMap = openRecService.getOpenRecList();
		
		request.setAttribute("dataMap", dataMap);
		
		return url;
	}
	
	@PostMapping("openAllim")
	@ResponseBody
	public AllimVO recAllim(AllimVO allim, webSocketListener handler ) throws Exception {
		
		allim.getFromId();     // 개인 아이디
		allim.getToId();       // 기업 이름
		allim.getOpenSeqno(); // 공채구인번호
		allim.getOpenTitle(); // 공채 제목
		allim.getCoNm(); // 공채 회사 이름
		System.out.println("찾아줘바"+allim.getFromId());
		System.out.println("찾아줘바"+allim.getToId());
		System.out.println("찾아줘"+allim.getOpenSeqno());
		System.out.println(allim.getOpenTitle());
		allimService.registAllim(allim);
		handler.AdviceAllim(allim);
		
		
//		String detail = adviceSerivce.registAdvice(indId);
		
		
		return allim;
	}
	
	
}
