package kr.or.ddit.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.ddit.dao.EmpstatsDAO;
import kr.or.ddit.dto.EmpstatsVO;

public class EmpstatsServiceImpl implements EmpstatsService {
	
	private EmpstatsDAO empstatsDAO;
	public void setEmpstatsDAO(EmpstatsDAO empstatsDAO) {
		this.empstatsDAO = empstatsDAO;
	}
	
	@Override
	public Map<String, Object> getTrendList() throws SQLException {
		Map<String, Object> trendMap = new HashMap<String, Object>();
		List<EmpstatsVO> trendList = empstatsDAO.selectTrend();
		trendMap.put("trendList", trendList);
		return trendMap;
	}
	
	@Override
	public Map<String, Object> getEmpList() throws SQLException {
		Map<String, Object> empMap = new HashMap<String, Object>();
		List<EmpstatsVO> empList = empstatsDAO.selectEmpStats();
		empMap.put("empList", empList);
		return empMap;
	}

}
