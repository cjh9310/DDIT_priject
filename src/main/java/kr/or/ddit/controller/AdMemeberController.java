package kr.or.ddit.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.command.Criteria;
import kr.or.ddit.dao.SeniorDAO;
import kr.or.ddit.dto.AuthReqVO;
import kr.or.ddit.dto.CoDetailListVO;
import kr.or.ddit.dto.FalseReportVO;
import kr.or.ddit.dto.FaqVO;
import kr.or.ddit.dto.MemberVO;
import kr.or.ddit.dto.NewsVO;
import kr.or.ddit.dto.PublicWorkVO;
import kr.or.ddit.dto.ReportListVO;
import kr.or.ddit.dto.SeniorVO;
import kr.or.ddit.dto.SupportVO;
import kr.or.ddit.service.AuthReqService;
import kr.or.ddit.service.FalseReportService;
import kr.or.ddit.service.FaqService;
import kr.or.ddit.service.MemberService;
import kr.or.ddit.service.NewsService;
import kr.or.ddit.service.PublicWorkService;
import kr.or.ddit.service.ReportService;
import kr.or.ddit.service.SeniorService;
import kr.or.ddit.service.SupportService;

@Controller
@RequestMapping("/admember")

public class AdMemeberController {

	@Autowired
	private PublicWorkService publicWorkService;

	@Autowired
	private FaqService faqService;

	@Autowired
	private ReportService reportService;

	@Autowired
	private NewsService newsService;

	@Autowired
	private SupportService supportService;

	@Autowired
	private SeniorService seniorService;

	@Autowired
	private MemberService memberService;

	@Autowired
	private AuthReqService authReqService;

	@PostMapping("mypage/checkInfo")
	public String myPageInfo(@RequestParam("checkPwd") String checkPwd, HttpServletRequest request) throws Exception {
		String url;
		
		HttpSession session = request.getSession();
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		String id = loginUser.getId();
		
		if(id.equals(checkPwd)) {
			url="indmember/mypage/info";
		} else {
			url="common/Unlocking_fail";
		}
		return url;
	}
	
	@Resource(name = "fileUploadPath")
	private String fileUploadPath;
	
	@GetMapping("mypage/nonCheckInfo")
	public String myPageInfo(HttpServletRequest request) throws Exception {
		String url="indmember/mypage/info";
		return url;
	}
	
	@GetMapping("mypage/lockedinfo")
	public String myPageLockedInfo(HttpServletRequest request) throws Exception {
		String url = "indmember/mypage/lockedinfo";
		return url;
	}

	@GetMapping("/mypage/support")
	public String myPageSupport(Criteria cri, HttpServletRequest request) throws Exception {
		String url = "admember/mypage/support";

		Map<String, Object> dataMap = null;
		dataMap = supportService.getSupportList(cri);

		request.setAttribute("dataMap", dataMap);

		return url;
	}

	@RequestMapping(value = "/mypage/supportDetail", method = RequestMethod.POST)
	public @ResponseBody SupportVO detailSuppory(@RequestParam("supNo") int supNo, Model model) throws Exception {

		SupportVO supportVO = supportService.getSupport(supNo);

		System.out.println(supNo);

		model.addAttribute("supportDetail", supNo);

		return supportVO;

	}

	@ResponseBody
	@RequestMapping(value = "/mypage/supportModify", method = RequestMethod.POST)
	public String modifySupport(@RequestBody SupportVO support, HttpServletRequest request, RedirectAttributes rttr)
			throws Exception {

		String msg = "성공";

		supportService.updateSupportCounselor(support);

		return msg;

	}

	@GetMapping("/mypage/report")
	public String myPageReport(Criteria cri, HttpServletRequest request) throws Exception {
		String url = "admember/mypage/report";

		Map<String, Object> dataMap = reportService.getAllReportList(cri);
		
		request.setAttribute("dataMap", dataMap);
		request.setAttribute("pageType", "normal");

		return url;
	}

	@GetMapping("/mypage/reportUpdateAndRefresh")
	public String reportUpdateAndRefresh(Criteria cri, int falNo, String coNm, HttpServletRequest request) throws Exception {
		String url = "admember/mypage/report";

		Map<String, Object> dataMap = reportService.getAllReportList(cri);

		request.setAttribute("dataMap", dataMap);
		request.setAttribute("falNo", falNo);
		request.setAttribute("coNm", coNm);
		request.setAttribute("pageType", "statusUpdate");

		return url;
	}	
	
