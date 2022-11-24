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
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.command.Criteria;
import kr.or.ddit.dto.ActivityVO;
import kr.or.ddit.dto.CareerVO;
import kr.or.ddit.dto.CertificateVO;
import kr.or.ddit.dto.ContestVO;
import kr.or.ddit.dto.CorporationVO;
import kr.or.ddit.dto.EducationVO;
import kr.or.ddit.dto.FalseReportVO;
import kr.or.ddit.dto.LetterVO;
import kr.or.ddit.dto.MemberVO;
import kr.or.ddit.dto.MentoringVO;
import kr.or.ddit.dto.OpenRecVO;
import kr.or.ddit.dto.RecruitVO;
import kr.or.ddit.dto.SeniorVO;
import kr.or.ddit.dto.SupportVO;
import kr.or.ddit.service.ActivityService;
import kr.or.ddit.service.AdviceService;
import kr.or.ddit.service.BookmarkService;
import kr.or.ddit.service.CareerService;
import kr.or.ddit.service.CertificateService;
import kr.or.ddit.service.ContestService;
import kr.or.ddit.service.CorporationService;
import kr.or.ddit.service.EducationService;
import kr.or.ddit.service.FalseReportService;
import kr.or.ddit.service.LetterService;
import kr.or.ddit.service.MemberService;
import kr.or.ddit.service.MentoringService;
import kr.or.ddit.service.OpenRecService;
import kr.or.ddit.service.RecruitService;
import kr.or.ddit.service.SupplyRecService;
import kr.or.ddit.service.SupportService;
import kr.or.ddit.util.ConvertUtils;

@Controller
@RequestMapping("/indmember")
public class IndMemberController {
	
	@Autowired
	private BookmarkService bookmarkService;
	@Autowired
	private EducationService educationService;
	@Autowired
	private CareerService careerService;
	@Autowired
	private CertificateService certificateService;
	@Autowired
	private SupportService supportService;
	@Autowired
	private RecruitService recruitService;
	@Autowired
	private LetterService letterService;
	@Autowired
	private SupplyRecService supplyRecService;
	@Autowired
	private AdviceService adviceService;
	@Autowired
	private ActivityService activityService;
	@Autowired
	private ContestService contestService;
	@Autowired
	private MentoringService mentoringService;
	@Autowired
	private MemberService memberService;
	@Autowired
	private FalseReportService falseReportService;
	@Autowired
	private OpenRecService openRecService;
	@Autowired
	private CorporationService corporationService; 
	
	@PostMapping("mypage/checkInfo")
	public String myPageInfo(@RequestParam("checkPwd") String checkPwd, HttpServletRequest request) throws Exception {
		String url;
		
		HttpSession session = request.getSession();
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		String id = loginUser.getId();
		
		if(id.equals(checkPwd)) {
			Map<String, Object> eduMap = educationService.getEducationListById(id);
			Map<String, Object> crrMap = careerService.getCareerListById(id);
			Map<String, Object> cerMap = certificateService.getCertificateListById(id);
			request.setAttribute("eduMap", eduMap);
			request.setAttribute("crrMap", crrMap);
			request.setAttribute("cerMap", cerMap);
			url="indmember/mypage/info";
		} else {
			url="common/Unlocking_fail";
		}
		return url;
	}
	
	@GetMapping("mypage/nonCheckInfo")
	public String myPageInfo(HttpServletRequest request) throws Exception {
		String url="indmember/mypage/info";
		
		HttpSession session = request.getSession();
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		String id = loginUser.getId();
		
		Map<String, Object> eduMap = educationService.getEducationListById(id);
		Map<String, Object> crrMap = careerService.getCareerListById(id);
		Map<String, Object> cerMap = certificateService.getCertificateListById(id);
		request.setAttribute("eduMap", eduMap);
		request.setAttribute("crrMap", crrMap);
		request.setAttribute("cerMap", cerMap);
		return url;
	}
	
	@GetMapping("mypage/lockedinfo")
	public String myPageLockedInfo(HttpServletRequest request) throws Exception {
		String url = "indmember/mypage/lockedinfo";
		
		HttpSession session = request.getSession();
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		String id = loginUser.getId();
		
		Map<String, Object> bookmarkMap = bookmarkService.getBookmarkListById(id);
		request.setAttribute("bookmarkMap", bookmarkMap);
		
		return url;
	}
	
