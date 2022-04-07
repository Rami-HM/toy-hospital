package com.spring.treatment.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.treatment.dao.TreatmentDao;
import com.spring.treatment.service.TreatmentService;
import com.spring.treatment.vo.TreatmentVo;

@Service("treatmentService")
public class TreatmentServiceImpl implements TreatmentService {

	@Autowired TreatmentDao treatmentDao;
	
	// 환자 이전진료기록 조회
	@Override
	public List<TreatmentVo> inquiryTreatment(HashMap<String, Object> map) {
		List<TreatmentVo> tList = treatmentDao.inquiryTreatment( map );
		return tList;
	}

	@Override
	public void writeTreatment(HashMap<String, Object> map) {
		treatmentDao.writeTreatment(map);
	}

}
