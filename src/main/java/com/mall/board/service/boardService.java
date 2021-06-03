package com.mall.board.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartHttpServletRequest;

public interface boardService {
	List<Map<String, Object>> selectBoardList(Map<String, Object> paramMap) throws Exception;

	List<Map<String, Object>> selectItemList(Map<String, Object> paramMap) throws Exception;

	List<Map<String, Object>> selectBoardHisList(Map<String, Object> paramMap) throws Exception;

	Map<String, Object> selectContent(Map<String, Object> paramMap) throws Exception;

	Map<String, Object> selectFile(Map<String, Object> paramMap) throws Exception;

	public Integer selectBoardListCnt(Map<String, Object> paramMap) throws Exception;

	public Integer memberLogin(Map<String, Object> paramMap) throws Exception;

	public Integer selectBoardMaxNo(Map<String, Object> paramMap) throws Exception;

	public Map<String, Object> selectBoardDetail(Map<String, Object> paramMap) throws Exception;

	public void insertBoard(Map<String, Object> paramMap, MultipartHttpServletRequest multi, HttpServletRequest request)
			throws Exception;

	public void insertReply(Map<String, Object> paramMap, MultipartHttpServletRequest multi, HttpServletRequest request)
			throws Exception;

	public void insertMember(Map<String, Object> paramMap, MultipartHttpServletRequest multi,
			HttpServletRequest request) throws Exception;

	public void deleteBoard(Map<String, Object> paramMap, MultipartHttpServletRequest multi, HttpServletRequest request)
			throws Exception;
}
