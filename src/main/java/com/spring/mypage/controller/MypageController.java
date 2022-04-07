package com.spring.mypage.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.login.vo.LoginVo;
import com.spring.menu.service.MenuService;
import com.spring.menu.vo.MenuVo;
import com.spring.mypage.service.MypageService;
import com.spring.patient.service.PatientService;
import com.spring.patient.vo.PatientVo;
import com.spring.reservation.vo.ReservationVo;
import com.spring.submenu.service.SubMenuService;
import com.spring.submenu.vo.SubMenuVo;

@Controller
public class MypageController {
	@Autowired
	MypageService mypageService; 
	@Autowired
	PatientService patientService;
	
	@Autowired
	MenuService menuService;
	@Autowired
	SubMenuService subMenuService;
	
	@RequestMapping("/Mypage")
	public String myHome() {
		return "redirect:/Mypage/List";
	}
	
	@RequestMapping("/Mypage/List")
	public ModelAndView mypageList(@RequestParam HashMap<String, Object> map, HttpSession session) {
		System.out.println("mypageList" + map);
		ModelAndView mv = new ModelAndView();
		//---------------메뉴부분 :  늘 들고 댕겨 ----------------------------------------
		List<MenuVo> menuList = menuService.getMenuList(); //메인메뉴
		String menu_id = (String) map.get("menu_id"); //서브메뉴를 위한 메인메뉴id
		//서브메뉴 가져오기.
		List<SubMenuVo> submenuList = subMenuService.getSubMenuTotList();
		
		mv.addObject("menu_id",menu_id);	
		mv.addObject("submenuList",submenuList);
		mv.addObject("menuList",menuList);
		//---------------------------------------------------------------------------------
		
		
		LoginVo login = (LoginVo) session.getAttribute("login");
		
		map.put("pat_id",login.getId());
		
		map.put("id",login.getId());
		
		List<ReservationVo> resVo = mypageService.getResList(map);
		ReservationVo rv = new ReservationVo();
		rv.setPat_id(login.getId());
		System.out.println("mypageList2" + map);

		PatientVo pvo = patientService.inquiry(map);
		
		
		mv.addObject("patVo", pvo);
		mv.addObject("resVo", resVo);
		mv.addObject("rv", rv);
		mv.setViewName("mypage/home");
		return mv;
	}
	@RequestMapping("/Mypage/Past")
	public ModelAndView mypagePast(@RequestParam HashMap<String, Object> map,HttpSession session) {
		ModelAndView mv = new ModelAndView();
		//---------------메뉴부분 :  늘 들고 댕겨 ----------------------------------------
		List<MenuVo> menuList = menuService.getMenuList(); //메인메뉴
		String menu_id = (String) map.get("menu_id"); //서브메뉴를 위한 메인메뉴id
		//서브메뉴 가져오기.
		List<SubMenuVo> submenuList = subMenuService.getSubMenuTotList();
		
		mv.addObject("menu_id",menu_id);	
		mv.addObject("submenuList",submenuList);
		mv.addObject("menuList",menuList);
    	//---------------------------------------------------------------------------------
		LoginVo login = (LoginVo) session.getAttribute("login");
		
		List<ReservationVo> resVo = mypageService.getResList(map);
		ReservationVo rv = new ReservationVo();
		rv.setPat_id(login.getId());
		
		map.put("id", login.getId());
		map.put("pat_id", login.getId());
		
		PatientVo pvo = patientService.inquiry(map);
		
		mv.addObject("resVo", resVo);
		mv.addObject("rv", pvo);
		mv.setViewName("mypage/past");
		return mv;
	}
	@RequestMapping("/Mypage/Delete")
	public ModelAndView mypageDelete(@RequestParam HashMap<String, Object> map, String pat_id, String res_time, String res_date, String emp_name, String dept_name) {
		ModelAndView mv  = new ModelAndView();
		//---------------메뉴부분 :  늘 들고 댕겨 ----------------------------------------
		List<MenuVo> menuList = menuService.getMenuList(); //메인메뉴
		String menu_id = (String) map.get("menu_id"); //서브메뉴를 위한 메인메뉴id
		//서브메뉴 가져오기.
		List<SubMenuVo> submenuList = subMenuService.getSubMenuTotList();
		
		mv.addObject("menu_id",menu_id);	
		mv.addObject("submenuList",submenuList);
		mv.addObject("menuList",menuList);
    	//---------------------------------------------------------------------------------
		List<ReservationVo> resVo = mypageService.mypageDelete(map);
		System.out.println("deleete");
		ReservationVo rv = new ReservationVo();
		rv.setPat_id(pat_id);
		rv.setRes_date(res_date);
		rv.setEmp_name(emp_name);
		rv.setRes_time(res_time);
		rv.setDept_name(dept_name);
		mv.addObject("rv", rv);
		mv.addObject("resVo", resVo);
		mv.setViewName("mypage/resDelete");
		return mv;
	}
	
	@RequestMapping("/Mypage/UpdateForm")
	public ModelAndView mypageUpdateForm(@RequestParam HashMap<String, Object> map,HttpSession session) {
		ModelAndView mv = new ModelAndView();
		LoginVo login = (LoginVo) session.getAttribute("login");
		
		//---------------메뉴부분 :  늘 들고 댕겨 ----------------------------------------
		List<MenuVo> menuList = menuService.getMenuList(); //메인메뉴
		String menu_id = (String) map.get("menu_id"); //서브메뉴를 위한 메인메뉴id
		//서브메뉴 가져오기.
		List<SubMenuVo> submenuList = subMenuService.getSubMenuTotList();
		
		mv.addObject("menu_id",menu_id);	
		mv.addObject("submenuList",submenuList);
		mv.addObject("menuList",menuList);
    	//---------------------------------------------------------------------------------
		
		map.put("id",login.getId());
		map.put("pat_id",login.getId());
		
		PatientVo pv = patientService.inquiry(map);
		List<ReservationVo> resVo = mypageService.getMemList(map);
		ReservationVo rv = resVo.get(0);
		System.out.println("resVo" + rv);
		
		
		mv.addObject("pv", pv);
		mv.addObject("rv", rv);
		mv.addObject("resVo", resVo);
		mv.setViewName("mypage/update");
		return mv;
	}
	@RequestMapping("/Mypage/Update")
	public ModelAndView mypageUpdate(@RequestParam HashMap<String, Object> map, String pat_id) {
		ModelAndView mv = new ModelAndView();
		List<PatientVo> pVo = mypageService.mypageUpdate(map);
		
		//---------------메뉴부분 :  늘 들고 댕겨 ----------------------------------------
		List<MenuVo> menuList = menuService.getMenuList(); //메인메뉴
		String menu_id = (String) map.get("menu_id"); //서브메뉴를 위한 메인메뉴id
		//서브메뉴 가져오기.
		List<SubMenuVo> submenuList = subMenuService.getSubMenuTotList();
		
		mv.addObject("menu_id",menu_id);	
		mv.addObject("submenuList",submenuList);
		mv.addObject("menuList",menuList);
    	//---------------------------------------------------------------------------------
		
		PatientVo pv = new PatientVo();
		pv.setPat_id(pat_id);
		mv.addObject("pv", pv);
		
		mv.setViewName("redirect:/Mypage");
		return mv;
	}
}
