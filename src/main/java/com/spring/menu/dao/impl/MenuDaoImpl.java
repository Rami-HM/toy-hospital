package com.spring.menu.dao.impl;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.menu.dao.MenuDao;
import com.spring.menu.vo.MenuVo;

@Repository("menuDao")
public class MenuDaoImpl implements MenuDao {
	
	@Autowired
	SqlSession sqlSession;
	
	@Override
	public List<MenuVo> getMenuList() {

		HashMap<String, Object> map =  new HashMap<>();
		
		sqlSession.selectList("Menu.MenuList",map);
		List<MenuVo> menuList = (List<MenuVo>) map.get("result");
		return menuList;
	}

	@Override
	public void updateMMenu(HashMap<String, Object> map) {
		sqlSession.update("Menu.MenuUpdate", map);
	}

	@Override
	public void deleteMMenu(String menu_id) {
		sqlSession.delete("Menu.MenuDelete",menu_id);
	}

	@Override
	public void insertMMenu(HashMap<String, Object> map) {
		System.out.println("insertMMenu : "+map.get("in_menu_name"));
		System.out.println("insertMMenu : "+map.get("in_menu_seq"));
		sqlSession.insert("Menu.MenuInsert",map);
	}

}
