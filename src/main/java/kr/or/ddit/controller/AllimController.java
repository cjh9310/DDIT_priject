package kr.or.ddit.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.dto.AllimVO;
import kr.or.ddit.dto.MemberVO;
import kr.or.ddit.service.AllimService;




@Controller
@RequestMapping("/allim")
public class AllimController {

	
	@Autowired
	private AllimService allimService;
	
	@GetMapping("list")
	@ResponseBody
	public ResponseEntity<Map<String, Object>> list(HttpServletRequest request) throws Exception {
		
		HttpSession session = request.getSession();
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		String id = loginUser.getId();
		
		Map<String, Object> almMap = allimService.getAllimToList(id);
		ResponseEntity<Map<String, Object>> entity = new ResponseEntity<Map<String, Object>>(almMap,HttpStatus.OK);
		
		return entity;
	}

	
	
 // login기준이 현재 일반회원인데 기업회원이여야 함
	@GetMapping("list2")
	@ResponseBody
	public ResponseEntity<Map<String, Object>> list2(HttpServletRequest request) throws Exception {
		
		HttpSession session = request.getSession();
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		String id = loginUser.getId();
//		AllimVO allim = null;
//		
//		String openSeqno = allim.getOpenSeqno();
//		
//		
		Map<String, Object> almNmTitleMap = allimService.getAllimNmTitleList(id);
//		System.out.println("찾아라"+almNmTitleMap);
		
		ResponseEntity<Map<String, Object>> entity = new ResponseEntity<Map<String, Object>>(almNmTitleMap,HttpStatus.OK);
		return entity;
	}


}
