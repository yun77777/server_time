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
	
//	@RequestMapping(value = "/signIn.do")
//	public String signIn( @RequestParam Map<String, Object> paramMap, HttpSession session, HttpServletRequest request, Model model) throws Exception {
//		try {
//			
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		
//	return "signIn";
//	}
//	
//	//memberLogin
//	
//	@ResponseBody
//	@RequestMapping(value = "/memberLogin.do")
//	public Map<String,Object> memberLogin(
//			MultipartHttpServletRequest multi, @RequestParam Map<String, Object> paramMap, HttpSession session, HttpServletRequest request, Model model) throws Exception {
//		try {
//			System.err.println("ff:"+paramMap);
//			if(loginService.memberLogin(paramMap)==1)
//				paramMap.put("result","success");
//			else
//				paramMap.put("result","fail");
//				
//		} catch (Exception e) {
//			e.printStackTrace();
//		}		
//		return paramMap;
//	}
	
	
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
			System.err.println("pa:"+paramMap);

			if(paramMap.get("userInfo")!=null) {
				paramMap.put("ID",paramMap.get("id"));
				paramMap.put("PLATFORM_TYPE","k");
//{"id":1749525693,"connected_at":"2021-05-30T07:00:45Z","properties":{"nickname":"윤경"},"kakao_account":{"profile_needs_agreement":false,"profile":{"nickname":"윤경","is_default_image":true},"has_email":true,"email_needs_agreement":true,"has_gender":true,"gender_needs_agreement":true}}
			}
			System.err.println("afamflfml:"+paramMap);
			//아이디 중복 아닐 경우
			if(loginService.selectMember(paramMap.get("id").toString())==null)
				loginService.insertMember(paramMap, multi, request);
			else
				paramMap.put("msg","중복");
			model.addAttribute("paramMap", paramMap);
		} catch (Exception e) {
			e.printStackTrace();
		}		
		return paramMap;
	}
}
