package kr.or.ddit.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.ddit.command.Criteria;
import kr.or.ddit.command.MakeFileName;
import kr.or.ddit.command.MultipartFileUploadResolver;
import kr.or.ddit.command.PageMaker;
import kr.or.ddit.dao.AttachDAO;
import kr.or.ddit.dao.ContestDAO;
import kr.or.ddit.dto.AttachVO;
import kr.or.ddit.dto.ContestVO;
import kr.or.ddit.dto.OpenRecVO;

public class ContestServiceImpl implements ContestService {
	
	private ContestDAO contestDAO;
	public void setContestDAO(ContestDAO contestDAO) {
		this.contestDAO = contestDAO;
	}
	
	private AttachDAO attachDAO;
	public void setAttachDAO(AttachDAO attachDAO) {
		this.attachDAO = attachDAO;
	}

	@Override
	public Map<String, Object> getContestList() throws SQLException {
		Map<String, Object> dataMap = null;
		
		List<ContestVO> contestList = contestDAO.selectContestList();
		
		dataMap = new HashMap<String, Object>();
		dataMap.put("contestList", contestList);
		
		return dataMap;
	}
	
	@Override
	public Map<String, Object> getContestListByCoId(String coId) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		List<ContestVO> contestList = contestDAO.selectContestListByCoId(coId);
		
		dataMap.put("contestList", contestList);
		
		return dataMap;
	}
	
	@Override
	public Map<String, Object> getContestList(Criteria cri) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		//현재페이지 번호에 맞는 리스트를 perpageNum 갯수만큼 가져오기
		List<ContestVO> contestList = contestDAO.selectContestCriteria(cri);
		System.out.println("왜안나와"+contestList);
		//전체 게시물 개수
		int totalCount = contestDAO.selectContestCriteriaTotalCount(cri);
		
		//공모전리스트 뿌릴때 편하게 하려고 작업한 totalCnt
		int totalCnt = totalCount/4;
		
		//pagemaker 생성
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);
		
		dataMap.put("totalCnt", totalCnt);
		dataMap.put("contestList", contestList);
		dataMap.put("pageMaker", pageMaker);
		
		return dataMap;
	}

	@Override
	public ContestVO getContest(int conNo) throws SQLException {
		ContestVO contest = contestDAO.selectContestByconNo(conNo);
		
		addAttachList(contest);
		
		if(contest!=null && contest.getAttachList()!=null) {
			for(AttachVO attach:contest.getAttachList()) {
				String originalFileName 
					= MakeFileName.parseFileNameFromUUID(attach.getFilename(), "\\$\\$");
				attach.setFilename(originalFileName);					
			}
		}
		return contest;
	}
	
	private void addAttachList(ContestVO contest) throws SQLException {

		AttachVO attach = new AttachVO();
		attach.setWorkPk(Integer.toString(contest.getConNo()));
		attach.setWorkDiv("Contest");
		
		List<AttachVO> attachList = attachDAO.selectAttachesByWorkInfo(attach);
		
		contest.setAttachList(attachList);
		
	}

	@Override
	public void regist(ContestVO contest, String savePath) throws SQLException {
		int conNo = contestDAO.selectContestSeqNext();
		contest.setConNo(conNo);
		
		// 첨부파일등록
		// fileUploadPath = D:/team1/src/uploadFile + /업무명(workDiv)
		String workDiv = "Contest"; // 필수
		//file 저장 -> List<AttachVO>
		List<AttachVO> attachList = null;
		try {
			// 파일을 실제 물리 저장소에 저장하고, 저장 목록을 리턴.
			attachList = MultipartFileUploadResolver.fileUpload(contest.getUploadFile(), savePath + "/" + workDiv);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		// 파일저장정보 목록을 FalseReportVO에 세팅
		contest.setAttachList(attachList);	
		
		// 파일정보를 첨부파일 테이블에 등록
		if (contest.getAttachList() != null) {
			for (AttachVO attach : contest.getAttachList()) {
				attach.setWorkDiv(workDiv);
				attach.setWorkPk(Integer.toString(contest.getConNo()));
				attach.setAttacher(contest.getCoId());
				attachDAO.insertAttach(attach);
			}
		}
		/*********** 첨부파일 등록   end**************/
				
		contestDAO.insertContest(contest);

	}

	@Override
	public void modify(ContestVO contest) throws SQLException {
		contestDAO.updateContest(contest);

	}

	@Override
	public void remove(int conNo) throws SQLException {
		contestDAO.deleteContest(conNo);
	}

	

	

}
