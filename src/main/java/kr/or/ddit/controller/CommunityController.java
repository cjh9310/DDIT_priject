package kr.or.ddit.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.command.Criteria;
import kr.or.ddit.dto.FalseReportVO;
import kr.or.ddit.dto.FaqVO;
import kr.or.ddit.dto.MemberVO;
import kr.or.ddit.dto.PublicWorkVO;
import kr.or.ddit.service.FalseReportService;
import kr.or.ddit.service.FaqService;
import kr.or.ddit.service.MemberService;
import kr.or.ddit.service.PublicWorkService;


@Controller
@RequestMapping("/community")
public class CommunityController {
	
	@Autowired
	private PublicWorkService publicWorkService;
	
	@Autowired
	private FaqService faqService;
	
	@Autowired
	private FalseReportService falseReportService;

	@Autowired
	private MemberService memberService;
	
	@GetMapping("archive/list")
	public String archiveList() throws Exception {
		String url = "community/archive/list";
		return url;
	}
	
	@GetMapping("faq/list")
	public String faqList(HttpServletRequest request) throws Exception {
		String url = "community/faq/list";
		
		List<FaqVO> indMemberList = faqService.getAllFaqIndmemberList();
		List<FaqVO> coMemberList = faqService.getAllFaqComemberList();
		List<FaqVO> etcList = faqService.getAllFaqEtcList();
		
		request.setAttribute("indMemberList", indMemberList);
		request.setAttribute("coMemberList", coMemberList);
		request.setAttribute("etcList", etcList);
		
		System.out.println(indMemberList.size());
		System.out.println(coMemberList.size());
		System.out.println(etcList.size());
		
		return url;
	}
	
	@GetMapping("publicwork/list")
	public String publicworkList(Criteria cri, HttpServletRequest req) throws Exception {
		String url = "community/publicwork/list";
		
		Map<String,Object> dataMap = publicWorkService.getPublicWorkList(cri);
		
		req.setAttribute("dataMap", dataMap);
		
		return url;
	}
	
	@RequestMapping(value = "/publicworkForMain", method = RequestMethod.GET, produces = "application/json;charset=utf-8")
	@ResponseBody
	public Map<String, Object> publicworkForMain(Criteria cri, HttpServletRequest request) throws Exception {
		cri.setPerPageNum(20);
		Map<String,Object> dataMap = publicWorkService.getPublicWorkList(cri);
		return dataMap;
	}
	
	@RequestMapping(value = "/faqForMain", method = RequestMethod.GET, produces = "application/json;charset=utf-8")
	@ResponseBody
	public Map<String, Object> faqForMain(HttpServletRequest request) throws Exception {
		Map<String,Object> dataMap = new HashMap<String, Object>();
		
		List<FaqVO> indMemberList = faqService.getAllFaqIndmemberList();
		List<FaqVO> coMemberList = faqService.getAllFaqComemberList();
		
		dataMap.put("indMemberList", indMemberList);
		dataMap.put("coMemberList", coMemberList);
		
		return dataMap;
	}
	
	@RequestMapping("publicwork/detail")
	public String publicworkDetail(int pubNo, HttpServletRequest request) throws Exception {
		String url = "community/publicwork/detail";
		
		PublicWorkVO publicWork = publicWorkService.getPublicWork(pubNo);
//		if(from!=null && from.equals("list")) {			
//			publicWork = publicWorkService.getPublicWork(pubNo);
//			url="redirect:/publicwork/detail.do?punNo="+pubNo;
//		}
//		
//		mnv.addObject("publicWork",publicWork);
//		mnv.setViewName(url);
		
		request.setAttribute("publickWork", publicWork);
	
		return url;
	}
	
	@GetMapping("report/list")
	public String reportList() throws Exception {
		String url = "community/report/list";
		
		return url;
	}

	@RequestMapping(value="report/insertForm",method= {RequestMethod.POST, RequestMethod.GET})
	public String reportrRegist() throws Exception {
		String url = "community/report/regist";
		
		return url;
	}	
	
	// 파일업로드 경로
	@Resource(name = "fileUploadPath")
	private String fileUploadPath;
	
	/**
	 * @see 신고 등록
	 * @author KYM
	 * @param falseReport
	 * @param request
	 * @param rttr
	 * @return url
	 * @throws Exception
	 */
	@PostMapping("report/regist")
	public String reportSuccess(FalseReportVO falseReport, HttpServletRequest request, RedirectAttributes rttr) throws Exception {
		String url = "redirect:/community/report/list";
		
		String savePath = this.fileUploadPath;	
		
		HttpSession session = request.getSession();
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		
		String indId = loginUser.getId();
		falseReport.setIndId(indId);
		//거짓구인광고신고 등록, 파일 등록, 신고내역관리 등록
		falseReportService.regist(falseReport, savePath);
		
		rttr.addFlashAttribute("from", "registForm");
		
		return url;
	}
	
	@GetMapping("report/coNameSearch")
	public String coNameSearch() throws Exception {
		String url = "community/report/nameSearch";
		
		return url;
	}	
	
	@PostMapping("/report/nameSearch")
	@ResponseBody
	public List<MemberVO> nameSearch(String name, HttpServletRequest request) throws Exception {
		
		List<MemberVO> memberVO = memberService.getSelectCoMember(name);
		request.setAttribute("memberVO", memberVO);
		
		return memberVO;
	}	
}
