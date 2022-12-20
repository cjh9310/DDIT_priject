package kr.or.ddit.service;

import java.sql.SQLException;
import java.util.Map;

import kr.or.ddit.dto.AdviceVO;
import kr.or.ddit.dto.AllimVO;

public interface AllimService {

	
	Map<String,Object> getAllimOpenList(String id)throws SQLException;
	
	Map<String,Object> getAllimRecList(String id)throws SQLException;
	
	Map<String,Object> getAllimRecNameList(String id)throws SQLException;
	
	Map<String,Object> getAllimOpenNameList(String id)throws SQLException;
	
	void registAllim(AllimVO allim) throws SQLException;
}
