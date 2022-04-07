package com.spring.zipcode.vo;

public class ZipcodeVo {
	// Fields
	private int    zipcode;
	private String sido;
	private String sigungu;
	private String doro;
	
	// Constructor
	public ZipcodeVo() { }
	public ZipcodeVo(int zipcode, String sido, String sigungu, String doro) {
		this.zipcode = zipcode;
		this.sido = sido;
		this.sigungu = sigungu;
		this.doro = doro;
	}
	
	// Getter / Setter
	public int getZipcode() {
		return zipcode;
	}
	public void setZipcode(int zipcode) {
		this.zipcode = zipcode;
	}
	public String getSido() {
		return sido;
	}
	public void setSido(String sido) {
		this.sido = sido;
	}
	public String getSigungu() {
		return sigungu;
	}
	public void setSigungu(String sigungu) {
		this.sigungu = sigungu;
	}
	public String getDoro() {
		return doro;
	}
	public void setDoro(String doro) {
		this.doro = doro;
	}
	
	// toString
	@Override
	public String toString() {
		return "ZipcodeVo [zipcode=" + zipcode + ", sido=" + sido + ", sigungu=" + sigungu + ", doro=" + doro + "]";
	}
	
}
