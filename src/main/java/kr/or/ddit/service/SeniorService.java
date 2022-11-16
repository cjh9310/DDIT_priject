package kr.or.ddit.service;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.dto.FaqVO;
import kr.or.ddit.dto.SeniorVO;

public interface SeniorService {
	
	// 전체조회하기
	List<SeniorVO> getAllSeniorList() throws SQLException;
	
	// 상세보기
	SeniorVO getSenior(int snrNo) throws SQLException;
	
	// 입력
	void regist(SeniorVO senior) throws SQLException;
}
