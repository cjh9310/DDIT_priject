package kr.or.ddit.dto;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class FalseReportVO {
	
	private int falNo; // 게시글번호
	private String indId; // 작성자
	private String falSdate; // 글작성일
	private String falOdate; // 사건발생일
	private String falEdate; // 종료일
	private String falTitle; // 제목
	private String coName; // 기업명
	private String coId; // 기업명
	private String falContent; // 내용
	private String falCategory; // 카테고리
	private String falCategorydetail; // 카테고리상세
	
	private List<MultipartFile> uploadFile; //파일업로드
	
	private List<AttachVO> attachList;
	
	public String getFalCategory() {
		return falCategory;
	}
	public void setFalCategory(String falCategory) {
		this.falCategory = falCategory;
	}
	public String getFalCategorydetail() {
		return falCategorydetail;
	}
	public void setFalCategorydetail(String falCategorydetail) {
		this.falCategorydetail = falCategorydetail;
	}
	public int getFalNo() {
		return falNo;
	}
	public void setFalNo(int falNo) {
		this.falNo = falNo;
	}
	public String getIndId() {
		return indId;
	}
	public void setIndId(String indId) {
		this.indId = indId;
	}
	public String getFalSdate() {
		return falSdate;
	}
	public void setFalSdate(String falSdate) {
		this.falSdate = falSdate;
	}
	public String getFalOdate() {
		return falOdate;
	}
	public void setFalOdate(String falOdate) {
		this.falOdate = falOdate;
	}
	public String getFalEdate() {
		return falEdate;
	}
	public void setFalEdate(String falEdate) {
		this.falEdate = falEdate;
	}
	public String getFalTitle() {
		return falTitle;
	}
	public void setFalTitle(String falTitle) {
		this.falTitle = falTitle;
	}
	public String getCoName() {
		return coName;
	}
	public void setCoName(String coName) {
		this.coName = coName;
	}
	public String getCoId() {
		return coId;
	}
	public void setCoId(String coId) {
		this.coId = coId;
	}
	public String getFalContent() {
		return falContent;
	}
	public void setFalContent(String falContent) {
		this.falContent = falContent;
	}
	
	public List<MultipartFile> getUploadFile() {
		return uploadFile;
	}
	public void setUploadFile(List<MultipartFile> uploadFile) {
		this.uploadFile = uploadFile;
	}
	
	public List<AttachVO> getAttachList() {
		return attachList;
	}
	public void setAttachList(List<AttachVO> attachList) {
		this.attachList = attachList;
	}
	@Override
	public String toString() {
		return "FalseReportVO [falNo=" + falNo + ", indId=" + indId + ", falSdate=" + falSdate + ", falOdate="
				+ falOdate + ", falEdate=" + falEdate + ", falTitle=" + falTitle + ", coName=" + coName
				+ ", falContent=" + falContent + ", falCategory=" + falCategory + ", falCategorydetail="
				+ falCategorydetail + "]";
	}


}