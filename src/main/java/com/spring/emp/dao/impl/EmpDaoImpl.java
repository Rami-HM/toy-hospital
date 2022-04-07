package com.spring.emp.dao.impl;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.admin.vo.AdminVo;
import com.spring.emp.dao.EmpDao;
import com.spring.emp.vo.EmpVo;
import com.spring.history.vo.HistoryVo;
import com.spring.patient.vo.PatientVo;

@Repository("empDao")
public class EmpDaoImpl implements EmpDao {

	@Autowired
	SqlSession sqlSession;

	@Override
	public List<EmpVo> getList() {

		HashMap<String, Object> map = new HashMap<String, Object>();
		sqlSession.selectList("Emp.List", map);
		List<EmpVo> emplist = (List<EmpVo>) map.get("result");
		return emplist;
	}

	// 의료진 로그인 처리
	@Override
	public EmpVo empLogin(HashMap<String, Object> map) {
		EmpVo eVo = null;

		try {
			sqlSession.selectList("Emp.Login", map);
			List<EmpVo> eList = (List<EmpVo>) map.get("result");
			eVo = (EmpVo) eList.get(0);
		} catch (Exception e) {
		}
		return eVo;
	}

	// 관리자 로그인 처리
	@Override
	public AdminVo adminLogin(HashMap<String, Object> map) {
		AdminVo aVo = null;

		try {
			sqlSession.selectList("Admin.Login", map);
			List<AdminVo> aList = (List<AdminVo>) map.get("result");
			aVo = (AdminVo) aList.get(0);
		} catch (Exception e) {
		}
		return aVo;
	}

	// 의료진 정보 불러오기(부서까지)
	@Override
	public EmpVo inquiryEmp(HashMap<String, Object> map) {
		sqlSession.selectList("Emp.inquiryEmp", map);
		List<EmpVo> eList = (List<EmpVo>) map.get("result");
		EmpVo eVo = (EmpVo) eList.get(0);
		return eVo;
	}

//--------------------------------------------------------------------------------------------song

	@Override
	public List<EmpVo> introStaff(HashMap<String, Object> map) {

		sqlSession.selectList("Emp.DoctorList", map);

		List<EmpVo> HistoryList = (List<EmpVo>) map.get("result");

		return HistoryList;

	}

	@Override
	public List<EmpVo> introStaff2(HashMap<String, Object> map) {
		sqlSession.selectList("Emp.DoctorList2", map);

		List<EmpVo> HistoryList = (List<EmpVo>) map.get("result");

		return HistoryList;
	}

	// 담당 관련 선생님들 순서대고 다 뽑기
	@Override
	public List<EmpVo> getList(HashMap<String, Object> map) {

		sqlSession.selectList("Emp.DoctorDetailList", map);

		List<EmpVo> detailList = (List<EmpVo>) map.get("result");

		return detailList;
	}

	@Override
	public List<EmpVo> getList2(HashMap<String, Object> map) {

		sqlSession.selectList("Emp.DoctorDetailList2", map);

		List<EmpVo> detailList = (List<EmpVo>) map.get("result");

		return detailList;
	}

	/////////////////////////////////////////////////////////////////////////////
	// home->의료진 찾기->의료진/질병명 검색하기 할 시 사용
	@Override
	public List<EmpVo> finalSearch(HashMap<String, Object> map) {
		sqlSession.selectList("Emp.finalSearch", map);
		List<EmpVo> finalSearch = (List<EmpVo>) map.get("result");
		return finalSearch;
	}

	// home->의료진 찾기->의료진/질병명 검색하기 할 시 사용->가나다
	@Override
	public List<EmpVo> finalSearch2(HashMap<String, Object> map) {
		sqlSession.selectList("Emp.finalSearch2", map);
		List<EmpVo> finalSearch = (List<EmpVo>) map.get("result");
		return finalSearch;
	}

	/////////////////////////////////////////////////////////////////////////////

	@Override
	public List<HistoryVo> getHistory(HashMap<String, Object> map) {

		sqlSession.selectList("History.HistoryList", map);

		List<HistoryVo> HistoryList = (List<HistoryVo>) map.get("result");

		return HistoryList;
	}

	// 선생님 한명 누를 시 관련 연역 다 뽑기
	@Override
	public List<HistoryVo> getHistory() {

		HashMap<String, Object> map = new HashMap<>();
		sqlSession.selectList("History.HistoryList2", map);
		List<HistoryVo> list = (List<HistoryVo>) map.get("result");
		return list;

	}

	@Override
	public void deleteEmp(String in_emp_id) {
		sqlSession.delete("Emp.Delete",in_emp_id);
	}

	

	@Override
	public List<EmpVo> getCareer(HashMap<String, Object> map) {
      sqlSession.selectList("Emp.career",map);
    
      List<EmpVo>list = (List<EmpVo>) map.get("result");
   
      return list;
	}
}
