package kr.or.ddit.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.dto.CertificateVO;

public interface CertificateDAO {
	
	List<CertificateVO> selectCertificateListById(String id) throws SQLException;
	
	CertificateVO selectCertificateByCerNo(String cerNo) throws SQLException;
	
	void insertCertificate(Map<String, Object> certificate) throws SQLException;
	
	void updateCertificate(Map<String, Object> certificate) throws SQLException;
	
	void deleteCertificate(String cerNo) throws SQLException;
	
}
