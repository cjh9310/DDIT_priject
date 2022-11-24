package kr.or.ddit.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.ddit.dao.BookmarkDAO;
import kr.or.ddit.dto.BookmarkVO;

public class BookmarkServiceImpl implements BookmarkService {
	
	private BookmarkDAO bookmarkDAO;
	public void setBookmarkDAO(BookmarkDAO bookmarkDAO) {
		this.bookmarkDAO = bookmarkDAO;
	}
	
	@Override
	public Map<String, Object> getBookmarkListByRecno(String recWantedno) throws SQLException {
		Map<String, Object> bookmarkMap = new HashMap<String, Object>();
		List<BookmarkVO> bookmarkList = bookmarkDAO.selectBookmarkByRecno(recWantedno);
		bookmarkMap.put("bookmarkList",bookmarkList);
		return bookmarkMap;
	}
	
	@Override
	public Map<String, Object> getBookmarkListById(String id) throws SQLException {
		Map<String, Object> bookmarkMap = new HashMap<String, Object>();
		List<BookmarkVO> bookmarkList = bookmarkDAO.selectBookmarkById(id);
		bookmarkMap.put("bookmarkList", bookmarkList);
		return bookmarkMap;
	}
	
	@Override
	public int getBookNoForRemove(BookmarkVO bookmark) throws SQLException {
		int bookNo = bookmarkDAO.selectBookNoForRemove(bookmark);
		return bookNo;
	}
	
	@Override
	public void registRecBookmark(BookmarkVO bookmark) throws SQLException {
		int bookNo = bookmarkDAO.selectCountForIndBookmark(bookmark);
		if(bookNo == 0) {
			bookmarkDAO.insertRecBookmark(bookmark);
		}
	}
	
	@Override
	public void removeBookmark(int bookNo) throws SQLException {
		bookmarkDAO.deleteBookmark(bookNo);
	}

	@Override
	public List<Integer> getBookNoByRecNo(String recWantedNo) throws SQLException {
		List<Integer> bookNo = bookmarkDAO.selectBookmarkByRecruitNO(recWantedNo);
		return bookNo;
	}

}
