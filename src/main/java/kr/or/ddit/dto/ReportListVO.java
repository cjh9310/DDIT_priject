package kr.or.ddit.dto;

import java.util.List;

public class ReportListVO {
	
	private int falNo; // 게시글번호
	private String indId; // 작성자
	private String falSdate; // 글작성일
	private String falOdate; // 사건발생일
	private String falEdate; // 종료일
	private String falTitle; // 제목
	private String coId; // 기업아이디
	private String coNm; // 기업명
	private String coName; // 기업명
	private String coAddr; // 기업 주소1
	private String coDeaddr; // 기업주소2
	private String falContent; // 내용
	private String falCategory; // 카테고리
	private String falCategorydetail; // 카테고리상세
	private String adId; // 처리한관리자ID
	private String repStatus; // 처리상태(확인중,완료 등등)
	private String coConfirm; // 권한
	private String coComment; // (누적)기업코멘트
	
	private List<AttachVO> attachList;
	
	private List<CoDetailListVO> coDetailList;

	
	
	
	/**
	 * @return the coName
	 */
	public String getCoName() {
		return coName;
	}

	/**
	 * @param coName the coName to set
	 */
	public void setCoName(String coName) {
		this.coName = coName;
	}

	/**
	 * @return the falNo
	 */
	public int getFalNo() {
		return falNo;
	}

	/**
	 * @param falNo the falNo to set
	 */
	public void setFalNo(int falNo) {
		this.falNo = falNo;
	}

	/**
	 * @return the indId
	 */
	public String getIndId() {
		return indId;
	}

	/**
	 * @param indId the indId to set
	 */
	public void setIndId(String indId) {
		this.indId = indId;
	}

	/**
	 * @return the falSdate
	 */
	public String getFalSdate() {
		return falSdate;
	}

	/**
	 * @param falSdate the falSdate to set
	 */
	public void setFalSdate(String falSdate) {
		this.falSdate = falSdate;
	}

	/**
	 * @return the falOdate
	 */
	public String getFalOdate() {
		return falOdate;
	}

	/**
	 * @param falOdate the falOdate to set
	 */
	public void setFalOdate(String falOdate) {
		this.falOdate = falOdate;
	}

	/**
	 * @return the falEdate
	 */
	public String getFalEdate() {
		return falEdate;
	}

	/**
	 * @param falEdate the falEdate to set
	 */
	public void setFalEdate(String falEdate) {
		this.falEdate = falEdate;
	}

	/**
	 * @return the falTitle
	 */
	public String getFalTitle() {
		return falTitle;
	}

	/**
	 * @param falTitle the falTitle to set
	 */
	public void setFalTitle(String falTitle) {
		this.falTitle = falTitle;
	}

	/**
	 * @return the coId
	 */
	public String getCoId() {
		return coId;
	}

	/**
	 * @param coId the coId to set
	 */
	public void setCoId(String coId) {
		this.coId = coId;
	}

	/**
	 * @return the coNm
	 */
	public String getCoNm() {
		return coNm;
	}

	/**
	 * @param coNm the coNm to set
	 */
	public void setCoNm(String coNm) {
		this.coNm = coNm;
	}

	/**
	 * @return the coAddr
	 */
	public String getCoAddr() {
		return coAddr;
	}

	/**
	 * @param coAddr the coAddr to set
	 */
	public void setCoAddr(String coAddr) {
		this.coAddr = coAddr;
	}

	/**
	 * @return the coDeaddr
	 */
	public String getCoDeaddr() {
		return coDeaddr;
	}

	/**
	 * @param coDeaddr the coDeaddr to set
	 */
	public void setCoDeaddr(String coDeaddr) {
		this.coDeaddr = coDeaddr;
	}

	/**
	 * @return the falContent
	 */
	public String getFalContent() {
		return falContent;
	}

	/**
	 * @param falContent the falContent to set
	 */
	public void setFalContent(String falContent) {
		this.falContent = falContent;
	}

	/**
	 * @return the falCategory
	 */
	public String getFalCategory() {
		return falCategory;
	}

	/**
	 * @param falCategory the falCategory to set
	 */
	public void setFalCategory(String falCategory) {
		this.falCategory = falCategory;
	}

	/**
	 * @return the falCategorydetail
	 */
	public String getFalCategorydetail() {
		return falCategorydetail;
	}

	/**
	 * @param falCategorydetail the falCategorydetail to set
	 */
	public void setFalCategorydetail(String falCategorydetail) {
		this.falCategorydetail = falCategorydetail;
	}

	/**
	 * @return the adId
	 */
	public String getAdId() {
		return adId;
	}

	/**
	 * @param adId the adId to set
	 */
	public void setAdId(String adId) {
		this.adId = adId;
	}

	/**
	 * @return the repStatus
	 */
	public String getRepStatus() {
		return repStatus;
	}

	/**
	 * @param repStatus the repStatus to set
	 */
	public void setRepStatus(String repStatus) {
		this.repStatus = repStatus;
	}

	/**
	 * @return the coConfirm
	 */
	public String getCoConfirm() {
		return coConfirm;
	}

	/**
	 * @param coConfirm the coConfirm to set
	 */
	public void setCoConfirm(String coConfirm) {
		this.coConfirm = coConfirm;
	}

	/**
	 * @return the coComment
	 */
	public String getCoComment() {
		return coComment;
	}

	/**
	 * @param coComment the coComment to set
	 */
	public void setCoComment(String coComment) {
		this.coComment = coComment;
	}

	/**
	 * @return the attachList
	 */
	public List<AttachVO> getAttachList() {
		return attachList;
	}

	/**
	 * @param attachList the attachList to set
	 */
	public void setAttachList(List<AttachVO> attachList) {
		this.attachList = attachList;
	}

	/**
	 * @return the coDetailList
	 */
	public List<CoDetailListVO> getCoDetailList() {
		return coDetailList;
	}

	/**
	 * @param coDetailList the coDetailList to set
	 */
	public void setCoDetailList(List<CoDetailListVO> coDetailList) {
		this.coDetailList = coDetailList;
	}

	
	@Override
	public String toString() {
		return "ReportListVO [falNo=" + falNo + ", indId=" + indId + ", falSdate=" + falSdate + ", falOdate=" + falOdate
				+ ", falEdate=" + falEdate + ", falTitle=" + falTitle + ", coId=" + coId + ", coNm=" + coNm
				+ ", coAddr=" + coAddr + ", coDeaddr=" + coDeaddr + ", falContent=" + falContent + ", falCategory="
				+ falCategory + ", falCategorydetail=" + falCategorydetail + ", adId=" + adId + ", repStatus="
				+ repStatus + ", coConfirm=" + coConfirm + ", coComment=" + coComment + ", attachList=" + attachList
				+ ", coDetailList=" + coDetailList + "]";
	}


	
	 
	
}
