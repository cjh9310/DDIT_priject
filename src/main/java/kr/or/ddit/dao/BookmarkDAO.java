package kr.or.ddit.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.dto.BookmarkVO;
import kr.or.ddit.dto.ContestVO;

public interface BookmarkDAO {
	
	List<BookmarkVO> selectBookmarkByRecno(String recWantedno) throws SQLException;
	
	List<BookmarkVO> selectBookmarkById(String id) throws SQLException;
	
	int selectBookNoForRemove(BookmarkVO bookmark) throws SQLException;
	
	int selectCountForIndBookmark(BookmarkVO bookmark) throws SQLException;
	
	void insertRecBookmark(BookmarkVO bookmark) throws SQLException;
	
	void deleteBookmark(int bookNo) throws SQLException;
	
}
