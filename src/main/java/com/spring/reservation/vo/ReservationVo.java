package com.spring.reservation.vo;

public class ReservationVo {
	// Fields
	// 의료진 정보
	private int    res_num;
	private String res_date;
	private String res_time;
	private String pat_id;
	private String emp_id;
	private String diagnose;  
	private String emp_name;
	private String dept_name;
	
	// 회원 정보
	private String pat_pw;
	private String pat_name;
	private String pat_ssn;
	private String pat_email;
	private String pat_tel;
	private String pat_address;
	
	// Constructor
	public ReservationVo() {}
	public ReservationVo(int res_num, String res_date, String res_time, String pat_id, String emp_id, String diagnose,
			String pat_pw, String pat_name, String pat_ssn, String dept_name, String pat_email, String emp_name, String pat_tel, String pat_address) {
		this.res_num = res_num;
		this.res_date = res_date;
		this.res_time = res_time;
		this.pat_id = pat_id;
		this.emp_id = emp_id;
		this.diagnose = diagnose;
		this.pat_pw = pat_pw;
		this.pat_name = pat_name;
		this.pat_ssn = pat_ssn;
		this.pat_email = pat_email;
		this.pat_tel = pat_tel;
		this.emp_name = emp_name;
		this.dept_name = dept_name;
		this.pat_address = pat_address;
	}
	
	public ReservationVo(int num) {
		this.res_num = num;
		this.diagnose ="쓰레ㅔ기 ";

	}
	
	// Getter / Setter
	public int getRes_num() {
		return res_num;
	}
	public void setRes_num(int res_num) {
		this.res_num = res_num;
	}
	public String getRes_date() {
		return res_date;
	}
	public void setRes_date(String res_date) {
		this.res_date = res_date;
	}
	public String getRes_time() {
		return res_time;
	}
	public void setRes_time(String res_time) {
		this.res_time = res_time;
	}
	public String getPat_id() {
		return pat_id;
	}
	public void setPat_id(String pat_id) {
		this.pat_id = pat_id;
	}
	public String getEmp_id() {
		return emp_id;
	}
	public void setEmp_id(String emp_id) {
		this.emp_id = emp_id;
	}
	public String getDiagnose() {
		return diagnose;
	}
	public void setDiagnose(String diagnose) {
		this.diagnose = diagnose;
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
	public String getSsn() {
		return pat_ssn;
	}
	public void setSsn(String ssn) {
		this.pat_ssn = ssn;
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
	public String getEmp_name() {
		return emp_name;
	}
	public void setEmp_name(String emp_name) {
		this.emp_name = emp_name;
	}
	public String getDept_name() {
		return dept_name;
	}
	public void setDept_name(String dept_name) {
		this.dept_name = dept_name;
	}
	
	// toString
	@Override
	public String toString() {
		return "ReservationVo [res_num=" + res_num + ", res_date=" + res_date + ", res_time=" + res_time + ", pat_id="
				+ pat_id + ", emp_id=" + emp_id + ", diagnose=" + diagnose + ", pat_pw=" + pat_pw + ", pat_name="
				+ pat_name + ", ssn=" + pat_ssn + ", pat_email=" + pat_email + ", pat_tel=" + pat_tel + ", pat_address="
				+ pat_address + "]";
	}


	}
