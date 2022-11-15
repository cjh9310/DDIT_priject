package kr.or.ddit.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.ddit.command.Criteria;
import kr.or.ddit.command.PageMaker;
import kr.or.ddit.dao.ReportDAO;
import kr.or.ddit.dto.ReportListVO;

public class ReportServiceImpl implements ReportService {
	
	private ReportDAO reportDAO;
	public void setReportDAO(ReportDAO reportDAO) {
		this.reportDAO = reportDAO;
	}

	@Override
	public Map<String, Object> getAllReportList(Criteria cri) throws SQLException {
	
		Map<String, Object>dataMap = new HashMap<String, Object>();
		
		// 현재 page 번호에 맞는 리스트를 perPageNum 개수만큼 가져오기.
		List<ReportListVO> reportList = reportDAO.selectAllReportList(cri);
		
		// 전체 board 개수
		int totalCount = reportDAO.selectSearchReportListCount(cri);
		
		//PageMaker 생성.
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);

		dataMap.put("reportList", reportList);
		dataMap.put("pageMaker", pageMaker);

		return dataMap;
	}
	

	@Override
	public ReportListVO getReport(int falNo) throws SQLException {
		
		ReportListVO report = reportDAO.selectReportListByFalNo(falNo);
		
		return report;
	}

		

}
