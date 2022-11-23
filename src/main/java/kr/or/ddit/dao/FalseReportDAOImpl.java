package kr.or.ddit.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.command.Criteria;
import kr.or.ddit.dto.FalseReportVO;
import kr.or.ddit.dto.ReportVO;

public class FalseReportDAOImpl implements FalseReportDAO {
	
	private SqlSession session;
	public void setSqlSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public List<FalseReportVO> selectAllFalseReportList(Criteria cri, String indId) throws SQLException {
		
		int startRow = cri.getStartRowNum()+1;
		int endRow = startRow+cri.getPerPageNum()-1;
		
		Map<String,Object> dataParam = new HashMap<String,Object>();
		
		dataParam.put("startRow",startRow);
		dataParam.put("endRow",endRow);
		dataParam.put("id", indId);
	
		List<FalseReportVO> falseReportList = session.selectList("FalseReport-Mapper.selectAllFalseReportList", dataParam);

		return falseReportList;
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

	@Override
	public int selectAllFalseReportListCount(String indId) {
		int count = session.selectOne("FalseReport-Mapper.selectAllFalseReportListCount", indId);
		return count;
	}

	@Override
	public FalseReportVO selectFalseReportById(int falNo, String id) throws SQLException {
		Map<String, Object> dataParam = new HashMap<>();
		dataParam.put("id", id);
		dataParam.put("falNo", falNo);
		FalseReportVO falseReport = session.selectOne("FalseReport-Mapper.selectFalseReportById", dataParam);
		return falseReport;
	}

}
