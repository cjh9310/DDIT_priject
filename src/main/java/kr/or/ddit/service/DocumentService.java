package kr.or.ddit.service;

import java.sql.SQLException;
import java.util.Map;

import kr.or.ddit.dto.DocumentVO;

public interface DocumentService {
	
	Map<String, Object> getDocumentListByIndId(String indId)throws SQLException;
	
	DocumentVO getDocumentByDocNo(String docNo) throws SQLException;
	
	void regist(Map<String, Object> document) throws SQLException;
	
	void modify(Map<String, Object> document) throws SQLException;
	
	void remove(String docNo) throws SQLException;
	
}


