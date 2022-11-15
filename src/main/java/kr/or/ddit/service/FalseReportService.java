package kr.or.ddit.service;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.dto.FalseReportVO;
import kr.or.ddit.dto.ReportVO;

public interface FalseReportService {
	
	// 전체보기
	List<FalseReportVO> getAllFalseReportList(String indId)throws SQLException;
	
	// 상세보기
	FalseReportVO getFalseReport(int falNo)throws SQLException;
	
	// 등록
	int regist(FalseReportVO falseReport)throws SQLException;
	
	// 수정
	void modify(FalseReportVO falseReport)throws SQLException;
	
	// 삭제
	void remove(int falNo)throws SQLException;
	
	// 리포트리스트(관리자페이지) 등록
	void registReportList(ReportVO reportVO)throws SQLException;

}
