package kr.or.ddit.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.dto.AdviceVO;
import kr.or.ddit.dto.BookmarkVO;

public interface AdviceService {
	
	List<AdviceVO> getAdviceList(String open_seqno) throws SQLException;

	Map<String,Object> getAdviceRecruitList(String id)throws SQLException;
	
	Map<String,Object> getAdviceOpenRecList(String id)throws SQLException;
	
	void registAdvice(AdviceVO advice) throws SQLException;

	void remove(int openSeqno) throws SQLException;

	void removeRNo(String recWantedno);

}
