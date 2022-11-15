package kr.or.ddit.service;

import java.sql.SQLException;
import java.util.Map;

import kr.or.ddit.dto.BookmarkVO;

public interface BookmarkService {
	
	Map<String, Object> getBookmarkListByRecno(String recWantedno) throws SQLException;
	
	Map<String, Object> getBookmarkListById(String id) throws SQLException;
	
	void registRecBookmark(BookmarkVO bookmark) throws SQLException;
	
	int getBookNoForRemove(BookmarkVO bookmark) throws SQLException;
	
	void removeBookmark(int bookNo) throws SQLException;
	
}


