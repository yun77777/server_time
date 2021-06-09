package com.mall.user;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
		model.addAttribute("k_userInfo", httpSession.getAttribute("k_userInfo"));
		
		Map<String,Object> login=(HashMap<String, Object>) httpSession.getAttribute("member");
		paramMap.put("ID",login.get("ID"));
		
		
		Map<String, Object> info = userService.memberInfo(paramMap);
		
		model.addAttribute("info", info);
		System.err.println("k:"+httpSession.getAttribute("k_userInfo"));
		return "/user/myPage";
	}
	
    @RequestMapping(value = "/updateUser.do", method = RequestMethod.POST)
    public String updateUser(@RequestParam Map<String, Object> paramMap, 
			HttpSession httpSession, Model model) throws Exception {    	try {
			model.addAttribute("member",httpSession.getAttribute("member"));
			model.addAttribute("k_userInfo", httpSession.getAttribute("k_userInfo"));

				
			System.err.println("$$$$:"+paramMap);
			System.err.println("$ID$$:"+paramMap.get("ID"));
//    		paramMap.put("ID",userVO.getID());
//        	paramMap.put("PW",userVO.getPW());
        	
//            String hashedPw = BCrypt.hashpw(userVO.getPW(), BCrypt.gensalt());
//            userVO.setPW(hashedPw);
//			paramMap.put("ID",httpSession.getAttribute("id"));
            userService.updateUser(paramMap);
		} catch (Exception e) {
			e.printStackTrace();
		}
        return "/test";
//        return "redirect:/user/myPage.do";
    }
    
    @RequestMapping(value = "/insertMember.do", method = RequestMethod.POST)
    public String insertMember(@RequestParam Map<String, Object> paramMap, 
    		HttpSession httpSession, Model model) throws Exception {    	try {
    			model.addAttribute("member",httpSession.getAttribute("member"));
    			model.addAttribute("k_userInfo", httpSession.getAttribute("k_userInfo"));
    			model.addAttribute("n_userInfo", httpSession.getAttribute("n_userInfo"));
    			
    			
    			System.err.println("$$$$:"+paramMap);
    			System.err.println("$ID$$:"+paramMap.get("ID"));
//    		paramMap.put("ID",userVO.getID());
//        	paramMap.put("PW",userVO.getPW());
    			
//            String hashedPw = BCrypt.hashpw(userVO.getPW(), BCrypt.gensalt());
//            userVO.setPW(hashedPw);
//			paramMap.put("ID",httpSession.getAttribute("id"));
    			userService.insertMember(paramMap);
    		} catch (Exception e) {
    			e.printStackTrace();
    		}
    		return "/test";
//        return "redirect:/user/myPage.do";
    }

}