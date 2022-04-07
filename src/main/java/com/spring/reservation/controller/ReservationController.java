package com.spring.reservation.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.emp.vo.EmpVo;
import com.spring.login.vo.LoginVo;
import com.spring.menu.service.MenuService;
import com.spring.menu.vo.MenuVo;
import com.spring.reservation.service.ReservationService;
import com.spring.reservation.vo.ReservationVo;
import com.spring.submenu.service.SubMenuService;
import com.spring.submenu.vo.SubMenuVo;

@Controller
public class ReservationController {
	@Autowired
	   private ReservationService reservationService;
	@Autowired
	SubMenuService subMenuService;
	
	@Autowired
	MenuService menuService;
	
	
	@RequestMapping("/Res/Reserv") 
	public ModelAndView getDoc(@RequestParam HashMap<String,Object> map) {
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
		
		List<EmpVo> empVo = reservationService.getDoc(map);
		ReservationVo rv = new ReservationVo();
		rv.setRes_date((String) map.get("res_date"));
		mv.addObject("empVo", empVo); 
		mv.setViewName("reservation/reservForm");
		return mv;
	}
	//예약 시간 페이지로 이동 
	@RequestMapping("/Reserv/TimeTable")
	public ModelAndView timeTable(@RequestParam HashMap<String,Object> map, String emp_name) {
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
		
		System.out.println("emp_name : " + emp_name);
		System.out.println("res_date : " + map.get("res_date"));
		
		mv.addObject("res_date",String.valueOf(map.get("res_date")));
		map.put("emp_name",emp_name);
		mv.addObject("emp_map",emp_name);
		EmpVo empVo = new EmpVo();
		empVo.setEmp_name(emp_name);
		mv.addObject("empVo", empVo);
		
		System.out.println("emp_name : " + map.get("emp_name"));
		
		
		ReservationVo trVo = new ReservationVo(-1);
		List<ReservationVo> resVo = new ArrayList<ReservationVo>();
		resVo = reservationService.timeTable(map);
		resVo.add(trVo); //마지막 값은 쓰레기 값임.
		
		int i = 0;
		for (ReservationVo reservationVo : resVo) {
			System.out.println(i + " : " +reservationVo);
			i++;
		}
		
		ReservationVo rv = new ReservationVo();
		rv.setRes_date((String) map.get("res_date"));
		
		
		mv.addObject("rv", rv);
		//EmpVo empVo = reservService.timeTable(emp_name);
		mv.addObject("resVo", resVo);
		
		/*int size = 0;
		if(resVo != null)
			size = resVo.size();*/
		
		mv.addObject("reslistsize", resVo.size());
		mv.setViewName("reservation/timeTable");
		return mv;
	}
	
	//업데이트 폼으로 넘어가기 
	@RequestMapping("/Reserv/UpdateForm")
	public ModelAndView update(@RequestParam HashMap<String, Object> map, HttpSession session) {
		
		ModelAndView mv = new ModelAndView();
		
		System.out.println("Upform"+map);
		
		//---------------메뉴부분 :  늘 들고 댕겨 ----------------------------------------
		
		List<MenuVo> menuList = menuService.getMenuList(); //메인메뉴
		String menu_id = (String) map.get("menu_id"); //서브메뉴를 위한 메인메뉴id
		//서브메뉴 가져오기.
		List<SubMenuVo> submenuList = subMenuService.getSubMenuTotList();
		
		mv.addObject("menu_id",menu_id);	
		mv.addObject("submenuList",submenuList);
		mv.addObject("menuList",menuList);
		//---------------------------------------------------------------------------------
		
		List<ReservationVo> resVo = reservationService.updateform(map);
		ReservationVo rv = new ReservationVo();
		rv.setRes_date((String)map.get("res_date"));
		rv.setRes_time((String)map.get("res_time"));
		mv.addObject("rv", rv);
		
		EmpVo empVo = new EmpVo();
		empVo.setEmp_name((String)map.get("emp_name"));
		
		mv.addObject("empVo", empVo);
		
		LoginVo login = (LoginVo) session.getAttribute("login");
		
		mv.addObject("login",login);
		
		mv.setViewName("reservation/updateForm");
		return mv;
	}
	
	//특정 예약 환자 데이터 조회 하기 
	@RequestMapping("/Reserv/Check")
	@ResponseBody
	public boolean updateCheck(@RequestParam HashMap <String, Object> map, HttpServletRequest request, HttpServletResponse response)
	throws IOException{
		boolean resCheck = reservationService.resCheck(map);
		return resCheck;
	}
	
	//예약 데이터 업데이트 하기 
	@RequestMapping("/Reserv/Update")	
	public ModelAndView updateRes(@RequestParam HashMap <String, Object> map, String res_date){
		System.out.println("mapmapmapamamp" + map);
		reservationService.update(map);
		ModelAndView mv = new ModelAndView();
		map.put("res_date", res_date);
		
//		String fmt = "redirect:/Reserv/TimeTable?"; emp_name, res_date들고 넘어가자 
//		String param = MessageFormat.format(fmt, map.get("emp_id"), map.get("res_date"), map.get("res_time"));
		
		
		map.put("emp_name",String.valueOf(map.get("emp_name")));
		EmpVo empVo = new EmpVo();
		empVo.setEmp_name(String.valueOf(map.get("emp_name")));
		mv.addObject("empVo", empVo);
		
		
		ReservationVo trVo = new ReservationVo(-1);
		List<ReservationVo> resVo = reservationService.timeTable(map);
		resVo.add(trVo); //마지막 값은 쓰레기 값임.
		
		ReservationVo rv = new ReservationVo();
		rv.setRes_date((String) map.get("res_date"));
		mv.addObject("rv", rv);
		//EmpVo empVo = reservService.timeTable(emp_name);
		mv.addObject("resVo", resVo);

		mv.addObject("reslistsize", resVo.size());
		mv.setViewName("redirect:/Mypage/List");
		return mv;
	}
}
