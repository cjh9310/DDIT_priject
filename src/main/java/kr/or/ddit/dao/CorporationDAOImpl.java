package kr.or.ddit.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.dto.CertificateVO;
import kr.or.ddit.dto.CorporationVO;

public class CorporationDAOImpl implements CorporationDAO {
	
	private SqlSession session;
	public void setSqlSession(SqlSession session) {
		this.session = session;
	}
	
	@Override
	public List<CorporationVO> selectLogoList() throws SQLException {
		List<CorporationVO> logoList = session.selectList("Corporation-Mapper.selectLogoList");
		return logoList;
	}

	@Override
	public CorporationVO selectCoInfoByName(String open_conm) throws SQLException {
		System.out.println(open_conm);
		CorporationVO corporation = session.selectOne("Corporation-Mapper.selectCoInfoByName", open_conm);
		return corporation;
	}
	
	
}
