package kr.or.ddit.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.dto.LetterVO;
import kr.or.ddit.dto.SupplyRecVO;

public interface SupplyRecDAO {
	
	List<SupplyRecVO> selectSupplyRecByNo(int open_seqno) throws SQLException;
	
	List<SupplyRecVO> selectSupplyListById(String id) throws SQLException;

	List<SupplyRecVO> selectSupplyOpenRecListById(String id) throws SQLException;
	
	int selectCountSupplyRecById(Map<String, Object> parameterMap) throws SQLException;
	
	int selectCountSupplyOpenRecById(Map<String, Object> parameterMap) throws SQLException;
	
	int selectSupplyRecSeqNextVal() throws SQLException;
	
	void copyInfoToSupResume(Map<String, Object> parameterMap) throws SQLException;
	
	void copyEducationToSupResEdu(Map<String, Object> parameterMap) throws SQLException;
	
	void copyCareerToSupResCrr(Map<String, Object> parameterMap) throws SQLException;
	
	void copyCertificateToSupResCer(Map<String, Object> parameterMap) throws SQLException;
	
	void insertLetterForSupply(List<LetterVO> letterList) throws SQLException;
}
