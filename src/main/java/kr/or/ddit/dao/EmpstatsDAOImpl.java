package kr.or.ddit.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.dto.EmpstatsVO;

public class EmpstatsDAOImpl implements EmpstatsDAO {
	
	private SqlSession session;
	
	public void setSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public List<EmpstatsVO> selectTrend() throws SQLException {
		List<EmpstatsVO> trendList = session.selectList("Empstats-Mapper.selectTrend");
		return trendList;
	}
	
	@Override
	public List<EmpstatsVO> selectEmpStats() throws SQLException {
		List<EmpstatsVO> empList = session.selectList("Empstats-Mapper.selectEmpStats");
		return empList;
	}

}
