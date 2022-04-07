package com.spring.zipcode.dao;

import java.util.HashMap;
import java.util.List;

import com.spring.zipcode.vo.ZipcodeVo;

public interface ZipcodeDao {

	List<ZipcodeVo> findAddress(HashMap<String, Object> map);

}
