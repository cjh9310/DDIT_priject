package kr.or.ddit.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.command.Criteria;
import kr.or.ddit.dto.AuthReqVO;
import kr.or.ddit.dto.NewsVO;


public class AuthReqDAOImpl implements AuthReqDAO {
	
	private SqlSession session;	
	public void setSqlSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public List<AuthReqVO> selectAuthReqList(Criteria cri) throws SQLException {
		
		int startRow = cri.getStartRowNum()+1;
		int endRow = startRow+cri.getPerPageNum()-1;
		
		Map<String,Object> dataParam = new HashMap<String,Object>();
		
		dataParam.put("startRow",startRow);
		dataParam.put("endRow",endRow);
//		dataParam.put("searchType", cri.getSearchType());
//		dataParam.put("keyword",cri.getKeyword());
		
		List<AuthReqVO> AuthReqList 
				= session.selectList("AuthReq-Mapper.selectAuthReqList", dataParam);
		
		return AuthReqList;
	}

	@Override
	public int selectAuthReqListCount(Criteria cri) throws SQLException {
		int count = session.selectOne("AuthReq-Mapper.selectAuthReqListCount",cri);
		return count;
	}

	@Override
	public AuthReqVO selectAuthReqByAuthNo(int authNo) throws SQLException {
		AuthReqVO AuthReq = session.selectOne("AuthReq-Mapper.selectAuthReqByAuthNo", authNo);
		return AuthReq;
	}

	@Override
	public int selectAuthReqSeqNext() throws SQLException {
		int seq_num = session.selectOne("AuthReq-Mapper.selectAuthReqSeqNext");
		return seq_num;
	}



	@Override
	public void insertAuthReq(AuthReqVO authReq) throws SQLException {
		session.update("AuthReq-Mapper.insertAuthReq", authReq);
	}

	

}
