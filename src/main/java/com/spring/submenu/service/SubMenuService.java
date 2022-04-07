package com.spring.submenu.service;

import java.util.HashMap;
import java.util.List;

import com.spring.submenu.vo.SubMenuVo;

public interface SubMenuService {

	public List<SubMenuVo> getSubMenuTotList();// DB안의 모든 서브메뉴를 가져옴

	public List<SubMenuVo> getSubMenu(String menu_id); //입력 받은 menu_id 안의 서브메뉴만 가져옴

	public void updateSMenu(HashMap<String, Object> map);

	public void deleteSMenu(String sub_id);
	
	public void insertSMenu(HashMap<String, Object> map);

}
