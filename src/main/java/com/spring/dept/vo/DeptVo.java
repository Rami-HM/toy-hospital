package com.spring.dept.vo;

public class DeptVo {
	private int dept_num;
	private String dept_name;
	private String dept_desc;
	public int getDept_num() {
		return dept_num;
	}
	public void setDept_num(int dept_num) {
		this.dept_num = dept_num;
	}
	public String getDept_name() {
		return dept_name;
	}
	public void setDept_name(String dept_name) {
		this.dept_name = dept_name;
	}
	public String getDept_desc() {
		return dept_desc;
	}
	public void setDept_desc(String dept_desc) {
		this.dept_desc = dept_desc;
	}
	public DeptVo() {
		
	}
	public DeptVo(int dept_num, String dept_name, String dept_desc) {
		super();
		this.dept_num = dept_num;
		this.dept_name = dept_name;
		this.dept_desc = dept_desc;
	}
	@Override
	public String toString() {
		return "DeptVo [dept_num=" + dept_num + ", dept_name=" + dept_name + ", dept_desc=" + dept_desc + "]";
	}
	
}
