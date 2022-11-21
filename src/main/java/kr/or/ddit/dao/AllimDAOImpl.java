package kr.or.ddit.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.dto.AllimVO;

public class AllimDAOImpl implements AllimDAO{

	private SqlSession session;
	public void setSqlSession(SqlSession session) {
		this.session = session;
	}
	@Override
	public List<AllimVO> selectFromIdById(String id) throws SQLException {
		List<AllimVO> almCmemList = session.selectList("Allim-Mapper.selectFromById", id);
		
		return almCmemList;
	}
	@Override
	public List<AllimVO> selectToById(String id) throws SQLException {
		List<AllimVO> almList = session.selectList("Allim-Mapper.selectToById",id);
		return almList;
	}
	@Override
	public void insertAllim(AllimVO allim) throws SQLException {
		session.update("Allim-Mapper.insertAllim", allim);
		
	}
	@Override
	public int selectCoTotalCount(String id) throws SQLException {
		int count = session.selectOne("Allim-Mapper.selectCoTotalCount",id);
		return count;
	}
	@Override
	public List<AllimVO> selectNmTitleById(String id) throws SQLException {
		List<AllimVO> almNmTitleList = session.selectList("Allim-Mapper.selectNmTitleById", id);
		System.out.println("여기"+almNmTitleList.size());
		return almNmTitleList;
	}
}
