package kr.or.ddit.dto;

public class CoDetailListVO {
	
	private String type; // 기업id
	private String coId; // 기업id
	private String coAddr; // 기업 주소1
	private String coDeaddr; // 기업주소2
	private String coNm; // 기업이름
	private String coConfirm; // 기업회원 권한
	private String recWantedtitle; // 공개채용 제목
	private String openTitle; // 일반채용 목록
	/**
	 * @return the type
	 */
	public String getType() {
		return type;
	}
	/**
	 * @param type the type to set
	 */
	public void setType(String type) {
		this.type = type;
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
	 * @return the recWantedtitle
	 */
	public String getRecWantedtitle() {
		return recWantedtitle;
	}
	/**
	 * @param recWantedtitle the recWantedtitle to set
	 */
	public void setRecWantedtitle(String recWantedtitle) {
		this.recWantedtitle = recWantedtitle;
	}
	/**
	 * @return the openTitle
	 */
	public String getOpenTitle() {
		return openTitle;
	}
	/**
	 * @param openTitle the openTitle to set
	 */
	public void setOpenTitle(String openTitle) {
		this.openTitle = openTitle;
	}
	@Override
	public String toString() {
		return "CoDetailListVO [type=" + type + ", coId=" + coId + ", coAddr=" + coAddr + ", coDeaddr=" + coDeaddr
				+ ", coNm=" + coNm + ", coConfirm=" + coConfirm + ", recWantedtitle=" + recWantedtitle + ", openTitle="
				+ openTitle + "]";
	}
	
	
}
