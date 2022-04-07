package com.spring.submenu.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.submenu.dao.SubMenuDao;
import com.spring.submenu.service.SubMenuService;
import com.spring.submenu.vo.SubMenuVo;

@Service("subMenuService")
public class SubMenuServiceImpl implements SubMenuService {
	
	@Autowired
	private SubMenuDao subMenuDao;

	@Override
	public List<SubMenuVo> getSubMenuTotList() {
		List<SubMenuVo> sublist = subMenuDao.getSubMenuTotList();
		return sublist;
	}
	@Override
	public List<SubMenuVo> getSubMenu(String menu_id) {
		List<SubMenuVo> sublist = subMenuDao.getSubMenu(menu_id);
		return sublist;
	}
	@Override
	public void updateSMenu(HashMap<String, Object> map) {
		subMenuDao.updateSMenu(map);
	}
	@Override
	public void deleteSMenu(String sub_id) {
		subMenuDao.deleteSMenu(sub_id);
	}
	
	@Override
	public void insertSMenu(HashMap<String, Object> map) {
		subMenuDao.insertSMenu(map);
	} 


}
