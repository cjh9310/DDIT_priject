package kr.or.ddit.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.ddit.dao.AllimDAO;
import kr.or.ddit.dto.AllimVO;

public class AllimServiceImpl implements AllimService{

	private AllimDAO allimDAO;
	public void setAllimDAO(AllimDAO allimDAO) {
		this.allimDAO = allimDAO;
	}
	
	@Override
	public Map<String, Object> getAllimOpenList(String id) throws SQLException {
		Map<String, Object> almMap = new HashMap<String, Object>();
		int count = allimDAO.selectOpenTotalCount(id);
		almMap.put("count", count);
		if(count > 0) {
			List<AllimVO> almList = allimDAO.selectToOpenId(id);
			almMap.put("almList",almList);
		}
		return almMap;
	}
	
	@Override
	public Map<String, Object> getAllimRecList(String id) throws SQLException {
		Map<String, Object> almMap = new HashMap<String, Object>();
		int count = allimDAO.selectRecTotalCount(id);
		almMap.put("count", count);
		if(count > 0) {
			List<AllimVO> almList = allimDAO.selectToRecId(id);
			almMap.put("almList",almList);
		}
			
		
		return almMap;
	}
	
	
	@Override
	public void registAllim(AllimVO allim) throws SQLException {
		allimDAO.insertAllim(allim);
		
	}

	@Override
	public Map<String, Object> getAllimRecNameList(String id) throws SQLException {
		Map<String, Object> almMap = new HashMap<String, Object>();
		int count = allimDAO.selectRecTotalCount(id);
		almMap.put("count", count);
		if(count > 0) {
			List<AllimVO> almList = allimDAO.selectToRecName(id);
			almMap.put("almList",almList);
		}
		return almMap;
	}
	
	@Override
	public Map<String, Object> getAllimOpenNameList(String id) throws SQLException {
		Map<String, Object> almMap = new HashMap<String, Object>();
		int count = allimDAO.selectRecTotalCount(id);
		almMap.put("count", count);
		if(count > 0) {
			List<AllimVO> almList = allimDAO.selectToOpenName(id);
			almMap.put("almList",almList);
		}
		return almMap;
	}
}
