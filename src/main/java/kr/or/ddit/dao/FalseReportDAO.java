package kr.or.ddit.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.command.Criteria;
import kr.or.ddit.dto.FalseReportVO;
import kr.or.ddit.dto.ReportVO;

public interface FalseReportDAO {
	
	List<FalseReportVO> selectAllFalseReportList(String indId, Criteria cri)throws SQLException;
	
	FalseReportVO selectFalseReportByFalNo(int falNo)throws SQLException;
	
	int insertFalse(FalseReportVO falseReport)throws SQLException;
	
	void updateFalse(FalseReportVO falseReport)throws SQLException;
	
	void deleteFalse(int falNo)throws SQLException;

	void registReportList(ReportVO reportVO)throws SQLException;

	int selectAllFalseReportListCount(String indId);
}
