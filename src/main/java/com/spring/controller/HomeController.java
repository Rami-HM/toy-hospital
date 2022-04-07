package com.spring.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.eclipse.jdt.internal.compiler.batch.Main;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.emp.service.EmpService;
import com.spring.login.vo.LoginVo;
import com.spring.menu.service.MenuService;
import com.spring.menu.vo.MenuVo;
import com.spring.patient.service.PatientService;
import com.spring.patient.vo.PatientVo;
import com.spring.submenu.service.SubMenuService;
import com.spring.submenu.vo.SubMenuVo;

@Controller
public class HomeController {

	@Autowired
	private PatientService patientService;
	@Autowired
	private MenuService    menuService;
	@Autowired
	private SubMenuService subMenuService;
	@Autowired
	private EmpService     empService;

	protected static Logger logger = Logger.getLogger(Main.class.getName());

	// 만약 메뉴를 추가 하고 그 메뉴를 들어가면, 빈화면이 뜸.
	@RequestMapping("/None")
	public ModelAndView chat(HashMap<String, Object> map, HttpSession loginSession) {
		ModelAndView mv = new ModelAndView();
		// ---------------메뉴부분 : 늘 들고 댕겨 ----------------------------------------
		List<MenuVo> menuList = menuService.getMenuList();   // 메인메뉴
		String       menu_id  = (String) map.get("menu_id"); // 서브메뉴를 위한 메인메뉴id
		// 서브메뉴 가져오기.
		List<SubMenuVo> submenuList = subMenuService.getSubMenuTotList();

		mv.addObject("menu_id", menu_id);
		mv.addObject("submenuList", submenuList);
		mv.addObject("menuList", menuList);
		// ---------------------------------------------------------------------------------

		mv.setViewName("none");

		return mv;
	}

	// 채팅창
	@RequestMapping("/echo")
	public String chat(HttpSession loginSession) {

		return "echo";
	}

	// 메인페이지
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView home(HashMap<String, Object> map, HttpSession session) {

		ModelAndView mv = new ModelAndView();

		// ---------------메뉴부분 : 늘 들고 댕겨 ----------------------------------------
		List<MenuVo> menuList = menuService.getMenuList();   // 메인메뉴
		String       menu_id  = (String) map.get("menu_id"); // 서브메뉴를 위한 메인메뉴id
		// 서브메뉴 가져오기.
		List<SubMenuVo> submenuList = subMenuService.getSubMenuTotList();

		mv.addObject("menu_id", menu_id);
		mv.addObject("submenuList", submenuList);
		mv.addObject("menuList", menuList);
		// ---------------------------------------------------------------------------------

		LoginVo login = (LoginVo) session.getAttribute("login");

		System.out.println(login);

		if (login != null) {
			if (login.getGrade() == 0)
				mv.addObject("grade", true);
		}

		mv.setViewName("home");

		return mv;
	}

	// 로그인 페이지로 이동
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginForm() {
		return "login/loginForm";
	}

	// 회원 로그인 처리
	@RequestMapping(value = "/login/Process", method = RequestMethod.POST)
	public ModelAndView loginProcess(HttpSession session, @RequestParam HashMap<String, Object> map) {
		ModelAndView mav       = new ModelAndView();
		String       returnURL = "";

		// 기존에 login한 session값이 존재하면 기존로그인 정보 제거
		if (session.getAttribute("login") != null) {
			session.removeAttribute("login");
		}

		// 로그인 성공하면 UserVo값 리턴
		boolean loginCheck = patientService.login(map);
		int     loginNum   = 1;
		int     grade      = 2;

		LoginVo login = new LoginVo((String) map.get("id"), (String) map.get("pwd"), loginNum, grade);

		if (loginCheck) {
			session.setAttribute("login", login);
			returnURL = "redirect:/";
			mav.setViewName(returnURL);
		} else {
			String msg = "해당하는 계정이 없습니다.";
			mav.addObject("msg", msg);
			returnURL = "login/alert";
			mav.setViewName(returnURL);
		}
		return mav;
	}

