package kr.or.ddit.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.command.Criteria;
import kr.or.ddit.dto.AuthReqVO;

public interface AuthReqService {
	// 목록 조회
		Map<String, Object> getAuthReqList(Criteria cri) throws SQLException;
		
		// 상세보기
		AuthReqVO getAuthReq(int authNo) throws SQLException;
		
		// 등록
		void regist(AuthReqVO authReq) throws SQLException;
		


		
	
}
