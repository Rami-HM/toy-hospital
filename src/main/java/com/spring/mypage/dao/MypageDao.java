package com.spring.mypage.dao;

import java.util.HashMap;
import java.util.List;

import com.spring.dept.vo.DeptVo;
import com.spring.emp.vo.EmpVo;
import com.spring.patient.vo.PatientVo;
import com.spring.reservation.vo.ReservationVo;

public interface MypageDao {

	List<EmpVo> getList(HashMap<String, Object> map);

	List<ReservationVo> getResList(HashMap<String, Object> map);

	List<DeptVo> getDeptList(HashMap<String, Object> map);

	List<ReservationVo> mypageDelete(HashMap<String, Object> map);

	List<PatientVo> mypageUpdate(HashMap<String, Object> map);

	List<ReservationVo> getMemList(HashMap<String, Object> map);
}
