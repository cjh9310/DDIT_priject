package kr.or.ddit.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.dto.CareerVO;
import kr.or.ddit.dto.CertificateVO;
import kr.or.ddit.dto.EducationVO;
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
	public int selectSupResLetSeqNextVal() throws SQLException {
		int supLetNo = session.selectOne("SupplyRec-Mapper.selectSupResLetSeqNextVal");
		return supLetNo;
	}
	
	@Override
	public void insertSupplyRec(SupplyRecVO supplyRec) throws SQLException {
		session.update("SupplyRec-Mapper.insertSupplyRec", supplyRec);
	}
	
	@Override
	public void insertSupplyOpenRec(SupplyRecVO supplyRec) throws SQLException {
		session.update("SupplyRec-Mapper.insertSupplyOpenRec", supplyRec);
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
	public void insertLetterForSupply(Map<String, Object> parameterMap) throws SQLException {
		session.update("SupplyRec-Mapper.insertLetterForSupply", parameterMap);
	}
	
	@Override
	public SupplyRecVO selectSupResume(int supNo) throws SQLException {
		SupplyRecVO supInfo = session.selectOne("SupplyRec-Mapper.selectSupResume", supNo);
		return supInfo;
	}
	
	@Override
	public List<EducationVO> selectSupResEduList(int supNo) throws SQLException {
		List<EducationVO> eduList = session.selectList("SupplyRec-Mapper.selectSupResEduList", supNo);
		return eduList;
	}
	
	@Override
	public List<CareerVO> selectSupResCrrList(int supNo) throws SQLException {
		List<CareerVO> crrList = session.selectList("SupplyRec-Mapper.selectSupResCrrList", supNo);
		return crrList;
	}
	
	@Override
	public List<CertificateVO> selectSupResCerList(int supNo) throws SQLException {
		List<CertificateVO> cerList = session.selectList("SupplyRec-Mapper.selectSupResCerList", supNo);
		return cerList;
	}
	
	@Override
	public List<LetterVO> selectSupResLetList(int supNo) throws SQLException {
		List<LetterVO> letList = session.selectList("SupplyRec-Mapper.selectSupResLetList", supNo);
		return letList;
	}

}
