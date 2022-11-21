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
	public Map<String, Object> getAllimFromList(String id) throws SQLException {
		Map<String, Object> almComemMap = new HashMap<String, Object>();
		int count = allimDAO.selectCoTotalCount(id);
		almComemMap.put("count",count);
		
		if(count > 0) {
			List<AllimVO> almComemList = allimDAO.selectFromIdById(id);
			almComemMap.put("almComemList",almComemList);
		}
		
		return almComemMap;
	}
	@Override
	public Map<String, Object> getAllimToList(String id) throws SQLException {
		Map<String, Object> almMap = new HashMap<String, Object>();
		int count = allimDAO.selectCoTotalCount(id);
		almMap.put("count", count);
		if(count > 0) {
			List<AllimVO> almList = allimDAO.selectToById(id);
			almMap.put("almList",almList);
			
		}
		return almMap;
	}
	@Override
	public void registAllim(AllimVO allim) throws SQLException {
		allimDAO.insertAllim(allim);
		
	}
	
	@Override
	public Map<String, Object> getAllimNmTitleList(String id) throws SQLException {
		Map<String, Object> almNmTitleMap = new HashMap<String, Object>();
		int count = allimDAO.selectCoTotalCount(id);
		if(count > 0) {
			List<AllimVO> almNmTitleList = allimDAO.selectNmTitleById(id);
			almNmTitleMap.put("almNmTitleList", almNmTitleList);
			System.out.println(almNmTitleList.size());
		}
		return almNmTitleMap;
		
		
		
	}
}
