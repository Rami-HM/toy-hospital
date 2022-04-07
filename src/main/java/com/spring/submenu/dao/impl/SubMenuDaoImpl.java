package com.spring.submenu.dao.impl;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.submenu.dao.SubMenuDao;
import com.spring.submenu.vo.SubMenuVo;

@Repository("subMenuDao")
public class SubMenuDaoImpl implements SubMenuDao {
	
	@Autowired
	SqlSession sqlSession;

	@Override
	public List<SubMenuVo> getSubMenuTotList() {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		sqlSession.selectList("SubMenu.SubMenuTotList",map);
		
		List<SubMenuVo> sublist = (List<SubMenuVo>) map.get("result");
		return sublist;
	}

	@Override
	public List<SubMenuVo> getSubMenu(String menu_id) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("menu_id",menu_id);
		sqlSession.selectList("SubMenu.MenuList",map);
		
		List<SubMenuVo> sublist = (List<SubMenuVo>) map.get("result");
		return sublist;
	}

	@Override
	public void updateSMenu(HashMap<String, Object> map) {
		sqlSession.update("SubMenu.MenuUpdate",map);
	}

	@Override
	public void deleteSMenu(String sub_id) {
		sqlSession.delete("SubMenu.MenuDelete",sub_id);
	}

	@Override
	public void insertSMenu(HashMap<String, Object> map) {
		
		
		System.out.println("i"+map.get("in_sub_name"));
		System.out.println("n"+map.get("in_sub_seq"));
		
		System.out.println("s"+map.get("menu_id"));
		System.out.println("e"+map.get("in_menu_id"));
			
		sqlSession.insert("SubMenu.MenuInsert",map);
	}

}