	@GetMapping("mypage/manage")
	public String myPageManage(String parameter, HttpServletRequest request) throws Exception {
		String url = "indmember/mypage/manage/" + parameter;
		
		HttpSession session = request.getSession();
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		String id = loginUser.getId();
		
		if(parameter.substring(0,3).equals("edu")) {
			Map<String, Object> eduMap = educationService.getEducationListById(id);
			request.setAttribute("eduMap", eduMap);
		} else if(parameter.substring(0,3).equals("crr")) {
			Map<String, Object> crrMap = careerService.getCareerListById(id);
			request.setAttribute("crrMap", crrMap);
		} else if(parameter.substring(0,3).equals("cer")) {
			Map<String, Object> cerMap = certificateService.getCertificateListById(id);
			request.setAttribute("cerMap", cerMap);
		} else if(parameter.substring(0,3).equals("let")) {
			Map<String, Object> letMap = letterService.getLetterListByIndId(id);
			request.setAttribute("letMap", letMap);
		}
		return url;
	}
	
	@GetMapping("mypage/registForm")
	public String myPageRegistForm(String parameter) throws Exception {
		String url = "indmember/mypage/form/" + parameter;
		return url;
	}
	
	@PostMapping("mypage/regist")
	public ResponseEntity<String> myPageRegist(@RequestParam Map<String, Object> voMap, HttpServletRequest request) throws Exception {
		ResponseEntity<String> entity = null;
		
		HttpSession session = request.getSession();
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		String id = loginUser.getId();
		
		if(voMap.containsKey("eduName")) {
			voMap.put("indId", id);
			educationService.regist(voMap);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} else if(voMap.containsKey("crrCorname")) {
			voMap.put("indId", id);
			careerService.regist(voMap);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} else if(voMap.containsKey("cerName")) {
			voMap.put("indId", id);
			certificateService.regist(voMap);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} else if(voMap.containsKey("letTitle")) {
			voMap.put("indId", id);
			letterService.regist(voMap);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		}
		return entity;
	}
	
	@GetMapping("mypage/modifyForm")
	public String myPageModifyForm(String parameter, String pkey, HttpServletRequest request) throws Exception {
		String url = "indmember/mypage/form/" + parameter;
		HttpSession session = request.getSession();
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		String id = loginUser.getId();
		
		if(parameter.substring(0,3).equals("edu")) {
			EducationVO education = educationService.getEducationByEduNo(pkey);
			request.setAttribute("education", education);
		} else if(parameter.substring(0,3).equals("crr")) {
			CareerVO career = careerService.getCareerByCrrNo(pkey);
			request.setAttribute("career", career);
		} else if(parameter.substring(0,3).equals("cer")) {
			CertificateVO certificate = certificateService.getCertificateByCerNo(pkey);
			request.setAttribute("certificate", certificate);
		} else if(parameter.substring(0,3).equals("let")) {
			LetterVO letter = letterService.getLetterByLetSeqno(pkey);
			request.setAttribute("letter", letter);
		}
		return url;
	}
	
	@GetMapping("mypage/detailForm")
	public String myPageDetailForm(String parameter, String pkey, HttpServletRequest request) throws Exception {
		String url = "indmember/mypage/form/" + parameter;
		HttpSession session = request.getSession();
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		String id = loginUser.getId();
		
		if(parameter.substring(0,3).equals("let")) {
			LetterVO letter = letterService.getLetterByLetSeqno(pkey);
			request.setAttribute("letter", letter);
		}
		return url;
	}
	
	@PostMapping("mypage/modify")
	@ResponseBody
	public void myPageModify(@RequestParam Map<String, Object> voMap, HttpServletRequest request) throws Exception {
		ConvertUtils convertor = new ConvertUtils();
		HttpSession session = request.getSession();
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		String id = loginUser.getId();
		
		System.out.println("voMap : " + voMap);
		
		if(voMap.containsKey("eduName")) {
			voMap.put("indId", id);
			educationService.modify(voMap);
		} else if(voMap.containsKey("crrCorname")) {
			voMap.put("indId", id);
			careerService.modify(voMap);
		} else if(voMap.containsKey("cerName")) {
			voMap.put("indId", id);
			certificateService.modify(voMap);
		} else if(voMap.containsKey("letTitle")) {
			voMap.put("indId", id);
			letterService.modify(voMap);
		}
	}
	
	@GetMapping("mypage/remove")
	public ResponseEntity<String> myPageEduRemove(@RequestParam String pkey, String parameter) throws Exception {
		ResponseEntity<String> entity = null;
		
		if(parameter.substring(0,3).equals("edu")) {
			educationService.remove(pkey);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} else if(parameter.substring(0,3).equals("crr")) {
			careerService.remove(pkey);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} else if(parameter.substring(0,3).equals("cer")) {
			certificateService.remove(pkey);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} else if(parameter.substring(0,3).equals("let")) {
			letterService.remove(pkey);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		}
		return entity;
	}

