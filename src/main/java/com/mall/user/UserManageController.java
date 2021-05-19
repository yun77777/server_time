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
public class UserManageController {

    @Resource(name = "UserService")
    private UserService userService;

    @RequestMapping(value = "/myPage.do", method = RequestMethod.GET)
	public String myPage(Map<String, Object> paramMap, @ModelAttribute("loginDTO") LoginDTO loginDTO, HttpSession httpSession, Model model) {
		System.err.println(httpSession.getAttribute("login"));
		model.addAttribute("login",httpSession.getAttribute("login"));
		return "/user/myPage";
	}

    
}