package kr.or.ddit.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.dto.SupplyRecVO;

public interface SupplyRecDAO {
	
	List<SupplyRecVO> selectSupplyRecByNo(int open_seqno) throws SQLException;
	
	List<SupplyRecVO> selectSupplyListById(String id) throws SQLException;

	List<SupplyRecVO> selectSupplyOpenRecListById(String id) throws SQLException;
	
}
