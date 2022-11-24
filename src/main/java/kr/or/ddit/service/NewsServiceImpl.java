package kr.or.ddit.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.jasper.tagplugins.jstl.core.ForEach;

import kr.or.ddit.command.Criteria;
import kr.or.ddit.command.MakeFileName;
import kr.or.ddit.command.MultipartFileUploadResolver;
import kr.or.ddit.command.PageMaker;
import kr.or.ddit.dao.AttachDAO;
import kr.or.ddit.dao.NewsDAO;
import kr.or.ddit.dto.AttachVO;
import kr.or.ddit.dto.NewsVO;

public class NewsServiceImpl implements NewsService {

	private NewsDAO newsDAO;
	public void setNewsDAO(NewsDAO newsDAO) {
		this.newsDAO = newsDAO;
	}
	
	private AttachDAO attachDAO;
	public void setAttachDAO(AttachDAO attachDAO) {
		this.attachDAO = attachDAO;
	}

	
	@Override 
	public Map<String, Object>getNewsList(Criteria cri) throws SQLException {

		Map<String, Object> dataMap = new HashMap<String, Object>();

		// 현재 page 번호에 맞는 리스트를 perPageNum 개수 만큼 가져오기.
		List<NewsVO> newsList = newsDAO.selectNewsList(cri);
		
		
		
		// 전체 board 개수
		int totalCount = newsDAO.selectNewsListCount(cri);

		// PageMaker 생성.
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);

		dataMap.put("newsList", newsList);
		dataMap.put("pageMaker", pageMaker);

		return dataMap;
	}

	@Override
	public NewsVO getNews(int newsNo) throws SQLException {
		NewsVO news = newsDAO.selectNewsByNewsNo(newsNo);
		addAttachList(news);
		newsDAO.increaseNewsCnt(newsNo);
		
		if(news!=null && news.getAttachList()!=null) {
			for(AttachVO attach:news.getAttachList()) {
				String originalFileName 
					= MakeFileName.parseFileNameFromUUID(attach.getFilename(), "\\$\\$");
				attach.setFilename(originalFileName);					
			}
		}
		
		
		return news;
	}


	private void addAttachList(NewsVO news) throws SQLException {
		
		AttachVO attach = new AttachVO();
		attach.setWorkPk(Integer.toString(news.getNewsNo()));
		attach.setWorkDiv("news");
		
		List<AttachVO> attachList = attachDAO.selectAttachesByWorkInfo(attach);
		
		news.setAttachList(attachList);
	}


	@Override
	public void regist(NewsVO news,String savePath) throws SQLException {
		int newsNo = newsDAO.selectNewsSeqNext();
		news.setNewsNo(newsNo);
		
		// fileUploadPath = D:/team1/src/uploadFile + /업무명(workDiv)
				String workDiv = "news"; // 필수
				//file 저장 -> List<AttachVO>
				List<AttachVO> attachList = null;
				try {
					// 파일을 실제 물리 저장소에 저장하고, 저장 목록을 리턴.
					attachList = MultipartFileUploadResolver.fileUpload(news.getUploadFile(), savePath + "/" + workDiv);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
				// 파일저장정보 목록을 FalseReportVO에 세팅
				news.setAttachList(attachList);	
				
				// 파일정보를 첨부파일 테이블에 등록
				if (news.getAttachList() != null) {
					for (AttachVO attach : news.getAttachList()) {
						attach.setWorkDiv(workDiv);
						attach.setWorkPk(Integer.toString(news.getNewsNo()));
						attach.setAttacher(news.getAdId());
						attachDAO.insertAttach(attach);
					}
				}
				newsDAO.insertNews(news);
	}

	@Override
	public void modify(NewsVO news) throws SQLException {
		System.out.println("업데이트 돼라!!!!!!!!!!!!!!"+ news);
		newsDAO.updateNews(news);

	}

	@Override
	public void remove(int newsNo) throws SQLException {
		newsDAO.deleteNews(newsNo);

	}


	@Override
	public NewsVO getNewsModify(int newsNo) throws SQLException {
		NewsVO news = newsDAO.selectNewsByNewsNo(newsNo);
		return news;
	}

}
