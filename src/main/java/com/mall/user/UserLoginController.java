package com.mall.user;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.codehaus.jackson.JsonNode;
import org.json.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.mall.login.service.loginService;
import com.mall.login.web.KakaoController;

@Controller
@RequestMapping("/user")
public class UserLoginController {
	@Resource(name = "UserService")
	private UserService userService;
	
	@Resource(name = "loginService")
	private loginService loginService;
	
	@Inject
	public UserLoginController(UserService userService) {
		this.userService = userService;
	}


	private KakaoController kakaoLogin=new KakaoController();

	// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

	// 로그인 페이지
	@RequestMapping(value="/login")
	public String login( @RequestParam Map<String, Object> paramMap, HttpServletRequest request, HttpServletResponse response, Model model, HttpSession session) {
		String kakaoUrl = kakaoLogin.getAuthorizationUrl(session);
		model.addAttribute("kakao_url", kakaoUrl);
		System.err.println("로그인:"+paramMap.get("userInfo"));
		if(paramMap.get("userInfo")!=null)
			return "/test";
		return "/user/login";
	}
	@RequestMapping(value="/kakaoLogin")
	public String kakaoLogin( HttpServletRequest request, HttpServletResponse response, Model model, HttpSession session) {
		String kakaoUrl = kakaoLogin.getAuthorizationUrl(session);
		model.addAttribute("kakao_url", kakaoUrl);
		
		return "/user/login";
	}
	

	@RequestMapping(value = "/kakaoOauth.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String getKakaoSignIn(ModelMap model, @RequestParam("code") String code, HttpSession session)
			throws Exception {
System.err.println("code:"+code);
		JsonNode userInfo = kakaoLogin.getKakaoUserInfo(code);
System.err.println("userInfo:"+userInfo);//@@@v2@@@
		
		System.out.println(userInfo);

		String id = userInfo.get("id").toString();
//		String email = userInfo.get("kaccount_email").toString();
//		String image = userInfo.get("properties").get("profile_image").toString();
		String nickname = userInfo.get("properties").get("nickname").toString();

//		System.out.println(id + email);

		model.addAttribute("k_userInfo", userInfo);
		model.addAttribute("id", id);
//		model.addAttribute("email", email);
		model.addAttribute("nickname", nickname);
//		model.addAttribute("image", image);
		
//		return "redirect:/"; //x
		
		// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
		Map<String, Object> paramMap=new HashMap<String, Object>();
		paramMap.put("ID",id);
		
			
		
		//신규회원일 경우 회원가입
		//아이디 중복 아닐 경우
		if(loginService.selectMember(id)==null)
			return "/signUp";
		//기존회원일 경우 로그인
		else {
			model.addAttribute("msg","로그인이 완료되었습니다.");
			return "/test";
		}
//		return "/user/afterLogin";//ooooo
	}

	// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@


	// 로그아웃
	@RequestMapping(value = "/logout.do")
	public String logout(HttpServletRequest request, HttpServletResponse response, HttpSession session)
			throws Exception {

		// 세션 삭제
		session.invalidate();

		return "redirect:/test.do";
	}

	// 로그인 처리
	@RequestMapping(value = "/loginPost.do", method = RequestMethod.POST)
	public void loginPOST(Map<String, Object> paramMap, LoginDTO loginDTO, HttpSession httpSession, Model model)
			throws Exception {

		paramMap.put("ID", loginDTO.getID());
		paramMap.put("PW", loginDTO.getPW());
		System.err.println("param:" + paramMap);
		try {

			if (userService.login(loginDTO) != null) {
//            	if (userVO == null || !BCrypt.checkpw(loginDTO.getPW(), userVO.get("PW").toString())) {

				Map<String, Object> userVO = userService.login(loginDTO);

				model.addAttribute("user", userVO);
				model.addAttribute("id", userVO.get("ID"));

				// 로그인 유지를 선택할 경우
				if (loginDTO.isUseCookie()) {
					int amount = 60 * 60 * 24 * 7; // 7일
					Date sessionLimit = new Date(System.currentTimeMillis() + (1000 * amount)); // 로그인 유지기간 설정
					System.err.println("keepLogin");
					System.err.println(userVO.get("ID"));
					System.err.println(httpSession.getId());
					System.err.println(sessionLimit);

					paramMap.put("userId", userVO.get("ID"));
					paramMap.put("sessionId", httpSession.getId());
					paramMap.put("sessionLimit", sessionLimit);

					userService.keepLogin(paramMap);
//			        userService.keepLogin(paramMap, userVO.get("ID").toString(), httpSession.getId(), sessionLimit);
				}

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	// 로그인 페이지
	@RequestMapping(value = "/afterLogin.do", method = RequestMethod.GET)
	public String loginGETAfter(Map<String, Object> paramMap, @ModelAttribute("loginDTO") LoginDTO loginDTO,
			HttpSession httpSession, Model model) {
		System.err.println(httpSession.getAttribute("login"));
		model.addAttribute("login", httpSession.getAttribute("login"));
		return "/user/afterLogin";
	}

	// 로그아웃 처리
//	@RequestMapping(value = "/logout.do", method = RequestMethod.GET)
//	public String logout(Map<String, Object> paramMap, HttpServletRequest request, HttpServletResponse response, HttpSession httpSession)
//			throws Exception {
//		
//		try {
//			Object object = httpSession.getAttribute("login");
//			System.err.println("logout session login:"+object);
//			if (object != null) {
//				Map<String, Object> userVO = new HashMap<String,Object>();
//				userVO.put("login",object);
//				System.err.println("fff@@");
//				System.err.println(userVO);
//				httpSession.removeAttribute("login");
//				httpSession.invalidate();
//				Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
//				System.err.println("loginCookie:"+loginCookie);
//				Cookie cookie=new Cookie("loginCookie",null);
//				
//				cookie.setPath("/test.do");
//				cookie.setMaxAge(0);
//				response.addCookie(cookie);
//				
//				paramMap.put("userId", userVO.get("ID"));
//				paramMap.put("sessionId", "none");
//				paramMap.put("sessionLimit", new Date());
//				
//				System.err.println("paramMap:"+paramMap);
//				userService.keepLogin(paramMap);
//				
//
//			}
//
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		System.err.println("go");
//		return "/user/logout";
//	}

}