	@RequestMapping(value = "/mypage/reportDetail", method = RequestMethod.POST)
	public @ResponseBody ReportListVO reportDetail(@RequestParam("falNo") int falNo, String coNm, Model model) throws Exception {
		System.out.println("falNo : " + falNo + coNm );
		ReportListVO reportListVO = reportService.getReport(falNo);
		List<CoDetailListVO> coDetailList = reportService.getCoDetail(coNm);
		
		reportListVO.setCoDetailList(coDetailList);
		model.addAttribute("openReportDetail", reportListVO);

		return reportListVO;

	}
	
	@RequestMapping(value = "/mypage/returnConfirm", method = RequestMethod.POST)
	public @ResponseBody String returnConfirm(String coId, String coConfirm, Model model) throws Exception {
		MemberVO memberVO = new MemberVO();
		
		memberVO.setId(coId);
		memberVO.setCoConfirm(coConfirm);
		
		reportService.updateReturnConfirm(memberVO);

		return "succ";

	}	
	
	@ResponseBody
	@PostMapping("/mypage/reportChangeStatus")
	public String reportChangeStatus(String repStatus,int falNo) throws Exception {
		ReportListVO reportListVO = new ReportListVO();
		reportListVO.setRepStatus(repStatus);
		reportListVO.setFalNo(falNo);
		reportService.updateReportChangeStatus(reportListVO);
		
		return "succ";
	}
	

	@GetMapping("/mypage/senior")
	public String myPageSenior(String adId, HttpServletRequest request) throws Exception {
		String url = "admember/mypage/senior";

		HttpSession session = request.getSession();
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");

		adId = loginUser.getId();

		List<SeniorVO> seniorVO = seniorService.getAllSeniorList();

		request.setAttribute("SeniorList", seniorVO);

		return url;
	}

	@ResponseBody
	@PostMapping("/mypage/seniorRegist")
	public String registSenior(SeniorVO senior, RedirectAttributes rttr) throws Exception {
		String url = "redirect:/mypage/senior";

		seniorService.regist(senior);

		rttr.addFlashAttribute("from", "regist");

		return url;

	}

	@ResponseBody
	@RequestMapping(value = "/mypage/seniorDetail", method = RequestMethod.POST)
	public SeniorVO DetailSenior(@RequestParam("snrNo") int snrNo, Model model) throws Exception {
		SeniorVO seniorVO = seniorService.getSenior(snrNo);

		model.addAttribute("seniorDetail", seniorVO);

		return seniorVO;

	}

	@GetMapping("/mypage/community")
	public String myPageCommunity(String adId, HttpServletRequest request) throws Exception {
		String url = "admember/mypage/community";

		HttpSession session = request.getSession();
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");

		adId = loginUser.getId();
		System.out.println(adId);

		List<PublicWorkVO> publicWorkVO = publicWorkService.getAllPublicWokrList(adId);
		List<FaqVO> faqVO = faqService.getAllFaqList(adId);

		request.setAttribute("PublicWorkList", publicWorkVO);
		request.setAttribute("FaqList", faqVO);

		return url;

	}

	@RequestMapping(value = "/mypage/communityPubDetail", method = RequestMethod.POST)
	public @ResponseBody PublicWorkVO detailPubwork(@RequestParam("pubNo") int pubNo, Model model) throws Exception {
		PublicWorkVO publicWokrVO = publicWorkService.getPublicWork(pubNo);

		model.addAttribute("openPubDetail", publicWokrVO);

		return publicWokrVO;

	}

	@RequestMapping(value = "/mypage/communityFaqDetail", method = RequestMethod.POST)
	public @ResponseBody FaqVO detailFaq(@RequestParam("faqNo") int faqNo, Model model) throws Exception {
		FaqVO faqVO = faqService.getFaq(faqNo);

		model.addAttribute("openFaqDetail", faqVO);

		return faqVO;

	}

	@PostMapping("/mypage/pubRegist")
	@ResponseBody
	public String registPublicWork(PublicWorkVO publicWork, RedirectAttributes rttr) throws Exception {
		String url = "redirect:/mypage/community";

		publicWorkService.regist(publicWork);

		rttr.addFlashAttribute("from", "regist");

		return url;

	}

