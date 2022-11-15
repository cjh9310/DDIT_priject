package kr.or.ddit.dto;

public class ReportVO {
	
	private int falNo; // 신고글번호
	private String adId; // 처리한관리자ID
	private String repStatus; // 처리상태(확인중,완료 등등)
	private String repComment; // 처리내용
	private String repApprove; // 처리결과
	
	
	public int getFalNo() {
		return falNo;
	}
	public void setFalNo(int falNo) {
		this.falNo = falNo;
	}
	public String getAdId() {
		return adId;
	}
	public void setAdId(String adId) {
		this.adId = adId;
	}
	public String getRepStatus() {
		return repStatus;
	}
	public void setRepStatus(String repStatus) {
		this.repStatus = repStatus;
	}
	public String getRepComment() {
		return repComment;
	}
	public void setRepComment(String repComment) {
		this.repComment = repComment;
	}
	public String getRepApprove() {
		return repApprove;
	}
	public void setRepApprove(String repApprove) {
		this.repApprove = repApprove;
	}
	
	@Override
	public String toString() {
		return "ReportVO [falNo=" + falNo + ", adId=" + adId + ", repStatus=" + repStatus + ", repComment=" + repComment
				+ ", repApprove=" + repApprove + "]";
	}

	
	
}
