package kr.or.ddit.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.dto.AllimVO;

public class AllimDAOImpl implements AllimDAO{

	private SqlSession session;
	public void setSqlSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public List<AllimVO> selectToOpenId(String id) throws SQLException {
		List<AllimVO> almList = session.selectList("Allim-Mapper.selectToOpenId",id);
		return almList;
	}
	@Override
	public void insertAllim(AllimVO allim) throws SQLException {
		session.update("Allim-Mapper.insertAllim", allim);
		
	}

	@Override
	public List<AllimVO> selectToRecId(String id) throws SQLException {
		List<AllimVO> almList = session.selectList("Allim-Mapper.selectToRecId",id);
		return almList;
	}

	@Override
	public int selectOpenTotalCount(String id) throws SQLException {
		int count = session.selectOne("Allim-Mapper.selectOpenTotalCount",id);
		return count;
	}

	@Override
	public int selectRecTotalCount(String id) throws SQLException {
		int count = session.selectOne("Allim-Mapper.selectRecTotalCount",id);
		return count;
	}

	@Override
	public List<AllimVO> selectToRecName(String id) throws SQLException {
		List<AllimVO> almList = session.selectList("Allim-Mapper.selectToRecName",id);
		return almList;
	}
	
	@Override
	public List<AllimVO> selectToOpenName(String id) throws SQLException {
		List<AllimVO> almList = session.selectList("Allim-Mapper.selectToOpenName",id);
		return almList;
	}

}
