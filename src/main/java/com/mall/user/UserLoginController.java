package com.mall.user;

import java.util.Map;

import com.mall.board.web.boardController;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
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
		
		System.err.println("log:");
		System.err.println(loginDTO.getID());
		System.err.println(loginDTO.getPW());
		paramMap.put("ID", loginDTO.getID());
		paramMap.put("PW", loginDTO.getPW());

		try {

			if (userService.login(loginDTO) != null) {
//            	if (userVO == null || !BCrypt.checkpw(loginDTO.getPW(), userVO.get("PW").toString())) {

				Map<String, Object> userVO = userService.login(loginDTO);
				System.err.println("$$$$$$$$$$userVO in loginPost");
				System.err.println(userVO);
				System.err.println("$$$$$$$$$$");
				model.addAttribute("user", userVO);
				model.addAttribute("id", userVO.get("ID"));

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}
	
	// 로그인 페이지
		@RequestMapping(value = "/afterLogin.do", method = RequestMethod.GET)
		public String loginGETAfter(Map<String, Object> paramMap, @ModelAttribute("loginDTO") LoginDTO loginDTO, HttpSession httpSession, Model model) {
			System.err.println(httpSession.getAttribute("login"));
			model.addAttribute("login",httpSession.getAttribute("login"));
			return "/user/afterLogin";
		}

}