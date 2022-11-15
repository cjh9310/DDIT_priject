package kr.or.ddit.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.dto.FalseReportVO;
import kr.or.ddit.dto.ReportVO;

public class FalseReportDAOImpl implements FalseReportDAO {
	
	private SqlSession session;
	public void setSqlSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public List<FalseReportVO> selectAllFalseReportList(String indId) throws SQLException {
		return session.selectList("FalseReport-Mapper.selectAllFalseReportList", indId);
	}

	@Override
	public FalseReportVO selectFalseReportByFalNo(int falNo) throws SQLException {
		return session.selectOne("FalseReport-Mapper.selectFalseReportByFalNo", falNo);
	}

	@Override
	public int insertFalse(FalseReportVO falseReport) throws SQLException {
		return session.insert("FalseReport-Mapper.insertFalse", falseReport);
		
	}

	@Override
	public void updateFalse(FalseReportVO falseReport) throws SQLException {
		session.update("FalseReport-Mapper.updateFalse", falseReport);
		
	}

	@Override
	public void deleteFalse(int falNo) throws SQLException {
		session.update("FalseReport-Mapper.deleteFalse", falNo);
		
	}

	@Override
	public void registReportList(ReportVO reportVO) throws SQLException {
		session.insert("FalseReport-Mapper.insertReportList", reportVO);
	}

}
