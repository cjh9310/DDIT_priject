package kr.or.ddit.service;

import java.sql.SQLException;
import java.util.Map;

import kr.or.ddit.dto.CorporationVO;

public interface CorporationService {
	
	Map<String, Object> getLogoList()throws SQLException;
	
	Map<String, Object> getCoInfo(String open_conm) throws SQLException, Exception;
	
	CorporationVO getCoInfoVo(String conm) throws SQLException, Exception;
	
}


