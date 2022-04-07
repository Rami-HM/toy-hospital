package com.spring.reservation.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.emp.vo.EmpVo;
import com.spring.reservation.dao.ReservationDao;
import com.spring.reservation.service.ReservationService;
import com.spring.reservation.vo.ReservationVo;

@Service("reservationService")
public class ReservationServiceImpl implements ReservationService {

	@Autowired
	private ReservationDao reservationDao;
	
	// (의료진 페이지) 전체 예약내역확인
	@Override
	public List<ReservationVo> inquiryReservation(HashMap<String, Object> map) {
		List<ReservationVo> rList = reservationDao.inquiryReservation( map );
		return rList;
	}

	// (의료진 페이지) 오늘 예약내역확인
	@Override
	public List<ReservationVo> inquiryReservationToday(HashMap<String, Object> map) {
		List<ReservationVo> rList = reservationDao.inquiryReservationToday( map );
		return rList;
	}

	// 특정 예약정보 불러오기
	@Override
	public ReservationVo getReservationData(HashMap<String, Object> map) {
		ReservationVo rVo = reservationDao.getReservationData( map );		
		return rVo;
	}

	@Override
	public List<EmpVo> getDoc(HashMap<String, Object> map) {
		List<EmpVo> empVo = reservationDao.getDoc(map);
		return empVo;
	}

	@Override
	public List<ReservationVo> timeTable(HashMap<String, Object> map) {
		List<ReservationVo> resVo = reservationDao.timeTable(map);
		
		return resVo;
	}

	@Override
	public EmpVo timeTable(String string) {
		EmpVo empVo = reservationDao.timeTable(string);
		return empVo;
	}
	
	@Override
	public List<ReservationVo> updateform(HashMap<String, Object> map) {
		List<ReservationVo> resVo = reservationDao.updateform(map);
		
		return resVo;
	}

	@Override
	public void update(HashMap<String, Object> map) {
		reservationDao.update(map);
		return;
		
	}
	
	@Override
	public boolean resCheck(HashMap<String, Object> map) {
		boolean resCheck = false;
		String alert = "";
		ReservationVo rVo  = reservationDao.resCheck(map);
		if (rVo == null) {
			resCheck = true;
			alert += "예약이 성공적으로 완료되었습니다! \\r\\n 예약에 대한 확인은 마이페이지에서 가능합니다.";
		} else {
			resCheck = false;
			alert += "이미 같은 날짜, 같은 시간에 이루어진 예약이 있습니다. \\r\\n다른 시간을 선택해 주세요.";
		}
		map.put("alert", alert);
		return resCheck;
	}
}
