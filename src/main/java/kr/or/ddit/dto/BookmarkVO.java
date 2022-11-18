package kr.or.ddit.dto;

public class BookmarkVO {

	// 기본 필드
	private int bookNo;
	private String id;
	private String talId;
	private String recWantedno;
	private int bookType;
	private String coName;

	// 조인 필드 - 채용공고정보
	private String recCoName;
	private String recWantedtitle;

	// 조인 필드 - 기업정보
	private String coLogo;

	// 조인 필드 - 개인회원 이름
	private String name;

	public String getTalId() {
		return talId;
	}

	public void setTalId(String talId) {
		this.talId = talId;
	}

	public int getBookNo() {
		return bookNo;
	}

	public void setBookNo(int bookNo) {
		this.bookNo = bookNo;
	}

	public String getRecWantedno() {
		return recWantedno;
	}

	public void setRecWantedno(String recWantedno) {
		this.recWantedno = recWantedno;
	}

	public String getCoName() {
		return coName;
	}

	public void setCoName(String coName) {
		this.coName = coName;
	}

	public String getRecCoName() {
		return recCoName;
	}

	public void setRecCoName(String recCoName) {
		this.recCoName = recCoName;
	}

	public String getRecWantedtitle() {
		return recWantedtitle;
	}

	public void setRecWantedtitle(String recWantedtitle) {
		this.recWantedtitle = recWantedtitle;
	}

	public String getCoLogo() {
		return coLogo;
	}

	public void setCoLogo(String coLogo) {
		this.coLogo = coLogo;
	}

	public int getBookType() {
		return bookType;
	}

	public void setBookType(int bookType) {
		this.bookType = bookType;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

}
