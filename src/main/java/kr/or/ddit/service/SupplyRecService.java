package kr.or.ddit.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.dto.SupplyRecVO;

public interface SupplyRecService {
	
	List<SupplyRecVO> getSupplyRecList(int open_seqno) throws SQLException;
	
	List<SupplyRecVO> getSupplyRecruit(String recWantedNo) throws SQLException;

	Map<String,Object> getSupplyRecruitList(String id)throws SQLException;
	
	Map<String,Object> getSupplyOpenRecList(String id)throws SQLException;
	
	int getCountSupplyRecById(Map<String, Object> parameterMap) throws SQLException;
	
	
	int getCountSupplyOpenRecById(Map<String, Object> parameterMap) throws SQLException;
	
	void supplyRecruit(SupplyRecVO supplyRec, Map<String, List<String>> letterMap) throws SQLException;
	
	void supplyOpenRec(SupplyRecVO supplyRec, Map<String, List<String>> letterMap) throws SQLException;
	
	Map<String, Object> getSupplyResumeAllInfo(int supNo) throws SQLException;

	void remove(int openSeqno);

	void removeRNo(String recWantedno);

}
