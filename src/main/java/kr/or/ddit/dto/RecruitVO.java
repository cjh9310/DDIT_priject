package kr.or.ddit.dto;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class RecruitVO {

	// 채용공고 필드
	private String recWantedno; // 구인인증번호                        REC_WANTEDNO
	private Date recRegdt; // 등록일자                                        SYSDATE
	private String recWantedtitle; // 구인제목                        REC_WANTEDTITLE
	private String recIndtpcdnm; // 업종					REC_INDTPCDNM
	private String coName; // 회사명						CO_NAME
	private int recMinsal; // 최소임금액					REC_MINSAL
	private int recMaxsal; // 최대임금액					REC_MAXSAL
	private String recEntertpnm; // 경력조건				REC_ENTERTPNM
	private String recMinedubg;  // 학력조건 				REC_MINEDUBG
	private String recPersonal; // 근로자수				REC_PERSONAL recPersonal
	private String recCapitalamt; // 자본금				REC_CAPITALAMT
	private String recYrsalesamt; // 연매출액				REC_YRSALESAMT
	private String recFourins; // 복리후생				REC_FOURINS
	private String recBusisize; // 회사규모				REC_BUSISIZE
	private String recHomepg; // 회사홈페이지				REC_HOMEPG
	private String recJobsnm; // 모집직종					REC_JOBSNM
	private String recReceiptclosedt; // 접수마감일		REC_RECEIPTCLOSEDT
	private String recJobcont; // 직무내용				REC_JOBCONT
	private String recCollectpsncnt; // 모집인원			REC_COLLECTPSNCNT
	private String recSaltpnm; // 임금조건				REC_SALTPNM
	private String recWorkdayworkhrcont; // 근무시간/형태	REC_WORKDAYWORKHRCONT
	private String recRegion; // 근무지					REC_REGION
	
	private String secCode; // 업종코드
	private int idx; // rownum을 idx로 표기

	// 채용공고 지원내역 필드
	private int rownum;
	private int supNo;
	private String indId;
	private Date subDate;
	private int supStatus;
	private String coId;

	// 즐겨찾기 필드
	private String recBookmark;
	private String coBookmark;
	
	//파일
	private List<MultipartFile> uploadFile;
	
	private List<AttachVO> attachList;

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

	public int getSupNo() {
		return supNo;
	}

	public void setSupNo(int supNo) {
		this.supNo = supNo;
	}

	public String getIndId() {
		return indId;
	}

	public void setIndId(String indId) {
		this.indId = indId;
	}

	public Date getSubDate() {
		return subDate;
	}

	public void setSubDate(Date subDate) {
		this.subDate = subDate;
	}

	public int getSupStatus() {
		return supStatus;
	}

	public void setSupStatus(int supStatus) {
		this.supStatus = supStatus;
	}

	public String getCoId() {
		return coId;
	}

	public void setCoId(String coId) {
		this.coId = coId;
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

	public Date getRecRegdt() {
		return recRegdt;
	}

	public void setRecRegdt(Date recRegdt) {
		SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd");
		String parseDate = format.format(recRegdt);
		try {
			Date recRegistDt = format.parse(parseDate);
			this.recRegdt = recRegistDt;
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
	}

	public int getRecMinsal() {
		return recMinsal;
	}

	public void setRecMinsal(int recMinsal) {
		this.recMinsal = recMinsal;
	}

	public int getRecMaxsal() {
		return recMaxsal;
	}

	public void setRecMaxsal(int recMaxsal) {
		this.recMaxsal = recMaxsal;
	}

	public String getRecMinedubg() {
		return recMinedubg;
	}

	public void setRecMinedubg(String recMinedubg) {
		this.recMinedubg = recMinedubg;
	}

	public String getRecPersonal() {
		return recPersonal;
	}

	public void setRecPersonal(String recPersonal) {
		this.recPersonal = recPersonal;
	}

	public String getRecCapitalamt() {
		return recCapitalamt;
	}

	public void setRecCapitalamt(String recCapitalamt) {
		this.recCapitalamt = recCapitalamt;
	}

	public String getRecYrsalesamt() {
		return recYrsalesamt;
	}

	public void setRecYrsalesamt(String recYrsalesamt) {
		this.recYrsalesamt = recYrsalesamt;
	}

	public String getRecIndtpcdnm() {
		return recIndtpcdnm;
	}

	public void setRecIndtpcdnm(String recIndtpcdnm) {
		this.recIndtpcdnm = recIndtpcdnm;
	}

	public String getRecHomepg() {
		return recHomepg;
	}

	public void setRecHomepg(String recHomepg) {
		this.recHomepg = recHomepg;
	}

	public String getRecBusisize() {
		return recBusisize;
	}

	public void setRecBusisize(String recBusisize) {
		this.recBusisize = recBusisize;
	}

	public String getRecJobsnm() {
		return recJobsnm;
	}

	public void setRecJobsnm(String recJobsnm) {
		this.recJobsnm = recJobsnm;
	}

	public String getRecWantedtitle() {
		return recWantedtitle;
	}

	public void setRecWantedtitle(String recWantedtitle) {
		this.recWantedtitle = recWantedtitle;
	}

	public String getRecJobcont() {
		return recJobcont;
	}

	public void setRecJobcont(String recJobcont) {
		this.recJobcont = recJobcont;
	}

	public String getRecReceiptclosedt() {
		return recReceiptclosedt;
	}

	public void setRecReceiptclosedt(String recReceiptclosedt) {
		if(recReceiptclosedt.contains("-")) {
			recReceiptclosedt = recReceiptclosedt.replace("-", "");
			this.recReceiptclosedt = recReceiptclosedt;
		}
	}

	public String getRecCollectpsncnt() {
		return recCollectpsncnt;
	}

	public void setRecCollectpsncnt(String recCollectpsncnt) {
		this.recCollectpsncnt = recCollectpsncnt;
	}

	public String getRecSaltpnm() {
		return recSaltpnm;
	}

	public void setRecSaltpnm(String recSaltpnm) {
		this.recSaltpnm = recSaltpnm;
	}

	public String getRecEntertpnm() {
		return recEntertpnm;
	}

	public void setRecEntertpnm(String recEntertpnm) {
		this.recEntertpnm = recEntertpnm;
	}

	public String getRecWorkdayworkhrcont() {
		return recWorkdayworkhrcont;
	}

	public void setRecWorkdayworkhrcont(String recWorkdayworkhrcont) {
		this.recWorkdayworkhrcont = recWorkdayworkhrcont;
	}

	public String getRecFourins() {
		return recFourins;
	}

	public void setRecFourins(String recFourins) {
		this.recFourins = recFourins;
	}

	public String getRecRegion() {
		return recRegion;
	}

	public void setRecRegion(String recRegion) {
		this.recRegion = recRegion;
	}

	public String getSecCode() {
		return secCode;
	}

	public void setSecCode(String secCode) {
		this.secCode = secCode;
	}

	public int getRownum() {
		return rownum;
	}

	public void setRownum(int rownum) {
		this.rownum = rownum;
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public String getRecBookmark() {
		return recBookmark;
	}

	public void setRecBookmark(String recBookmark) {
		this.recBookmark = recBookmark;
	}

	public String getCoBookmark() {
		return coBookmark;
	}

	public void setCoBookmark(String coBookmark) {
		this.coBookmark = coBookmark;
	}

	@Override
	public String toString() {
		return "RecruitVO [recWantedno=" + recWantedno + ", recRegdt=" + recRegdt + ", recWantedtitle=" + recWantedtitle
				+ ", recIndtpcdnm=" + recIndtpcdnm + ", coName=" + coName + ", recMinsal=" + recMinsal + ", recMaxsal="
				+ recMaxsal + ", recEntertpnm=" + recEntertpnm + ", recMinedubg=" + recMinedubg + ", recPersonal="
				+ recPersonal + ", recCapitalamt=" + recCapitalamt + ", recYrsalesamt=" + recYrsalesamt
				+ ", recFourins=" + recFourins + ", recBusisize=" + recBusisize + ", recHomepg=" + recHomepg
				+ ", recJobsnm=" + recJobsnm + ", recReceiptclosedt=" + recReceiptclosedt + ", recJobcont=" + recJobcont
				+ ", recCollectpsncnt=" + recCollectpsncnt + ", recSaltpnm=" + recSaltpnm + ", recWorkdayworkhrcont="
				+ recWorkdayworkhrcont + ", recRegion=" + recRegion + ", secCode=" + secCode + ", idx=" + idx
				+ ", rownum=" + rownum + ", supNo=" + supNo + ", indId=" + indId + ", subDate=" + subDate
				+ ", supStatus=" + supStatus + ", coId=" + coId + ", recBookmark=" + recBookmark + ", coBookmark="
				+ coBookmark + ", uploadFile=" + uploadFile + ", attachList=" + attachList + "]";
	}

	

}
