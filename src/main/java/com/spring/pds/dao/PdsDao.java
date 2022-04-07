package com.spring.pds.dao;

import java.util.HashMap;
import java.util.List;

import com.spring.pds.vo.FilesVo;
import com.spring.pds.vo.PdsVo;

public interface PdsDao {
	// 게시글 목록 출력
	public List<PdsVo> getPdsList(HashMap<String, Object> map);

	// 자료실 새글 작성
	public void setWrite(HashMap<String, Object> map);

	// 게시글 본문 보기
	public PdsVo getContent(HashMap<String, Object> map);

	// 게시글 본문 파일불러오기
	public List<FilesVo> getFileList(HashMap<String, Object> map);

	// 게시글 수정
	public void updateContent(HashMap<String, Object> map);
	
	// 게시글 삭제 처리
	public void setDelete(HashMap<String, Object> map);
}
