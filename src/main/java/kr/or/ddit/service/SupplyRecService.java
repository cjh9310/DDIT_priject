package kr.or.ddit.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.dto.SupplyRecVO;

public interface SupplyRecService {
	
	List<SupplyRecVO> getSupplyRecList(int open_seqno) throws SQLException;

	Map<String,Object> getSupplyRecruitList(String id)throws SQLException;
	
	Map<String,Object> getSupplyOpenRecList(String id)throws SQLException;

}
