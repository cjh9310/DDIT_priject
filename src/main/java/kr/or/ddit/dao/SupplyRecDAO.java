package kr.or.ddit.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.dto.CareerVO;
import kr.or.ddit.dto.CertificateVO;
import kr.or.ddit.dto.EducationVO;
import kr.or.ddit.dto.LetterVO;
import kr.or.ddit.dto.SupplyRecVO;

public interface SupplyRecDAO {
	
	List<SupplyRecVO> selectSupplyRecByNo(int open_seqno) throws SQLException;
	
	List<SupplyRecVO> selectSupplyListById(String id) throws SQLException;

	List<SupplyRecVO> selectSupplyOpenRecListById(String id) throws SQLException;
	
	List<SupplyRecVO> selectSupplyRecByRNo(String recWantedNo) throws SQLException;
	
	int selectCountSupplyRecById(Map<String, Object> parameterMap) throws SQLException;
	
	int selectCountSupplyOpenRecById(Map<String, Object> parameterMap) throws SQLException;
	
	int selectSupplyRecSeqNextVal() throws SQLException;

	int selectSupResLetSeqNextVal() throws SQLException;
	
	void insertSupplyRec(SupplyRecVO supplyRec) throws SQLException;

	void insertSupplyOpenRec(SupplyRecVO supplyRec) throws SQLException;
	
	void copyInfoToSupResume(Map<String, Object> parameterMap) throws SQLException;
	
	void copyEducationToSupResEdu(Map<String, Object> parameterMap) throws SQLException;
	
	void copyCareerToSupResCrr(Map<String, Object> parameterMap) throws SQLException;
	
	void copyCertificateToSupResCer(Map<String, Object> parameterMap) throws SQLException;
	
	void insertLetterForSupply(Map<String, Object> parameterMap) throws SQLException;
	
	SupplyRecVO selectSupResume(int supNo) throws SQLException;
	
	List<EducationVO> selectSupResEduList(int supNo) throws SQLException;

	List<CareerVO> selectSupResCrrList(int supNo) throws SQLException;
	
	List<CertificateVO> selectSupResCerList(int supNo) throws SQLException;
	
	List<LetterVO> selectSupResLetList(int supNo) throws SQLException;

	void remove(int openSeqno);

	void removeRno(String recWantedno);
}
