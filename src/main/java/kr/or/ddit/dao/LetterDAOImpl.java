package kr.or.ddit.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.dto.LetterVO;

public class LetterDAOImpl implements LetterDAO {
	
	private SqlSession session;
	public void setSqlSession(SqlSession session) {
		this.session = session;
	}
	
	@Override
	public List<LetterVO> selectLetterListByIndId(String indId) throws SQLException {
		List<LetterVO> letterList = session.selectList("Letter-Mapper.selectLetterListByIndId", indId);
		return letterList;
	}
	
	@Override
	public LetterVO selectLetterByLetSeqno(String letSeqno) throws SQLException {
		LetterVO letter = session.selectOne("Letter-Mapper.selectLetterByLetSeqno", letSeqno);
		return letter;
	}
	
	@Override
	public int selectCountOpenLetter(String indId) throws SQLException {
		int openLetterCount = session.selectOne("Letter-Mapper.selectCountOpenLetter", indId);
		return openLetterCount;
	}
	
	@Override
	public void insertLetter(Map<String, Object> Letter) throws SQLException {
		session.update("Letter-Mapper.insertLetter", Letter);
	}
	
	@Override
	public void updateLetter(Map<String, Object> Letter) throws SQLException {
		session.update("Letter-Mapper.updateLetter", Letter);
	}
	
	@Override
	public void deleteLetter(String letSeqno) throws SQLException {
		session.update("Letter-Mapper.deleteLetter", letSeqno);
	}

}
