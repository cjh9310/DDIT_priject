package kr.or.ddit.service;

import java.sql.SQLException;
import java.util.Map;

import kr.or.ddit.dto.AdviceVO;
import kr.or.ddit.dto.AllimVO;

public interface AllimService {

	Map<String,Object> getAllimFromList(String id)throws SQLException;
	
	Map<String,Object> getAllimToList(String id)throws SQLException;
	
	Map<String,Object> getAllimNmTitleList(String id) throws SQLException;
	
	void registAllim(AllimVO allim) throws SQLException;
}
