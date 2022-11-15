package kr.or.ddit.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.dto.DocumentVO;

public interface DocumentDAO {
	
	List<DocumentVO> selectDocumentListByIndId(String indId) throws SQLException;
	
	DocumentVO selectDocumentByDocNo(String docNo) throws SQLException;
	
	void insertDocument(Map<String, Object> document) throws SQLException;
	
	void updateDocument(Map<String, Object> document) throws SQLException;
	
	void deleteDocument(String docNo) throws SQLException;

}
