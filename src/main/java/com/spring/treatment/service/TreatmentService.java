package com.spring.treatment.service;

import java.util.HashMap;
import java.util.List;

import com.spring.treatment.vo.TreatmentVo;

public interface TreatmentService {
	
	// 환자 이전진료 기록 조회
	public List<TreatmentVo> inquiryTreatment(HashMap<String, Object> map);

	public void writeTreatment(HashMap<String, Object> map);

}
