package com.spring.pds.dao.impl;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.pds.dao.PdsDao;
import com.spring.pds.vo.FilesVo;
import com.spring.pds.vo.PdsVo;

@Repository("pdsDao")
public class PdsDaoImpl implements PdsDao {

	@Autowired
	private  SqlSession sqlSession;
	
	// pds 목록 출력
	@Override
	public List<PdsVo> getPdsList(HashMap<String, Object> map) {
		sqlSession.selectList("Pds.PdsList", map);
		List<PdsVo> pdsList = (List<PdsVo>) map.get("result");
		
		return pdsList;
	}

	// 자료실 새글 작성
	@Override
	public void setWrite(HashMap<String, Object> map) {
		sqlSession.insert("Pds.PdsInsert", map);		
	}

	// pds 본문 보기
	@Override
	public PdsVo getContent(HashMap<String, Object> map) {
		sqlSession.selectOne("Pds.GetContent", map);
		PdsVo pdsVo = ((List<PdsVo>) map.get("result")).get(0);
		return pdsVo;
	}

	// 게시글 파일 본문불러오기
	@Override
	public List<FilesVo> getFileList(HashMap<String, Object> map) {
		sqlSession.selectList("Pds.FileList", map);
		List<FilesVo> fileList = (List<FilesVo>) map.get("result");
		return fileList;
	}

	// 게시글 수정
	@Override
	public void updateContent(HashMap<String, Object> map) {
		sqlSession.update("Pds.UpdateContent", map);
	}
	
	// 게시글 삭제 처리
	@Override
	public void setDelete(HashMap<String, Object> map) {
		sqlSession.delete("Pds.PdsDelete", map);
	}	
}
