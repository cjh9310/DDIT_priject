package kr.or.ddit.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.dto.AdviceVO;

public interface AdviceDAO {

	List<AdviceVO> selectAdviceByNo(String open_seqno) throws SQLException;
	
	List<AdviceVO> selectAdivceRecListById(String id) throws SQLException;

	List<AdviceVO> selectAdviceOpenRecListById(String id) throws SQLException;
	
	void insertAdvice(AdviceVO advice) throws SQLException;
	
}
