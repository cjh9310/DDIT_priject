package kr.or.ddit.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.command.Criteria;
import kr.or.ddit.dto.CoDetailListVO;
import kr.or.ddit.dto.ReportListVO;

public class ReportDAOImpl implements ReportDAO {
	
	private SqlSession session;
	public void setSqlSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public List<ReportListVO> selectAllReportList(Criteria cri) throws SQLException {
		
		int startRow = cri.getStartRowNum()+1;
		int endRow = startRow+cri.getPerPageNum()-1;
		
		Map<String, Object> dataParam = new HashMap<String, Object>();
		dataParam.put("startRow", startRow);
		dataParam.put("endRow", endRow);
		dataParam.put("searchType", cri.getSearchType());
		dataParam.put("keyword", cri.getKeyword());		
		
		List<ReportListVO> reportList = session.selectList("ReportList-Mapper.selectAllReportList",dataParam);
		
		return reportList;
	}
	
	@Override
	public int selectSearchReportListCount(Criteria cri) throws SQLException {
		int count = session.selectOne("ReportList-Mapper.selectSearchReportListCount", cri);
		return count;
	}

	@Override
	public ReportListVO selectReportListByFalNo(int falNo) throws SQLException {
		ReportListVO reportList =  session.selectOne("ReportList-Mapper.selectReportListByFalNo", falNo);
		return reportList;
	}

	@Override
	public List<CoDetailListVO> selectCoDetail(String coName) throws SQLException {
		List<CoDetailListVO> coDetail = session.selectList("ReportList-Mapper.selectCoDetail", coName);
		return coDetail;
	}

	@Override
	public void updateReportChangeStatus(ReportListVO reportList) throws SQLException {
		session.update("ReportList-Mapper.updateReportChangeStatus", reportList);
	}
	
}
