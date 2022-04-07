package com.spring.zipcode.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.zipcode.dao.ZipcodeDao;
import com.spring.zipcode.service.ZipcodeService;
import com.spring.zipcode.vo.ZipcodeVo;

@Service("zipcodeService")
public class ZipcodeServiceImpl implements ZipcodeService {

	@Autowired
	private ZipcodeDao zipcodeDao;
	
	// 주소찾기(회원가입)
	@Override
	public List<ZipcodeVo> findAddress(HashMap<String, Object> map) {
		List<ZipcodeVo> zList = zipcodeDao.findAddress(map);
		
		return zList;
	}

}