	@PostMapping("/mypage/faqRegist")
	@ResponseBody
	public String registFaq(FaqVO faq, RedirectAttributes rttr) throws Exception {
		String url = "redirect:/mypage/community";

		faqService.regist(faq);

		rttr.addFlashAttribute("from", "regist");

		return url;

	}

	@RequestMapping(value = "/mypage/pubModify", method = RequestMethod.POST)
	public String modifyPublicWork(PublicWorkVO publicwork, HttpServletRequest request, RedirectAttributes rttr)
			throws Exception {
		String url = "redirect:/admember/mypage/community";

		publicWorkService.modify(publicwork);

		rttr.addAttribute("from", "community");

		return url;

	}

	@RequestMapping(value = "/mypage/faqModify", method = RequestMethod.POST)
	public String modifyFaq(FaqVO faq, HttpServletRequest request, RedirectAttributes rttr) throws Exception {
		String url = "redirect:/admember/mypage/community";

		faqService.modify(faq);

		rttr.addAttribute("from", "community");

		return url;

	}

	@PostMapping("/mypage/remove")
	@ResponseBody
	public String removePublicWork(int pubNo, RedirectAttributes rttr) throws Exception {
		String url = "redirect:/mypage/community";

		publicWorkService.remove(pubNo);

		rttr.addAttribute("from", "community");

		return url;
	}

	@PostMapping("/mypage/faqRemove")
	@ResponseBody
	public String removeFaq(int faqNo, RedirectAttributes rttr) throws Exception {
		String url = "redirect:/mypage/community";

		faqService.remove(faqNo);

		rttr.addAttribute("from", "community");

		return url;
	}

	@GetMapping("/mypage/news")
	public String news(Criteria cri, HttpServletRequest request) throws Exception {
		String url = "admember/mypage/news";

		Map<String, Object> dataMap = null;
		dataMap = newsService.getNewsList(cri);

		request.setAttribute("dataMap", dataMap);

		return url;
	}

	@GetMapping("/mypage/authority")
	public String myPageAuthority(Criteria cri, HttpServletRequest request) throws Exception {
		String url = "admember/mypage/authority";

		Map<String, Object> dataMap = null;
		dataMap = authReqService.getAuthReqList(cri);

		request.setAttribute("dataMap", dataMap);
		return url;
	}

	@RequestMapping(value = "/mypage/newsDetail", method = RequestMethod.POST)
	public @ResponseBody NewsVO detailNews(@RequestParam("newsNo") int newsNo, Model model) throws Exception {

		NewsVO news = newsService.getNews(newsNo);

		model.addAttribute("newsDetail", news);

		return news;
	}

	@PostMapping("/mypage/newsRegist")
	public String registNews(NewsVO news, RedirectAttributes rttr, HttpServletRequest request) throws Exception {
		String url = "redirect:/admember/mypage/news";
		
		String savePath = this.fileUploadPath;
		
		HttpSession session = request.getSession();
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");

		String adId = loginUser.getId();

		news.setAdId(adId);

		System.out.println("news :" + news);
		newsService.regist(news,savePath);

		rttr.addFlashAttribute("from", "regist");
		
		return url;
	}

	@RequestMapping(value = "/mypage/newsModify", method = RequestMethod.POST)
	public String modifyNews(NewsVO news, HttpServletRequest request, RedirectAttributes rttr) throws Exception {

		String url = "redirect:/admember/mypage/news";

		newsService.modify(news);

		rttr.addAttribute("from", "modify");

		return url;

	}

	@PostMapping("/mypage/newsRemove")
	@ResponseBody
	public String removeNews(int newsNo, RedirectAttributes rttr) throws Exception {

		String url = "redirect:/admember/mypage/news";

		newsService.remove(newsNo);

		rttr.addAttribute("from", "remove");

		return url;
	}

	@RequestMapping(value = "/mypage/authReqModify", method = RequestMethod.POST)
	@ResponseBody
	public String modifyAuthority(@RequestParam("coId") String id, AuthReqVO AuthReq, HttpServletRequest request,
			RedirectAttributes rttr) throws Exception {

		String url = "admember/mypage/authority";

		memberService.modifyAuthority(id);

		return url;

	}
}
