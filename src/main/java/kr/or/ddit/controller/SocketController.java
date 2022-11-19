package kr.or.ddit.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import bookred.socket.dto.AlramVO;
import bookred.socket.service.SocketService;

@Controller
@RequestMapping("/socket")
public class SocketController {
	
	@Autowired
	SocketService socekService;
	
	@PostMapping(value = "/main",produces = "application/json;charset=utf-8" )
	@ResponseBody
	public Map<String, Object> main() throws Exception {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		System.out.println("socket컨트롤러");
		List<AlramVO> alramList = socekService.getAlramRMList();
		
		dataMap.put("alramList", alramList);
		
		return dataMap;
	}

}
