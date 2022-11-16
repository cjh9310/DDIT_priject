package kr.or.ddit.service;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.dao.SeniorDAO;
import kr.or.ddit.dto.SeniorVO;

public class SeniorServiceImpl implements SeniorService {
	
	private SeniorDAO seniorDAO;
	public void setSeniorDAO(SeniorDAO seniorDAO) {
		this.seniorDAO = seniorDAO;
	}

	@Override
	public List<SeniorVO> getAllSeniorList() throws SQLException {
		List<SeniorVO> senior = seniorDAO.selectAllSeniorList();
		return senior;
	}

	@Override
	public SeniorVO getSenior(int snrNo) throws SQLException {
		SeniorVO senior = seniorDAO.selectSeniorListBySnrNo(snrNo);
		return senior;
	}

	@Override
	public void regist(SeniorVO senior) throws SQLException {
		seniorDAO.insertSenior(senior);
		
	}
	
	

}
