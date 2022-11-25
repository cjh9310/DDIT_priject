package kr.or.ddit.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.command.Criteria;
import kr.or.ddit.dto.ActivityVO;
import kr.or.ddit.dto.ContestVO;
import kr.or.ddit.dto.MemberVO;
import kr.or.ddit.dto.MentoringVO;
import kr.or.ddit.dto.SupportVO;
import kr.or.ddit.service.ActivityService;
import kr.or.ddit.service.ContestService;
import kr.or.ddit.service.MentoringService;
import kr.or.ddit.service.SupportService;

@Controller
@RequestMapping("/support")
public class SupportController {
	
	@Autowired
	private SupportService supportService;
	
	@Autowired
	private ContestService contestService;
	
	@Autowired
	private MentoringService mentoringService;
	
	@Autowired
	private ActivityService activityService;
	
	@Resource(name="fileUploadPath")
	private String fileUploadPath;
	
	@GetMapping("/contest/list")
	public String contestList(Criteria cri, Model model) throws Exception {
		String url = "support/contest/list";
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		dataMap = contestService.getContestList();
		
		model.addAttribute("dataMap",dataMap);
		
		return url;
	}
	
	@RequestMapping(value = "/contestForMain", method = RequestMethod.GET, produces = "application/json;charset=utf-8")
	@ResponseBody
	public Map<String, Object> contestForMain() throws Exception {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap = contestService.getContestList();
		return dataMap;
	}
	
	@RequestMapping(value = "/mentoringForMain", method = RequestMethod.GET, produces = "application/json;charset=utf-8")
	@ResponseBody
	public Map<String, Object> mentoringForMain() throws Exception {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap = mentoringService.getMentoringList();
		return dataMap;
	}
	
	@PostMapping(value="/contest/activityRegist")
	//@ResponseBody
	public String activityRegistContest(int conNo, ActivityVO activity, RedirectAttributes rttr, HttpServletRequest request)throws Exception{
		
		String url = "redirect:/support/contest/detail?conNo="+conNo;
		
		//파일업로드 경로 
		String savePath = this.fileUploadPath;
		
		HttpSession session = request.getSession();
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		
		String indId = loginUser.getId();
		activity.setIndId(indId);
		
		activityService.registContest(activity, savePath);
		
		rttr.addFlashAttribute("from","regist");
		
		return url;
		
	}
	
	@GetMapping("/contest/detail")
	public ModelAndView contestDetail(ModelAndView mnv, int conNo) throws Exception {
		String url = "support/contest/detail";
		ContestVO contest = contestService.getContest(conNo);
		
		mnv.addObject("contest", contest);
		mnv.setViewName(url);
		return mnv;
		
	}
//취업상담----------------------------------------------------------------------------------
	@GetMapping("/counsel/main")
	public String counselMain() throws Exception {
		String url = "support/counsel/main";
		return url;
	}
	
	@PostMapping("/counsel/regist")
	public String CounselRegist(			
			SupportVO support,
			HttpServletRequest request) throws Exception{
		
		String url = "redirect:main";
		
		//파일업로드 경로 
		String savePath = this.fileUploadPath;
		
		HttpSession session = request.getSession();
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		
		String indId = loginUser.getId();
		support.setIndId(indId);
		
		//상담신청내용 등록, 파일등록 서비스 호출(경로포함)
		supportService.regist(support, savePath);
		
		return url;
	}
	
	@GetMapping("/mentoring/list")
	public String mentoringList(Criteria cri, Model model) throws Exception {
		String url = "support/mentoring/list";
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		dataMap = mentoringService.getMentoringList();
		
		model.addAttribute("dataMap",dataMap);
		
		return url;
	}
	
	@GetMapping("/mentoring/detail")
	public ModelAndView mentroringDetail(int menNo, ModelAndView mnv)throws Exception {
		String url = "support/mentoring/detail";
		
		MentoringVO mentoring = mentoringService.getMentoring(menNo);
		
		mnv.addObject("mentoring", mentoring);
		mnv.setViewName(url);
		return mnv;
	}
	
	@RequestMapping("/mentoring/activityRegist")
	public String activityRegistMentoring(ActivityVO activity, Model model, HttpServletRequest request)throws Exception{
		String url = "redirect:/support/mentoring/list";
		
		HttpSession session = request.getSession();
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		
		String indId = loginUser.getId();
		activity.setIndId(indId);
		
		activityService.registMentoring(activity);
		
		return url;
	}
		

	
}
