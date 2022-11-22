package kr.or.ddit.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.dto.AdviceVO;
import kr.or.ddit.dto.SupplyRecVO;

public class AdviceDAOImpl implements AdviceDAO{
	
	private SqlSession session;
	public void setSqlSession(SqlSession session) {
		this.session = session;
	}
	@Override
	public List<AdviceVO>selectAdviceByNo(String open_seqno) throws SQLException{
		List<AdviceVO> adviceList =
				session.selectList("Advice-mapper.selectAdviceByNo",open_seqno);
		return adviceList;
	}
	@Override
	public List<AdviceVO>selectAdivceRecListById(String id) throws SQLException{
		List<AdviceVO> advRecList = session.selectList("Advice-Mapper.selectAdviceRecruitListById", id);
		return advRecList;
	}
	
	@Override
	public List<AdviceVO> selectAdviceOpenRecListById(String id) throws SQLException {
		List<AdviceVO> advRecList = session.selectList("Advice-Mapper.selectAdviceOpenRecListById", id);
		return advRecList;
	}
	@Override
	public void insertAdvice(AdviceVO advice) throws SQLException {
		session.update("Advice-Mapper.insertAdvice", advice);
	}
}