	@GetMapping("mypage/recruit")
	public String myPageRecruit(HttpServletRequest request) throws Exception {
		String url = "indmember/mypage/recruit";

		HttpSession session = request.getSession();
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		String id = loginUser.getId();
		Map<String, Object> advRecMap = adviceService.getAdviceRecruitList(id);
		Map<String, Object> advOpenMap = adviceService.getAdviceOpenRecList(id);
		Map<String, Object> supRecMap = supplyRecService.getSupplyRecruitList(id);
		Map<String, Object> supOpenMap = supplyRecService.getSupplyOpenRecList(id);
		request.setAttribute("supRecMap", supRecMap);
		request.setAttribute("supOpenMap", supOpenMap);
		request.setAttribute("advRecMap", advRecMap);
		request.setAttribute("advOpenMap",advOpenMap);
		
		return url;
	}
	
	@GetMapping("mypage/recruit/supplyRecResume")
	public String supplyRecResume(int supNo, String recWantedno, HttpServletRequest request) throws Exception {
		String url = "indmember/mypage/supplyRecResume";
		
		HttpSession session = request.getSession();
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		String id = loginUser.getId();
		
		RecruitVO recruitParam = new RecruitVO();
		recruitParam.setIndId(id);
		recruitParam.setRecWantedno(recWantedno);
		
		RecruitVO recruit = recruitService.getRecruitDetail(recruitParam);
		Map<String, Object> resumeMap = supplyRecService.getSupplyResumeAllInfo(supNo);
		
		request.setAttribute("recruit", recruit);
		request.setAttribute("resumeMap", resumeMap);
		
		return url;
	}
	
	@GetMapping("mypage/recruit/supplyOpenRecResume")
	public String supplyOpenRecResume(int supNo, int openSeqno, HttpServletRequest request) throws Exception {
		String url = "indmember/mypage/supplyOpenRecResume";
		
		HttpSession session = request.getSession();
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		String id = loginUser.getId();
		
		OpenRecVO openrecParam = new OpenRecVO();
		openrecParam.setId(id);
		openrecParam.setOpenSeqno(openSeqno);
		
		OpenRecVO openRec = openRecService.getOpenRecListByDetail(openrecParam);
		Map<String, Object> resumeMap = supplyRecService.getSupplyResumeAllInfo(supNo);
		
		String openConm = openRec.getOpenConm();
		CorporationVO corporation = corporationService.getCoInfoVo(openConm);
		request.setAttribute("openRec", openRec);
		request.setAttribute("resumeMap", resumeMap);
		request.setAttribute("corporation", corporation);
		
		return url;
	}
	
	@GetMapping("mypage/resume")
	public String myPageResume(HttpServletRequest request) throws Exception {
		String url = "indmember/mypage/resume";
		
		HttpSession session = request.getSession();
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		String id = loginUser.getId();
		
		Map<String, Object> eduMap = educationService.getEducationListById(id);
		Map<String, Object> crrMap = careerService.getCareerListById(id);
		Map<String, Object> cerMap = certificateService.getCertificateListById(id);
		Map<String, Object> letMap = letterService.getLetterListByIndId(id);
		request.setAttribute("eduMap", eduMap);
		request.setAttribute("crrMap", crrMap);
		request.setAttribute("cerMap", cerMap);
		request.setAttribute("letMap", letMap);
		
		return url;
	}
	
	@RequestMapping(value = "/getLetter", method = RequestMethod.GET, produces = "application/json;charset=utf-8")
	@ResponseBody
	public LetterVO getLetterForAjax(String letSeqno) throws Exception {
		LetterVO letter = letterService.getLetterByLetSeqno(letSeqno);
		return letter;
	}
	
	//취업지원-----------------------------------------------------------------------------------------------
	@GetMapping("mypage/support")
	public String myPageSupport(Criteria cri, HttpServletRequest request) throws Exception {
		String url = "indmember/mypage/support";
		
		HttpSession session = request.getSession();
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		String indId = loginUser.getId();
		
		Map<String, Object> supportMap = supportService.getSupportListByindId(indId);
		Map<String, Object> activityConMap = activityService.getActivityListCon(indId);
		Map<String, Object> activityMenMap = activityService.getActivityListMen(indId);
		
		request.setAttribute("supportMap", supportMap);
		request.setAttribute("activityConMap", activityConMap);
		request.setAttribute("activityMenMap", activityMenMap);
		
		return url;
	}
	
	@RequestMapping("mypage/supportDetail")
	public ModelAndView myPageSupportDetail(int supNo, ModelAndView mnv) throws Exception{
		
		String url="indmember/mypage/supportDetail";
		
		SupportVO support = null;
		
		support = supportService.getSupport(supNo);
		
		mnv.addObject("support", support);
		mnv.setViewName(url);
		
		
		return mnv;
	}
	
