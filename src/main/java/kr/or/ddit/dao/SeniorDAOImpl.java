package kr.or.ddit.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.dto.SeniorVO;

public class SeniorDAOImpl implements SeniorDAO {
	
	private SqlSession session;
	public void setSqlSession (SqlSession session) {
		this.session = session;
	}

	@Override
	public List<SeniorVO> selectAllSeniorList() throws SQLException {
		return session.selectList("Senior-Mapper.selectAllSeniorList");
	}

	@Override
	public SeniorVO selectSeniorListBySnrNo(int snrNo) throws SQLException {
		return session.selectOne("Senior-Mapper.selectSeniorListBySnrNo", snrNo);
	}

	@Override
	public void insertSenior(SeniorVO senior) throws SQLException {
		session.insert("Senior-Mapper.insertSenior", senior);
		
	}

}
