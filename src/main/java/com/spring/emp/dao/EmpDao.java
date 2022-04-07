package com.spring.emp.dao;

import java.util.HashMap;
import java.util.List;

import com.spring.admin.vo.AdminVo;
import com.spring.emp.vo.EmpVo;
import com.spring.history.vo.HistoryVo;
import com.spring.patient.vo.PatientVo;

public interface EmpDao {

	public List<EmpVo> getList();

	// 의료진 로그인 처리	
	public EmpVo empLogin(HashMap<String, Object> map);

	// 의료진 정보 불러오기(부서까지)
	public EmpVo inquiryEmp(HashMap<String, Object> map);

	// 관리자 로그인 처리	
	public AdminVo adminLogin(HashMap<String, Object> map);
	
	
	
//--------------------------------------------------------------------------------song
	public List<EmpVo> introStaff(HashMap<String, Object> map);

	public List<EmpVo> introStaff2(HashMap<String, Object> map);

///////////////////////////////////////////////////////////////////////
	
	public List<EmpVo> getList(HashMap<String, Object> map);
	
	public List<EmpVo> getList2(HashMap<String, Object> map);

	//home->의료진 찾기->의료진/질병명 검색하기 할 시 사용
	public List<EmpVo> finalSearch(HashMap<String, Object> map);
	//home->의료진 찾기->의료진/질병명 검색하기 할 시 사용->가나다순
	public List<EmpVo> finalSearch2(HashMap<String, Object> map);
	
	public List<HistoryVo> getHistory();
	
	public List<HistoryVo> getHistory(HashMap<String, Object> map);

	public void deleteEmp(String in_emp_id);

	

	public List<EmpVo> getCareer(HashMap<String, Object> map);
}