	@RequestMapping("mypage/supportModifyForm")
	public ModelAndView myPageSupportModifyForm(int supNo, ModelAndView mnv) throws Exception{
		
		String url = "indmember/mypage/supportModify";
		
		SupportVO support = supportService.getSupport(supNo);
		
		mnv.addObject("support", support);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@PostMapping(value="mypage/supportModify")
	@ResponseBody
	public void myPageSupportModify(SupportVO support) throws Exception {
		
		supportService.modify(support);
		
	}
	
	@RequestMapping(value="/mypage/supportRemove")
	@ResponseBody
	public void myPageSupportRemove(int supNo) throws Exception{
		
		supportService.remove(supNo);
		
	}
	
	@RequestMapping("mypage/menDetail")
	public ModelAndView myPageMentoringDetail(int actNo, ModelAndView mnv) throws Exception{
		
		String url="indmember/mypage/mentoringDetail";
		
		ActivityVO activity = activityService.getActivityMen(actNo);
		
		mnv.addObject("activity", activity);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping("mypage/menModifyForm")
	public ModelAndView myPageMentoringModifyForm(int actNo, ModelAndView mnv) throws Exception{
		
		String url = "indmember/mypage/mentoringModify";
		
		ActivityVO activity = activityService.getActivityMen(actNo);
		
		mnv.addObject("activity", activity);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@PostMapping(value="mypage/menModify")
	@ResponseBody
	public void myPageMentoringModify(ActivityVO activity) throws Exception {
		activityService.modify(activity);
		
	}
	
	@PostMapping(value="mypage/menRemove")
	@ResponseBody
	public void myPageMentoringRemove(int actNo) throws Exception {
		activityService.remove(actNo);
		
	}
	
	@RequestMapping("mypage/conDetail")
	public ModelAndView myPageContestDetail(int actNo, ModelAndView mnv) throws Exception{
		
		String url="indmember/mypage/contestDetail";
		
		ActivityVO activity = activityService.getActivityCon(actNo);
		
		mnv.addObject("activity", activity);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping("mypage/conModifyForm")
	public ModelAndView myPageContestModifyForm(int actNo, ModelAndView mnv) throws Exception{
		
		String url = "indmember/mypage/contestModify";
		
		ActivityVO activity = activityService.getActivityCon(actNo);
		
		mnv.addObject("activity", activity);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@PostMapping(value="mypage/conModify")
	@ResponseBody
	public void myPageContestModify(ActivityVO activity) throws Exception {
		activityService.modify(activity);
		
	}
	
	@RequestMapping(value="mypage/conRemove" )
	@ResponseBody
	public void myPageContestRemove(int actNo) throws Exception {
		activityService.remove(actNo);
		
	}
	//개인회원 수정-----------------------------------------------------------------------------------------------
	
	@RequestMapping(value="/mypage/indmembermodify", method=RequestMethod.POST, produces="application/text; charset=UTF-8")
	@ResponseBody
	public String indmembermodify(MemberVO member, HttpServletRequest request, RedirectAttributes rttr) throws Exception {
		String url = "redirect:/mypage/info";
		
		HttpSession session = request.getSession();
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		String id = loginUser.getId();
		member.setId(id);
		memberService.modify(member);
		
		rttr.addFlashAttribute("from","modify");
		
		return url;
	}
	
	//--------------------------------------------------------------------------------------------------
	@GetMapping("mypage/usage")
	public String myPageUsage() throws Exception {
		String url = "indmember/mypage/usage";
		return url;
	}
	
	
	@GetMapping("mypage/report")
	public String myPageReport(Criteria cri, HttpServletRequest request) throws Exception {
		String url = "indmember/mypage/report";
		
		HttpSession session = request.getSession();
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		String id = loginUser.getId();
		
		Map<String, Object> dataMap = falseReportService.getAllFalseReportList(cri ,id);;
		
		request.setAttribute("dataMap", dataMap);
		
		return url;
	}
	
	@GetMapping("mypage/faceSection")
	public String faceSection(CorsRegistry registry) throws Exception {
		String url = "indmember/mypage/faceSection";
		registry.addMapping("/**").allowedOrigins("*");
		return url;
	}
	
	//얘는 통채로 
	@GetMapping("mypage/result")
	@ResponseBody
	public String result() throws Exception {
		String url = "http://192.168.141.13:5005/result";
		
		RestTemplate restTemplate = new RestTemplate();
        return restTemplate.getForObject(url, String.class);
	}
	
	@RequestMapping("mypage/reportDetail")
	@ResponseBody
	public FalseReportVO reportDetail(int falNo, HttpServletRequest request) throws SQLException, Exception {
		
		HttpSession session = request.getSession();
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		String id = loginUser.getId();
		
		FalseReportVO falseReportDetail = falseReportService.getFalseReportById(falNo, id);
		return falseReportDetail;
	}
}
