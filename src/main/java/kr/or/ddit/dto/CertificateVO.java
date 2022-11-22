package kr.or.ddit.dto;

import java.util.Date;

public class CertificateVO {

	private String cerNo;
	private String indId;
	private String cerName;
	private Date cerSdate;
	private Date cerEdate;
	private String cerHost;
	
	// 지원 필드
	private int supNo;
	private int supcerNo;
	private String supcerHost;
	private String supcerName;
	private Date supcerSdate;
	private Date supcerEdate;

	public String getCerNo() {
		return cerNo;
	}

	public void setCerNo(String cerNo) {
		this.cerNo = cerNo;
	}

	public String getIndId() {
		return indId;
	}

	public void setIndId(String indId) {
		this.indId = indId;
	}

	public String getCerName() {
		return cerName;
	}

	public void setCerName(String cerName) {
		this.cerName = cerName;
	}

	public Date getCerSdate() {
		return cerSdate;
	}

	public void setCerSdate(Date cerSdate) {
		this.cerSdate = cerSdate;
	}

	public Date getCerEdate() {
		return cerEdate;
	}

	public void setCerEdate(Date cerEdate) {
		this.cerEdate = cerEdate;
	}

	public String getCerHost() {
		return cerHost;
	}

	public void setCerHost(String cerHost) {
		this.cerHost = cerHost;
	}

	public int getSupcerNo() {
		return supcerNo;
	}

	public void setSupcerNo(int supcerNo) {
		this.supcerNo = supcerNo;
	}

	public String getSupcerHost() {
		return supcerHost;
	}

	public void setSupcerHost(String supcerHost) {
		this.supcerHost = supcerHost;
	}

	public String getSupcerName() {
		return supcerName;
	}

	public void setSupcerName(String supcerName) {
		this.supcerName = supcerName;
	}

	public Date getSupcerSdate() {
		return supcerSdate;
	}

	public void setSupcerSdate(Date supcerSdate) {
		this.supcerSdate = supcerSdate;
	}

	public Date getSupcerEdate() {
		return supcerEdate;
	}

	public void setSupcerEdate(Date supcerEdate) {
		this.supcerEdate = supcerEdate;
	}

	public int getSupNo() {
		return supNo;
	}

	public void setSupNo(int supNo) {
		this.supNo = supNo;
	}
	
}
