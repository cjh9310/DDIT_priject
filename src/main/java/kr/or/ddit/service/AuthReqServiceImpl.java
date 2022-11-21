package kr.or.ddit.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.ddit.command.Criteria;
import kr.or.ddit.command.PageMaker;
import kr.or.ddit.dao.AuthReqDAO;
import kr.or.ddit.dao.NewsDAO;
import kr.or.ddit.dto.AuthReqVO;
import kr.or.ddit.dto.FaqVO;
import kr.or.ddit.dto.NewsVO;

public class AuthReqServiceImpl implements AuthReqService {

	private AuthReqDAO authReqDAO;
	public void setAuthReqDAO(AuthReqDAO authReqDAO) {
		this.authReqDAO = authReqDAO;
	}
	
	
	@Override 
	public Map<String, Object>getAuthReqList(Criteria cri) throws SQLException {

		Map<String, Object> dataMap = new HashMap<String, Object>();

		// 현재 page 번호에 맞는 리스트를 perPageNum 개수 만큼 가져오기.
		List<AuthReqVO> authReqList = authReqDAO.selectAuthReqList(cri);
		
		// 전체  개수
		int totalCount = authReqDAO.selectAuthReqListCount(cri);

		// PageMaker 생성.
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);

		dataMap.put("authReqList", authReqList);
		dataMap.put("pageMaker", pageMaker);

		return dataMap;
	}


	@Override
	public void regist(AuthReqVO authReq) throws SQLException {
		int authNo = authReqDAO.selectAuthReqSeqNext();
		authReq.setAuthNo(authNo);
		authReqDAO.insertAuthReq(authReq);
		
	}


	@Override
	public AuthReqVO getAuthReq(int authNo) throws SQLException {
		AuthReqVO authReq = authReqDAO.selectAuthReqByAuthNo(authNo);
		return null;
	}

	
}
