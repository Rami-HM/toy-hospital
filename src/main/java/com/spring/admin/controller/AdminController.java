package com.spring.admin.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;

import com.spring.emp.service.EmpService;
import com.spring.emp.vo.EmpVo;
import com.spring.menu.service.MenuService;
import com.spring.menu.vo.MenuVo;
import com.spring.patient.service.PatientService;
import com.spring.patient.vo.PatientVo;
import com.spring.submenu.service.SubMenuService;
import com.spring.submenu.vo.SubMenuVo;

@Controller
public class AdminController {
	@Autowired
	private MappingJackson2JsonView jsonView;
	
	@Autowired
	SubMenuService subMenuService;
	
	@Autowired
	MenuService menuService;
	
	@Autowired
	PatientService patientService;
	
	@Autowired
	EmpService	empService;
	
	
	@RequestMapping("/Admin/Board")
	public ModelAndView adminBoard(@RequestParam HashMap<String, Object> map)
	{
		ModelAndView mv = new ModelAndView();
		
//		List<MenuVo> menuList = (List<MenuVo>) map.get("menuList"); // 왜 안되는지 모를..
		List<MenuVo> menuList = menuService.getMenuList(); //메인메뉴
		
		
		String menu_id = (String) map.get("menu_id"); //서브메뉴를 위한 메인메뉴id
		//서브메뉴 가져오기.
		List<SubMenuVo> submenuList = subMenuService.getSubMenuTotList();
		
		List<SubMenuVo> subList = subMenuService.getSubMenu("MENU03");

		mv.addObject("subList",subList);
		mv.addObject("submenuList",submenuList);
		mv.addObject("menuList",menuList);
		mv.setViewName("admin/board");
		return mv;
	}
	
	@RequestMapping("/Admin/Member")
	public ModelAndView adminMember(@RequestParam HashMap<String, Object> map)
	{
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
		
		//환자 목록
		List<PatientVo> patientList = patientService.getList();
		//의료진 목록
		List<EmpVo> empList = empService.getList();
		
		System.out.println(patientList.size());
		
		mv.addObject("patientList",patientList);
		mv.addObject("empList",empList);
		
		
		mv.setViewName("admin/member");
		return mv;
	}

	@RequestMapping("/Admin/Member/Delete")
	public ModelAndView adminMemberDelete(@RequestParam HashMap<String, Object> map)
	{
		ModelAndView mv = new ModelAndView();
		
		List<MenuVo> menuList = menuService.getMenuList(); //메인메뉴
		String menu_id = (String) map.get("menu_id"); //서브메뉴를 위한 메인메뉴id
		//서브메뉴 가져오기.
		List<SubMenuVo> submenuList = subMenuService.getSubMenuTotList();
		
		mv.addObject("menu_id",menu_id);	
		mv.addObject("submenuList",submenuList);
		mv.addObject("menuList",menuList);
	//---------------------------------------------------------------------------------
		
		//환자 삭제
		String[] patDelList = ((String) map.get("pat_ids")).split(",");
		for(int i = 0 ; i < patDelList.length ; i++)
			patientService.deletePat(patDelList[i]);
		
		//의료진 삭제
		String[] empDelList = ((String) map.get("emp_ids")).split(",");
		for(int i = 0 ; i < empDelList.length ; i++)
			empService.deleteEmp(empDelList[i]);
		
		
		//환자 목록
		List<PatientVo> patientList = patientService.getList();
		//의료진 목록
		List<EmpVo> empList = empService.getList();
		
		
		mv.addObject("patientList",patientList);
		mv.addObject("empList",empList);
		mv.setViewName("redirect:/Admin/Member");
		return mv;
	}
	
