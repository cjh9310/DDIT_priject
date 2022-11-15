package kr.or.ddit.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.dto.CertificateVO;

public class CertificateDAOImpl implements CertificateDAO {
	
	private SqlSession session;
	public void setSqlSession(SqlSession session) {
		this.session = session;
	}
	
	@Override
	public List<CertificateVO> selectCertificateListById(String id) throws SQLException {
		List<CertificateVO> cerList = session.selectList("Certificate-Mapper.selectCertificateListById", id);
		return cerList;
	}
	
	@Override
	public CertificateVO selectCertificateByCerNo(String cerNo) throws SQLException {
		CertificateVO certificate = session.selectOne("Certificate-Mapper.selectCertificateByCerNo", cerNo);
		return certificate;
	}
	
	@Override
	public void insertCertificate(Map<String, Object> certificate) throws SQLException {
		session.update("Certificate-Mapper.insertCertificate", certificate);
	}
	
	@Override
	public void updateCertificate(Map<String, Object> certificate) throws SQLException {
		session.update("Certificate-Mapper.updateCertificate", certificate);
	}
	
	@Override
	public void deleteCertificate(String crrNo) throws SQLException {
		session.update("Certificate-Mapper.deleteCertificate", crrNo);
	}

}
