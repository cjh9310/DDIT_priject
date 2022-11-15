package kr.or.ddit.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.ddit.dao.DocumentDAO;
import kr.or.ddit.dto.DocumentVO;

public class DocumentServiceImpl implements DocumentService {
	
	private DocumentDAO documentDAO;
	public void setDocumentDAO(DocumentDAO documentDAO) {
		this.documentDAO = documentDAO;
	}
	
	@Override
	public Map<String, Object> getDocumentListByIndId(String indId) throws SQLException {
		Map<String, Object> documentMap = new HashMap<String, Object>();
		List<DocumentVO> documentList = documentDAO.selectDocumentListByIndId(indId);
		documentMap.put("documentList", documentList);
		return documentMap;
	}
	
	@Override
	public DocumentVO getDocumentByDocNo(String docNo) throws SQLException {
		DocumentVO document = documentDAO.selectDocumentByDocNo(docNo);
		return document;
	}
	
	@Override
	public void regist(Map<String, Object> document) throws SQLException {
		documentDAO.insertDocument(document);
	}
	
	@Override
	public void modify(Map<String, Object> document) throws SQLException {
		documentDAO.updateDocument(document);
	}
	
	@Override
	public void remove(String docNo) throws SQLException {
		documentDAO.deleteDocument(docNo);
	}
	
}
