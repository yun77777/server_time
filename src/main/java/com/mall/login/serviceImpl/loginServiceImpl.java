package com.mall.login.serviceImpl;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.mall.login.service.loginService;

@Service("loginService")
public class loginServiceImpl implements loginService {

	@Autowired
	private loginMapper loginMapper;

	@Override
	public Integer memberLogin(Map<String, Object> paramMap) throws Exception {
		System.err.println("login@:" + paramMap);
		System.err.println(loginMapper.memberLogin(paramMap));
		return loginMapper.memberLogin(paramMap);
	}

	@Override
	public void insertMember(Map<String, Object> paramMap, MultipartHttpServletRequest multi,
			HttpServletRequest request) throws Exception {
		System.err.println("$$$$$$$$$:" + paramMap);
		loginMapper.insertMember(paramMap);
//		loginMapper.insertMemberHis(paramMap);
	}

	@Override
	public Map<String, Object> selectMember(String member) throws Exception {
		return loginMapper.selectMember(member);
	}

}
