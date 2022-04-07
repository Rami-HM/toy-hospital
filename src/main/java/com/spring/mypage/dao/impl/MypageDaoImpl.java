package com.spring.mypage.dao.impl;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.dept.vo.DeptVo;
import com.spring.emp.vo.EmpVo;
import com.spring.mypage.dao.MypageDao;
import com.spring.patient.vo.PatientVo;
import com.spring.reservation.vo.ReservationVo;
@Repository("mypageDao")
public class MypageDaoImpl implements MypageDao {
	@Autowired
	SqlSession sqlSession;

	@Override
	public List<EmpVo> getList(HashMap<String, Object> map) {
		sqlSession.selectList("Mypage.List", map);
		List<EmpVo> eVo = (List<EmpVo>) map.get("result");
		return eVo;
	}

	@Override
	public List<ReservationVo> getResList(HashMap<String, Object> map) {
		sqlSession.selectList("Mypage.List", map);
		List<ReservationVo> resVo = (List<ReservationVo>) map.get("result");
		return resVo;
	}

	@Override
	public List<DeptVo> getDeptList(HashMap<String, Object> map) {
		List<DeptVo> deptVo = sqlSession.selectList("Mypage.List", map);
		
		return deptVo;
	}

	@Override
	public List<ReservationVo> mypageDelete(HashMap<String, Object> map) {
		sqlSession.delete("Mypage.Delete", map);
		List<ReservationVo> resVo = (List<ReservationVo>) map.get(0);
		return resVo;
	}
	
	@Override
	public List<PatientVo> mypageUpdate(HashMap<String, Object> map) {
		sqlSession.update("Mypage.Update", map);
		List<PatientVo> pVo = (List<PatientVo>) map.get("result");
		return pVo;
	}

	@Override
	public List<ReservationVo> getMemList(HashMap<String, Object> map) {
		sqlSession.selectList("Mypage.Member", map);
		List<ReservationVo> rVo = (List<ReservationVo>) map.get("result");
		return rVo;
	}

}