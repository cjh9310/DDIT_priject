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
//      두가지의 맵을 담기 위해 hashMap을 생성하고 담아줌..  상위호환?		
		Map<String, Object> alertForOpenList = allimService.getAllimOpenList(id);
		Map<String, Object> alertForRecList = allimService.getAllimRecList(id);
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("alertForOpenList", alertForOpenList);
		dataMap.put("alertForRecList", alertForRecList);
		
		ResponseEntity<Map<String, Object>> entity = new ResponseEntity<Map<String, Object>>(dataMap,HttpStatus.OK);
		
		
		return entity;
	}




}
