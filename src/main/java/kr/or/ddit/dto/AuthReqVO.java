package kr.or.ddit.dto;

public class AuthReqVO {

	private String coId;
	private String adId;
	private String authTitle;
	private String authContent;
	private String authFile;
	private int authNo;
	private String authSdate;
	private String coConfirm;
	
	
	public String getCoId() {
		return coId;
	}
	public void setCoId(String coId) {
		this.coId = coId;
	}
	public String getAdId() {
		return adId;
	}
	public void setAdId(String adId) {
		this.adId = adId;
	}
	public String getAuthTitle() {
		return authTitle;
	}
	public void setAuthTitle(String authTitle) {
		this.authTitle = authTitle;
	}
	public String getAuthContent() {
		return authContent;
	}
	public void setAuthContent(String authContent) {
		this.authContent = authContent;
	}
	public String getAuthFile() {
		return authFile;
	}
	public void setAuthFile(String authFile) {
		this.authFile = authFile;
	}
	public int getAuthNo() {
		return authNo;
	}
	public void setAuthNo(int authNo) {
		this.authNo = authNo;
	}
	public String getAuthSdate() {
		return authSdate;
	}
	public void setAuthSdate(String authSdate) {
		this.authSdate = authSdate;
	}
	
	public String getCoConfirm() {
		return coConfirm;
	}
	public void setCoConfirm(String coConfirm) {
		this.coConfirm = coConfirm;
	}
	@Override
	public String toString() {
		return "AuthReqVO [coId=" + coId + ", adId=" + adId + ", authTitle=" + authTitle + ", authContent="
				+ authContent + ", authFile=" + authFile + ", authNo=" + authNo + ", authSdate=" + authSdate
				+ ", coConfirm=" + coConfirm + "]";
	}
	
	
	
	
	
	
}
