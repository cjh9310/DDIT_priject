package kr.or.ddit.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


import kr.or.ddit.command.Criteria;
import kr.or.ddit.command.MultipartFileUploadResolver;
import kr.or.ddit.command.PageMaker;
import kr.or.ddit.dao.AttachDAO;
import kr.or.ddit.dao.SupportDAO;
import kr.or.ddit.dto.AttachVO;
import kr.or.ddit.dto.SupportVO;

public class SupportServiceImpl implements SupportService {
	
	private SupportDAO supportDAO;
	public void setSupportDAO(SupportDAO supportDAO) {
		this.supportDAO = supportDAO;
	}
	
	private AttachDAO attachDAO;
	public void setAttachDAO(AttachDAO attachDAO) {
		this.attachDAO = attachDAO;
	}
	
	@Override
	public Map<String, Object> getSupportList(Criteria cri) throws SQLException {


		Map<String, Object> dataMap = new HashMap<String, Object>();

		// 현재 page 번호에 맞는 리스트를 perPageNum 개수 만큼 가져오기.
		List<SupportVO> supportList = supportDAO.selectSupportCriteria(cri);
		
		// 전체 board 개수
		int totalCount = supportDAO.selectSupportCriteriaTotalCount(cri);

		// PageMaker 생성.
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);

		dataMap.put("supportList", supportList);
		dataMap.put("pageMaker", pageMaker);

		return dataMap;
	}
	
	@Override
	public Map<String, Object> getSupportListByindId(String indId) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		List<SupportVO> supportList = supportDAO.selectSupportListByIndId(indId);
		
		dataMap.put("supportList", supportList);
		
		return dataMap;
	}

	@Override
	public SupportVO getSupport(int supNo) throws SQLException {
		SupportVO support = supportDAO.selectSupportBySupNo(supNo);
		return support;
	}


	@Override
	public void regist(SupportVO support, String savePath) throws SQLException {
		int supNo = supportDAO.selectSupportSeqNext();
		support.setSupNo(supNo);
		
		// 첨부파일등록
		// fileUploadPath = D:/team1/src/uploadFile + /업무명(workDiv)
		String workDiv = "Support"; // 필수
		//file 저장 -> List<AttachVO>
		List<AttachVO> attachList = null;
		try {
			// 파일을 실제 물리 저장소에 저장하고, 저장 목록을 리턴.
			attachList = MultipartFileUploadResolver.fileUpload(support.getUploadFile(), savePath + "/" + workDiv);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		// 파일저장정보 목록을 FalseReportVO에 세팅
		support.setAttachList(attachList);	
		
		// 파일정보를 첨부파일 테이블에 등록
		if (support.getAttachList() != null) {
			for (AttachVO attach : support.getAttachList()) {
				attach.setWorkDiv(workDiv);
				attach.setWorkPk(Integer.toString(support.getSupNo()));
				attach.setAttacher(support.getIndId());
				attachDAO.insertAttach(attach);
			}
		}
		/*********** 첨부파일 등록   end**************/
				
		supportDAO.insertSupport(support);
	}

	@Override
	public void modify(SupportVO support) throws SQLException {
		supportDAO.updateSupport(support);

	}

	@Override
	public void remove(int supNo) throws SQLException {
		supportDAO.deleteSupport(supNo);

	}
	
	@Override
	public void updateSupportCounselor(SupportVO support) throws SQLException {
		System.out.println("서포트서포트서포트서포트서포트서포트"+support);
		supportDAO.updateSupportCounselor(support);
		
	}
}
