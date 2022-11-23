package kr.or.ddit.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.ddit.dao.SupplyRecDAO;
import kr.or.ddit.dto.CareerVO;
import kr.or.ddit.dto.CertificateVO;
import kr.or.ddit.dto.EducationVO;
import kr.or.ddit.dto.LetterVO;
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
	
	@Override
	public void supplyRecruit(SupplyRecVO supplyRec, Map<String, List<String>> letterMap) throws SQLException {
		String indId = supplyRec.getIndId();
		int supNo = supplyRecDAO.selectSupplyRecSeqNextVal();
		
		supplyRec.setSupNo(supNo);
		supplyRec.setSupType(1);
		
		Map<String, Object> parameterMap = new HashMap<String, Object>();
		parameterMap.put("indId", indId);
		parameterMap.put("supNo", supNo);
		
		supplyRecDAO.insertSupplyRec(supplyRec);
		supplyRecDAO.copyInfoToSupResume(parameterMap);
		supplyRecDAO.copyEducationToSupResEdu(parameterMap);
		supplyRecDAO.copyCareerToSupResCrr(parameterMap);
		supplyRecDAO.copyCertificateToSupResCer(parameterMap);
		 
		List<String> titleList = letterMap.get("titleList");
		List<String> contentList = letterMap.get("contentList");
		for(int i=0; i < titleList.size(); i++) {
			Map<String, Object> letterParameterMap = new HashMap<String, Object>();
			letterParameterMap.put("supNo", supNo);
			letterParameterMap.put("supletTitle", titleList.get(i));
			letterParameterMap.put("supletContent", contentList.get(i));
			supplyRecDAO.insertLetterForSupply(letterParameterMap);
		}
	}
	
	@Override
	public void supplyOpenRec(SupplyRecVO supplyRec, Map<String, List<String>> letterMap) throws SQLException {
		String indId = supplyRec.getIndId();
		int supNo = supplyRecDAO.selectSupplyRecSeqNextVal();
		
		supplyRec.setSupNo(supNo);
		supplyRec.setSupType(2);
		
		Map<String, Object> parameterMap = new HashMap<String, Object>();
		parameterMap.put("indId", indId);
		parameterMap.put("supNo", supNo);
		
		supplyRecDAO.insertSupplyOpenRec(supplyRec);
		supplyRecDAO.copyInfoToSupResume(parameterMap);
		supplyRecDAO.copyEducationToSupResEdu(parameterMap);
		supplyRecDAO.copyCareerToSupResCrr(parameterMap);
		supplyRecDAO.copyCertificateToSupResCer(parameterMap);
		
		List<String> titleList = letterMap.get("titleList");
		List<String> contentList = letterMap.get("contentList");
		for(int i=0; i < titleList.size(); i++) {
			Map<String, Object> letterParameterMap = new HashMap<String, Object>();
			letterParameterMap.put("supNo", supNo);
			letterParameterMap.put("supletTitle", titleList.get(i));
			letterParameterMap.put("supletContent", contentList.get(i));
			supplyRecDAO.insertLetterForSupply(letterParameterMap);
		}
	}
	
	@Override
	public Map<String, Object> getSupplyResumeAllInfo(int supNo) throws SQLException {
		Map<String, Object> resumeMap = new HashMap<String, Object>();
		
		SupplyRecVO supInfo = supplyRecDAO.selectSupResume(supNo);
		List<EducationVO> eduList = supplyRecDAO.selectSupResEduList(supNo);
		List<CareerVO> crrList = supplyRecDAO.selectSupResCrrList(supNo);
		List<CertificateVO> cerList = supplyRecDAO.selectSupResCerList(supNo);
		List<LetterVO> letList = supplyRecDAO.selectSupResLetList(supNo);
		
		resumeMap.put("supInfo", supInfo);
		resumeMap.put("eduList", eduList);
		resumeMap.put("crrList", crrList);
		resumeMap.put("cerList", cerList);
		resumeMap.put("letList", letList);
		
		return resumeMap;
	}
	
}
