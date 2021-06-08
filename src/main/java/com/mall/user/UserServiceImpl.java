package com.mall.user;

import java.util.Date;
import java.util.Map;

import com.mall.board.web.boardController;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.mall.login.service.loginService;
import com.mall.login.serviceImpl.loginMapper;

@Service("UserService")
public class UserServiceImpl implements UserService {

	@Autowired
	private UserMapper userMapper;

	// 회원 가입 처리
	@Override
	public void register(Map<String, Object> paramMap, UserVO userVO) throws Exception {
		System.err.println(paramMap);
		userMapper.register(paramMap);
	}
	
	@Override
	public void updateUser(Map<String, Object> paramMap) throws Exception {		
		System.err.println(paramMap);
		userMapper.updateUser(paramMap);
	}
	@Override
	public void insertMember(Map<String, Object> paramMap) throws Exception {		
		userMapper.insertMember(paramMap);
	}

	@Override
	public Map<String, Object> login(LoginDTO loginDTO) throws Exception {
		return userMapper.login(loginDTO);

	}
	@Override
	public Map<String, Object> memberInfo(Map<String, Object> paramMap) throws Exception{
		return userMapper.memberInfo(paramMap);
		
	}

	// 로그인 유지 처리
	@Override
	public void keepLogin(Map<String,Object> paramMap) throws Exception {
//		public void keepLogin(Map<String,Object> paramMap, String userId, String sessionId, Date sessionLimit) throws Exception {
//		paramMap.put("userId", userId);
//		paramMap.put("sessionId", sessionId);
//		paramMap.put("sessionLimit", sessionLimit);

		userMapper.keepLogin(paramMap);
//		userMapper.keepLogin(userId, sessionId, sessionLimit);
	}

	@Override
	public Map<String, Object> checkLoginBefore(String value) throws Exception {
		return userMapper.checkUserWithSessionKey(value);
	}
}