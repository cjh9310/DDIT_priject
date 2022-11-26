package kr.or.ddit.dto;

import java.util.Date;

public class EmpstatsVO {

	// Trend Field
	private String trendNo;
	private String trendPeriod;
	private String disCode;
	private String ageCode;
	private float trendRatio;
	private float trendCnt;

	// EmpStats Field
	private Date empDate;
	private int empsPop;
	private int empsActivity;
	private int employedRate;
	private int employedNum;
	private int unemployedRate;
	private int unemployedNum;
	private int empIncdec;

	public String getTrendNo() {
		return trendNo;
	}

	public void setTrendNo(String trendNo) {
		this.trendNo = trendNo;
	}

	public String getDisCode() {
		return disCode;
	}

	public void setDisCode(String disCode) {
		this.disCode = disCode;
	}

	public String getAgeCode() {
		return ageCode;
	}

	public void setAgeCode(String ageCode) {
		this.ageCode = ageCode;
	}

	public float getTrendRatio() {
		return trendRatio;
	}

	public void setTrendRatio(float trendRatio) {
		this.trendRatio = trendRatio;
	}

	public float getTrendCnt() {
		return trendCnt;
	}

	public void setTrendCnt(float trendCnt) {
		this.trendCnt = trendCnt;
	}

	public String getTrendPeriod() {
		return trendPeriod;
	}

	public void setTrendPeriod(String trendPeriod) {
		this.trendPeriod = trendPeriod;
	}

	public Date getEmpDate() {
		return empDate;
	}

	public void setEmpDate(Date empDate) {
		this.empDate = empDate;
	}

	public int getEmpsPop() {
		return empsPop;
	}

	public void setEmpsPop(int empsPop) {
		this.empsPop = empsPop;
	}

	public int getEmpsActivity() {
		return empsActivity;
	}

	public void setEmpsActivity(int empsActivity) {
		this.empsActivity = empsActivity;
	}

	public int getEmployedRate() {
		return employedRate;
	}

	public void setEmployedRate(int employedRate) {
		this.employedRate = employedRate;
	}

	public int getEmployedNum() {
		return employedNum;
	}

	public void setEmployedNum(int employedNum) {
		this.employedNum = employedNum;
	}

	public int getUnemployedRate() {
		return unemployedRate;
	}

	public void setUnemployedRate(int unemployedRate) {
		this.unemployedRate = unemployedRate;
	}

	public int getUnemployedNum() {
		return unemployedNum;
	}

	public void setUnemployedNum(int unemployedNum) {
		this.unemployedNum = unemployedNum;
	}

	public int getEmpIncdec() {
		return empIncdec;
	}

	public void setEmpIncdec(int empIncdec) {
		this.empIncdec = empIncdec;
	}

}
