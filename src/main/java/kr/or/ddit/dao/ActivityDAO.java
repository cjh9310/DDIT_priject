package kr.or.ddit.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.command.Criteria;
import kr.or.ddit.dto.ActivityVO;

public interface ActivityDAO {
	
	//개인회원 자신이 참여한 프로그램 리스트
	List<ActivityVO> selectActivityList(String indId) throws SQLException;
	
	//공모전번호로 참가자 리스트 가져오기
	List<ActivityVO> selectActivityListByConNo(int conNo) throws SQLException;
	
	//멘토링번호로 참가자 리스트 가져오기
	List<ActivityVO> selectActivityListByMenNo(int menNo) throws SQLException;
	
	List<ActivityVO> selectActivityCriteria(Criteria cri) throws SQLException;
	
	int selectActivityCriteriaTotalCount(Criteria cri) throws SQLException;
	
	ActivityVO selectActivityByActNo(int actNo) throws SQLException;
	
	void insertActivityContest(ActivityVO activity) throws SQLException;
	void insertActivityMentoring(ActivityVO activity) throws SQLException;
	
	void updateActivity(ActivityVO activity) throws SQLException;
	//기업회원이 가산점 부여하는 update
	void updateActivityCom(ActivityVO activity) throws SQLException;
	
	void deleteActivity(int actNo) throws SQLException;
	
	int selectActivitySeqNext() throws SQLException;
	
}
