package com.spring.history.vo;

public class HistoryVo {
	
	private String emp_id;
	private int hst_num;
	private String hst_career;
	private String hst_date;

	public HistoryVo() {
		
	}
	
	public HistoryVo(String emp_id, int hst_num, String hst_career, String hst_date) {
	
		this.emp_id = emp_id;
		this.hst_num = hst_num;
		this.hst_career = hst_career;
		this.hst_date = hst_date;
	}

	public String getEmp_id() {
		return emp_id;
	}

	public void setEmp_id(String emp_id) {
		this.emp_id = emp_id;
	}

	public int getHst_num() {
		return hst_num;
	}

	public void setHst_num(int hst_num) {
		this.hst_num = hst_num;
	}

	public String getHst_career() {
		return hst_career;
	}

	public void setHst_career(String hst_career) {
		this.hst_career = hst_career;
	}

	public String getHst_date() {
		return hst_date;
	}

	public void setHst_date(String hst_date) {
		this.hst_date = hst_date;
	}

	@Override
	public String toString() {
		return "HistoryVo [emp_id=" + emp_id + ", hst_num=" + hst_num + ", hst_career=" + hst_career + ", hst_date="
				+ hst_date + "]";
	}
	
	
	
}
