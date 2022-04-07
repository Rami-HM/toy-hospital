package com.spring.treatment.dao.impl;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.treatment.dao.TreatmentDao;
import com.spring.treatment.vo.TreatmentVo;

@Repository("treatmentDao")
public class TreatmentDaoImpl implements TreatmentDao {

	@Autowired
	private SqlSession sqlSession;
	
	// 환자 이전진료기록 조회
	@Override
	public List<TreatmentVo> inquiryTreatment(HashMap<String, Object> map) {
		sqlSession.selectList("Treatment.InquiryTreatment", map);
		List<TreatmentVo> tList = (List<TreatmentVo>) map.get("result");
		for (TreatmentVo treatmentVo : tList) {
			System.out.println(treatmentVo);
		}
		return tList;
	}

	// 진료서 작성
   @Override
   public void writeTreatment(HashMap<String, Object> map) {
	  System.out.println("insert : " + map);
      sqlSession.insert("Treatment.WriteTreatment", map);
  }

}