	@RequestMapping("/Admin/Menu")
	public ModelAndView adminMenu(@RequestParam HashMap<String, Object> map,HttpServletRequest request)
	{
		ModelAndView mv = new ModelAndView();
		
		//---------------메뉴부분 :  늘 들고 댕겨 ----------------------------------------
		List<MenuVo> menuList = menuService.getMenuList(); //메인메뉴
		//서브메뉴 가져오기.
		List<SubMenuVo> submenuList = subMenuService.getSubMenuTotList();
		
		String menu_id = (String) map.get("menu_id");
		mv.addObject("menu_id",menu_id);	
		mv.addObject("submenuList",submenuList);
		mv.addObject("menuList",menuList);
		//---------------------------------------------------------------------------------
		
		String selmenu_name = request.getParameter("selectedMenu"); //서브메뉴를 위한 메인메뉴id
		String selmenu_id = request.getParameter("menu_id"); //서브메뉴를 위한 메인메뉴id
		//메뉴별 서브메뉴 보여주기
		if(selmenu_id == null)
			selmenu_id = menuList.get(0).getMenu_id();
		if(selmenu_name == null)
			selmenu_name = menuList.get(0).getMenu_name();
		
		List<SubMenuVo> subList = subMenuService.getSubMenu(selmenu_id);
		
		mv.addObject("subList",subList);
		mv.addObject("selmenu_name",selmenu_name);
		
		mv.addObject("menu_id",selmenu_id);	
		
		System.out.println(selmenu_id);
		mv.setViewName("admin/menu");
		return mv;
	}
	
	@RequestMapping("/getmenudetail")
	public ModelAndView getmenudetail(HttpServletRequest request)
	{
		ModelAndView mv = new ModelAndView();
		
		//---------------메뉴부분 :  늘 들고 댕겨 ----------------------------------------
		List<MenuVo> menuList = menuService.getMenuList(); //메인메뉴
		//서브메뉴 가져오기.
		List<SubMenuVo> submenuList = subMenuService.getSubMenuTotList();
		
		mv.addObject("submenuList",submenuList);
		mv.addObject("menuList",menuList);
		//---------------------------------------------------------------------------------
		
		String selmenu_id = request.getParameter("menu_id"); //서브메뉴를 위한 메인메뉴id
		String selmenu_name = menuList.get(0).getMenu_name();
		
		for (MenuVo menu : menuList) {
			if(menu.getMenu_id().equals(selmenu_id)) 
			{
				selmenu_name = menu.getMenu_name();
				break;
			}
		}
		
		//메뉴별 서브메뉴 보여주기
		if(selmenu_id == null)
				selmenu_id = "MENU01";
		
		List<SubMenuVo> subList = subMenuService.getSubMenu(selmenu_id);
		
		mv.addObject("menu_id",selmenu_id);
		mv.addObject("menu_name",selmenu_name);
		mv.addObject("subList",subList);
		mv.setView(jsonView);
		
		return mv;
	}
	
