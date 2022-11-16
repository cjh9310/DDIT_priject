package kr.or.ddit.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.dto.SeniorVO;

public interface SeniorDAO {
	
	List<SeniorVO> selectAllSeniorList() throws SQLException;
	
	SeniorVO selectSeniorListBySnrNo(int snrNo) throws SQLException;
	
	void insertSenior(SeniorVO senior) throws SQLException;

}
