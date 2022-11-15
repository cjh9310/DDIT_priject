package kr.or.ddit.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.dto.LetterVO;

public interface LetterDAO {
	
	List<LetterVO> selectLetterListByIndId(String indId) throws SQLException;
	
	LetterVO selectLetterByLetSeqno(String letSeqno) throws SQLException;
	
	int selectCountOpenLetter(String indId) throws SQLException;
	
	void insertLetter(Map<String, Object> letter) throws SQLException;
	
	void updateLetter(Map<String, Object> letter) throws SQLException;
	
	void deleteLetter(String letSeqno) throws SQLException;

}
