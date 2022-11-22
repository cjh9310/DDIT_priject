package kr.or.ddit.service;

import java.sql.SQLException;

import kr.or.ddit.dto.AttachVO;

public interface AttachService {
	
	
	
	// 첨부파일 테이블 등록
	void insertAttach(AttachVO attachVO)throws SQLException;

	// 첨부파일 조회
	AttachVO getAttachByAttNo(int attNo);
}
