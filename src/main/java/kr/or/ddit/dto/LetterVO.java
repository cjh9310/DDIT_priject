package kr.or.ddit.dto;

public class LetterVO {

	private String letSeqno;
	private String indId;
	private String letTitle;
	private String letContent;
	private int letNo;
	private int letIsnav;
	
	// 지원 전용 필드
	private int supNo;
	private int supletNo;
	private String supletTitle;
	private String supletContent;
	
	public String getLetSeqno() {
		return letSeqno;
	}

	public void setLetSeqno(String letSeqno) {
		this.letSeqno = letSeqno;
	}

	public String getIndId() {
		return indId;
	}

	public void setIndId(String indId) {
		this.indId = indId;
	}

	public String getLetTitle() {
		return letTitle;
	}

	public void setLetTitle(String letTitle) {
		this.letTitle = letTitle;
	}

	public String getLetContent() {
		return letContent;
	}

	public void setLetContent(String letContent) {
		this.letContent = letContent;
	}

	public int getLetNo() {
		return letNo;
	}

	public void setLetNo(int letNo) {
		this.letNo = letNo;
	}

	public int getLetIsnav() {
		return letIsnav;
	}

	public void setLetIsnav(int letIsnav) {
		this.letIsnav = letIsnav;
	}

	public int getSupNo() {
		return supNo;
	}

	public void setSupNo(int supNo) {
		this.supNo = supNo;
	}

	public int getSupletNo() {
		return supletNo;
	}

	public void setSupletNo(int supletNo) {
		this.supletNo = supletNo;
	}

	public String getSupletTitle() {
		return supletTitle;
	}

	public void setSupletTitle(String supletTitle) {
		this.supletTitle = supletTitle;
	}

	public String getSupletContent() {
		return supletContent;
	}

	public void setSupletContent(String supletContent) {
		this.supletContent = supletContent;
	}
	
}
