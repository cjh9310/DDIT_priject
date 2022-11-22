package kr.or.ddit.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.dto.LetterVO;
import kr.or.ddit.dto.RecruitVO;
import kr.or.ddit.dto.SupplyRecVO;

public class SupplyRecDAOImpl implements SupplyRecDAO {
	
	private SqlSession session;
	
	public void setSqlSession(SqlSession session) {
		this.session = session;
	}
	
	@Override
	public List<SupplyRecVO> selectSupplyRecByNo(int open_seqno) throws SQLException {
		List<SupplyRecVO> supplyRecList =
				session.selectList("SupplyRec-Mapper.selectSupplyRecByNo", open_seqno);
		return supplyRecList;
	}
	
	@Override
	public List<SupplyRecVO> selectSupplyListById(String id) throws SQLException {
		List<SupplyRecVO> supRecList = session.selectList("SupplyRec-Mapper.selectSupplyRecruitListById", id);
		return supRecList;
	}
	
	@Override
	public List<SupplyRecVO> selectSupplyOpenRecListById(String id) throws SQLException {
		List<SupplyRecVO> supRecList = session.selectList("SupplyRec-Mapper.selectSupplyOpenRecListById", id);
		return supRecList;
	}
	
	@Override
	public int selectCountSupplyRecById(Map<String, Object> parameterMap) throws SQLException {
		int count = session.selectOne("SupplyRec-Mapper.selectCountSupplyRecById", parameterMap);
		return count;
	}
	
	@Override
	public int selectCountSupplyOpenRecById(Map<String, Object> parameterMap) throws SQLException {
		int count = session.selectOne("SupplyRec-Mapper.selectCountSupplyOpenRecById", parameterMap);
		return count;
	}
	
	@Override
	public int selectSupplyRecSeqNextVal() throws SQLException {
		int supNo = session.selectOne("SupplyRec-Mapper.selectSupplyRecSeqNextVal");
		return supNo;
	}
	
	@Override
	public void copyCareerToSupResCrr(Map<String, Object> parameterMap) throws SQLException {
		session.update("SupplyRec-Mapper.copyCareerToSupResCrr", parameterMap);
	}
	
	@Override
	public void copyCertificateToSupResCer(Map<String, Object> parameterMap) throws SQLException {
		session.update("SupplyRec-Mapper.copyCertificateToSupResCer", parameterMap);
	}
	
	@Override
	public void copyEducationToSupResEdu(Map<String, Object> parameterMap) throws SQLException {
		session.update("SupplyRec-Mapper.copyEducationToSupResEdu", parameterMap);
	}
	
	@Override
	public void copyInfoToSupResume(Map<String, Object> parameterMap) throws SQLException {
		session.update("SupplyRec-Mapper.copyInfoToSupResume", parameterMap);
	}
	
	@Override
	public void insertLetterForSupply(List<LetterVO> letterList) throws SQLException {
		session.update("SupplyRec-Mapper.insertLetterForSupply", letterList);
	}

}
