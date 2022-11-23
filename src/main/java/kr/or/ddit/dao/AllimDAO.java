package kr.or.ddit.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.dto.AdviceVO;
import kr.or.ddit.dto.AllimVO;

public interface AllimDAO {

	List<AllimVO> selectToOpenId(String id) throws SQLException;
	
	List<AllimVO> selectToRecId(String id) throws SQLException;

	void insertAllim (AllimVO allim)throws SQLException;
	
	int selectCoTotalCount(String id) throws SQLException;
}
