package com.spring.emp.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.admin.vo.AdminVo;
import com.spring.emp.dao.EmpDao;
import com.spring.emp.service.EmpService;
import com.spring.emp.vo.EmpVo;
import com.spring.history.vo.HistoryVo;
import com.spring.patient.vo.PatientVo;

@Service("empService")
public class EmpServiceImpl implements EmpService {

	@Autowired
	private EmpDao empDao;

	@Override
	public List<EmpVo> getList() {
		List<EmpVo> emplist = empDao.getList();

		return emplist;
	}

	// 의료진 로그인 처리
	@Override
	public boolean empLogin(HashMap<String, Object> map) {
		boolean loginCheck;
		EmpVo eVo = empDao.empLogin(map);

		if (eVo != null) {
			loginCheck = true;
		} else {
			loginCheck = false;
		}
		return loginCheck;
	}

	// 의료진 정보 불러오기(부서까지)
	@Override
	public EmpVo inquiryEmp(HashMap<String, Object> map) {
		EmpVo eVo = empDao.inquiryEmp(map);
		return eVo;
	}

	// 관리자 로그인 처리
	@Override
	public boolean adminLogin(HashMap<String, Object> map) {
		boolean loginCheck;
		AdminVo aVo = empDao.adminLogin(map);

		if (aVo != null) {
			loginCheck = true;
		} else {
			loginCheck = false;
		}
		return loginCheck;
	}

//--------------------------------------------------------------------------------song
	@Override
	public List<EmpVo> introStaff(HashMap<String, Object> map) {
		List<EmpVo> list = empDao.introStaff(map);
		return list;
	}

	@Override
	public List<EmpVo> introStaff2(HashMap<String, Object> map) {
		List<EmpVo> list = empDao.introStaff2(map);
		return list;
	}

	//////////////////////////////////////////////////////////////////////////////
	@Override
	public List<EmpVo> getDetialList(HashMap<String, Object> map) {

		List<EmpVo> list = empDao.getList(map);
		return list;
	}

	@Override
	public List<EmpVo> getDetialList2(HashMap<String, Object> map) {
		List<EmpVo> list = empDao.getList2(map);
		return list;
	}

	///////////////////////////////////////////////////////////////////////////
	@Override
	public List<EmpVo> finalSearch(HashMap<String, Object> map) {
		List<EmpVo> list = empDao.finalSearch(map);
		return list;
	}

	@Override
	public List<EmpVo> finalSearch2(HashMap<String, Object> map) {

		List<EmpVo> list = empDao.finalSearch2(map);

		return list;
	}

///////////////////////////////////////////////////////////////////////////
	@Override
	public List<HistoryVo> getHistory(HashMap<String, Object> map) {

		List<HistoryVo> list = empDao.getHistory(map);

		return list;
	}

	@Override
	public List<HistoryVo> getHistory() {
		List<HistoryVo> list = empDao.getHistory();
		return list;
	}

	@Override
	public void deleteEmp(String in_emp_id) {
		empDao.deleteEmp(in_emp_id);
	}
	
	
	@Override
	public List<EmpVo> getCareer(HashMap<String, Object> map) {
		List<EmpVo> list = empDao.getCareer(map);
		return list;
	}
}
