package com.spring.health.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.spring.login.vo.LoginVo;
import com.spring.menu.service.MenuService;
import com.spring.menu.vo.MenuVo;
import com.spring.submenu.service.SubMenuService;
import com.spring.submenu.vo.SubMenuVo;

@Controller
public class HealthCotroller {
	@Autowired
	MenuService menuService;
	@Autowired
	SubMenuService subMenuService;
	// 메인페이지
    @RequestMapping(value="/Health", method=RequestMethod.GET )
    public ModelAndView home(HashMap<String, Object> map, HttpSession session) {
	    
    	ModelAndView mv = new  ModelAndView();
    	
    	//---------------메뉴부분 :  늘 들고 댕겨 ----------------------------------------
		List<MenuVo> menuList = menuService.getMenuList(); //메인메뉴
		String menu_id = (String) map.get("menu_id"); //서브메뉴를 위한 메인메뉴id
		//서브메뉴 가져오기.
		List<SubMenuVo> submenuList = subMenuService.getSubMenuTotList();
		
		mv.addObject("menu_id",menu_id);	
		mv.addObject("submenuList",submenuList);
		mv.addObject("menuList",menuList);
    	//---------------------------------------------------------------------------------
    	

    	mv.setViewName("board/health");
    	
		return mv;
    }
    @RequestMapping(value="/Health/Tv", method=RequestMethod.GET )
    public ModelAndView Tv(HashMap<String, Object> map, HttpSession session) {
    	
    	ModelAndView mv = new  ModelAndView();
    	
    	//---------------메뉴부분 :  늘 들고 댕겨 ----------------------------------------
    	List<MenuVo> menuList = menuService.getMenuList(); //메인메뉴
    	String menu_id = (String) map.get("menu_id"); //서브메뉴를 위한 메인메뉴id
    	//서브메뉴 가져오기.
    	List<SubMenuVo> submenuList = subMenuService.getSubMenuTotList();
    	
    	mv.addObject("menu_id",menu_id);	
    	mv.addObject("submenuList",submenuList);
    	mv.addObject("menuList",menuList);
    	//---------------------------------------------------------------------------------
    	
    	
    	mv.setViewName("board/healthTV");
    	
    	return mv;
    }
}
