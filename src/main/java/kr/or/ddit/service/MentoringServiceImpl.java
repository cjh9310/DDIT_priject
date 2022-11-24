package kr.or.ddit.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import kr.or.ddit.command.Criteria;
import kr.or.ddit.command.MultipartFileUploadResolver;
import kr.or.ddit.command.PageMaker;
import kr.or.ddit.dao.AttachDAO;
import kr.or.ddit.dao.MentoringDAO;
import kr.or.ddit.dto.AttachVO;
import kr.or.ddit.dto.MentoringVO;
@Service
public class MentoringServiceImpl implements MentoringService {
	
	private MentoringDAO mentoringDAO;
	public void setMentoringDAO(MentoringDAO mentoringDAO) {
		this.mentoringDAO = mentoringDAO;
	}
	
	private AttachDAO attachDAO;
	public void setAttachDAO(AttachDAO attachDAO) {
		this.attachDAO = attachDAO;
	}
	
	
	@Override
	public Map<String, Object> getMentoringList() throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		List<MentoringVO> mentoringList = mentoringDAO.selectMentoringList();
		
		dataMap.put("mentoringList",mentoringList);
		
		
		return dataMap;
	}
	


	@Override
	public Map<String, Object> getMentoringList(Criteria cri) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		//현재페이지 번호에 맞는 리스트를 perpageNum 갯수만큼 가져오기
		List<MentoringVO> mentoringList = mentoringDAO.selectMentoringCriteria(cri);
		
		//전체 게시물 갯수
		int totalCount = mentoringDAO.selectMentoringCriteriaTotalCount(cri);
		
		//전처리 totalCnt(멘토링리스트 뿌릴때 사용)
		int totalCnt = totalCount/4;
		
		//pageMaker 생성
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);
		
		dataMap.put("totalCnt",totalCnt);
		dataMap.put("mentoringList",mentoringList);
		dataMap.put("pageMaker", pageMaker);
		
		return dataMap;
	}

	@Override
	public Map<String, Object> getMentoringListByCoId(String coId) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		List<MentoringVO> mentoringList = mentoringDAO.selectMentoringByCoId(coId);
		dataMap.put("mentoringList",mentoringList);                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
		
		return dataMap;
	}


	@Override
	public void registAll(MentoringVO mentoring) throws SQLException {
		int menNo = mentoringDAO.selectMentoringSeqNext();
		mentoring.setMenNo(menNo);
		mentoringDAO.insertAllMentoring(mentoring);
		
	}

	@Override
	public void regist(MentoringVO mentoring, String savePath) throws SQLException {
		int menNo = mentoringDAO.selectMentoringSeqNext();
		mentoring.setMenNo(menNo);
		
		// 첨부파일등록
		// fileUploadPath = D:/team1/src/uploadFile + /업무명(workDiv)
		String workDiv = "Mentoring"; // 필수
		//file 저장 -> List<AttachVO>
		List<AttachVO> attachList = null;
		try {
			// 파일을 실제 물리 저장소에 저장하고, 저장 목록을 리턴.
			attachList = MultipartFileUploadResolver.fileUpload(mentoring.getUploadFile(), savePath + "/" + workDiv);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		// 파일저장정보 목록을 FalseReportVO에 세팅
		mentoring.setAttachList(attachList);	
		
		// 파일정보를 첨부파일 테이블에 등록
		if (mentoring.getAttachList() != null) {
			for (AttachVO attach : mentoring.getAttachList()) {
				attach.setWorkDiv(workDiv);
				attach.setWorkPk(Integer.toString(mentoring.getMenNo()));
				attach.setAttacher(mentoring.getCoId());
				attachDAO.insertAttach(attach);
			}
		}
		/*********** 첨부파일 등록   end**************/
		
		mentoringDAO.insertMentoring(mentoring);
		
	}

	@Override
	public void modify(MentoringVO mentoring) throws SQLException {
		mentoringDAO.updateMentoring(mentoring);
		
	}

	@Override
	public void modifyComem(MentoringVO mentoring) throws SQLException {
		mentoringDAO.updateMentoringComem(mentoring);
		
	}

	@Override
	public void remove(int menNo) throws SQLException {
		mentoringDAO.deleteMentoring(menNo);
		
	}

	@Override
	public MentoringVO getMentoring(int menNo) throws SQLException {
		MentoringVO mentoring = mentoringDAO.selectMentoringByMenNo(menNo);
		return mentoring;
	}

	

	
	

	

}
