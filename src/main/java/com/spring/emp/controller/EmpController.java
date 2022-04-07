package com.spring.emp.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.logging.Logger;

import javax.servlet.http.HttpSession;

import org.eclipse.jdt.internal.compiler.batch.Main;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.emp.service.EmpService;
import com.spring.emp.vo.EmpVo;
import com.spring.history.vo.HistoryVo;
import com.spring.login.vo.LoginVo;
import com.spring.menu.service.MenuService;
import com.spring.menu.vo.MenuVo;
import com.spring.patient.service.PatientService;
import com.spring.patient.vo.PatientVo;
import com.spring.reservation.service.ReservationService;
import com.spring.reservation.vo.ReservationVo;
import com.spring.submenu.service.SubMenuService;
import com.spring.submenu.vo.SubMenuVo;
import com.spring.treatment.service.TreatmentService;
import com.spring.treatment.vo.TreatmentVo;

@Controller
public class EmpController {

	@Autowired
	private ReservationService reservationService;
	
	@Autowired
	private EmpService empService;
	
	@Autowired
	private PatientService patientService;
	
	@Autowired
	private TreatmentService treatmentService;
	
	@Autowired
	private MenuService menuService;
	
	@Autowired
	private SubMenuService subMenuService;
	
    protected static Logger logger = Logger.getLogger(Main.class.getName());
	
    // 메인페이지
    @RequestMapping(value="/emp/home", method=RequestMethod.GET )
    public ModelAndView home( HttpSession session ) {
    	// session에서 로그인 정보 불러오기
    	LoginVo login = (LoginVo) session.getAttribute("login");
    	
    	
    	// HashMap에 직원 아이디정보 저장
    	HashMap<String, Object> map = new HashMap<>();
    	map.put("id",login.getId());
    	
    	// 현재날짜정보
    	Date d = new Date();
    	SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
    	String date = format.format(d);
 
    	// 1주일간의 날짜 정의
    	Calendar c = Calendar.getInstance();
    	String date1 = "";
    	String date2 = "";
    	String date3 = "";
    	String date4 = "";
    	String date5 = "";
    	String date6 = "";
    	try {
			c.setTime(format.parse(date));
			c.add(Calendar.DATE, 1);
			date1 = format.format(c.getTime());
			c.add(Calendar.DATE, 1);
			date2 = format.format(c.getTime());
			c.add(Calendar.DATE, 1);
			date3 = format.format(c.getTime());
			c.add(Calendar.DATE, 1);
			date4 = format.format(c.getTime());
			c.add(Calendar.DATE, 1);
			date5 = format.format(c.getTime());
			c.add(Calendar.DATE, 1);
			date6 = format.format(c.getTime());
		} catch (ParseException e) {
			e.printStackTrace();
		}
    	
    	// 예약정보
    	List<ReservationVo> rList   = reservationService.inquiryReservation( map );      // 오늘부터 예약된 회원
    	List<ReservationVo> rList_1 = reservationService.inquiryReservationToday( map ); // 오늘 예약된 회원   	
	    
	    ModelAndView mav = new ModelAndView();
	    
	  //---------------메뉴부분 :  늘 들고 댕겨 ----------------------------------------
		List<MenuVo> menuList = menuService.getMenuList(); //메인메뉴
		String menu_id = (String) map.get("menu_id"); //서브메뉴를 위한 메인메뉴id
		//서브메뉴 가져오기.
		List<SubMenuVo> submenuList = subMenuService.getSubMenuTotList();
		
		mav.addObject("menu_id",menu_id);	
		mav.addObject("submenuList",submenuList);
		mav.addObject("menuList",menuList);
	//---------------------------------------------------------------------------------
	    
	    mav.addObject("rList", rList);
	    mav.addObject("rListToday", rList_1);
	    mav.addObject("date", date);
	    mav.addObject("date1", date1);
	    mav.addObject("date2", date2);
	    mav.addObject("date3", date3);
	    mav.addObject("date4", date4);
	    mav.addObject("date5", date5);
	    mav.addObject("date6", date6);
	    mav.setViewName("emp/home");
		
    	return mav;
    }
 	   
