package kr.or.ddit.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.dto.EmpstatsVO;

public interface EmpstatsDAO {
	
	List<EmpstatsVO> selectTrend() throws SQLException;

	List<EmpstatsVO> selectEmpStats() throws SQLException;
	
}
