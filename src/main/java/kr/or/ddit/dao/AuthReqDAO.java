package kr.or.ddit.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.command.Criteria;
import kr.or.ddit.dto.AuthReqVO;

public interface AuthReqDAO {
	
	List<AuthReqVO> selectAuthReqList(Criteria cri) throws SQLException;
	
	int selectAuthReqListCount(Criteria cri) throws SQLException;
	
	AuthReqVO selectAuthReqByAuthNo(int authNo) throws SQLException;
	
	// seq.nextval 갖고오기.
	int selectAuthReqSeqNext() throws SQLException;
	
	void insertAuthReq(AuthReqVO authReq) throws SQLException;
	
	

}
