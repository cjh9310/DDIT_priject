package kr.or.ddit.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.ddit.dao.FalseReportDAO;
import kr.or.ddit.dto.FalseReportVO;
import kr.or.ddit.dto.ReportVO;

public class FalseReportServiceImpl implements FalseReportService {
	
	private FalseReportDAO falseReportDAO;
	public void setFalseReportDAO(FalseReportDAO falseReportDAO) {
		this.falseReportDAO = falseReportDAO;
	}

	@Override
	public Map<String, Object> getAllFalseReportList(String indId) throws SQLException {
		Map<String, Object> dataMap = null;
		
		List<FalseReportVO> falseReport = falseReportDAO.selectAllFalseReportList(indId);
		
		dataMap = new HashMap<String, Object>();
		
		dataMap.put("falseReportList",falseReport);
		
		return dataMap;
	}

	@Override
	public FalseReportVO getFalseReport(int falNo) throws SQLException {
		FalseReportVO falseReport = falseReportDAO.selectFalseReportByFalNo(falNo);
		return falseReport;
	}

	@Override
	public int regist(FalseReportVO falseReport) throws SQLException {
		
		return falseReportDAO.insertFalse(falseReport);
		
	}

	@Override
	public void modify(FalseReportVO falseReport) throws SQLException {
		falseReportDAO.updateFalse(falseReport);
		
	}

	@Override
	public void remove(int falNo) throws SQLException {
		falseReportDAO.deleteFalse(falNo);
		
	}

	@Override
	public void registReportList(ReportVO reportVO) throws SQLException {
		falseReportDAO.registReportList(reportVO);
		
	}

}
