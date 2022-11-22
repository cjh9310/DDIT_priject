package kr.or.ddit.controller;

import java.sql.SQLException;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.command.Criteria;
import kr.or.ddit.dto.CorporationVO;
import kr.or.ddit.dto.MemberVO;
import kr.or.ddit.dto.OpenRecVO;
import kr.or.ddit.service.CorporationService;
import kr.or.ddit.service.OpenRecService;

@Controller
@RequestMapping("/openrec")
public class OpenrecController {
	
	private static final Logger log = LoggerFactory.getLogger(OpenrecController.class);
	
	@Autowired
	private OpenRecService openRecService;

	@Autowired
	private CorporationService corporationService; 
	
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
	
}
