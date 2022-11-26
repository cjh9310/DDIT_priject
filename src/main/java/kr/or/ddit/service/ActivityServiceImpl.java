package kr.or.ddit.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.ddit.command.Criteria;
import kr.or.ddit.command.MakeFileName;
import kr.or.ddit.command.MultipartFileUploadResolver;
import kr.or.ddit.command.PageMaker;
import kr.or.ddit.dao.ActivityDAO;
import kr.or.ddit.dao.AttachDAO;
import kr.or.ddit.dao.MemberDAO;
import kr.or.ddit.dto.ActivityVO;
import kr.or.ddit.dto.AttachVO;
import kr.or.ddit.dto.ContestVO;
import kr.or.ddit.dto.MemberVO;
import kr.or.ddit.dto.MentoringVO;

public class ActivityServiceImpl implements ActivityService {
	
	private ActivityDAO activityDAO;
	
	public void setActivityDAO(ActivityDAO activityDAO) {
		this.activityDAO = activityDAO;
	}
	
	private MemberDAO memberDAO;
	public void setMemberDAO(MemberDAO memberDAO) {
		this.memberDAO = memberDAO;
	}
	
	private AttachDAO attachDAO;
	public void setAttachDAO(AttachDAO attachDAO) {
		this.attachDAO = attachDAO;
	}
	
	
	@Override
	public Map<String, Object> getActivityListCon(String indId) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		List<ActivityVO> activityListCon = activityDAO.selectActivityListCon(indId);
		dataMap.put("activityListCon", activityListCon);
		
		return dataMap;
	}

	@Override
	public Map<String, Object> getActivityListMen(String indId) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		List<ActivityVO> activityListMen = activityDAO.selectActivityListMem(indId);
		dataMap.put("activityListMen", activityListMen);
		
		return dataMap;
	}
	
	@Override
	public Map<String, Object> selectAllActivityById(String id) throws SQLException {
		Map<String, Object> activityMap = new HashMap<String, Object>();
		
		MemberVO memberInfo = memberDAO.selectMemberById(id);
		List<ActivityVO> activityList = activityDAO.selectAllActivityById(id);
		List<ActivityVO> contestList = activityDAO.selectActivityListCon(id);
		List<ActivityVO> mentoringList = activityDAO.selectActivityMentoringList(id);
		
		activityMap.put("memberInfo", memberInfo);
		activityMap.put("activityList", activityList);
		activityMap.put("contestList", contestList);
		activityMap.put("mentoringList", mentoringList);
		return activityMap;
	}
	
	@Override
	public Map<String, Object> getActivityList(Criteria cri) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		//현재페이지 번호에 맞는 리스트를 perpageNum 갯수만큼 가져오기
		List<ActivityVO> activityList = activityDAO.selectActivityCriteria(cri);
		
		//전체 게시물 갯수
		int totalCount = activityDAO.selectActivityCriteriaTotalCount(cri);
		
		//전처리 totalCnt(멘토링리스트 뿌릴때 사용)
		int totalCnt = totalCount/4;
		
		//pageMaker 생성
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);
		
		dataMap.put("totalCnt",totalCnt);
		dataMap.put("activityList",activityList);
		dataMap.put("pageMaker", pageMaker);
		
		return dataMap;	
	}

	@Override
	public Map<String, Object> getActivityListByConNo(int conNo) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		List<ActivityVO> activityList = activityDAO.selectActivityListByConNo(conNo);
		dataMap.put("activityList", activityList);
		return dataMap;
	}

	@Override
	public Map<String, Object> getActivityListByMenNo(int menNo) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		List<ActivityVO> activityMenList = activityDAO.selectActivityListByMenNo(menNo);
		dataMap.put("activityMenList",activityMenList);
		return dataMap;
	}

	
	@Override
	public ActivityVO getActivityCon(int actNo) throws SQLException {
		ActivityVO activity = activityDAO.selectActivityConByActNo(actNo);
		
		addAttachList(activity);
		
		if(activity!=null && activity.getAttachList()!=null) {
			for(AttachVO attach:activity.getAttachList()) {
				String originalFileName 
					= MakeFileName.parseFileNameFromUUID(attach.getFilename(), "\\$\\$");
				attach.setFilename(originalFileName);					
			}
		}
		return activity;
	}
	
	private void addAttachList(ActivityVO activity) throws SQLException {

		AttachVO attach = new AttachVO();
		attach.setWorkPk(Integer.toString(activity.getActNo()));
		attach.setWorkDiv("Contest");
		
		List<AttachVO> attachList = attachDAO.selectAttachesByWorkInfo(attach);
		
		activity.setAttachList(attachList);
		
	}
		

	@Override
	public ActivityVO getActivityMen(int actNo) throws SQLException {
		ActivityVO activity = activityDAO.selectActivityMenByActNo(actNo);
		
		return activity;
	}
	


	@Override
	public void registContest(ActivityVO activity, String savePath) throws SQLException {
		int actNo = activityDAO.selectActivitySeqNext();
		activity.setActNo(actNo);
		
		// 첨부파일등록
		// fileUploadPath = D:/team1/src/uploadFile + /업무명(workDiv)
		String workDiv = "Activity"; // 필수
		//file 저장 -> List<AttachVO>
		List<AttachVO> attachList = null;
		try {
			// 파일을 실제 물리 저장소에 저장하고, 저장 목록을 리턴.
			attachList = MultipartFileUploadResolver.fileUpload(activity.getUploadFile(), savePath + "/" + workDiv);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		// 파일저장정보 목록을 FalseReportVO에 세팅
		activity.setAttachList(attachList);	
		
		// 파일정보를 첨부파일 테이블에 등록
		if (activity.getAttachList() != null) {
			for (AttachVO attach : activity.getAttachList()) {
				attach.setWorkDiv(workDiv);
				attach.setWorkPk(Integer.toString(activity.getActNo()));
				attach.setAttacher(activity.getIndId());
				attachDAO.insertAttach(attach);
			}
		}
		/*********** 첨부파일 등록   end**************/
		activityDAO.insertActivityContest(activity);
	}

	@Override
	public void registMentoring(ActivityVO activity) throws SQLException {
		int actNo = activityDAO.selectActivitySeqNext();
		activity.setActNo(actNo);
		
		activityDAO.insertActivityMentoring(activity);

	}

	@Override
	public void modify(ActivityVO activity) throws SQLException {
		activityDAO.updateActivity(activity);

	}

	@Override
	public void modifyCom(ActivityVO activity) throws SQLException {
		activityDAO.updateActivityCom(activity);
	}

	@Override
	public void remove(int actNo) throws SQLException {
		activityDAO.deleteActivity(actNo);

	}
}
