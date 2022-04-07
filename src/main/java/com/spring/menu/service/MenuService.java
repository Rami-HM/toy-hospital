package com.spring.menu.service;

import java.util.HashMap;
import java.util.List;

import com.spring.menu.vo.MenuVo;


public interface MenuService {

	public List<MenuVo> getMenuList();

	public void updateMMenu(HashMap<String, Object> map);

	public void deleteMMenu(String menu_id);

	public void insertMMenu(HashMap<String, Object> map);

}
