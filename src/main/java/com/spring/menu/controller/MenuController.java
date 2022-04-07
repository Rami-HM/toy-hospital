package com.spring.menu.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.spring.menu.service.MenuService;
import com.spring.menu.vo.MenuVo;

@Controller
public class MenuController {

	@Autowired
	MenuService menuService;
	
	@RequestMapping("/Menu/List")
	public ModelAndView menulist(HashMap<String, Object> map)
	{
		ModelAndView mv = new  ModelAndView();
    	List<MenuVo> menuList = menuService.getMenuList();
    	
    	mv.addObject("menuList",menuList);
    	mv.setViewName("home");
		return mv;
	}
}
