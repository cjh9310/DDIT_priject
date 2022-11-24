package kr.or.ddit.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

import kr.or.ddit.command.Criteria;
import kr.or.ddit.dto.AdviceVO;
import kr.or.ddit.dto.AllimVO;
import kr.or.ddit.dto.MemberVO;
import kr.or.ddit.dto.OpenRecVO;
import kr.or.ddit.dto.RecruitVO;
import kr.or.ddit.dto.SeniorVO;
import kr.or.ddit.dto.SupplyRecVO;
import kr.or.ddit.handler.webSocketListener;
import kr.or.ddit.service.AllimService;
import kr.or.ddit.service.CareerService;
import kr.or.ddit.service.CertificateService;
import kr.or.ddit.service.EducationService;
import kr.or.ddit.service.EmpstatsService;
import kr.or.ddit.service.LetterService;
import kr.or.ddit.service.RecruitService;
import kr.or.ddit.service.SupplyRecService;
import kr.or.ddit.service.SupportService;

@Controller
@RequestMapping("/recruit")
//@Slf4j
public class RecruitController {

   @Autowired
   private RecruitService recruitService;
   @Autowired
   private EmpstatsService empstatsService;
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
   
   @RequestMapping(value = "/page", method = RequestMethod.GET)
   public ResponseEntity<Map<String, Object>> recruitlist(@PathVariable("page") int page)throws Exception {
      ResponseEntity<Map<String, Object>> entity = null;
      System.out.println("page1: " + page);
      Criteria cri = new Criteria();
      System.out.println("page: " + page);
      System.out.println("첫번째 버튼값" + cri.getSearchBtn1());
      cri.setPage(page);
      Map<String, Object> dataMap = recruitService.getRecruitList(cri);   
      entity = new ResponseEntity<Map<String, Object>>(dataMap, HttpStatus.OK);      
      return entity;
   }
   
   @GetMapping("list")
   public String recruitList(Criteria cri, HttpServletRequest request) throws Exception {
      String url = "recruit/list";
      cri.setPage(1);
      cri.setPerPageNum(18);
      HttpSession session = request.getSession();
      MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
      String id = loginUser.getId();
      
      cri.setId(id);
      
      Map<String, Object> dataMap = recruitService.getRecruitList(cri);
      request.setAttribute("dataMap", dataMap);
      return url;
   }
   
   @GetMapping("detail")
   public String recruitDetail(String recWantedno, HttpServletRequest request) throws Exception {
      String url = "recruit/detail";
      HttpSession session = request.getSession();
      MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
      String id = loginUser.getId();
      RecruitVO recruitParam = new RecruitVO();
      recruitParam.setIndId(id);
      recruitParam.setRecWantedno(recWantedno);
      RecruitVO recruit = recruitService.getRecruitDetail(recruitParam);
      request.setAttribute("recruit", recruit);
      return url;
   }
   
   @GetMapping("supply")
   public String recruitSupply(String recWantedno, HttpServletRequest request) throws Exception {
      String url = "recruit/supply";
      
      HttpSession session = request.getSession();
      MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
      String id = loginUser.getId();
      
      RecruitVO recruitParam = new RecruitVO();
      recruitParam.setIndId(id);
      recruitParam.setRecWantedno(recWantedno);
      
      RecruitVO recruit = recruitService.getRecruitDetail(recruitParam);
      Map<String, Object> eduMap = educationService.getEducationListById(id);
      Map<String, Object> crrMap = careerService.getCareerListById(id);
      Map<String, Object> cerMap = certificateService.getCertificateListById(id);
      Map<String, Object> letMap = letterService.getLetterListByIndId(id);
      
      request.setAttribute("recruit", recruit);
      request.setAttribute("eduMap", eduMap);
      request.setAttribute("crrMap", crrMap);
      request.setAttribute("cerMap", cerMap);
      request.setAttribute("letMap", letMap);
      
      return url;
   }
   
   @PostMapping("supply/check")
   @ResponseBody
   public String recruitSupplyCheck(@RequestParam("recWantedno") String recWantedno, HttpServletRequest request) throws Exception {
      HttpSession session = request.getSession();
      MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
      String indId = loginUser.getId();
      Map<String, Object> parameterMap = new HashMap<String, Object>();
      parameterMap.put("recWantedno", recWantedno);
      parameterMap.put("indId", indId);
      
      int count = supplyRecService.getCountSupplyRecById(parameterMap);
      
      if(count == 0) {
         return "SupplyAllowed";
      } else {
         return "SupplyNotAllowed";
      }
      
   }
   
   @PostMapping("/supply/submit")
   @ResponseBody
   public String recruitSupplySubmit(String recWantedno, @RequestParam List<String> letTitle, @RequestParam List<String> letContent, HttpSession session) throws Exception {
      MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
      String indId = loginUser.getId();
      
      SupplyRecVO supplyRec = new SupplyRecVO();
      supplyRec.setIndId(indId);
      supplyRec.setRecWantedno(recWantedno);
      
      Map<String, List<String>> letterMap = new HashMap<String, List<String>>();
      letterMap.put("titleList", letTitle);
      letterMap.put("contentList", letContent);
      
      supplyRecService.supplyRecruit(supplyRec, letterMap);
      
      return "recruitSupplySuccess";
   }
   
   @RequestMapping(value = "/scrollList", method = RequestMethod.GET, produces = "application/json;charset=utf-8")
   @ResponseBody
   public Map<String, Object> recruitScrollList(Criteria cri, int pageNum, HttpServletRequest request) throws Exception {
      cri.setPerPageNum(18);
      cri.setPage(pageNum);
      Map<String, Object> dataMap = recruitService.getRecruitList(cri);
      return dataMap;
   }

   @GetMapping("empstats")
   public String empstats(Model model) throws Exception {
      String url = "recruit/empstats";

      Map<String, Object> empstatsMap = empstatsService.getEmpStatsList();
      model.addAttribute("empstatsMap", empstatsMap);
      
      return url;
   }
   
    @PostMapping("/recAllim")
	@ResponseBody
	public AllimVO recAllim(AllimVO allim, webSocketListener handler ) throws Exception {
		
		allim.getFromId();     // 개인 아이디
		allim.getToId();       // 기업 이름
		allim.getRecWantedno();// 구인번호
		System.out.println("찾아줘바"+allim.getFromId());
		System.out.println("찾아줘바"+allim.getToId());
		System.out.println("찾아줘"+allim.getRecWantedno());
		allimService.registAllim(allim);
		handler.AdviceAllim(allim);
		
		
//		String detail = adviceSerivce.registAdvice(indId);
		
		
		return allim;
	}
   
   
   
   
}