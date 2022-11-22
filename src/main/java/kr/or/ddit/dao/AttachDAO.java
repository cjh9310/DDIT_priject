package kr.or.ddit.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.dto.AttachVO;


public interface AttachDAO {
	

	public List<AttachVO> selectAttachesByWorkInfo( AttachVO attach)throws SQLException;
	
	public AttachVO selectAttachByAno( int ano)throws SQLException;
	
	public void insertAttach( AttachVO attach) throws SQLException;
	
	public void deleteAttach( int ano) throws SQLException;
	
	public void deleteAllAttach( int pno) throws SQLException;

	public AttachVO selectAttachByAttNo(int attNo);

}
