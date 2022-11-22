package kr.or.ddit.dto;

import java.util.Date;

public class SupplyRecVO {

	// COMMON FIELD
	private int rownum;
	
	// Member FIELD
	private String id;
	private String name;
	private String email;
	private String picture;

	// SUPPLY_REC FIELD
	private int supNo;
	private String indId;
	private Date supDate;
	private int supType;
	
	// RECRUIT FIELD
	private String coName;
	private String recWantedno;
	private String recWantedtitle;
	private String recIndtpcdnm;
	private String recRegion;
	private String recReceiptclosedt;
	private Date recRegdt;

	// OPEN_REC FIELD
	private int openSeqno;
	private String openTitle;
	private String openConm;
	private String openRegion;
	private String openSdate;
	private String openEdate;
	
	// SUP_RESUME FIELD
	private int supresNo;
	private String supresName;
	private String supresBir;
	private String supresEmail;
	private String supresTel;
	private String supresAddr;
	private String supresPic;

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

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPicture() {
		return picture;
	}

	public void setPicture(String picture) {
		this.picture = picture;
	}

	public int getRownum() {
		return rownum;
	}

	public void setRownum(int rownum) {
		this.rownum = rownum;
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

	public Date getSupDate() {
		return supDate;
	}

	public void setSupDate(Date supDate) {
		this.supDate = supDate;
	}

	public String getRecWantedno() {
		return recWantedno;
	}

	public void setRecWantedno(String recWantedno) {
		this.recWantedno = recWantedno;
	}

	public String getRecWantedtitle() {
		return recWantedtitle;
	}

	public void setRecWantedtitle(String recWantedtitle) {
		this.recWantedtitle = recWantedtitle;
	}

	public String getRecRegion() {
		return recRegion;
	}

	public void setRecRegion(String recRegion) {
		this.recRegion = recRegion;
	}

	public String getRecReceiptclosedt() {
		return recReceiptclosedt;
	}

	public void setRecReceiptclosedt(String recReceiptclosedt) {
		this.recReceiptclosedt = recReceiptclosedt;
	}

	public Date getRecRegdt() {
		return recRegdt;
	}

	public void setRecRegdt(Date recRegdt) {
		this.recRegdt = recRegdt;
	}

	public int getOpenSeqno() {
		return openSeqno;
	}

	public void setOpenSeqno(int openSeqno) {
		this.openSeqno = openSeqno;
	}

	public String getOpenTitle() {
		return openTitle;
	}

	public void setOpenTitle(String openTitle) {
		this.openTitle = openTitle;
	}

	public String getOpenConm() {
		return openConm;
	}

	public void setOpenConm(String openConm) {
		this.openConm = openConm;
	}

	public String getOpenRegion() {
		return openRegion;
	}

	public void setOpenRegion(String openRegion) {
		this.openRegion = openRegion;
	}

	public String getOpenSdate() {
		return openSdate;
	}

	public void setOpenSdate(String openSdate) {
		this.openSdate = openSdate;
	}

	public String getOpenEdate() {
		return openEdate;
	}

	public void setOpenEdate(String openEdate) {
		this.openEdate = openEdate;
	}

	public String getRecIndtpcdnm() {
		return recIndtpcdnm;
	}

	public void setRecIndtpcdnm(String recIndtpcdnm) {
		this.recIndtpcdnm = recIndtpcdnm;
	}

	public String getCoName() {
		return coName;
	}

	public void setCoName(String coName) {
		this.coName = coName;
	}

	public int getSupType() {
		return supType;
	}

	public void setSupType(int supType) {
		this.supType = supType;
	}

	public int getSupresNo() {
		return supresNo;
	}

	public void setSupresNo(int supresNo) {
		this.supresNo = supresNo;
	}

	public String getSupresName() {
		return supresName;
	}

	public void setSupresName(String supresName) {
		this.supresName = supresName;
	}

	public String getSupresBir() {
		return supresBir;
	}

	public void setSupresBir(String supresBir) {
		this.supresBir = supresBir;
	}

	public String getSupresEmail() {
		return supresEmail;
	}

	public void setSupresEmail(String supresEmail) {
		this.supresEmail = supresEmail;
	}

	public String getSupresTel() {
		return supresTel;
	}

	public void setSupresTel(String supresTel) {
		this.supresTel = supresTel;
	}

	public String getSupresAddr() {
		return supresAddr;
	}

	public void setSupresAddr(String supresAddr) {
		this.supresAddr = supresAddr;
	}

	public String getSupresPic() {
		return supresPic;
	}

	public void setSupresPic(String supresPic) {
		this.supresPic = supresPic;
	}

}
