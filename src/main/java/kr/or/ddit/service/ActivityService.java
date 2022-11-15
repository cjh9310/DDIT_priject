package kr.or.ddit.service;

import java.sql.SQLException;
import java.util.Map;

import kr.or.ddit.command.Criteria;
import kr.or.ddit.dto.ActivityVO;

public interface ActivityService {
	
	Map<String, Object> getActivityList(String indId) throws SQLException;
	
	Map<String, Object> getActivityList(Criteria cri) throws SQLException;
	
	Map<String, Object> getActivityListByConNo(int conNo) throws SQLException;
	
	Map<String, Object> getActivityListByMenNo(int menNo) throws SQLException;
	
	//상세보기
	ActivityVO getActivity(int actNo)throws SQLException;
	
	//등록
	void registContest(ActivityVO activity)throws SQLException;
	
	void registMentoring(ActivityVO activity)throws SQLException;
	
	//수정
	void modify(ActivityVO activity)throws SQLException;
	
	//기업회원이 가산점 입력해줄때의 수정문
	void modifyCom(ActivityVO activity)throws SQLException;
	
	//삭제
	void remove(int actNo)throws SQLException;
	
}
