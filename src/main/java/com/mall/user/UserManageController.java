package com.mall.user;

import java.util.Map;
import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/user")
public class UserManageController {

	@Resource(name = "UserService")
	private UserService userService;

	@RequestMapping(value = "/myPage.do", method = RequestMethod.GET)
	public String myPage(Map<String, Object> paramMap, 
			HttpSession httpSession, Model model) throws Exception {
		System.err.println("login@@:" + httpSession.getAttribute("login"));
		model.addAttribute("login", httpSession.getAttribute("login"));
		model.addAttribute("member",httpSession.getAttribute("member"));
		
		Map<String, Object> login = (Map<String, Object>) httpSession.getAttribute("login");
		paramMap.put("ID",login.get("ID"));
		
		Map<String, Object> info = userService.memberInfo(paramMap);
		System.err.println("info@:"+info);
		
		model.addAttribute("info", info);
		return "/user/myPage";
	}

}