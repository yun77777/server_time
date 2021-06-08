package com.mall.common;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Component("fileUtils")
public class FileUtils {
	private static final String filePath = "/Users/won-yungyeong/Downloads/"; // 파일이 저장될 위치

	public List<Map<String, Object>> parseInsertFileInfo(Map<String, Object> paramMap,
//			public List<Map<String, Object>> parseInsertFileInfo(BoardVO boardVO, 
			MultipartHttpServletRequest mpRequest) throws Exception {

		/*
		 * Iterator은 데이터들의 집합체? 에서 컬렉션으로부터 정보를 얻어올 수 있는 인터페이스입니다. List나 배열은 순차적으로 데이터의
		 * 접근이 가능하지만, Map등의 클래스들은 순차적으로 접근할 수가 없습니다. Iterator을 이용하여 Map에 있는 데이터들을
		 * while문을 이용하여 순차적으로 접근합니다.
		 */

		Iterator<String> iterator = mpRequest.getFileNames();

		MultipartFile multipartFile = null;
		String originalFileName = null;
		String originalFileExtension = null;
		String storedFileName = null;

		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		Map<String, Object> listMap = null;

		int no = Integer.parseInt(paramMap.get("no").toString());
//		int no = Integer.parseInt(paramMap.get("gdsNum").toString());
		int B_TYPE = Integer.parseInt(paramMap.get("B_TYPE").toString());
//		int bno = boardVO.getB_NO();

		File file = new File(filePath);
		if (file.exists() == false) {
			file.mkdirs();
		}
		while (iterator.hasNext()) {
			multipartFile = mpRequest.getFile(iterator.next());

			// 새로운파일
			if (multipartFile.isEmpty() == false) {
				originalFileName = multipartFile.getOriginalFilename();
				originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
				storedFileName = getRandomString() + originalFileExtension;

				file = new File(filePath + storedFileName);
				multipartFile.transferTo(file);

				listMap = new HashMap<String, Object>();
				listMap.put("B_NO", no);
				listMap.put("B_TYPE", B_TYPE);
				listMap.put("ORG_FILE_NAME", originalFileName);
				listMap.put("STORED_FILE_NAME", storedFileName);
				listMap.put("FILE_SIZE", multipartFile.getSize());
				listMap.put("FILE_PATH", filePath + storedFileName);
				listMap.put("NEW_ITEM", "Y");
				list.add(listMap);
			}

		}
		return list;
	}

	public List<Map<String, Object>> parseUpdateFileInfo(
			Map<String, Object> paramMap,
			String[] files,
			String[] fileNames,
			MultipartHttpServletRequest mpRequest) throws Exception {
		Iterator<String> iterator = mpRequest.getFileNames();
		MultipartFile multipartFile = null;
		String originalFileName = null;
		String originalFileExtension = null;
		String storedFileName = null;
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		Map<String, Object> listMap = null;
		
		int no = Integer.parseInt(paramMap.get("no").toString());
		int B_TYPE = Integer.parseInt(paramMap.get("B_TYPE").toString());
		
		while (iterator.hasNext()) {
			multipartFile = mpRequest.getFile(iterator.next());
			if (multipartFile.isEmpty() == false) {
				originalFileName = multipartFile.getOriginalFilename();
				originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
				storedFileName = getRandomString() + originalFileExtension;
				multipartFile.transferTo(new File(filePath + storedFileName));
				listMap = new HashMap<String, Object>();
				listMap.put("NEW_ITEM", "Y");
				listMap.put("B_NO", no);
				listMap.put("B_TYPE", B_TYPE);
				listMap.put("ORG_FILE_NAME", originalFileName);
				listMap.put("STORED_FILE_NAME", storedFileName);
				listMap.put("FILE_SIZE", multipartFile.getSize());
				list.add(listMap);
				System.err.println("listMap:"+listMap);
			}
		}
		if (files != null && fileNames != null) {
			for (int i = 0; i < fileNames.length; i++) {
				listMap = new HashMap<String, Object>();
				listMap.put("NEW_ITEM", "N");
				listMap.put("FILE_NO", files[i]);
				listMap.put("B_NO", no);
				listMap.put("B_TYPE", B_TYPE);
				list.add(listMap);
			}
		}
		System.err.println("files:"+files);
		System.err.println("fileNames:"+fileNames);
		System.err.println("fff:"+listMap);

		return list;
	}

	public static String getRandomString() {
		return UUID.randomUUID().toString().replaceAll("-", "");
	}
}