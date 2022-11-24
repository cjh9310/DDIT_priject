package kr.or.ddit.dto;

public class CoDetailListVO {
	
	private String type; // 채용type
	private String coId; // 기업id
	private String coNm; // 기업이름
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
		return "CoDetailListVO [type=" + type + ", coId=" + coId + ", coNm=" + coNm + ", recWantedtitle="
				+ recWantedtitle + ", openTitle=" + openTitle + "]";
	}
	
	
}
