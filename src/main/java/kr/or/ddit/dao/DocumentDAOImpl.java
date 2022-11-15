package kr.or.ddit.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.dto.DocumentVO;

public class DocumentDAOImpl implements DocumentDAO {
	
	private SqlSession session;
	public void setSqlSession(SqlSession session) {
		this.session = session;
	}
	
	@Override
	public List<DocumentVO> selectDocumentListByIndId(String indId) throws SQLException {
		List<DocumentVO> documentList = session.selectList("Document-Mapper.selectDocumentListByIndId", indId);
		return documentList;
	}
	
	@Override
	public DocumentVO selectDocumentByDocNo(String docNo) throws SQLException {
		DocumentVO document = session.selectOne("Document-Mapper.selectDocumentByDocNo", docNo);
		return document;
	}
	
	@Override
	public void insertDocument(Map<String, Object> document) throws SQLException {
		session.update("Document-Mapper.insertDocument", document);
	}
	
	@Override
	public void updateDocument(Map<String, Object> document) throws SQLException {
		session.update("Document-Mapper.updateDocument", document);
	}
	
	@Override
	public void deleteDocument(String docNo) throws SQLException {
		session.update("Document-Mapper.deleteDocument", docNo);
	}

}
