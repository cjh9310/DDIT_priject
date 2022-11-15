package kr.or.ddit.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.command.Criteria;
import kr.or.ddit.dto.ReportListVO;

public interface ReportService {
	
	// 전체보기
	Map<String, Object> getAllReportList(Criteria cri) throws SQLException;
	
	// 상세보기
	ReportListVO getReport(int falNo) throws SQLException;

}
