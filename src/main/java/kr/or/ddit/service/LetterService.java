package kr.or.ddit.service;

import java.sql.SQLException;
import java.util.Map;

import kr.or.ddit.dto.LetterVO;

public interface LetterService {
	
	Map<String, Object> getLetterListByIndId(String indId)throws SQLException;
	
	LetterVO getLetterByLetSeqno(String letSeqno) throws SQLException;
	
	void regist(Map<String, Object> letter) throws SQLException;
	
	void modify(Map<String, Object> letter) throws SQLException;
	
	void remove(String letSeqno) throws SQLException;
	
}


