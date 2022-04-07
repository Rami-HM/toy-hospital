package com.spring.submenu.vo;

public class SubMenuVo {

	private String menu_id;
	private String sub_id;
	private String sub_name;
	private int sub_seq;
	
	
	
	public SubMenuVo() {
		super();
	}

	public SubMenuVo(String menu_id, String sub_id, String sub_name, int sub_seq) {
		super();
		this.menu_id = menu_id;
		this.sub_id = sub_id;
		this.sub_name = sub_name;
		this.sub_seq = sub_seq;
	}

	public String getMenu_id() {
		return menu_id;
	}

	public void setMenu_id(String menu_id) {
		this.menu_id = menu_id;
	}

	public String getSub_id() {
		return sub_id;
	}

	public void setSub_id(String sub_id) {
		this.sub_id = sub_id;
	}

	public String getSub_name() {
		return sub_name;
	}

	public void setSub_name(String sub_name) {
		this.sub_name = sub_name;
	}

	public int getSub_seq() {
		return sub_seq;
	}

	public void setSub_seq(int sub_seq) {
		this.sub_seq = sub_seq;
	}
	
	
	
}
