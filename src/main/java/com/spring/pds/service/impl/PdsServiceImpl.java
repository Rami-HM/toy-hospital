package com.spring.pds.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring.pds.dao.PdsDao;
import com.spring.pds.service.PdsService;
import com.spring.pds.vo.FilesVo;
import com.spring.pds.vo.PdsVo;

@Service("pdsService")
public class PdsServiceImpl implements PdsService {

	@Autowired
	private  PdsDao pdsDao;
	
	@Override
	public List<PdsVo> getPdsList(HashMap<String, Object> map) {
		int pagetotalcount = 5;
		int pagecount      = 10;
		
		map.put("pagecount", pagecount);
		
		// db 조회
		List<PdsVo> pdsList = pdsDao.getPdsList(map);
		
		// 조회된 이후 처리
		int nowpage    = Integer.parseInt(String.valueOf(map.get("nowpage")));
		int pagegrpnum = Integer.parseInt(String.valueOf(map.get("pagegrpnum")));
		int totalcount = Integer.parseInt(String.valueOf(map.get("totalcount")));
		
		BoardPaging bp = new BoardPaging(nowpage, pagecount, totalcount, pagetotalcount, pagegrpnum );
		
		PdsVo vo = bp.getPdsPagingInfo(); 
		map.put("pagePdsVo", vo);		
		//vo.setSub_id( (String) map.get("sub_id")); 
		
		
		return  pdsList;
	}

	// 자료실 새글 작성
	@Override
	public void setWrite(HashMap<String, Object> map, HttpServletRequest request) {
		// 중복파일 처리
		CheckFileName  checkFile = new CheckFileName(); 
		
		// 저장될 경로 지정
		String filePath = "c:\\download";   
		
		// 업로드된 파일의 처리(저장)
		MultipartHttpServletRequest multipartServletRequest 
		   = (MultipartHttpServletRequest) request;
		
		Iterator<String> iterator = multipartServletRequest.getFileNames();
		MultipartFile multipartFile = null;
		
		// 저장된 파일 목록 정보
		List<String> filenames  = new ArrayList<String>();
		List<String> fileexts   = new ArrayList<String>();
		List<String> sfilenames = new ArrayList<String>();
		
		String  fileName     = null;
		String  orgFileName  = null;
		String  fileExt      = null;
		String  sFileName    = null;
		
		int i = 0;
		while ( iterator.hasNext() ) {
			multipartFile = multipartServletRequest.getFile(iterator.next());
			
			HashMap<String, String> HashMap = new HashMap<String, String>();
			
			if( !multipartFile.isEmpty() ) {
				fileName = multipartFile.getOriginalFilename();
				
				// upload 된 파일명
				int dotIdx  = fileName.lastIndexOf('.');
				orgFileName = fileName.substring( 0, dotIdx );
				fileExt     = fileName.substring( dotIdx ); 
				
				// 중복파일이 존재하면 번호추가 후 실제 파일명 처리
				sFileName  = checkFile.getCheckFileName(
					filePath, orgFileName, fileExt	);
				
				filenames.add(fileName);
				fileexts.add(fileExt);
				sfilenames.add(sFileName);
				
				map.put("file_names",  filenames);
				map.put("file_exts",   fileexts);
				map.put("sfile_names", sfilenames);
				
				System.out.println(map);
				
				// 저장
				File file = new File (filePath + "\\" +  sFileName);
				i += 1;	
				try {
					multipartFile.transferTo( file ); // 실제 파일명으로 저장
					System.out.println(i + "." + file + " 저장됨");
				} catch (IllegalStateException e) {					
					e.printStackTrace();
				} catch (IOException e) {
					System.out.println("오류:" + e.getMessage() );
					e.printStackTrace();
				} 
			}
		} // file 저장 끝
		System.out.println("최종" + map);
		// db 에 정보 저장 1, 3
		pdsDao.setWrite( map );
		
	}
	
	// 게시글 내용보기
	@Override 
	public PdsVo getContent(HashMap<String, Object> map) {
		PdsVo pdsVo = pdsDao.getContent(map);
		return pdsVo;
	}

	// 게시글 본문 파일불러오기
	@Override
	public List<FilesVo> getFileList(HashMap<String, Object> map) {
		List<FilesVo> fileList = pdsDao.getFileList(map);
		return fileList;
	}

	// 게시글 수정
	@Override
	public void updateContent(HashMap<String, Object> map) {
		pdsDao.updateContent(map);
	}
	
	// 게시글 삭제 처리
	@Override
	public void setDelete(HashMap<String, Object> map) {
		// 1. 실제 파일 삭제 D:\Upload\  
		List<FilesVo> fileList = pdsDao.getFileList( map );
		for (FilesVo filesVo : fileList) {
			File file = new File("c:\\Upload\\" + filesVo.getSfile_name() );
			if( file.exists() )
				file.delete();
		}

		// Board table 과 Files table에 realtion 이 있을 때 삭제 순서 중요
		// 2. Files table 해당 idx 항목 record 삭제
		// 3. Board table 해당 idx 항목 record 삭제
		pdsDao.setDelete( map );

	}

}
