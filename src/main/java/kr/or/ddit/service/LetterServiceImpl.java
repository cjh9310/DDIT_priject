package kr.or.ddit.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.ddit.dao.LetterDAO;
import kr.or.ddit.dto.LetterVO;

public class LetterServiceImpl implements LetterService {
	
	private LetterDAO letterDAO;
	public void setLetterDAO(LetterDAO letterDAO) {
		this.letterDAO = letterDAO;
	}
	
	@Override
	public Map<String, Object> getLetterListByIndId(String indId) throws SQLException {
		Map<String, Object> letterMap = new HashMap<String, Object>();
		List<LetterVO> letterList = letterDAO.selectLetterListByIndId(indId);
		int countOpenLetter = letterDAO.selectCountOpenLetter(indId);
		letterMap.put("letterList", letterList);
		letterMap.put("countOpenLetter", countOpenLetter);
		return letterMap;
	}
	
	@Override
	public LetterVO getLetterByLetSeqno(String letSeqno) throws SQLException {
		LetterVO letter = letterDAO.selectLetterByLetSeqno(letSeqno);
		return letter;
	}
	
	@Override
	public void regist(Map<String, Object> letter) throws SQLException {
		letterDAO.insertLetter(letter);
	}
	
	@Override
	public void modify(Map<String, Object> letter) throws SQLException {
		letterDAO.updateLetter(letter);
	}
	
	@Override
	public void remove(String letSeqno) throws SQLException {
		letterDAO.deleteLetter(letSeqno);
	}
	
}
