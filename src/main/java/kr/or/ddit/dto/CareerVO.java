package kr.or.ddit.dto;

import java.util.Date;

public class CareerVO {

	private String crrNo;
	private String indId;
	private String crrSector;
	private String crrCorname;
	private String crrJob;
	private String crrPosition;
	private Date crrSdate;
	private Date crrEdate;
	private int crrSal;
	private int crrAnnual;
	private int crrStatus;
	private String strStatus;
	
	// 지원 필드
	private int supNo;
	private int supcrrNo;
	private String supcrrSec;
	private String supcrrCor;
	private String supcrrJob;
	private String supcrrPos;
	private Date supcrrSdate;
	private Date supcrrEdate;

	public int getCrrStatus() {
		return crrStatus;
	}

	public void setCrrStatus(int crrStatus) {
		this.crrStatus = crrStatus;
	}

	public String getStrStatus() {
		return strStatus;
	}

	public void setStrStatus(String strStatus) {
		this.strStatus = strStatus;
	}

	public String getCrrNo() {
		return crrNo;
	}

	public void setCrrNo(String crrNo) {
		this.crrNo = crrNo;
	}

	public String getIndId() {
		return indId;
	}

	public void setIndId(String indId) {
		this.indId = indId;
	}

	public String getCrrSector() {
		return crrSector;
	}

	public void setCrrSector(String crrSector) {
		this.crrSector = crrSector;
	}

	public String getCrrCorname() {
		return crrCorname;
	}

	public void setCrrCorname(String crrCorname) {
		this.crrCorname = crrCorname;
	}

	public String getCrrJob() {
		return crrJob;
	}

	public void setCrrJob(String crrJob) {
		this.crrJob = crrJob;
	}

	public String getCrrPosition() {
		return crrPosition;
	}

	public void setCrrPosition(String crrPosition) {
		this.crrPosition = crrPosition;
	}

	public Date getCrrSdate() {
		return crrSdate;
	}

	public void setCrrSdate(Date crrSdate) {
		this.crrSdate = crrSdate;
	}

	public Date getCrrEdate() {
		return crrEdate;
	}

	public void setCrrEdate(Date crrEdate) {
		this.crrEdate = crrEdate;
	}

	public int getCrrSal() {
		return crrSal;
	}

	public void setCrrSal(int crrSal) {
		this.crrSal = crrSal;
	}

	public int getCrrAnnual() {
		return crrAnnual;
	}

	public void setCrrAnnual(int crrAnnual) {
		this.crrAnnual = crrAnnual;
	}

	public int getSupNo() {
		return supNo;
	}

	public void setSupNo(int supNo) {
		this.supNo = supNo;
	}

	public int getSupcrrNo() {
		return supcrrNo;
	}

	public void setSupcrrNo(int supcrrNo) {
		this.supcrrNo = supcrrNo;
	}

	public String getSupcrrSec() {
		return supcrrSec;
	}

	public void setSupcrrSec(String supcrrSec) {
		this.supcrrSec = supcrrSec;
	}

	public String getSupcrrCor() {
		return supcrrCor;
	}

	public void setSupcrrCor(String supcrrCor) {
		this.supcrrCor = supcrrCor;
	}

	public String getSupcrrJob() {
		return supcrrJob;
	}

	public void setSupcrrJob(String supcrrJob) {
		this.supcrrJob = supcrrJob;
	}

	public String getSupcrrPos() {
		return supcrrPos;
	}

	public void setSupcrrPos(String supcrrPos) {
		this.supcrrPos = supcrrPos;
	}

	public Date getSupcrrSdate() {
		return supcrrSdate;
	}

	public void setSupcrrSdate(Date supcrrSdate) {
		this.supcrrSdate = supcrrSdate;
	}

	public Date getSupcrrEdate() {
		return supcrrEdate;
	}

	public void setSupcrrEdate(Date supcrrEdate) {
		this.supcrrEdate = supcrrEdate;
	}
	
}
