package com.spring.treatment.vo;

public class TreatmentVo {
	// Fields
	// 환자정보
	private String pat_id;
	private String pat_name;
	private String pat_tel;
	private String pat_address;
	private String pat_email;
	private String pat_gender;
	
	// 진료정보
	private String trt_date;
	private String emp_conts;
	
	// 의료진 정보
	private String emp_name;
	
	// 부서정보
	private String dept_name;

	// Constuctor
	public TreatmentVo() {}
	public TreatmentVo(String pat_id, String pat_name, String pat_tel, String pat_address, String pat_email,
			String pat_gender, String trt_date, String emp_conts, String emp_name, String dept_name) {
		this.pat_id = pat_id;
		this.pat_name = pat_name;
		this.pat_tel = pat_tel;
		this.pat_address = pat_address;
		this.pat_email = pat_email;
		this.pat_gender = pat_gender;
		this.trt_date = trt_date;
		this.emp_conts = emp_conts;
		this.emp_name = emp_name;
		this.dept_name = dept_name;
	}
	
	// Getter / Setter
	public String getPat_id() {
		return pat_id;
	}
	public void setPat_id(String pat_id) {
		this.pat_id = pat_id;
	}
	public String getPat_name() {
		return pat_name;
	}
	public void setPat_name(String pat_name) {
		this.pat_name = pat_name;
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
	public String getPat_email() {
		return pat_email;
	}
	public void setPat_email(String pat_email) {
		this.pat_email = pat_email;
	}
	public String getPat_gender() {
		return pat_gender;
	}
	public void setPat_gender(String pat_gender) {
		this.pat_gender = pat_gender;
	}
	public String getTrt_date() {
		return trt_date;
	}
	public void setTrt_date(String trt_date) {
		this.trt_date = trt_date;
	}
	public String getEmp_conts() {
		return emp_conts;
	}
	public void setEmp_conts(String emp_conts) {
		this.emp_conts = emp_conts;
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
		return "TreatmentVo [pat_id=" + pat_id + ", pat_name=" + pat_name + ", pat_tel=" + pat_tel + ", pat_address="
				+ pat_address + ", pat_email=" + pat_email + ", pat_gender=" + pat_gender + ", trt_date=" + trt_date
				+ ", emp_conts=" + emp_conts + ", emp_name=" + emp_name + ", dept_name=" + dept_name + "]";
	}
	
}
