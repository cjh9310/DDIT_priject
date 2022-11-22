package kr.or.ddit.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.ddit.command.Criteria;
import kr.or.ddit.command.MultipartFileUploadResolver;
import kr.or.ddit.command.PageMaker;
import kr.or.ddit.dao.AttachDAO;
import kr.or.ddit.dao.FalseReportDAO;
import kr.or.ddit.dto.AttachVO;
import kr.or.ddit.dto.FalseReportVO;
import kr.or.ddit.dto.ReportVO;


public class FalseReportServiceImpl implements FalseReportService {
	
	
	private FalseReportDAO falseReportDAO;
	public void setFalseReportDAO(FalseReportDAO falseReportDAO) {
		this.falseReportDAO = falseReportDAO;
	}
	
	private AttachDAO attachDAO;
	public void setAttachDAO(AttachDAO attachDAO) {
		this.attachDAO = attachDAO;
	}
	
	@Override
	public Map<String, Object> getAllFalseReportList(Criteria cri, String indId) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		List<FalseReportVO> falseReport = falseReportDAO.selectAllFalseReportList(cri, indId);
		
		int totalCount = falseReportDAO.selectAllFalseReportListCount(indId);
		
		// pageMaker 생성
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);
						
		dataMap.put("falseReportList",falseReport);
		dataMap.put("pageMaker", pageMaker);
		
		return dataMap;
	}

	@Override
	public FalseReportVO getFalseReport(int falNo) throws SQLException {
		FalseReportVO falseReport = falseReportDAO.selectFalseReportByFalNo(falNo);
		return falseReport;
	}

	@Override
	public void regist(FalseReportVO falseReport, String savePath) throws SQLException {
		
		/*********** 거짓구인광고신고 등록  start************/
		falseReportDAO.insertFalse(falseReport);
		/*********** 거짓구인광고신고 등록  start************/
		
		/*********** 첨부파일 등록  start************/
		// 첨부파일등록
		// fileUploadPath = D:/team1/src/uploadFile + /업무명(workDiv)
		String workDiv = "FalseReport"; // 필수
		//file 저장 -> List<AttachVO>
		List<AttachVO> attachList = null;
		try {
			attachList = MultipartFileUploadResolver.fileUpload(falseReport.getUploadFile(), savePath + "/" + workDiv);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		// 파일저장정보 목록을 FalseReportVO에 세팅
		falseReport.setAttachList(attachList);	
		
		if (falseReport.getAttachList() != null) {
			for (AttachVO attach : falseReport.getAttachList()) {
				attach.setWorkDiv(workDiv);
				attach.setWorkPk(Integer.toString(falseReport.getFalNo()));
				attach.setAttacher(falseReport.getIndId());
				attachDAO.insertAttach(attach);
			}
		}
		/*********** 첨부파일 등록   end**************/
		
		/*********** 신고내역관리등록  start*********/
		ReportVO reportVO = new ReportVO();
		reportVO.setFalNo(falseReport.getFalNo());
		reportVO.setRepStatus("신고접수중");
		
		falseReportDAO.registReportList(reportVO);
		/*********** 신고내역관리등록 end************/
		
		System.out.println("내용 :" + falseReport.getFalContent());
		
	}

	@Override
	public void modify(FalseReportVO falseReport) throws SQLException {
		falseReportDAO.updateFalse(falseReport);
		
	}

	@Override
	public void remove(int falNo) throws SQLException {
		falseReportDAO.deleteFalse(falNo);
		
	}

}
