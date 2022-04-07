package com.spring.patient.dao.impl;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.patient.dao.PatientDao;
import com.spring.patient.vo.PatientVo;

@Repository("patientDao")
public class PatientDaoImpl implements PatientDao {

	@Autowired
	SqlSession sqlSession;

	// 회원 로그인 처리
	   @Override
	   public PatientVo login(HashMap<String, Object> map) {
	      PatientVo pVo = null;

	      try {
	         sqlSession.selectList("Patient.Login", map);
	         List<PatientVo> pList = (List<PatientVo>) map.get("result");
	         pVo = (PatientVo) pList.get(0);
	      } catch (Exception e) {   }
	      return pVo;
	 }

	// 아이디 중복확인(회원가입)
	@Override
	public boolean idCheck(HashMap<String, Object> map) {
		boolean idCheck = false;
		sqlSession.selectList("Patient.InquiryPatient", map);
		List<PatientVo> pList = (List<PatientVo>) map.get("result");

		System.out.println("daoImpl 들어오자마자1" + pList.size());
		
		if (pList.size() == 0) {
			// 고객 회원자료에서 해당 ID가 없다면 의료진 회원자료에서 ID 조회
			sqlSession.selectList("Emp.InquiryEmployee", map);
			pList = (List<PatientVo>) map.get("result");

			if (pList.size() == 0) {
				// 관리자계정 아이디와 비교
				sqlSession.selectList("Admin.InquiryAdmin", map);
				pList = (List<PatientVo>) map.get("result");
				
				if(pList.size() == 0) {
					// 고객, 의료진 관리자자료에서 해당 ID정보가 없다면
					idCheck = true;					
				} else {
					// 고객, 의료진 관리자자료에서 해당 ID정보가 있다면
					idCheck = false;					
				}
			}
		}
		return idCheck;
	}

	// 회원가입 전송
	@Override
	public void regMember(HashMap<String, Object> map) {
		sqlSession.insert("Patient.RegPatient", map);
	}

	// 아이디로 회원정보 조회
	@Override
	public PatientVo inquiry(HashMap<String, Object> map) {
		sqlSession.selectList("Patient.InquiryPatient", map);
		List<PatientVo> pList = (List<PatientVo>) map.get("result");
		PatientVo pVo = pList.get(0);
		return pVo;
	}

	@Override
	public List<PatientVo> getList() {
		HashMap<String, Object> map = new HashMap<String, Object>();
		sqlSession.selectList("Patient.List", map);
		List<PatientVo> patList = (List<PatientVo>) map.get("result");
		System.out.println(patList.get(0));
		return patList;
	}

	@Override
	public void deletePat(String in_pat_id) {
		sqlSession.delete("Patient.Delete",in_pat_id);
	}

	// 아이디 찾기
	@Override
	public PatientVo findId(HashMap<String, Object> map) {
		sqlSession.selectList("Patient.findid",map);
		PatientVo vo = null;
		
		try {
			List<PatientVo>list = (List<PatientVo>) map.get("result");
			vo = list.get(0);
		} catch (Exception e) {}
		return vo;
	}

	// 패스워드 찾기
	@Override
	public PatientVo findPwd(HashMap<String, Object> map) {
		System.out.println(map);
		sqlSession.selectList("Patient.findpwd",map);
		PatientVo vo = null;
		try {
			List<PatientVo>list = (List<PatientVo>) map.get("result");
			vo = list.get(0);
		} catch (Exception e) {}
		return vo;
	}

	// 패스워드 찾기 후 패스워드 변경
	@Override
	public void changePwd(HashMap<String, Object> map) {
		sqlSession.update("Patient.changepwd",map);
	}
	
}
