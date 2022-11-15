package kr.or.ddit.service;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.dao.FalseReportDAO;
import kr.or.ddit.dto.FalseReportVO;
import kr.or.ddit.dto.ReportVO;

public class FalseReportServiceImpl implements FalseReportService {
	
	private FalseReportDAO falseReportDAO;
	public void setFalseReportDAO(FalseReportDAO falseReportDAO) {
		this.falseReportDAO = falseReportDAO;
	}

	@Override
	public List<FalseReportVO> getAllFalseReportList(String indId) throws SQLException {
		List<FalseReportVO> falseReport = falseReportDAO.selectAllFalseReportList(indId);
		return falseReport;
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
