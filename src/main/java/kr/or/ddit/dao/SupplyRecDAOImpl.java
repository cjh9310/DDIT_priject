package kr.or.ddit.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

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

}
