package kr.or.ddit.service;

import java.sql.SQLException;

import kr.or.ddit.dao.AttachDAO;
import kr.or.ddit.dto.AttachVO;

public class AttachServiceImpl implements AttachService {
	
	private AttachDAO attachDAO;
	public void setAttachDAO(AttachDAO attachDAO) {
		this.attachDAO = attachDAO;
	}
	
	@Override
	public void insertAttach(AttachVO attachVO) throws SQLException {
		attachDAO.insertAttach(attachVO);
	}
	
	@Override
	public AttachVO getAttachByAttNo(int attNo) {
		AttachVO attach = attachDAO.selectAttachByAttNo(attNo);
		return attach;
	}
	
}
