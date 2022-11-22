package kr.or.ddit.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.ddit.dao.AdviceDAO;
import kr.or.ddit.dto.AdviceVO;

public class AdviceServiceImpl implements AdviceService {
	
	private AdviceDAO adviceDAO;
	public void setAdviceDAO(AdviceDAO adviceDAO) {
		this.adviceDAO = adviceDAO;
	}
	
	
	@Override
	public List<AdviceVO> getAdviceList(String open_seqno) throws SQLException {
		
		List<AdviceVO> adviceList = adviceDAO.selectAdviceByNo(open_seqno);
		return adviceList;
	}
	
	@Override
	public Map<String, Object> getAdviceRecruitList(String id) throws SQLException {
		Map<String, Object> advRecMap = new HashMap<String, Object>();
		List<AdviceVO> advRecList = adviceDAO.selectAdivceRecListById(id);
		advRecMap.put("advRecList", advRecList);
		return advRecMap;
	}

	@Override
	public Map<String, Object> getAdviceOpenRecList(String id) throws SQLException {
		Map<String, Object> advOpenMap = new HashMap<String, Object>();
		List<AdviceVO> advOpenList = adviceDAO.selectAdviceOpenRecListById(id);
		advOpenMap.put("advOpenList", advOpenList);
		return advOpenMap;
	}


	@Override
	public void registAdvice(AdviceVO advice) throws SQLException {
		adviceDAO.insertAdvice(advice);
		
	}
}
