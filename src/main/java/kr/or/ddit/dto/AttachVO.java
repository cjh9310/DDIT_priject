package kr.or.ddit.dto;

import java.util.Date;

public class AttachVO {
	
	/**등록번호*/
	private int attNo;
	
	/**저장경로*/
	private String uploadpath;
	
	/**파일명*/
	private String filename;
	
	/**파일확장자명*/
	private String filetype;
	
	/**작성자*/
	private String attacher;
	
	/**등록일시*/
	private Date regdate;
	
	/**등록일시 YYYY-MM-DD*/
	private String regdateStr;
	
	/**파일순번*/
	private int fileseqNo;
	
	/**업무구분*/
	private String workDiv;

	/**업무PK*/
	private String workPk;

	
	/**
	 * @return the attNo
	 */
	public int getAttNo() {
		return attNo;
	}

	/**
	 * @param attNo the attNo to set
	 */
	public void setAttNo(int attNo) {
		this.attNo = attNo;
	}

	/**
	 * @return the uploadpath
	 */
	public String getUploadpath() {
		return uploadpath;
	}

	/**
	 * @param uploadpath the uploadpath to set
	 */
	public void setUploadpath(String uploadpath) {
		this.uploadpath = uploadpath;
	}

	/**
	 * @return the filename
	 */
	public String getFilename() {
		return filename;
	}

	/**
	 * @param filename the filename to set
	 */
	public void setFilename(String filename) {
		this.filename = filename;
	}

	/**
	 * @return the filetype
	 */
	public String getFiletype() {
		return filetype;
	}

	/**
	 * @param filetype the filetype to set
	 */
	public void setFiletype(String filetype) {
		this.filetype = filetype;
	}

	/**
	 * @return the attacher
	 */
	public String getAttacher() {
		return attacher;
	}

	/**
	 * @param attacher the attacher to set
	 */
	public void setAttacher(String attacher) {
		this.attacher = attacher;
	}

	/**
	 * @return the regdate
	 */
	public Date getRegdate() {
		return regdate;
	}

	/**
	 * @param regdate the regdate to set
	 */
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	/**
	 * @return the regdateStr
	 */
	public String getRegdateStr() {
		return regdateStr;
	}

	/**
	 * @param regdateStr the regdateStr to set
	 */
	public void setRegdateStr(String regdateStr) {
		this.regdateStr = regdateStr;
	}

	/**
	 * @return the fileseqNo
	 */
	public int getFileseqNo() {
		return fileseqNo;
	}

	/**
	 * @param fileseqNo the fileseqNo to set
	 */
	public void setFileseqNo(int fileseqNo) {
		this.fileseqNo = fileseqNo;
	}

	/**
	 * @return the workDiv
	 */
	public String getWorkDiv() {
		return workDiv;
	}

	/**
	 * @param workDiv the workDiv to set
	 */
	public void setWorkDiv(String workDiv) {
		this.workDiv = workDiv;
	}

	/**
	 * @return the workPk
	 */
	public String getWorkPk() {
		return workPk;
	}

	/**
	 * @param workPk the workPk to set
	 */
	public void setWorkPk(String workPk) {
		this.workPk = workPk;
	}

	@Override
	public String toString() {
		return "AttachVO [attNo=" + attNo + ", uploadpath=" + uploadpath + ", filename=" + filename + ", filetype="
				+ filetype + ", attacher=" + attacher + ", regdate=" + regdate + ", regdateStr=" + regdateStr
				+ ", fileseqNo=" + fileseqNo + ", workDiv=" + workDiv + ", workPk=" + workPk + "]";
	}
	
}
