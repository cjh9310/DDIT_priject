package kr.or.ddit.dto;

public class OpenRecVO {
	private int openSeqno; // 공고순번

	// 상세검색옵션
	private String openCocl; // 기업형태
	private String openType; // 고용형태
	private String openCar; // 경력형태
	private String openEdu; // 학력형태
	private String openJobscd; // 직종형태

	private String openConm; // 회사명
	private String openHomepg; // 회사홈페이지

	private String openTitle; // 채용제목
	private String openSdate; // 채용시작일
	private String openEdate; // 채용마감일
	private String openAcptpsn;// 채용합격자발표일
	private String openContent;// 채용내용
	private String openRegion; // 채용지역
	private String openCarnm; // 지원자격(경력)
	private String openEdunm; // 지원자격(학력)
	private int openCnt; // 모집인원수
	private int idx;
	private String openLogo; // 회사로고

	private String id;

	// 즐겨찾기필드
	private String coBookmark;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getCoBookmark() {
		return coBookmark;
	}

	public void setCoBookmark(String coBookmark) {
		this.coBookmark = coBookmark;
	}

	public String getOpenEdu() {
		return openEdu;
	}

	public void setOpenEdu(String openEdu) {
		this.openEdu = openEdu;
	}

	public String getOpenConm() {
		return openConm;
	}

	public void setOpenConm(String openConm) {
		this.openConm = openConm;
	}

	public String getOpenHomepg() {
		return openHomepg;
	}

	public void setOpenHomepg(String openHomepg) {
		this.openHomepg = openHomepg;
	}

	public int getOpenSeqno() {
		return openSeqno;
	}

	public void setOpenSeqno(int openSeqno) {
		this.openSeqno = openSeqno;
	}

	public String getOpenCocl() {
		return openCocl;
	}

	public void setOpenCocl(String openCocl) {
		this.openCocl = openCocl;
	}

	public String getOpenType() {
		return openType;
	}

	public void setOpenType(String openType) {
		this.openType = openType;
	}

	public String getOpenCar() {
		return openCar;
	}

	public void setOpenCar(String openCar) {
		this.openCar = openCar;
	}

	public String getOpenJobscd() {
		return openJobscd;
	}

	public void setOpenJobscd(String openJobscd) {
		this.openJobscd = openJobscd;
	}

	public String getOpenTitle() {
		return openTitle;
	}

	public void setOpenTitle(String openTitle) {
		this.openTitle = openTitle;
	}

	public String getOpenLogo() {
		return openLogo;
	}

	public void setOpenLogo(String openLogo) {
		this.openLogo = openLogo;
	}

	public String getOpenSdate() {
		return openSdate;
	}

	public void setOpenSdate(String openSdate) {
		openSdate = openSdate.replace("/", "-");
		this.openSdate = "20" + openSdate;
	}

	public String getOpenEdate() {
		return openEdate;
	}

	public void setOpenEdate(String openEdate) {
		if (openEdate.contains("-")) {
			openEdate = openEdate.substring(2).replace("-", "/");
			this.openEdate = openEdate;
		} else {
			openEdate = openEdate.replace("/", "-");
			this.openEdate = "20" + openEdate;
		}
	}

	public String getOpenAcptpsn() {
		return openAcptpsn;
	}

	public void setOpenAcptpsn(String openAcptpsn) {
		this.openAcptpsn = openAcptpsn;
	}

	public String getOpenContent() {
		return openContent;
	}

	public void setOpenContent(String openContent) {
		this.openContent = openContent;
	}

	public String getOpenRegion() {
		return openRegion;
	}

	public void setOpenRegion(String openRegion) {
		this.openRegion = openRegion;
	}

	public String getOpenCarnm() {
		return openCarnm;
	}

	public void setOpenCarnm(String openCarnm) {
		this.openCarnm = openCarnm;
	}

	public String getOpenEdunm() {
		return openEdunm;
	}

	public void setOpenEdunm(String openEdunm) {
		this.openEdunm = openEdunm;
	}

	public int getOpenCnt() {
		return openCnt;
	}

	public void setOpenCnt(int openCnt) {
		this.openCnt = openCnt;
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	@Override
	public String toString() {
		return "OpenRecVO [openSeqno=" + openSeqno + ", openCocl=" + openCocl + ", openType=" + openType + ", openCar="
				+ openCar + ", openEdu=" + openEdu + ", oepnJobscd=" + openJobscd + ", openConm=" + openConm
				+ ", openHomepg=" + openHomepg + ", openTitle=" + openTitle + ", openSdate=" + openSdate
				+ ", openEdate=" + openEdate + ", openAcptpsn=" + openAcptpsn + ", openContent=" + openContent
				+ ", openRegion=" + openRegion + ", openCarnm=" + openCarnm + ", openEdunm=" + openEdunm + ", openCnt="
				+ openCnt + ", idx=" + idx + ", openLogo=" + openLogo + "]";
	}
}
