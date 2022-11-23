package kr.or.ddit.controller;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.command.Criteria;
import kr.or.ddit.dto.ActivityVO;
import kr.or.ddit.dto.ContestVO;
import kr.or.ddit.dto.MemberVO;
import kr.or.ddit.dto.MentoringVO;
import kr.or.ddit.service.ActivityService;
import kr.or.ddit.service.ContestService;
import kr.or.ddit.service.MentoringService;
import kr.or.ddit.service.SupportService;

@Controller
@RequestMapping("/comember")
public class CoMemberControllerSH {
	
	@Autowired
	private ContestService contestService; //공모전
	
	@Autowired
	private MentoringService mentoringService; //멘토링
	
	@Autowired
	private ActivityService activityService;
	
	@Resource(name="fileUploadPath")
	private String fileUploadPath;
	
	
	@RequestMapping(value="/mypage/contestRegist", produces = "application/text; charset=UTF-8")
	@ResponseBody
	public String contestRegist(			
			//@RequestBody 
			ContestVO contest,
			HttpServletRequest request) throws Exception{
		
		//String url = "redirect:/comember/mypage/support/contest";
		
		//파일업로드 경로 
		String savePath = this.fileUploadPath;
		
		HttpSession session = request.getSession();
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		
		String coId = loginUser.getId();
		contest.setCoId(coId);
		
		//contest프로그램등록, 파일등록 서비스 호출(경로포함)
		contestService.regist(contest, savePath);
		//rttr.addFlashAttribute("form", "regist");
		
		return "ok";
	}
	
	@GetMapping("/mypage/contestList")
	public String contestList(Criteria cri, Model model, HttpServletRequest request ) throws Exception {
		String url = "comember/mypage/support/contest";
		HttpSession session = request.getSession();
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		String coId = loginUser.getId();
		
		Map<String, Object> contestMap = new HashMap<String, Object>();
		Map<String, Object> mentoringMap = new HashMap<String, Object>();
		
		contestMap = contestService.getContestListByCoId(coId);
		//mentoringMap = mentoringService.getMentoringList();
		mentoringMap = mentoringService.getMentoringListByCoId(coId);
		
		
		model.addAttribute("contestMap",contestMap);
		model.addAttribute("mentoringMap",mentoringMap);
		
		
		
		return url;
	}
	
	@GetMapping("mypage/contestDetail")
	public String contestDetail(Model model, int conNo) throws Exception{
		
		String url = "comember/mypage/support/contestDetail";
		
		ContestVO contest = contestService.getContest(conNo);
		
		model.addAttribute("contest", contest);
		
		System.out.println(conNo);
		return url;
	}
	
	@RequestMapping("mypage/contestModifyForm")
	public String contestModifyForm(Model model, int conNo) throws Exception{
		String url = "comember/mypage/support/contestModify";
		
		ContestVO contest = contestService.getContest(conNo);
		
		model.addAttribute("contest", contest);
		
		return url;
	}
	
	
	@RequestMapping(value="mypage/contestModify" , method = RequestMethod.POST)
	@ResponseBody
	public void contestModify( ContestVO contest )throws Exception{
		
		contestService.modify(contest);
		
	}
	
	
	/*
	 * @RequestMapping(value="/mypage/contestRemove") public void contestRemove(int
	 * conNo) throws Exception{ //String url =
	 * "comember/mypage/support/contestRemove";
	 * 
	 * contestService.remove(conNo);
	 * 
	 * //return url; }
	 */
	
	@RequestMapping(value="/mypage/contestRemove",method= RequestMethod.POST)
	@ResponseBody    // 요게 있으면 아작스로 받겠다는 이야기
	//스크립트에서 JSON문자열이나 배열문자열로 왔을때 @RequestBody로 받는다!
	public void contestRemove(int conNo) throws SQLException { //박스안에서 찾으라는 의미인 requestBody
		contestService.remove(conNo);
	}
	
	@RequestMapping("/mypage/contestSupporterList")
	public ResponseEntity<Map<String, Object>> contestSupporterList(int conNo, Model model)throws Exception{
		
		ResponseEntity<Map<String, Object>> activityConMap = null;
		Map<String, Object> dataMap = activityService.getActivityListByConNo(conNo);
		
		model.addAttribute("activityConMap",activityConMap);
		
		activityConMap = new ResponseEntity<Map<String,Object>>(dataMap, HttpStatus.OK);
		
		return activityConMap;
	}
	
	@RequestMapping("/mypage/mentoringSupporterList")
	public ResponseEntity<Map<String, Object>> mentoringSupporterList(int menNo, Model model)throws Exception{
		ResponseEntity<Map<String, Object>> activityMenMap = null;
		Map<String, Object> dataMap = activityService.getActivityListByMenNo(menNo);
		
		model.addAttribute("activityMenMap",activityMenMap);
		
		activityMenMap = new ResponseEntity<Map<String, Object>>(dataMap, HttpStatus.OK);
		
	       return activityMenMap;
	}
	
	@PutMapping(value="/mypage/mentoringScoreModify", produces = "application/text; charset=UTF-8")
	@ResponseBody
	public String mentoringScoreModify(@RequestBody ActivityVO activityVO) throws Exception {
		activityService.modifyCom(activityVO);
		
		return "가산점수정!!";
	}
	
	@RequestMapping(value="/mypage/mentoringRegist", produces = "application/text; charset=UTF-8")
	@ResponseBody
	public String mentoringRegist(			
			//@RequestBody 
			MentoringVO mentoring,
			HttpServletRequest request) throws Exception{
		
		//String url = "redirect:/comember/mypage/support/contest";
		
		HttpSession session = request.getSession();
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		
		String coId = loginUser.getId();
		mentoring.setCoId(coId);
		
		mentoringService.regist(mentoring);
		
		return "ok";
	}
	
	@GetMapping("mypage/mentoringDetail")
	public String mentoringDetail(Model model, int menNo) throws Exception{
		
		String url = "comember/mypage/support/mentoringDetail";
		
		MentoringVO mentoring = mentoringService.getMentoring(menNo);
		
		model.addAttribute("mentoring", mentoring);
		
		return url;
	}
	
	@RequestMapping("mypage/mentoringModifyForm")
	public String mentoringModifyForm(Model model, int menNo) throws Exception{
		String url = "comember/mypage/support/mentoringModify";
		
		MentoringVO mentoring = mentoringService.getMentoring(menNo);
		
		model.addAttribute("mentoring", mentoring);
		
		return url;
	}
	
	@RequestMapping(value="mypage/mentoringModify" , method = RequestMethod.POST)
	@ResponseBody
	public void mentoringModify( MentoringVO mentoring )throws Exception{
		
		mentoringService.modify(mentoring);
		System.out.println(mentoring);
	}
	
	
	@RequestMapping(value="/mypage/mentoringRemove",method= RequestMethod.POST)
	@ResponseBody    // 요게 있으면 아작스로 받겠다는 이야기
	//스크립트에서 JSON문자열이나 배열문자열로 왔을때 @RequestBody로 받는다!
	public void mentoringRemove(int menNo) throws SQLException { //박스안에서 찾으라는 의미인 requestBody
		mentoringService.remove(menNo);
	}
	/*
	 * @RequestMapping("mypage/mentoringRemove") public void mentoringRemove(int
	 * menNo) throws Exception{
	 * 
	 * mentoringService.remove(menNo); }
	 */
	
	
}