    // 환자예약내역을 클릭하면 환자 정보 및 진료기록 페이지로 이동
    @RequestMapping(value="/emp/reservation/view")
    public ModelAndView reservationView( HttpSession session, @RequestParam HashMap<String, Object> map ) {
    	// 환자정보 불러오기
    	PatientVo pVo = patientService.inquiry( map );
    	
    	// 환자 이전 진료기록 불러오기
    	List<TreatmentVo> tList = treatmentService.inquiryTreatment( map );
    	
    	// session에서 직원 정보 불러오기
    	LoginVo login = (LoginVo) session.getAttribute("login");
    	// HashMap에 의사 아이디정보 저장
    	map.put("emp_id", login.getId());
    	// 의사정보 불러오기
    	EmpVo employee = empService.inquiryEmp(map);
    	
    	// 예약정보 불러오기
    	ReservationVo rVo = reservationService.getReservationData(map);
    	ModelAndView mav = new ModelAndView();
    	//---------------메뉴부분 :  늘 들고 댕겨 ----------------------------------------
		List<MenuVo> menuList = menuService.getMenuList(); //메인메뉴
		String menu_id = (String) map.get("menu_id"); //서브메뉴를 위한 메인메뉴id
		//서브메뉴 가져오기.
		List<SubMenuVo> submenuList = subMenuService.getSubMenuTotList();
		
		mav.addObject("menu_id",menu_id);	
		mav.addObject("submenuList",submenuList);
		mav.addObject("menuList",menuList);
    	//---------------------------------------------------------------------------------
    	mav.addObject("patient", pVo);
    	mav.addObject("employee", employee);
    	mav.addObject("treatments", tList);
    	mav.addObject("res_date", map.get("res_date"));
    	mav.addObject("res_time", map.get("res_time"));
    	mav.addObject("reservation", rVo);
    	mav.setViewName("emp/viewReservation");
    	
    	return mav;
    }
    
    // 진료서 오픈
    @RequestMapping(value="/emp/reservation/view/treatment")
    public ModelAndView viewTreatment( @RequestParam HashMap<String, Object> map ) {
    	ModelAndView mav  = new ModelAndView();
    	mav.setViewName("emp/treatment");
    	return mav;
    }
    
    // 진료서 작성
    @RequestMapping(value="/emp/reservation/view/treatment/write")
    public ModelAndView writeTreatment( @RequestParam HashMap<String, Object> map ) {
    	ModelAndView mav  = new ModelAndView();
    	
    	// 환자정보 불러오기
    	PatientVo pVo = patientService.inquiry( map );
    	
    	mav.addObject("pat_id", map.get("id"));
        mav.addObject("emp_id", map.get("emp_id"));
        mav.addObject("res_num", map.get("res_num"));
    	mav.addObject("patient", pVo);
    	mav.setViewName("emp/writeTreatment");
    	return mav;
    	
    }
    // 진료서 작성 처리
    @RequestMapping("/emp/reservation/view/treatment/write/process")
    public void writeTreatmentProcess( @RequestParam HashMap<String, Object> map ) {
       System.out.println("진단서 작성 완전 시작 : " + map);
       treatmentService.writeTreatment( map );
    }
    
    //--------------------------------------------------------------------------------------song
    
	//병원소개->의료진 소개를 갈 떄 사용
	@RequestMapping("/Emp/introStaff") 
	public ModelAndView list(@RequestParam HashMap<String,Object>map) {

		ModelAndView mv=new ModelAndView();
		
		//---------------메뉴부분 :  늘 들고 댕겨 ----------------------------------------
		List<MenuVo> menuList = menuService.getMenuList(); //메인메뉴
		String menu_id = (String) map.get("menu_id"); //서브메뉴를 위한 메인메뉴id
		//서브메뉴 가져오기.
		List<SubMenuVo> submenuList = subMenuService.getSubMenuTotList();
		
		mv.addObject("menu_id",menu_id);	
		mv.addObject("submenuList",submenuList);
		mv.addObject("menuList",menuList);
		//---------------------------------------------------------------------------------
		
		//일반적으로 뽑은 데이터
		List<EmpVo>list=empService.introStaff(map);
		
		//가나다 순으로 뽑은 데이터
		List<EmpVo>list2=empService.introStaff2(map);
				
		//원래 map에 데이터가 없기 때문에 result의 값은 null
		String result=(String) map.get("dept_name");
		
		map.put("dept_name", result);
				
		mv.addObject("doctorList",list);
		
		mv.addObject("doctorList2",list2);
		
		mv.setViewName("emp/introStaff");
		
		if(result!=null) {
		mv.addObject("result","검색어:"+result);
		int result2=list.size();
		mv.addObject("result2","검색결과:"+result2+"건");
		}
		
		if(list.size()==0&&list2.size()==0) {
				String result2="검색결과가 없습니다";
				mv.addObject("result2",result2);
			}
		
		return mv;
	}

