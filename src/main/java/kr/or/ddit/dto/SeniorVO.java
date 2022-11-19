package kr.or.ddit.dto;

public class SeniorVO {
	
	private int snrNo; // 글번호
	private String snrType; // 일자리유형
	private String snrTitle; // 글제목
	private String snrContent; // 글내용
	private String snrConame; // 회사명
	private String snrTel;	  // 전화번호
	private String snrWorkplace; // 근무지
	private String snrSdate;	// 글등록일
	private String snrEdate;	// 종료일
	private String snrVolume;	// 구인인원명수
	private String snrState;	// 상태(진행중,진행완료..) 
	private String snrAdid;	// 등록관리자
	
	public int getSnrNo() {
		return snrNo;
	}
	public void setSnrNo(int snrNo) {
		this.snrNo = snrNo;
	}
	public String getSnrType() {
		return snrType;
	}
	public void setSnrType(String snrType) {
		this.snrType = snrType;
	}
	public String getSnrTitle() {
		return snrTitle;
	}
	public void setSnrTitle(String snrTitle) {
		this.snrTitle = snrTitle;
	}
	public String getSnrContent() {
		return snrContent;
	}
	public void setSnrContent(String snrContent) {
		this.snrContent = snrContent;
	}
	public String getSnrConame() {
		return snrConame;
	}
	public void setSnrConame(String snrConame) {
		this.snrConame = snrConame;
	}
	public String getSnrTel() {
		return snrTel;
	}
	public void setSnrTel(String snrTel) {
		this.snrTel = snrTel;
	}
	public String getSnrWorkplace() {
		return snrWorkplace;
	}
	public void setSnrWorkplace(String snrWorkplace) {
		this.snrWorkplace = snrWorkplace;
	}
	public String getSnrSdate() {
		return snrSdate;
	}
	public void setSnrSdate(String snrSdate) {
		this.snrSdate = snrSdate;
	}
	public String getSnrEdate() {
		return snrEdate;
	}
	public void setSnrEdate(String snrEdate) {
		this.snrEdate = snrEdate;
	}
	public String getSnrVolume() {
		return snrVolume;
	}
	public void setSnrVolume(String snrVolume) {
		this.snrVolume = snrVolume;
	}
	public String getSnrState() {
		return snrState;
	}
	public void setSnrState(String snrState) {
		this.snrState = snrState;
	}
	public String getSnrAdid() {
		return snrAdid;
	}
	public void setSnrAdid(String snrAdid) {
		this.snrAdid = snrAdid;
	}
	
	@Override
	public String toString() {
		return "SeniorVO [snrNo=" + snrNo + ", snrType=" + snrType + ", snrTitle=" + snrTitle + ", snrContent="
				+ snrContent + ", snrConame=" + snrConame + ", snrTel=" + snrTel + ", snrWorkplace=" + snrWorkplace
				+ ", snrSdate=" + snrSdate + ", snrEdate=" + snrEdate + ", snrVolume=" + snrVolume + ", snrState="
				+ snrState + ", snrAdid=" + snrAdid + "]";
	}
	
	

}