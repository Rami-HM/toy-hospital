package com.spring.login.vo;

public class LoginVo {
	private String id;
	private String pwd;
	private int loginNum;
	private int grade;
	
	
	
	public LoginVo() {
		super();
	}



	public LoginVo(String id, String pwd, int loginNum, int grade) {
		super();
		this.id = id;
		this.pwd = pwd;
		this.loginNum = loginNum;
		this.grade = grade;
	}



	public String getId() {
		return id;
	}



	public void setId(String id) {
		this.id = id;
	}



	public String getPwd() {
		return pwd;
	}



	public void setPwd(String pwd) {
		this.pwd = pwd;
	}



	public int getLoginNum() {
		return loginNum;
	}



	public void setLoginNum(int loginNum) {
		this.loginNum = loginNum;
	}



	public int getGrade() {
		return grade;
	}



	public void setGrade(int grade) {
		this.grade = grade;
	}
	
	
	
}
