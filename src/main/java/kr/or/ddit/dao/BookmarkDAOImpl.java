package kr.or.ddit.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.dto.BookmarkVO;

public class BookmarkDAOImpl implements BookmarkDAO {
	
	private SqlSession session;
	
	public void setSqlSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public List<BookmarkVO> selectBookmarkByRecno(String recWantedno) throws SQLException {
		List<BookmarkVO> bookmarkList = session.selectList("Bookmark-Mapper.selectBookmarkByRecno",recWantedno);
		return bookmarkList;
	}
	
	@Override
	public List<BookmarkVO> selectBookmarkById(String id) throws SQLException {
		List<BookmarkVO> bookmarkList = session.selectList("Bookmark-Mapper.selectBookmarkById", id);
		return bookmarkList;
	}
	
	@Override
	public int selectBookNoForRemove(BookmarkVO bookmark) throws SQLException {
		int bookNo = session.selectOne("Bookmark-Mapper.selectBookNoForRemove", bookmark);
		return bookNo;
	}
	
	@Override
	public int selectCountForIndBookmark(BookmarkVO bookmark) throws SQLException {
		int bookNo = session.selectOne("Bookmark-Mapper.selectCountForIndBookmark", bookmark);
		return bookNo;
	}
	
	@Override
	public void insertRecBookmark(BookmarkVO bookmark) throws SQLException {
		session.update("Bookmark-Mapper.insertRecBookmark", bookmark);
	}

	@Override
	public void deleteBookmark(int bookNo) throws SQLException {
		session.update("Bookmark-Mapper.deleteBookmark", bookNo);
	}

	@Override
	public List<Integer> selectBookmarkByRecruitNO(String recWantedno) throws SQLException {
		List<Integer> bookno = null;
		bookno = session.selectList("Bookmark-Mapper.selectBookmarkByRecruitNO", recWantedno);
		return bookno;
	}
}
