package kr.or.ddit.dto;

public class AuthReqVO {

	public String coId;
	public String adId;
	public String authTitle;
	public String authContent;
	public String authFile;
	public int authNo;
	public String authSdate;
	
	
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
	@Override
	public String toString() {
		return "AuthReqVO [coId=" + coId + ", adId=" + adId + ", authTitle=" + authTitle + ", authContent="
				+ authContent + ", authFile=" + authFile + ", authNo=" + authNo + ", authSdate=" + authSdate + "]";
	}
	
	
	
	
	
}
