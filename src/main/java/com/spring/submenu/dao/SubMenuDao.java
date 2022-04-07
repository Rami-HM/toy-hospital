package com.spring.submenu.dao;

import java.util.HashMap;
import java.util.List;

import com.spring.submenu.vo.SubMenuVo;

public interface SubMenuDao {

	public List<SubMenuVo> getSubMenuTotList();

	public List<SubMenuVo> getSubMenu(String menu_id);

	public void updateSMenu(HashMap<String, Object> map);

	public void deleteSMenu(String sub_id);

	public void insertSMenu(HashMap<String, Object> map);

}