	// 의료진 로그인 처리
	@RequestMapping(value = "/login/EmpProcess", method = RequestMethod.POST)
	public ModelAndView empLoginProcess(HttpSession session, @RequestParam HashMap<String, Object> map) {
		ModelAndView mav = new ModelAndView();

		String returnURL = "";

		if (session.getAttribute("login") != null) {
			// 기존에 login한 session값이 존재하면 기존값 제거
			session.removeAttribute("login");
		}

		// 로그인 성공: true, 로그인 실패: false
		boolean loginCheck = empService.empLogin(map);
		int     loginNum   = 1;
		int     grade      = 1;

		LoginVo login = new LoginVo((String) map.get("id"), (String) map.get("pwd"), loginNum, grade);

		if (loginCheck) {
			session.setAttribute("login", login);
			returnURL = "redirect:/";
			mav.setViewName(returnURL);
		} else {
			String msg = "해당하는 계정이 없습니다.";
			mav.addObject("msg", msg);
			returnURL = "login/alert";
			mav.setViewName(returnURL);
		}

		return mav;
	}

	// 관리자 로그인 처리
	@RequestMapping(value = "/login/AdminProcess", method = RequestMethod.POST)
	public ModelAndView adminLoginProcess(HttpSession session, @RequestParam HashMap<String, Object> map) {
		ModelAndView mav = new ModelAndView();

		String returnURL = "";

		if (session.getAttribute("login") != null) {
			// 기존에 login한 session값이 존재하면 기존값 제거
			session.removeAttribute("login");
		}

		// 로그인 성공: true, 로그인 실패: false
		boolean loginCheck = empService.adminLogin(map);
		int     loginNum   = 1;
		int     grade      = 0;

		LoginVo login = new LoginVo((String) map.get("id"), (String) map.get("pwd"), loginNum, grade);

		if (loginCheck) {
			session.setAttribute("login", login);
			returnURL = "redirect:/";
			mav.setViewName(returnURL);
		} else {
			String msg = "해당하는 계정이 없습니다.";
			mav.addObject("msg", msg);
			returnURL = "login/alert";
			mav.setViewName(returnURL);
		}

		return mav;
	}

	// 아이디/패스워드 찾기 페이지 이동
	@RequestMapping("/login/find/personalData")
	public ModelAndView findPersonalData() {
		ModelAndView mav = new ModelAndView();

		mav.setViewName("login/find/personalData");
		return mav;
	}
	/*
	 * @RequestMapping("/Emp/join") public ModelAndView join() { ModelAndView mv=new ModelAndView();
	 * mv.setViewName("login/find/join"); return mv; }
	 */

	// 아이디 찾기 결과페이지이동
	@RequestMapping("/login/find/findid")
	public ModelAndView findId(@RequestParam HashMap<String, Object> map) {
		ModelAndView mv  = new ModelAndView();
		String       url = "";

		boolean findIdCheck = patientService.findId(map); // 아이디 이미 존재: true, 아이디 없음: false
		if (findIdCheck) {
			List<PatientVo> pList = (List<PatientVo>) map.get("result");
			PatientVo       pVo   = pList.get(0);
			mv.addObject("pat_id", pVo.getPat_id());
			url = "login/find/findidResult";
			mv.setViewName(url);
			return mv;
		} else {
			String msg = "조회된 계정이 없습니다.";
			mv.addObject("msg", msg);
			url = "login/find/alert";
			mv.setViewName(url);
		}
		return mv;
	}

	// 패스워드 찾기 결과과 있다면 패스워드 변경페이지로 이동
	@RequestMapping("/login/find/findpw")
	public ModelAndView findPw(@RequestParam HashMap<String, Object> map) {
		ModelAndView mv  = new ModelAndView();
		String       url = "";

		boolean findIdCheck = patientService.findpwd(map);
		System.out.println(map);
		System.out.println(findIdCheck);
		if (findIdCheck) {
			// 계정 조회 후 결과가 있다면
			List<PatientVo> pList = (List<PatientVo>) map.get("result");
			PatientVo       pVo   = pList.get(0);
			mv.addObject("pat_id", pVo.getPat_id());
			url = "login/find/changePwdForm";
			mv.setViewName(url);
			return mv;
		} else {
			// 계정 조회 후 결과가 없다면
			String msg = "조회된 계정이 없습니다.";
			mv.addObject("msg", msg);
			url = "login/find/alert";
			mv.setViewName(url);
		}
		return mv;
	}

