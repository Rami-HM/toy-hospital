package com.spring.zipcode.dao.impl;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.zipcode.dao.ZipcodeDao;
import com.spring.zipcode.vo.ZipcodeVo;

@Repository("zipcodeDao")
public class ZipcodeDaoImpl implements ZipcodeDao {

	@Autowired
	SqlSession sqlSession;
	
	// 주소찾기(회원가입)
	@Override
	public List<ZipcodeVo> findAddress(HashMap<String, Object> map) {
		sqlSession.selectList("Zipcode.FindAddress", map);

		List<ZipcodeVo> zList = (List<ZipcodeVo>) map.get("result");
		
		return zList;
	}

}
