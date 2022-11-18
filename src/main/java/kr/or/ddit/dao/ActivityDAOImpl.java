package kr.or.ddit.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.command.Criteria;
import kr.or.ddit.dto.ActivityVO;
import kr.or.ddit.dto.MentoringVO;

public class ActivityDAOImpl implements ActivityDAO {
	
	private SqlSession session;
	
	public void setSqlSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public List<ActivityVO> selectActivityListCon(String indId) throws SQLException {
		List<ActivityVO> activityList = session.selectList("Activity-Mapper.selectActivityListCon", indId);
		return activityList;
	}

	@Override
	public List<ActivityVO> selectActivityListMem(String indId) throws SQLException {
		List<ActivityVO> activityList = session.selectList("Activity-Mapper.selectActivityListMen", indId);
		return activityList;
	}

	@Override
	public List<ActivityVO> selectActivityListByConNo(int conNo) throws SQLException {
		List<ActivityVO> activityList = session.selectList("Activity-Mapper.selectActivityListByConNo", conNo);
		return activityList;
	}

	@Override
	public List<ActivityVO> selectActivityListByMenNo(int menNo) throws SQLException {
		List<ActivityVO> activityList = session.selectList("Activity-Mapper.selectActivityListByMenNo", menNo);
		return activityList;
	}

	@Override
	public List<ActivityVO> selectActivityCriteria(Criteria cri) throws SQLException {
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset,limit);
		
		List<ActivityVO> activityList = session.selectList("Activity-Mapper.selectActivityList", cri,rowBounds);
		
		return activityList;
	}

	@Override
	public int selectActivityCriteriaTotalCount(Criteria cri) throws SQLException {
		int count = session.selectOne("Activity-Mapper.selectActivityListCount", cri);
		return count;
	}
	
	@Override
	public ActivityVO selectActivityByActNo(int actNo) throws SQLException {
		ActivityVO activity = session.selectOne("Activity-Mapper.selectActivityByActNo", actNo);
		return activity;
	}

	@Override
	public void insertActivityContest(ActivityVO activity) throws SQLException {
		session.update("Activity-Mapper.insertActivityContest", activity);
		
	}

	@Override
	public void insertActivityMentoring(ActivityVO activity) throws SQLException {
		session.update("Activity-Mapper.insertActivityMentoring", activity);
		
	}

	@Override
	public void updateActivity(ActivityVO activity) throws SQLException {
		session.update("Activity-Mapper.updateActivity", activity);
		
	}

	@Override
	public void updateActivityCom(ActivityVO activity) throws SQLException {
		session.update("Activity-Mapper.updateActivityCom",activity);
		
	}

	@Override
	public void deleteActivity(int actNo) throws SQLException {
		session.delete("Activity-Mapper.deleteActivity", actNo);
		
	}

	@Override
	public int selectActivitySeqNext() throws SQLException {
		int seq_num = session.selectOne("Activity-Mapper.selectActivitySeqNext");
		return seq_num;
	}

	
	
}
