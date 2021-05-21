package com.mall.login.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartHttpServletRequest;

public interface loginService {

	public Integer memberLogin(Map<String, Object> paramMap) throws Exception;

	public void insertMember(Map<String, Object> paramMap, MultipartHttpServletRequest multi,
			HttpServletRequest request) throws Exception;

	public Map<String, Object> selectMember(String member) throws Exception;

}