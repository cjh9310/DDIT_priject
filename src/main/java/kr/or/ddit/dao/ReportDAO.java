package kr.or.ddit.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.command.Criteria;
import kr.or.ddit.dto.CoDetailListVO;
import kr.or.ddit.dto.ReportListVO;

public interface ReportDAO {
	
	List<ReportListVO> selectAllReportList(Criteria cri)throws SQLException;
	
	int selectSearchReportListCount(Criteria cri)throws SQLException;
	
	ReportListVO selectReportListByFalNo(int falNo)throws SQLException;
	
	List<CoDetailListVO> selectCoDetail(String coName)throws SQLException;
	
	void updateReportChangeStatus(ReportListVO reportList)throws SQLException;
}
