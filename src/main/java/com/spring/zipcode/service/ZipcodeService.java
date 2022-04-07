package com.spring.zipcode.service;

import java.util.HashMap;
import java.util.List;

import com.spring.zipcode.vo.ZipcodeVo;

public interface ZipcodeService {

	public List<ZipcodeVo> findAddress(HashMap<String, Object> map);

}
