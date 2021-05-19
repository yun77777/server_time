package com.mall.user;

import java.util.Date;
import java.util.Map;

import com.mall.board.web.boardController;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.mindrot.jbcrypt.BCrypt;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.WebUtils;

import com.mall.login.service.loginService;

@Controller
@RequestMapping("/user")
public class UserLoginController {
	@Resource(name = "UserService")
	private UserService userService;

	@Inject
	public UserLoginController(UserService userService) {
		this.userService = userService;
	}

	// 로그인 페이지
	@RequestMapping(value = "/login.do", method = RequestMethod.GET)
	public String loginGET(Map<String, Object> paramMap, @ModelAttribute("loginDTO") LoginDTO loginDTO) {
		System.err.println("@@@@@@@@login");
		return "/user/login";
	}

	// 로그인 처리
	@RequestMapping(value = "/loginPost.do", method = RequestMethod.POST)
	public void loginPOST(Map<String, Object> paramMap, LoginDTO loginDTO, HttpSession httpSession, Model model)
			throws Exception {

		paramMap.put("ID", loginDTO.getID());
		paramMap.put("PW", loginDTO.getPW());
		System.err.println("param:"+paramMap);
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
	@RequestMapping(value = "/logout.do", method = RequestMethod.GET)
	public String logout(Map<String, Object> paramMap, HttpServletRequest request, HttpServletResponse response, HttpSession httpSession)
			throws Exception {
		
		try {
			Object object = httpSession.getAttribute("login");
			System.err.println("logout session login:"+object);
			if (object != null) {
				Map<String, Object> userVO = (Map<String, Object>) object;
				System.err.println("fff@@");
				System.err.println(userVO);
				httpSession.removeAttribute("login");
				httpSession.invalidate();
				Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
				System.err.println("loginCookie:"+loginCookie);
				Cookie cookie=new Cookie("loginCookie",null);
				
				cookie.setPath("/test.do");
//				loginCookie.setPath("/");
				cookie.setMaxAge(0);
				response.addCookie(cookie);

				if (loginCookie != null) {
					loginCookie.setPath("/test.do");
//					loginCookie.setPath("/");
					loginCookie.setMaxAge(0);
					response.addCookie(loginCookie);
					
					paramMap.put("userId", userVO.get("ID"));
					paramMap.put("sessionId", "none");
					paramMap.put("sessionLimit", new Date());
					
					System.err.println("paramMap:"+paramMap);
					userService.keepLogin(paramMap);
//					userService.keepLogin(userVO.get("ID"), "none", new Date());
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		System.err.println("go");
		return "/user/logout";
	}

}