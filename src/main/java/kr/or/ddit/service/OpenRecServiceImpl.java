package kr.or.ddit.service;

import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.log;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.or.ddit.command.Criteria;
import kr.or.ddit.command.MakeFileName;
import kr.or.ddit.command.MultipartFileUploadResolver;
import kr.or.ddit.command.PageMaker;
import kr.or.ddit.dao.AttachDAO;
import kr.or.ddit.dao.OpenRecDAO;
import kr.or.ddit.dto.AttachVO;
import kr.or.ddit.dto.OpenRecVO;
import kr.or.ddit.dto.RecruitVO;

public class OpenRecServiceImpl implements OpenRecService {
	
	private final Logger log = LoggerFactory.getLogger(getClass());

	private OpenRecDAO openRecDAO;
	public void setOpenRecDAO(OpenRecDAO openRecDAO) {
		this.openRecDAO = openRecDAO;
	}
	
	private AttachDAO attachDAO;
	public void setAttachDAO(AttachDAO attachDAO) {
		this.attachDAO = attachDAO;
	}
	
	@Override
	public Map<String, Object> getOpenRecList() throws SQLException {
		Map<String, Object> dataMap = null;
		
		List<OpenRecVO> openRecList = openRecDAO.selectOpenRecList();
		
		dataMap = new HashMap<String, Object>();
		dataMap.put("openRecList", openRecList);
		
		return dataMap;
	}

	@Override
	public Map<String, Object> getOpenRecList(Criteria cri) throws SQLException {
		Map<String, Object> dataMap = null;
		
		List<OpenRecVO> openRecList = openRecDAO.selectSearchOpenRecList(cri);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(openRecDAO.selectOpenRecListCount(cri));
		
		dataMap = new HashMap<String, Object>();
		dataMap.put("pageMaker",pageMaker);
		dataMap.put("openRecList", openRecList);
		
		return dataMap;
	}
	
	@Override
	public Map<String, Object> getOpenRecListByScroll(int startNum, int endNum) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		List<OpenRecVO> openRecList = openRecDAO.selectOpenRecListByScroll(startNum, endNum);
		dataMap.put("openRecList", openRecList);
		return dataMap;
	}

	@Override
	public Map<String, Object> getOpenRecListByConm(String open_conm) throws SQLException {
		Map<String, Object> dataMap = null;
		
		List<OpenRecVO> openRecList = openRecDAO.selectOpenRecListByConm(open_conm);
		
		dataMap = new HashMap<String, Object>();
		dataMap.put("openRecList", openRecList);
		
		return dataMap;
	}
	
	@Override
	public Map<String, Object> getOpenRecListForMain() throws SQLException {
		Map<String, Object> dataMap = null;
		
		List<OpenRecVO> openRecList = openRecDAO.selectOpenRecListForMain();
		
		dataMap = new HashMap<String, Object>();
		dataMap.put("openRecList", openRecList);
		
		return dataMap;
	}

	@Override
	public int regist(OpenRecVO openRec, String savePath) throws SQLException {

		openRecDAO.insertOpenRec(openRec);
		
		System.out.println("공채 입력 서비스 옴");

		String workDiv = "openRec"; // 필수
		
		List<AttachVO> attachList = null;
		try {
			attachList = MultipartFileUploadResolver.fileUpload(openRec.getUploadFile(), savePath + "/" + workDiv);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		openRec.setAttachList(attachList);
		
		if(openRec.getAttachList() != null) {
			for (AttachVO attach : openRec.getAttachList()) {
				attach.setWorkDiv(workDiv);
				attach.setWorkPk(Integer.toString(openRec.getOpenSeqno()));
				attach.setAttacher(openRec.getOpenConm());
				attachDAO.insertAttach(attach);
			}
		}
		
		
		return 1;
	}

	@Override
	public OpenRecVO getOpenRecListByNo(int open_seqNo) throws SQLException {
		OpenRecVO openRecDetail = openRecDAO.selectOpenRecListByNo(open_seqNo);
		
		addAttachList(openRecDetail);
		
		if(openRecDetail!=null && openRecDetail.getAttachList()!=null) {
			for(AttachVO attach:openRecDetail.getAttachList()) {
				String originalFileName 
					= MakeFileName.parseFileNameFromUUID(attach.getFilename(), "\\$\\$");
				attach.setFilename(originalFileName);					
			}
		}
		
		return openRecDetail;
	}
	
	@Override
	public OpenRecVO getOpenRecListByDetail(OpenRecVO openRec) throws SQLException {
		OpenRecVO openRecDetail = openRecDAO.selectOpenRecListbyDetail(openRec);
		return openRecDetail;
	}

	@Override
	public int modify(OpenRecVO openRec) throws SQLException {
		int openRecModify = openRecDAO.modifyOpenRec(openRec);
		return openRecModify;
	}

	@Override
	public void delete(int openSeqno) throws SQLException {
		openRecDAO.delete(openSeqno);
	}
	
	private void addAttachList(OpenRecVO openRec) throws SQLException {

		AttachVO attach = new AttachVO();
		attach.setWorkPk(Integer.toString(openRec.getOpenSeqno()));
		attach.setWorkDiv("openRec");
		
		List<AttachVO> attachList = attachDAO.selectAttachesByWorkInfo(attach);
		
		openRec.setAttachList(attachList);
		
	}
}
