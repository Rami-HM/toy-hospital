package com.spring.reservation.dao.impl;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.emp.vo.EmpVo;
import com.spring.reservation.dao.ReservationDao;
import com.spring.reservation.vo.ReservationVo;

@Repository("reservationDao")
public class ReservationDaoImpl implements ReservationDao {

	@Autowired
	private SqlSession sqlSession;
	
	// (의료진 페이지) 전체 예약내역확인
	@Override
	public List<ReservationVo> inquiryReservation( HashMap<String, Object> map ) {
		sqlSession.selectList("Reservation.InquiryReservation", map);
		List<ReservationVo> rList = (List<ReservationVo>) map.get("result");
		return rList;
	}

	// (의료진 페이지) 오늘 예약내역확인
	@Override
	public List<ReservationVo> inquiryReservationToday(HashMap<String, Object> map) {
		sqlSession.selectList("Reservation.InquiryReservationToday", map);
		List<ReservationVo> rList = (List<ReservationVo>) map.get("result");
		return rList;
	}

	// 특정 예약정보 불러오기
	@Override
	public ReservationVo getReservationData(HashMap<String, Object> map) {
		sqlSession.selectList("Reservation.GetReservationData", map);
		List<ReservationVo> rList = (List<ReservationVo>) map.get("result");
		ReservationVo rVo = rList.get(0);
		
		return rVo;
	}
	
	@Override
	public List<EmpVo> getDoc(HashMap<String, Object> map) {
		sqlSession.selectList("Emp.List", map);
		List<EmpVo> empVo = (List<EmpVo>) map.get("result");
		return empVo;
	}

	@Override
	public List<ReservationVo> timeTable(HashMap<String, Object> map) {
		System.out.println(map.get("res_date"));
		System.out.println(map.get("emp_name"));
		sqlSession.selectList("Reservation.Time", map);
		List<ReservationVo> resVo = (List<ReservationVo>) map.get("result");
		
		System.out.println("dao imp : " + resVo);
		
		
		return resVo;
	}

	@Override
	public EmpVo timeTable(String string) {
		sqlSession.selectList("Reservation.Time", string);
		return null;
	}

	@Override
	public void update(HashMap<String, Object> map) {
		sqlSession.insert("Reservation.Ins", map);
	}

	@Override
	public List<ReservationVo> updateform(HashMap<String, Object> map) {
		sqlSession.selectList("Reservation.Time", map);
		List<ReservationVo> resVo = (List<ReservationVo>) map.get("result");
		return resVo;
	}

	@Override
	public ReservationVo resCheck(HashMap<String, Object> map) {
		sqlSession.selectList("Reservation.Check", map);
		System.out.println("Reservation.Check sql" + map);
		ReservationVo rVo = null;
		try {
			List<ReservationVo> resVo = (List<ReservationVo>) map.get("result");
			rVo = resVo.get(0);
		} catch (Exception e) {
		}
		return rVo;
	}
}
