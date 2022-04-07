package com.spring.patient.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.patient.dao.PatientDao;
import com.spring.patient.service.PatientService;
import com.spring.patient.vo.PatientVo;

@Service("patientService")
public class PatientServiceImpl implements PatientService {

	@Autowired
	private PatientDao patientDao;

	// 회원 로그인 처리
	   @Override
	   public boolean login(HashMap<String, Object> map) {
	      boolean loginCheck;
	      PatientVo pVo = patientDao.login(map);
	      
	      if(pVo != null) {
	         loginCheck = true;
	      } else {
	         loginCheck = false;
	      }
	      return loginCheck;
	 }

	// 아이디 중복확인(회원가입)
	@Override
	public boolean idCheck(HashMap<String, Object> map) {
		boolean idCheck = false;
		idCheck = patientDao.idCheck(map); // 사용가능 id : true, 사용불가 id : false

		String msg = "";
		if (idCheck) {
			msg += "사용가능한 아이디입니다.";
		} else {
			msg += "이미 사용중인 아이디입니다.";
		}

		map.put("msg", msg);

		return idCheck;
	}

	// 회원가입 전송
	@Override
	public void regMember(HashMap<String, Object> map) {
		// 주민등록번호 처리
		String first_ssn = (String) map.get("first_ssn");
		String second_ssn = (String) map.get("second_ssn");
		String ssn = first_ssn + "-" + second_ssn;

		// 이메일 처리
		String first_email = (String) map.get("first_email");
		String second_email = (String) map.get("second_email");
		String pat_email = first_email + "@" + second_email;

		// 연락처 처리
		String first_tel = (String) map.get("first_tel");
		String second_tel = (String) map.get("second_tel");
		String third_tel = (String) map.get("third_tel");
		String pat_tel = first_tel + "-" + second_tel + "-" + third_tel;

		// 주소 처리
		String zipcode = (String) map.get("zipcode");
		String main_address = (String) map.get("main_address");
		String rest_address = (String) map.get("rest_address");
		String pat_address = zipcode + " " + main_address + " " + rest_address;

		map.put("ssn", ssn);
		map.put("pat_email", pat_email);
		map.put("pat_tel", pat_tel);
		map.put("pat_address", pat_address);

		map.remove("idbtncheck");
		map.remove("passwordcheck");
		map.remove("first_ssn");
		map.remove("second_ssn");
		map.remove("first_email");
		map.remove("second_email");
		map.remove("first_tel");
		map.remove("second_tel");
		map.remove("third_tel");
		map.remove("zipcode");
		map.remove("main_address");
		map.remove("rest_address");

		// 나중에 성별 처리하고 지울것
		map.put("gender", "M");

		patientDao.regMember(map);
	}

	// 아이디로 회원정보 조회
	@Override
	public PatientVo inquiry(HashMap<String, Object> map) {
		PatientVo pVo = patientDao.inquiry(map);
		return pVo;
	}

	@Override
	public List<PatientVo> getList() {
		List<PatientVo> patList = patientDao.getList();
		return patList;
	}

	@Override
	public void deletePat(String string) {
		patientDao.deletePat(string);
	}
	
	// 아이디 찾기
	@Override
	public boolean findId(HashMap<String, Object> map) {		
		boolean findIdCheck;
		
		String first_ssn=(String) map.get("first_ssn");
		String second_ssn=(String) map.get("second_ssn");
		String pat_ssn=first_ssn+"-"+second_ssn;
		map.put("pat_ssn", pat_ssn);
		map.remove("first_ssn");
		map.remove("second_ssn");
		
		PatientVo vo=patientDao.findId(map);
	
		if(vo==null) {
			findIdCheck=false;
		}else {
			findIdCheck=true;
		}		
		return findIdCheck;
	}

	// 패스워드 찾기
	@Override
	public boolean findpwd(HashMap<String, Object> map) {
		boolean findPwdCheck;
		String first_ssn  = (String) map.get("first_ssn");
		String second_ssn = (String) map.get("second_ssn");
		String pat_ssn    = first_ssn+"-"+second_ssn;
		map.put("pat_ssn", pat_ssn);
		map.remove("first_ssn");
		map.remove("second_ssn");
		PatientVo vo = patientDao.findPwd(map);

		if(vo!=null) {
			findPwdCheck=true;
		}else {
			findPwdCheck=false;
		}		
		return findPwdCheck;
	}

	// 패스워드 찾기 후 패스워드 변경
	@Override
	public boolean changePwd(HashMap<String, Object> map) {
		boolean changeCheck = false;
		patientDao.changePwd(map);
		
		if(map.get("pat_id") != null) {
			changeCheck = true;
		}
		return changeCheck;
	}


}