	// 패스워드 변경페이지
	@RequestMapping("/login/find/findpw/changepw")
	@ResponseBody
	public boolean changePwd(@RequestParam HashMap<String, Object> map, HttpServletRequest request,
		HttpServletResponse response) throws IOException {
		boolean changeCheck = patientService.changePwd(map);
		return changeCheck;
	}

	// 로그아웃
	@RequestMapping("/logout")
	public ModelAndView test(HttpSession session, @RequestParam HashMap<String, Object> map) {
		ModelAndView mav = new ModelAndView();
		session.invalidate();

		mav = new ModelAndView("redirect:/");
		return mav;
	}

	   // 메뉴 이동
	 	@RequestMapping(value="/Content/{main}/{sub}", method=RequestMethod.GET )
	    public ModelAndView content(@RequestParam HashMap<String, Object> map
	    		,@PathVariable String main
	    		,@PathVariable String sub,
	    		HttpSession session,
	    		HttpServletResponse response) {
			 
			 ModelAndView mv = new ModelAndView();
			
			 System.out.println(map.get("menu_id"));
			 System.out.println(map.get("sub"));
			 
			 if(sub.equals("1"))
				 sub = getFirstSubMenu(main);

			 LoginVo login = (LoginVo) session.getAttribute("login");
			 int grade = -1;
			 if(login != null)
				 grade = login.getGrade();

			 switch(main)
			 {
				case "MENU01" :
					System.out.println("병원소개");
					if(sub.equals("SUBMENU03"))
					 mv.setViewName("redirect:/Emp/introStaff");
					else if(sub.equals("SUBMENU01"))
						mv.setViewName("redirect:/Emp/finalSearch");
					else if(sub.equals("SUBMENU02"))
						mv.setViewName("redirect:/Emp/Hoslocation");
					break;
				case "MENU02" :
					System.out.println("진료예약");
					mv.setViewName("redirect:/Res/Reserv");
					break;
				case "MENU03" :
					System.out.println("게시판");	
						mv.addObject("sub_id",sub);
						mv.setViewName("redirect:/PDS/List");
					break;
				case "MENU04":
					System.out.println("고객센터");	
					if(sub.equals("SUBMENU12"))
						mv.setViewName("redirect:/Center/home");
					else if(sub.equals("SUBMENU11"))
					{
						if(login != null && grade == 2)
							mv.setViewName("redirect:/Mypage");
						if(login != null && grade != 2)
							mv.setViewName("redirect:/");
						if(login == null )
							mv.setViewName("redirect:/login");
					}	
					break;
			 	case "MENU05":
			 		System.out.println("관리자설정");	
			 		if(sub.equals("SUBMENU08"))
			 			mv.setViewName("redirect:/Admin/Board");
			 		else if(sub.equals("SUBMENU06"))
			 			mv.setViewName("redirect:/Admin/Member");
			 		else if(sub.equals("SUBMENU07"))
			 			mv.setViewName("redirect:/Admin/Menu");
			 		break;
			 	case "MENU06":
			 		System.out.println("의료진설정");	
			 		mv.setViewName("redirect:/emp/home");
			 		break;
			 	case "MENU07":
			 		System.out.println("건강정보");	
			 		if(sub.equals("SUBMENU09"))
			 			mv.setViewName("redirect:/Health");
			 		else if(sub.equals("SUBMENU10"))
			 			mv.setViewName("redirect:/Health/Tv");
			 		break;
			 	default :
			 		mv.setViewName("redirect:/None");
			 		break;
			 }
			 return mv;
		 }

	private String getFirstSubMenu(String menu_id) {
		String          subname = "";
		List<SubMenuVo> sublist = subMenuService.getSubMenu(menu_id);
		if (sublist.size() == 0)
			return "1";
		subname = sublist.get(0).getSub_id();
		return subname;
	}
}