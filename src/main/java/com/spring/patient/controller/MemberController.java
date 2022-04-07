package com.spring.patient.controller;

import java.util.HashMap;
import java.util.List;
import java.util.logging.Logger;

import org.eclipse.jdt.internal.compiler.batch.Main;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.emp.service.EmpService;
import com.spring.patient.service.PatientService;
import com.spring.zipcode.service.ZipcodeService;
import com.spring.zipcode.vo.ZipcodeVo;

@Controller
public class MemberController {
	
	@Autowired
	PatientService patientService;
	
	@Autowired
	EmpService employeeService;
	
	@Autowired
	ZipcodeService zipcodeService;

    protected static Logger logger = Logger.getLogger(Main.class.getName());
	
    // 고객 회원가입 페이지로 이동
  	@RequestMapping(value="/login/regMember")
    public String regMemberPage() {
 		return "/login/registerForm";
    }
 	
  	// 찬식스 패키지명 통일해주세요!!!! com.spring.DB이름.cont~
 	// 회원가입 아이디 중복확인
 	@RequestMapping(value="/login/regMember/idCheck")
 	public ModelAndView idCheck( @RequestParam HashMap<String, Object> map ) {
 		boolean idCheck = patientService.idCheck(map); // 사용가능 id : true, 사용불가 id : false
 		
 		ModelAndView mav = new ModelAndView();
 		mav.addObject("idCheck", idCheck);
 		mav.addObject("inputId", map.get("id"));
 		mav.addObject("msg", map.get("msg"));
 		mav.setViewName("/login/register/idCheckForm");
 		return mav;
 	}
 	
 	// 주소찾기 및 입력페이지 오픈
 	@RequestMapping(value="/login/regMember/findAddressForm")
 	public ModelAndView findAddressForm() {
 		ModelAndView mav = new ModelAndView();
 		mav.setViewName("/login/register/findAddressForm");
 		return mav;
 	}
 	
 	// 주소검색
 	@RequestMapping(value="/login/regMember/findAddress")
 	public ModelAndView findAddress( @RequestParam HashMap<String, Object> map ) {
 		List<ZipcodeVo> zList = zipcodeService.findAddress(map);
 		
 		ModelAndView mav = new ModelAndView();
 		mav.addObject("zipcodeList", zList);
 		mav.setViewName("/login/register/findAddressForm");
 		return mav;
 	}
 	
 	// 회원가입
 	@RequestMapping(value="/login/regMember/submit")
 	public ModelAndView regMemberSubmit( @RequestParam HashMap<String, Object> map ) {
 		patientService.regMember(map);
 		 		
 		ModelAndView mav = new ModelAndView();
 		
 		// 회원가입 성공 메세지
 		String registerSuccessMsg = "회원가입이 성공적으로 이루어졌습니다.";
 		mav.addObject("registerSuccessMsg", registerSuccessMsg);

 		// 회원가입 성공 메세지 출력페이지로 이동
 		mav.setViewName("/login/register/alert");
 		
 		return mav;
 	}
}

