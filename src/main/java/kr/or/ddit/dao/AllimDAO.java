package kr.or.ddit.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.dto.AdviceVO;
import kr.or.ddit.dto.AllimVO;

public interface AllimDAO {

	List<AllimVO> selectFromIdById(String id) throws SQLException;

	List<AllimVO> selectToById(String id) throws SQLException;
	
	List<AllimVO> selectNmTitleById(String id) throws SQLException;
	
	void insertAllim (AllimVO allim)throws SQLException;
	
	int selectCoTotalCount(String id) throws SQLException;
}
