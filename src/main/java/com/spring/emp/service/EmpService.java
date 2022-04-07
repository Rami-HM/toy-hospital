package com.spring.emp.service;

import java.util.HashMap;
import java.util.List;

import com.spring.emp.vo.EmpVo;
import com.spring.history.vo.HistoryVo;

public interface EmpService {

	public List<EmpVo> getList();

	// 관리자,의료진 로그인 처리
	public boolean empLogin(HashMap<String, Object> map);
	
	// 관리자 로그인 처리
	public boolean adminLogin(HashMap<String, Object> map);

	// 의료진 정보 불러오기(정보, 부서)
	public EmpVo inquiryEmp(HashMap<String, Object> map);
	
	//---------------------------------------------------------------------song
	
	//introStaff(의료진소개)에서 사용하는 메소드

	public List<EmpVo> introStaff(HashMap<String, Object> map);

	public List<EmpVo> introStaff2(HashMap<String, Object> map);

	//////////////////////////////////////////////////////////////////////////
	
	public List<EmpVo> getDetialList(HashMap<String, Object> map);

	public List<EmpVo> getDetialList2(HashMap<String, Object> map);

	public List<HistoryVo> getHistory();

	public List<HistoryVo> getHistory(HashMap<String, Object> map);

	//home에서 의료진/질병명을 검색할 때 나오는 것
	public List<EmpVo> finalSearch(HashMap<String, Object> map);
	//home에서 의료진/질병명을 검색할 때 나오는 것->가나다순
	public List<EmpVo> finalSearch2(HashMap<String, Object> map);

	public void deleteEmp(String string);

	public List<EmpVo> getCareer(HashMap<String, Object> map);
}
