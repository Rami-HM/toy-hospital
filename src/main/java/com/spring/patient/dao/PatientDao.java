package com.spring.patient.dao;

import java.util.HashMap;
import java.util.List;

import com.spring.patient.vo.PatientVo;

public interface PatientDao {

	// 로그인 처리
	public PatientVo login(HashMap<String, Object> map);

	// 아이디 중복확인(회원가입)
	public boolean idCheck(HashMap<String, Object> map);

	// 회원가입 전송
	public void regMember(HashMap<String, Object> map);
	
	// 아이디로 회원정보조회
	public PatientVo inquiry(HashMap<String, Object> map);

	
	public List<PatientVo> getList();

	public void deletePat(String string);

	// 아이디 찾기
	public PatientVo findId(HashMap<String, Object> map);

	// 패스워드 찾기
	public PatientVo findPwd(HashMap<String, Object> map);

	// 패스워드 찾기 후 패스워드 변경
	public void changePwd(HashMap<String, Object> map);
}
