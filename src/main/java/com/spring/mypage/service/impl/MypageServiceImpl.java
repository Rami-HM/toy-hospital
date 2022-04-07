package com.spring.mypage.service.impl;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.dept.vo.DeptVo;
import com.spring.emp.vo.EmpVo;
import com.spring.mypage.dao.MypageDao;
import com.spring.mypage.service.MypageService;
import com.spring.patient.vo.PatientVo;
import com.spring.reservation.vo.ReservationVo;

@Service
public class MypageServiceImpl implements MypageService {
	@Autowired
	MypageDao mypageDao;
	
	@Override
	public List<EmpVo> getList(HashMap<String, Object> map) {
		List<EmpVo> eVo = mypageDao.getList(map);
		return eVo;
	}

	@Override
	public List<ReservationVo> getResList(HashMap<String, Object> map) {
		List<ReservationVo> resVo = mypageDao.getResList(map);
		return resVo;
	}

	@Override
	public List<DeptVo> getDeptList(HashMap<String, Object> map) {
		List<DeptVo> deptVo = mypageDao.getDeptList(map);
		return deptVo;
	}

	@Override
	public List<ReservationVo> mypageDelete(HashMap<String, Object> map) {
		List<ReservationVo> resVo = mypageDao.mypageDelete(map);
		return resVo;
	}
	
	@Override
	public List<PatientVo> mypageUpdate(HashMap<String, Object> map) {
		List<PatientVo> pVo = mypageDao.mypageUpdate(map);
		return pVo;
	}

	@Override
	public List<ReservationVo> getMemList(HashMap<String, Object> map) {
		List<ReservationVo> rVo = mypageDao.getMemList(map);
		return rVo;
	}
	
	

}
