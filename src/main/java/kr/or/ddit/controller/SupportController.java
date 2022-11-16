package kr.or.ddit.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.command.Criteria;
import kr.or.ddit.dto.ActivityVO;
import kr.or.ddit.dto.ContestVO;
import kr.or.ddit.dto.MemberVO;
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
	
	@GetMapping("contest/list")
	public String contestList(Criteria cri, Model model) throws Exception {
		String url = "support/contest/list";
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		dataMap = contestService.getContestList();
		
		model.addAttribute("dataMap",dataMap);
		
		return url;
	}
	
	@RequestMapping("contest/activityRegist")
	public String activityRegistContest(ActivityVO activity, Model model, HttpServletRequest request)throws Exception{
		String url = "redirect:/support/contest/list";
		
		HttpSession session = request.getSession();
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		
		String indId = loginUser.getId();
		activity.setIndId(indId);
		
		activityService.registContest(activity);
		
		return url;
	}
	
	@GetMapping("contest/detail")
	public String contestDetail(Model model, int conNo) throws Exception {
		String url = "support/contest/detail";
		Map<String, Object> contestMap = new HashMap<String, Object>();
		
		contestMap = contestService.getContestList();
		
		model.addAttribute("contestMap",contestMap);
		return url;
	}
	
	@GetMapping("counsel/main")
	public String counselMain() throws Exception {
		String url = "support/counsel/main";
		return url;
	}
	
	@PostMapping(value="counsel/regist")
	@ResponseBody
	public String CounselRegist(			
			//@RequestBody 
			SupportVO support,
			@RequestParam Map<String, Object> param,
			HttpServletRequest request, RedirectAttributes rttr) throws Exception{
		
		String url = "redirect:/support/counsel/main";
		
		HttpSession session = request.getSession();
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		
		String indId = loginUser.getId();
		support.setIndId(indId);
		
		supportService.regist(support);
		
		rttr.addFlashAttribute("form", "regist");
		
		return url;
	}
	
	@GetMapping("mentoring/list")
	public String mentoringList(Criteria cri, Model model) throws Exception {
		String url = "support/mentoring/list";
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		dataMap = mentoringService.getMentoringList();
		
		model.addAttribute("dataMap",dataMap);
		
		return url;
	}
	
	@GetMapping("mentoring/detail")
	public String mentroringDetail()throws Exception {
		String url = "support/mentoring/detail";
		
		return url;
	}
	
	@RequestMapping("mentoring/activityRegist")
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
