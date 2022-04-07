package com.spring.pds.controller;

import java.text.MessageFormat;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.login.vo.LoginVo;
import com.spring.menu.service.MenuService;
import com.spring.menu.vo.MenuVo;
import com.spring.pds.service.PdsService;
import com.spring.pds.vo.FilesVo;
import com.spring.pds.vo.PdsVo;
import com.spring.submenu.service.SubMenuService;
import com.spring.submenu.vo.SubMenuVo;

@Controller
public class PdsController {


	@Autowired
	private PdsService pdsService; 	
	
	@Autowired
	MenuService menuService;
	@Autowired
	SubMenuService subMenuService;
	
	// 자료실 목록 출력
	//@RequestMapping("/List")   
	@RequestMapping("/PDS/List") 
	public ModelAndView  pdsList(@RequestParam HashMap<String, Object> map) {

		ModelAndView mav = new ModelAndView();
		
		// 메뉴아이디 값 지정=====================================
		//---------------메뉴부분 :  늘 들고 댕겨 ----------------------------------------
		List<MenuVo> menuList = menuService.getMenuList(); //메인메뉴
		String menu_id = (String) map.get("menu_id"); //서브메뉴를 위한 메인메뉴id
		//서브메뉴 가져오기.
		List<SubMenuVo> submenuList = subMenuService.getSubMenuTotList();
		
		mav.addObject("sub_id",map.get("sub_id"));
		mav.addObject("menu_id",menu_id);	
		mav.addObject("submenuList",submenuList);
		mav.addObject("menuList",menuList);
    	//---------------------------------------------------------------------------------
		//========================================================
		
		String nowpage = "";
		String pagegrpnum = "";
		

		if((String) map.get("nowpage") == null)
			nowpage = "1";
		else
			nowpage = (String) map.get("nowpage");
		if((String) map.get("pagegrpnum") == null)
			pagegrpnum = "1";
		else
			pagegrpnum = (String) map.get("pagegrpnum");
		
		
		map.put("nowpage",nowpage);
		map.put("pagegrpnum",pagegrpnum);
		
		List<PdsVo> pdsList = pdsService.getPdsList(map);   // data 조회
		PdsVo pagePdsVo = (PdsVo) map.get("pagePdsVo"); 
		
		mav.addObject("nowpage",   nowpage);
		mav.addObject("pagegrpnum", pagegrpnum);
		
		mav.addObject("pdsList",   pdsList);
		mav.addObject("pagePdsVo", pagePdsVo);
		
		mav.setViewName("pds/list");
		
		return mav;		
	}
	
	// 새 글 작성페이지로 이동
	@RequestMapping("/PDS/WriteForm")	
	public ModelAndView pdsWriteForm(@RequestParam HashMap<String, Object> map, HttpSession session) {
		// 로그인 했음을 가정=====================================
		LoginVo login = (LoginVo) session.getAttribute("login");
		
		map.put("user_id", login.getId());
		//========================================================
				
		ModelAndView mav = new ModelAndView();
		mav.addObject("map", map);
		//{brd_bnum=0, brd_lvl=0, brd_step=0, brd_nref=0, nowpage=1, pagegrpnum=1, user_id=sky}
		System.out.println("글작성 페이지 이동전 map : " + map); 
		mav.setViewName("pds/write");
		return mav;		
	}
	
	// 새 글 작성처리
	@RequestMapping("/PDS/Write")
	public ModelAndView pdsWrite(@RequestParam HashMap<String, Object> map, HttpServletRequest request ) {
		// request를 통해서 file이 넘어온다
		// 넘어온 자료를 저장
		pdsService.setWrite(map, request);
		
		ModelAndView mv = new ModelAndView();	
	
		mv.addObject("sub_id", map.get("sub_id") );
		mv.addObject("nowpage", map.get("nowpage"));
		mv.addObject("pagegrpnum", map.get("pagegrpnum"));
		
		mv.setViewName("redirect:/PDS/List");
				
		return mv;		
	} 
	
	
	// 자료실 내용보기 페이지로 이동
	@RequestMapping("/PDS/Content")
	public ModelAndView viewContent(@RequestParam HashMap<String, Object> map) {
		ModelAndView mav = new ModelAndView();
// ---------------메뉴부분 : 늘 들고 댕겨 ----------------------------------------
		List<MenuVo> menuList = menuService.getMenuList();   // 메인메뉴
		String       menu_id  = (String) map.get("menu_id"); // 서브메뉴를 위한 메인메뉴id
		// 서브메뉴 가져오기.
		List<SubMenuVo> submenuList = subMenuService.getSubMenuTotList();

		mav.addObject("menu_id", menu_id);
		mav.addObject("submenuList", submenuList);
		mav.addObject("menuList", menuList);
		// ---------------------------------------------------------------------------------

		
		System.out.println("내용보기 들어오자마자 map: " + map );
		PdsVo pdsVo = pdsService.getContent(map);
		List<FilesVo> fileList = pdsService.getFileList(map);
		mav.addObject("pdsVo", pdsVo);		
		mav.addObject("map", map);
		mav.addObject("fileList", fileList);
		mav.setViewName("pds/content");
		return mav;
	}
	
	// 자료실 수정페이지로 이동
	@RequestMapping("/PDS/UpdateForm")
	public ModelAndView updateForm(@RequestParam HashMap<String, Object> map) {
		System.out.println("수정페이지 가기전 map : " + map);
		PdsVo pdsVo = pdsService.getContent(map);
		List<FilesVo> fileList = pdsService.getFileList(map);
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("pdsVo", pdsVo);		
		mav.addObject("map", map);
		mav.addObject("fileList", fileList);
		mav.setViewName("pds/update");
		return mav;
	}
	
	// 자료실 수정 처리
	@RequestMapping("/PDS/Update")
	public ModelAndView update(@RequestParam HashMap<String, Object> map) {
		System.out.println("게시글 수정처리전 map : " + map);
		pdsService.updateContent(map);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("sub_id", map.get("sub_id") );
		mav.addObject("nowpage", map.get("nowpage"));
		mav.addObject("pagegrpnum", map.get("pagegrpnum"));
		mav.setViewName("redirect:/PDS/List");
		return mav;
	}
	
	// 게시물 삭제 처리
	@RequestMapping("/PDS/Delete")
	public ModelAndView pdsDelete(@RequestParam HashMap<String, Object> map) {
		pdsService.setDelete( map );
		
		String fmt = "?sub_id={0}&nowpage={1}&pagegrpnum={2}";
		String param = MessageFormat.format(fmt, 
				map.get("sub_id"), map.get("nowpage"), map.get("pagegrpnum"));
		ModelAndView mav = new ModelAndView();		
		mav.setViewName("redirect:/PDS/List" + param);
		return mav;
		
	}
}
