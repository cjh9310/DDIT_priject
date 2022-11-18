package kr.or.ddit.dto;

import java.util.Date;

public class ActivityVO {
	
	private int actNo; //활동이력 일련번호
	private String indId; //개인회원 아이디
	private int conNo; //공모전 일련번호
	private int menNo; //멘토링 일련번호
	private int actStatus; // 진행상태(0신청완료,1진행중,2완료,3중도포기)=>(0신청완료,1중도포기)
	private int actPrize; //수상내역(0,1,2)
	private int actScore; //가산점수(1,2,3)
	private String actTel; //신청자가 공모응모페이지에서 직접 입력한 전화번호
	private String actEmail; //신청자가 공모응모페이지에서 직접 입력한 이메일주소
	private Date actDate; //신청자가 공모전신청하고 멘토링신청한 날짜
	
	//공모전
	private Date conSdate; //시작일자
	private Date conEdate;//마감일자
	private String conTitle;//제목
	
	//멘토링
	private Date menSdate;//시작일자
	private Date menEdate;//마감일자
	private String menTitle;//재목
	private int menProgress;//진행률
	
	//회원명
	private String name;
	
	public int getActNo() {
		return actNo;
	}
	public void setActNo(int actNo) {
		this.actNo = actNo;
	}
	public String getIndId() {
		return indId;
	}
	public void setIndId(String indId) {
		this.indId = indId;
	}
	public int getConNo() {
		return conNo;
	}
	public void setConNo(int conNo) {
		this.conNo = conNo;
	}
	public int getMenNo() {
		return menNo;
	}
	public void setMenNo(int menNo) {
		this.menNo = menNo;
	}
	public int getActStatus() {
		return actStatus;
	}
	public void setActStatus(int actStatus) {
		this.actStatus = actStatus;
	}
	public int getActPrize() {
		return actPrize;
	}
	public void setActPrize(int actPrize) {
		this.actPrize = actPrize;
	}
	public int getActScore() {
		return actScore;
	}
	public void setActScore(int actScore) {
		this.actScore = actScore;
	}
	public String getActTel() {
		return actTel;
	}
	public void setActTel(String actTel) {
		this.actTel = actTel;
	}
	public String getActEmail() {
		return actEmail;
	}
	public void setActEmail(String actEmail) {
		this.actEmail = actEmail;
	}
	public Date getActDate() {
		return actDate;
	}
	public void setActDate(Date actDate) {
		this.actDate = actDate;
	}
	public Date getConSdate() {
		return conSdate;
	}
	public void setConSdate(Date conSdate) {
		this.conSdate = conSdate;
	}
	public Date getConEdate() {
		return conEdate;
	}
	public void setConEdate(Date conEdate) {
		this.conEdate = conEdate;
	}
	public String getConTitle() {
		return conTitle;
	}
	public void setConTitle(String conTitle) {
		this.conTitle = conTitle;
	}
	public Date getMenSdate() {
		return menSdate;
	}
	public void setMenSdate(Date menSdate) {
		this.menSdate = menSdate;
	}
	public Date getMenEdate() {
		return menEdate;
	}
	public void setMenEdate(Date menEdate) {
		this.menEdate = menEdate;
	}
	public String getMenTitle() {
		return menTitle;
	}
	public void setMenTitle(String menTitle) {
		this.menTitle = menTitle;
	}
	public int getMenProgress() {
		return menProgress;
	}
	public void setMenProgress(int menProgress) {
		this.menProgress = menProgress;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	@Override
	public String toString() {
		return "ActivityVO [actNo=" + actNo + ", indId=" + indId + ", conNo=" + conNo + ", menNo=" + menNo
				+ ", actStatus=" + actStatus + ", actPrize=" + actPrize + ", actScore=" + actScore + ", actTel="
				+ actTel + ", actEmail=" + actEmail + ", actDate=" + actDate + ", conSdate=" + conSdate + ", conEdate="
				+ conEdate + ", conTitle=" + conTitle + ", menSdate=" + menSdate + ", menEdate=" + menEdate
				+ ", menTitle=" + menTitle + ", menProgress=" + menProgress + ", name=" + name + "]";
	}
	
	
	
	
	
}