	//병원소개->의료진 소개->(내과,외과,신경과,정신과,피부과 중 1개)
	//진료과 소개 들어감
	@RequestMapping("/Emp/DmoM") 

	public ModelAndView detailview(@RequestParam HashMap<String,Object>map) {

		ModelAndView mv=new ModelAndView();
		//---------------메뉴부분 :  늘 들고 댕겨 ----------------------------------------
		List<MenuVo> menuList = menuService.getMenuList(); //메인메뉴
		String menu_id = (String) map.get("menu_id"); //서브메뉴를 위한 메인메뉴id
		//서브메뉴 가져오기.
		List<SubMenuVo> submenuList = subMenuService.getSubMenuTotList();
		
		mv.addObject("menu_id",menu_id);	
		mv.addObject("submenuList",submenuList);
		mv.addObject("menuList",menuList);
    	//---------------------------------------------------------------------------------
		List<EmpVo>list=empService.getDetialList(map);

		EmpVo dvo=list.get(0);

		int practice=dvo.getDept_num();

		String getDeptName="";

		
		//내과에 대한 db가 너무 적어서
		//그냥 폴더 많이 만들어서 정보 저장해놨음
		switch(practice) {
		case 10:
			getDeptName="medicine";
			break;
		case 20:
			getDeptName="surgery";
			break;
		case 30:
			getDeptName="Neurology";
			break;
		case 40:
			getDeptName="Psychiatry";
			break;
		case 50:
			getDeptName="Dermatology";
			break;
		}
				
		mv.addObject("doctorDetailList",list);

		mv.addObject("dvo",dvo);
				
		mv.setViewName("emp/"+getDeptName+"/eachIntroduce");

		return mv;
	}

	//의료진 소개
	@RequestMapping("/Emp/Introduce")

	public ModelAndView abc(@RequestParam HashMap<String,Object>map) {
	
		//map->각 담당에 맞는 dept_num 들어감
		
		ModelAndView mv=new ModelAndView();
		//---------------메뉴부분 :  늘 들고 댕겨 ----------------------------------------
		List<MenuVo> menuList = menuService.getMenuList(); //메인메뉴
		String menu_id = (String) map.get("menu_id"); //서브메뉴를 위한 메인메뉴id
		//서브메뉴 가져오기.
		List<SubMenuVo> submenuList = subMenuService.getSubMenuTotList();
		
		mv.addObject("menu_id",menu_id);	
		mv.addObject("submenuList",submenuList);
		mv.addObject("menuList",menuList);
    	//---------------------------------------------------------------------------------
		List<EmpVo>list;
		
		String result=(String) map.get("dept_name");
		
		if(result==null) {
			list=empService.getDetialList(map);
				
		}else {
			list=empService.getDetialList2(map);
			mv.addObject("result","검색어:"+result);
			if(list.size()==0) {
				mv.addObject("result","검색어:"+result);
				list=empService.getDetialList(map);
				String result2="검색 결과가 없습니다";
				mv.addObject("result2",result2);
			}
		}
		
		List<HistoryVo>historyList=empService.getHistory();
		
		mv.addObject("historyList",historyList);
		
		EmpVo dvo=list.get(0);
		
		mv.addObject("dvo",dvo);
		
		mv.addObject("doctorDetailList",list);

		mv.setViewName("emp/medicalstaffintroduce");

		return mv;
	}

	//진료과 위치
	@RequestMapping("/Emp/Location")
	public ModelAndView location(@RequestParam HashMap<String,Object>map) {

		ModelAndView mv=new ModelAndView();
		//---------------메뉴부분 :  늘 들고 댕겨 ----------------------------------------
		List<MenuVo> menuList = menuService.getMenuList(); //메인메뉴
		String menu_id = (String) map.get("menu_id"); //서브메뉴를 위한 메인메뉴id
		//서브메뉴 가져오기.
		List<SubMenuVo> submenuList = subMenuService.getSubMenuTotList();
		
		mv.addObject("menu_id",menu_id);	
		mv.addObject("submenuList",submenuList);
		mv.addObject("menuList",menuList);
    	//---------------------------------------------------------------------------------
		List<EmpVo>list=empService.getDetialList(map);

		String src="";

		EmpVo dvo=list.get(0);
		int practice=dvo.getDept_num();
		switch(practice) {
		case 10:
			src="/img/medicine.jpg";
			break;
		case 20:
			src="/img/surgery.jpg";
			break;
		case 30:
			src="/img/Neurology.jpg";
			break;
		case 40:
			src="/img/Psychiatry.jpg";
			break;
		case 50:
			src="/img/Dermatology.jpg";
			break;
		}
		mv.addObject("src",src);
		mv.addObject("dvo",dvo);
		mv.setViewName("emp/location");
		return mv;
	}

