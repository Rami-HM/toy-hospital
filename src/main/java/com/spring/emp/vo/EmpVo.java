package com.spring.emp.vo;

public class EmpVo {
	private String emp_id;
	private String emp_name;
	private int dept_num;
	private String emp_position;
	private String emp_img;
	private String emp_pw;

	// 부서 정보
	private String dept_name;
	private String dept_desc;

	// Constructor
	public EmpVo() {
	}

	public EmpVo(String emp_id, String emp_pw, String emp_name, int dept_num, String emp_position, String emp_img,
			String dept_name, String dept_desc) {
		this.emp_id = emp_id;
		this.emp_pw = emp_pw;
		this.emp_name = emp_name;
		this.dept_num = dept_num;
		this.emp_position = emp_position;
		this.emp_img = emp_img;
		this.dept_name = dept_name;
		this.dept_desc = dept_desc;
	}

	public EmpVo(String emp_id, String emp_name, int dept_num, String emp_position, String emp_img, String emp_pw) {
		super();
		this.emp_id = emp_id;
		this.emp_name = emp_name;
		this.dept_num = dept_num;
		this.emp_position = emp_position;
		this.emp_img = emp_img;
		this.emp_pw = emp_pw;
	}

	public String getEmp_id() {
		return emp_id;
	}

	public void setEmp_id(String emp_id) {
		this.emp_id = emp_id;
	}

	public String getEmp_name() {
		return emp_name;
	}

	public void setEmp_name(String emp_name) {
		this.emp_name = emp_name;
	}

	public int getDept_num() {
		return dept_num;
	}

	public void setDept_num(int dept_num) {
		this.dept_num = dept_num;
	}

	public String getEmp_position() {
		return emp_position;
	}

	public void setEmp_position(String emp_position) {
		this.emp_position = emp_position;
	}

	public String getEmp_img() {
		return emp_img;
	}

	public void setEmp_img(String emp_img) {
		this.emp_img = emp_img;
	}

	public String getEmp_pw() {
		return emp_pw;
	}

	public void setEmp_pw(String emp_pw) {
		this.emp_pw = emp_pw;
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

	// toString
		@Override
		public String toString() {
			return "EmployeeVo [emp_id=" + emp_id + ", emp_pw=" + emp_pw + ", emp_name=" + emp_name + ", dept_num="
					+ dept_num + ", emp_position=" + emp_position + ", emp_img=" + emp_img + ", dept_name=" + dept_name
					+ ", dept_desc=" + dept_desc + "]";
		}
}