	@RequestMapping("/UpdateMenu")
	public ModelAndView updateMenuSEQ(@RequestParam HashMap<String, Object> map)
	{
		ModelAndView mv = new ModelAndView();

		String menu_name = (String)map.get("menu_name_seq");
		
		String menu_id_seq = (String)map.get("menu_id_seq");

		String[] menu_ids = menu_id_seq.split(",");
		String[] menu_names = (menu_name).split(",");
		
		
		//--- 순서 및 메뉴이름 Update부분
		for(int i = 0 ; i < menu_ids.length ; i++)
		{
			map.put("in_new_seq",i+1);
			map.put("in_menu_id",menu_ids[i]);
			map.put("in_menu_name",menu_names[i]);
			
			menuService.updateMMenu(map);
		}
		
		//-- 메뉴 delete부분
		List<MenuVo> ori_menuList = menuService.getMenuList(); //이전 메뉴를 가져옴
		for (MenuVo menuVo : ori_menuList) {
			System.out.println("delete : " + menu_id_seq + ":" + menuVo.getMenu_id());
			System.out.println(menu_id_seq.indexOf(menuVo.getMenu_id()));
			if(menu_id_seq.indexOf(menuVo.getMenu_id()) == -1)
				menuService.deleteMMenu(menuVo.getMenu_id());
		}
		
		//-- value 가 insert인 메뉴 추가부분
		
		//val 의 값이 insert면, 그 인덱스를 들구와서 DB INSERT로.
		
		for(int i = 0 ; i < menu_ids.length ; i++)
		{
			System.out.println("insert : " + menu_ids[i]);
			if(menu_ids[i].equals("insert"))
			{
				map.put("in_menu_name",menu_names[i]);
				map.put("in_menu_seq",i+1);
				menuService.insertMMenu(map);
			}
		}
				
		
		//---------------메뉴부분 :  늘 들고 댕겨 ----------------------------------------
		List<MenuVo> menuList = menuService.getMenuList(); //메인메뉴
		//서브메뉴 가져오기.
		List<SubMenuVo> submenuList = subMenuService.getSubMenuTotList();
		
		mv.addObject("submenuList",submenuList);
		mv.addObject("menuList",menuList);
		//---------------------------------------------------------------------------------
		
		String selmenu_name = (String) map.get("selectedMenu"); //서브메뉴를 위한 메인메뉴id
		String selmenu_id = (String) map.get("menu_id"); //서브메뉴를 위한 메인메뉴id
		//메뉴별 서브메뉴 보여주기
		if(selmenu_id == null)
			selmenu_id = "MENU01";
			
		List<SubMenuVo> subList = subMenuService.getSubMenu(selmenu_id);
				
		mv.addObject("subList",subList);
		
		
		mv.setViewName("redirect:/Admin/Menu");
		return mv;
	}
	
	
	@RequestMapping("/UpdateSubMenu")
	public ModelAndView updateSubMenu(@RequestParam HashMap<String, Object> map)
	{
		ModelAndView mv = new ModelAndView();

		String sub_name = (String)map.get("sub_name_seq");
		String sub_id_seq = (String)map.get("sub_id_seq");

		String selMainMenu = (String)map.get("main_menu_id");
		
		map.put("menu_id", selMainMenu);
		
		
		String[] sub_ids = sub_id_seq.split(",");
		String[] sub_names = (sub_name).split(",");
		
		
		//--- 순서 및 서브메뉴이름 Update부분
		for(int i = 0 ; i < sub_ids.length ; i++)
		{
			map.put("in_sub_seq",i+1);
			map.put("in_sub_id",sub_ids[i]);
			map.put("in_sub_name",sub_names[i]);
			
			subMenuService.updateSMenu(map);
		}
		
		
		//-- 서브 메뉴 delete부분
		List<SubMenuVo> ori_subList = subMenuService.getSubMenu(selMainMenu); //이전 메뉴를 가져옴
		for (SubMenuVo subMenuVo : ori_subList) {
			if(sub_id_seq.indexOf(subMenuVo.getSub_id()) == -1)
				subMenuService.deleteSMenu(subMenuVo.getSub_id());
		}
		
		
		//-- value 가 insert인 메뉴 추가부분
		//val 의 값이 insert면, 그 인덱스를 들구와서 DB INSERT로.
		
		for(int i = 0 ; i < sub_ids.length ; i++)
		{
			System.out.println("insert : " + sub_ids[i]);
			if(sub_ids[i].equals("insert"))
			{
				map.put("in_menu_id",selMainMenu);
				map.put("in_sub_name",sub_names[i]);
				map.put("in_sub_seq",i+1);
				subMenuService.insertSMenu(map);
			}
		}
		
		//---------------메뉴부분 :  늘 들고 댕겨 ----------------------------------------
		List<MenuVo> menuList = menuService.getMenuList(); //메인메뉴
		//서브메뉴 가져오기.
		List<SubMenuVo> submenuList = subMenuService.getSubMenuTotList();
		
		mv.addObject("submenuList",submenuList);
		mv.addObject("menuList",menuList);
		//---------------------------------------------------------------------------------
		
		String selmenu_name = (String) map.get("selectedMenu"); //서브메뉴를 위한 메인메뉴id
		String selmenu_id = (String) map.get("menu_id"); //서브메뉴를 위한 메인메뉴id
		//메뉴별 서브메뉴 보여주기
		if(selmenu_id == null)
			selmenu_id = "MENU01";
			
		List<SubMenuVo> subList = subMenuService.getSubMenu(selmenu_id);
				
		mv.addObject("subList",subList);
		
		
		mv.setViewName("redirect:/Admin/Menu");
		return mv;
	}
	
}