	//의료진 상세 설명
	@RequestMapping("/Emp/Career")
	public ModelAndView career(@RequestParam HashMap<String,Object>map) {
		ModelAndView mv=new ModelAndView();
		List<EmpVo>list=empService.getCareer(map);
		EmpVo vo=list.get(0);
		mv.addObject("vo",vo);
		
		//---------------메뉴부분 :  늘 들고 댕겨 ----------------------------------------
		List<MenuVo> menuList = menuService.getMenuList(); //메인메뉴
		String menu_id = (String) map.get("menu_id"); //서브메뉴를 위한 메인메뉴id
		//서브메뉴 가져오기.
		List<SubMenuVo> submenuList = subMenuService.getSubMenuTotList();
		
		String img=(String) map.get("emp_img");
	      
	    mv.addObject("img","/img/"+img);
		
		mv.addObject("menu_id",menu_id);	
		mv.addObject("submenuList",submenuList);
		mv.addObject("menuList",menuList);
    	//---------------------------------------------------------------------------------
		List<HistoryVo>historyList=empService.getHistory(map);
		mv.addObject("historyList",historyList);
		
		mv.setViewName("emp/career");
		return mv;
	}
	
	//병원 위치
	@RequestMapping("/Emp/Hoslocation")
	public ModelAndView hoslocation(@RequestParam HashMap<String,Object>map) {
		ModelAndView mv=new ModelAndView();
		//---------------메뉴부분 :  늘 들고 댕겨 ----------------------------------------
		List<MenuVo> menuList = menuService.getMenuList(); //메인메뉴
		String menu_id = (String) map.get("menu_id"); //서브메뉴를 위한 메인메뉴id
		//서브메뉴 가져오기.
		List<SubMenuVo> submenuList = subMenuService.getSubMenuTotList();
		
		mv.addObject("menu_id",menu_id);	
		mv.addObject("submenuList",submenuList);
		mv.addObject("menuList",menuList);
		//---------------------------------------------------------------------------------

		
		mv.setViewName("emp/hoslocation");
		return mv;
	}
	
	
	//첫페이지에서 의료진 찾기를 할 시 나올 화면 
	@RequestMapping("/Emp/finalSearch")
	public ModelAndView finalSearch(@RequestParam HashMap<String,Object>map) {
				
		ModelAndView mv=new ModelAndView();

		//---------------메뉴부분 :  늘 들고 댕겨 ----------------------------------------
		List<MenuVo> menuList = menuService.getMenuList(); //메인메뉴
		String menu_id = (String) map.get("menu_id"); //서브메뉴를 위한 메인메뉴id
		//서브메뉴 가져오기.
		List<SubMenuVo> submenuList = subMenuService.getSubMenuTotList();
		
		mv.addObject("menu_id",menu_id);	
		mv.addObject("submenuList",submenuList);
		mv.addObject("menuList",menuList);
		//---------------------------------------------------------------------------------

		List<EmpVo>finalSearch=empService.finalSearch(map);
		List<EmpVo>finalSearch2=empService.finalSearch2(map);
				
		
		String result=(String) map.get("dept_name");
		
		if(finalSearch.size()==0) {
			finalSearch=empService.finalSearch(map);
			
			mv.addObject("result","검색어:"+result);
			
			String result2="검색 결과가 없습니다";
			
			mv.addObject("result2",result2);
			
			mv.setViewName("emp/finalSearch");
			
		}else {
		
			finalSearch=empService.finalSearch(map);
			if(result == null)
				mv.addObject("result","전체 의료진 조회");
			else
				mv.addObject("result","검색어:"+result);
			List<HistoryVo>historyList=empService.getHistory();
			
			mv.addObject("finalSearch",finalSearch);
			mv.addObject("finalSearch2",finalSearch2);
			mv.addObject("historyList",historyList);
			EmpVo dvo=finalSearch.get(0);
			mv.addObject("dvo",dvo);
			mv.setViewName("emp/finalSearch");
		}
		return mv;
	}
    
}
