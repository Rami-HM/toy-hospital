package com.spring.patient.vo;

public class PatientVo {
	// Fields
	// 환자정보
	private String pat_id;
	private String pat_pw;
	private String pat_name;
	private String pat_ssn;
	private String pat_email;
	private String pat_tel;
	private String pat_address;
	private String pat_gender;
	
	// Constructor
	public PatientVo() {}
	public PatientVo(String pat_id, String pat_pw, String pat_name, String pat_ssn, String pat_email, String pat_tel,
			String pat_address, String pat_gender) {
		this.pat_id = pat_id;
		this.pat_pw = pat_pw;
		this.pat_name = pat_name;
		this.pat_ssn = pat_ssn;
		this.pat_email = pat_email;
		this.pat_tel = pat_tel;
		this.pat_address = pat_address;
		this.pat_gender = pat_gender;
	}
	public String getPat_id() {
		return pat_id;
	}
	public void setPat_id(String pat_id) {
		this.pat_id = pat_id;
	}
	public String getPat_pw() {
		return pat_pw;
	}
	public void setPat_pw(String pat_pw) {
		this.pat_pw = pat_pw;
	}
	public String getPat_name() {
		return pat_name;
	}
	public void setPat_name(String pat_name) {
		this.pat_name = pat_name;
	}
	public String getPat_ssn() {
		return pat_ssn;
	}
	public void setPat_ssn(String pat_ssn) {
		this.pat_ssn = pat_ssn;
	}
	public String getPat_email() {
		return pat_email;
	}
	public void setPat_email(String pat_email) {
		this.pat_email = pat_email;
	}
	public String getPat_tel() {
		return pat_tel;
	}
	public void setPat_tel(String pat_tel) {
		this.pat_tel = pat_tel;
	}
	public String getPat_address() {
		return pat_address;
	}
	public void setPat_address(String pat_address) {
		this.pat_address = pat_address;
	}
	public String getPat_gender() {
		return pat_gender;
	}
	public void setPat_gender(String pat_gender) {
		this.pat_gender = pat_gender;
	}
	@Override
	public String toString() {
		return "PatientVo [pat_id=" + pat_id + ", pat_pw=" + pat_pw + ", pat_name=" + pat_name + ", pat_ssn=" + pat_ssn
				+ ", pat_email=" + pat_email + ", pat_tel=" + pat_tel + ", pat_address=" + pat_address + ", pat_gender="
				+ pat_gender + "]";
	}
	
	
}
