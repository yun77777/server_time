package com.mall.login.web;

import java.util.Map;

import com.mall.board.web.boardController;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.mall.login.service.loginService;



@Controller
public class loginController {

	private static final Logger logger = LoggerFactory.getLogger(boardController.class);
	
	@Resource(name = "loginService")
	private loginService loginService;
	
	@RequestMapping(value = "/signIn.do")
	public String signIn( @RequestParam Map<String, Object> paramMap, HttpSession session, HttpServletRequest request, Model model) throws Exception {
		try {
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	return "signIn";
	}
	
	//memberLogin
	
	@ResponseBody
	@RequestMapping(value = "/memberLogin.do")
	public Map<String,Object> memberLogin(
			MultipartHttpServletRequest multi, @RequestParam Map<String, Object> paramMap, HttpSession session, HttpServletRequest request, Model model) throws Exception {
		try {
			System.err.println("ff:"+paramMap);
			if(loginService.memberLogin(paramMap)==1)
				paramMap.put("result","success");
			else
				paramMap.put("result","fail");
				
		} catch (Exception e) {
			e.printStackTrace();
		}		
		return paramMap;
	}
	
	
	@RequestMapping(value = "/signUp.do")
	public String signUp( @RequestParam Map<String, Object> paramMap, HttpSession session, HttpServletRequest request, Model model) throws Exception {
		System.err.println("searchList@@@");
		System.err.println(paramMap);
		
		try {
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	return "signUp";
	}
	
	@ResponseBody
	@RequestMapping(value = "/insertMember.do")
	public Map<String,Object> insertMember(
			MultipartHttpServletRequest multi, @RequestParam Map<String, Object> paramMap, HttpSession session, HttpServletRequest request, Model model) throws Exception {
		try {
			loginService.insertMember(paramMap, multi, request);
			model.addAttribute("paramMap", paramMap);
		} catch (Exception e) {
			e.printStackTrace();
		}		
		return paramMap;
	}
}
