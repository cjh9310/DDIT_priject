package kr.or.ddit.dto;

public class AllimVO {

// 알림 컬럼
	private int almSeqno;
	private String almDate;
	private String almheckDate;
	private String almType;

// 개인회원 컬럼
	private String fromId;
	
// 기업회원 컬럼
	private String toId;
	private String coId;
	private String coNm;
	
// 공채
	private String openTitle;
	private String openSeqno;

// 채용
	private String recWantedtitle;
	private String recWantedno;
	
	

	public String getOpenSeqno() {
		return openSeqno;
	}

	public void setOpenSeqno(String openSeqno) {
		this.openSeqno = openSeqno;
	}

	public String getRecWantedno() {
		return recWantedno;
	}

	public void setRecWantedno(String recWantedno) {
		this.recWantedno = recWantedno;
	}

	public String getCoId() {
		return coId;
	}

	public void setCoId(String coId) {
		this.coId = coId;
	}

	public String getCoNm() {
		return coNm;
	}

	public void setCoNm(String coNm) {
		this.coNm = coNm;
	}

	public String getOpenTitle() {
		return openTitle;
	}

	public void setOpenTitle(String openTitle) {
		this.openTitle = openTitle;
	}

	public String getRecWantedtitle() {
		return recWantedtitle;
	}

	public void setRecWantedtitle(String recWantedtitle) {
		this.recWantedtitle = recWantedtitle;
	}

	public int getAlmSeqno() {
		return almSeqno;
	}

	public void setAlmSeqno(int almSeqno) {
		this.almSeqno = almSeqno;
	}

	public String getAlmDate() {
		return almDate;
	}

	public void setAlmDate(String almDate) {
		this.almDate = almDate;
	}

	public String getAlmheckDate() {
		return almheckDate;
	}

	public void setAlmheckDate(String almheckDate) {
		this.almheckDate = almheckDate;
	}

	public String getAlmType() {
		return almType;
	}

	public void setAlmType(String almType) {
		this.almType = almType;
	}

	public String getFromId() {
		return fromId;
	}

	public void setFromId(String fromId) {
		this.fromId = fromId;
	}

	public String getToId() {
		return toId;
	}

	public void setToId(String toId) {
		this.toId = toId;
	}

	@Override
	public String toString() {
		return "AllimVO [almSeqno=" + almSeqno + ", almDate=" + almDate + ", almheckDate=" + almheckDate + ", almType="
				+ almType + ", fromId=" + fromId + ", toId=" + toId + ", coId=" + coId + ", coNm=" + coNm
				+ ", openTitle=" + openTitle + ", openSeqno=" + openSeqno + ", recWantedtitle=" + recWantedtitle
				+ ", recWantedno=" + recWantedno + "]";
	}

	

	

	
	
	
	
}
