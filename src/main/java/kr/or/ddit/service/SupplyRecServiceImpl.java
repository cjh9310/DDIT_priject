package kr.or.ddit.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.ddit.dao.SupplyRecDAO;
import kr.or.ddit.dto.RecruitVO;
import kr.or.ddit.dto.SupplyRecVO;

public class SupplyRecServiceImpl implements SupplyRecService {
	
	private SupplyRecDAO supplyRecDAO;
	public void setSupplyRecDAO(SupplyRecDAO supplyRecDAO) {
		this.supplyRecDAO = supplyRecDAO;
	}
	
	@Override
	public List<SupplyRecVO> getSupplyRecList(int open_seqno) throws SQLException {
		
		List<SupplyRecVO> supplyRecList = supplyRecDAO.selectSupplyRecByNo(open_seqno);
		
		return supplyRecList;
	}
	
	@Override
	public Map<String, Object> getSupplyRecruitList(String id) throws SQLException {
		Map<String, Object> supRecMap = new HashMap<String, Object>();
		List<SupplyRecVO> supRecList = supplyRecDAO.selectSupplyListById(id);
		supRecMap.put("supRecList", supRecList);
		return supRecMap;
	}

	@Override
	public Map<String, Object> getSupplyOpenRecList(String id) throws SQLException {
		Map<String, Object> supOpenMap = new HashMap<String, Object>();
		List<SupplyRecVO> supOpenList = supplyRecDAO.selectSupplyOpenRecListById(id);
		supOpenMap.put("supOpenList", supOpenList);
		return supOpenMap;
	}
	
	@Override
	public int getCountSupplyRecById(Map<String, Object> parameterMap) throws SQLException {
		int count = supplyRecDAO.selectCountSupplyRecById(parameterMap);
		return count;
	}
	
	@Override
	public int getCountSupplyOpenRecById(Map<String, Object> parameterMap) throws SQLException {
		int count = supplyRecDAO.selectCountSupplyOpenRecById(parameterMap);
		return count;
	}
}
