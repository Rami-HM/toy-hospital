package com.spring.reservation.service;

import java.util.HashMap;
import java.util.List;

import com.spring.emp.vo.EmpVo;
import com.spring.reservation.vo.ReservationVo;

public interface ReservationService {

	// (의료진 페이지) 전체 예약내역확인	
	public List<ReservationVo> inquiryReservation(HashMap<String, Object> map);

	// (의료진 페이지) 오늘 예약내역확인
	public List<ReservationVo> inquiryReservationToday(HashMap<String, Object> map);

	// 특정 예약정보 불러오기
	public ReservationVo getReservationData(HashMap<String, Object> map);

	List<EmpVo> getDoc(HashMap<String, Object> map);

	List<ReservationVo> timeTable(HashMap<String, Object> map);

	EmpVo timeTable(String string);

	List<ReservationVo> updateform(HashMap<String, Object> map);

	public void update(HashMap<String, Object> map);

	public boolean resCheck(HashMap<String, Object> map);
}
