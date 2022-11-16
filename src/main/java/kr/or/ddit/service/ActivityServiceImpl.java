package kr.or.ddit.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.ddit.command.Criteria;
import kr.or.ddit.command.PageMaker;
import kr.or.ddit.dao.ActivityDAO;
import kr.or.ddit.dto.ActivityVO;
import kr.or.ddit.dto.MentoringVO;

public class ActivityServiceImpl implements ActivityService {
	
	private ActivityDAO activityDAO;
	
	public void setActivityDAO(ActivityDAO activityDAO) {
		this.activityDAO = activityDAO;
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
		List<ActivityVO> activityList = activityDAO.selectActivityListByMenNo(menNo);
		dataMap.put("activityList",activityList);
		return dataMap;
	}

	@Override
	public ActivityVO getActivity(int actNo) throws SQLException {
		ActivityVO activity = activityDAO.selectActivityByActNo(actNo);
		return activity;
	}

	@Override
	public void registContest(ActivityVO activity) throws SQLException {
		int actNo = activityDAO.selectActivitySeqNext();
		activity.setActNo(actNo);
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
