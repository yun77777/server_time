package com.mall.user;

import java.util.Date;
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

import com.github.scribejava.core.model.OAuth2AccessToken;
import com.mall.login.web.KakaoController;
import com.mall.login.web.KakaoLoginBO;
import com.mall.login.web.NaverLoginBO;

@Controller
@RequestMapping("/user")
public class UserLoginController {
	@Resource(name = "UserService")
	private UserService userService;

	@Inject
	public UserLoginController(UserService userService) {
		this.userService = userService;
	}

	@Autowired
	NaverLoginBO naverLoginBO;

	@Autowired
	KakaoLoginBO kakaoLoginBO;

	private KakaoController kakaoLogin=new KakaoController();

	// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

	// 로그인 페이지
	@RequestMapping(value = "/login.do", method = RequestMethod.GET)
	public String loginK(HttpServletRequest request, HttpServletResponse response, Model model, HttpSession session) {

		String kakaoUrl = kakaoLogin.getAuthorizationUrl(session);

		/* 생성한 인증 URL을 View로 전달 */
		model.addAttribute("kakao_url", kakaoUrl);
//		if(kakaoUrl!=null)
//			return kakaoUrl;
//		return "redirect: /user/kakaoOauth.do";

		return "/user/login";
	}
	
	@RequestMapping(value = "/loginAfter.do", method = RequestMethod.GET)
	public String loginAfter(HttpServletRequest request, HttpServletResponse response, Model model, HttpSession session) {


		return "/user/loginAfter.do";
//		return "redirect: /user/loginAfter.do";
	}
	/**
	 * 카카오 로그인 콜백
	 *
	 * @return String
	 * @throws Exception
	 */
	@RequestMapping(value = "/kakaoOauth.do")
	public String getKakaoSignIn(ModelMap model, @RequestParam("code") String code, HttpSession session)
			throws Exception {

		JsonNode userInfo = kakaoLogin.getKakaoUserInfo(code);

		System.out.println(userInfo);

		String id = userInfo.get("id").toString();
		String email = userInfo.get("kaccount_email").toString();
		String image = userInfo.get("properties").get("profile_image").toString();
		String nickname = userInfo.get("properties").get("nickname").toString();

		System.out.println(id + email);

		model.addAttribute("k_userInfo", userInfo);
		model.addAttribute("id", id);
		model.addAttribute("email", email);
		model.addAttribute("nickname", nickname);
		model.addAttribute("image", image);

		return "/user/afterLogin";
	}

	// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

	// 로그인 페이지
//	@RequestMapping(value = "/login.do", method = RequestMethod.GET)
//	public String login(HttpServletRequest request, HttpServletResponse response, Model model, HttpSession session) {
//		
//
//		String serverUrl = request.getScheme()+"://"+request.getServerName();
//		if(request.getServerPort() != 80) {
//			serverUrl = serverUrl + ":" + request.getServerPort();
//		}
//		
//		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session, serverUrl);
//		model.addAttribute("naverAuthUrl", naverAuthUrl);
//		System.err.println("fmlaksfml");
//		String kakaoAuthUrl = kakaoLoginBO.getAuthorizationUrl(session, serverUrl);
//		model.addAttribute("kakaoAuthUrl", kakaoAuthUrl);
//
//
//
//		
//		return "/user/login";
//	}

	// 네이버 로그인 성공시 callback
	@RequestMapping(value = "/naverOauth2ClientCallback.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String naverOauth2ClientCallback(HttpServletRequest request, HttpServletResponse response, Model model,
			@RequestParam String code, @RequestParam String state, HttpSession session) throws Exception {

		String serverUrl = request.getScheme() + "://" + request.getServerName();
		if (request.getServerPort() != 80) {
			serverUrl = serverUrl + ":" + request.getServerPort();
		}

		OAuth2AccessToken oauthToken;
		oauthToken = naverLoginBO.getAccessToken(session, code, state, serverUrl);
		if (oauthToken == null) {
			model.addAttribute("msg", "네이버 로그인 access 토큰 발급 오류 입니다.");
			model.addAttribute("url", "/");
			return "/common/redirect";
		}

		// 로그인 사용자 정보를 읽어온다
		String apiResult = naverLoginBO.getUserProfile(oauthToken, serverUrl);

		JSONParser jsonParser = new JSONParser();
		Object obj = jsonParser.parse(apiResult);
		JSONObject jsonObj = (JSONObject) obj;

		JSONObject response_obj = (JSONObject) jsonObj.get("response");

		// 프로필 조회
		String id = (String) response_obj.get("id");
		String gender = (String) response_obj.get("gender");

		// 세션에 사용자 정보 등록
		session.setAttribute("islogin_r", "Y");
		session.setAttribute("id", id);
		session.setAttribute("gender", gender);

		return "redirect:/";
	}

	// 카카오 로그인 성공시 callback
	@RequestMapping(value = "/kakaoOauth2ClientCallback.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String kakaoOauth2ClientCallback(HttpServletRequest request, HttpServletResponse response, Model model,
			@RequestParam String code, @RequestParam String state, HttpSession session) throws Exception {

		String serverUrl = request.getScheme() + "://" + request.getServerName();
		if (request.getServerPort() != 80) {
			serverUrl = serverUrl + ":" + request.getServerPort();
		}

		OAuth2AccessToken oauthToken;
		oauthToken = kakaoLoginBO.getAccessToken(session, code, state, serverUrl);
		if (oauthToken == null) {
			model.addAttribute("msg", "카카오 로그인 access 토큰 발급 오류 입니다.");
			model.addAttribute("url", "/");
			return "/common/redirect";
		}

		// 로그인 사용자 정보를 읽어온다
		String apiResult = kakaoLoginBO.getUserProfile(oauthToken, serverUrl);

		JSONParser jsonParser = new JSONParser();
		Object obj = jsonParser.parse(apiResult);
		JSONObject jsonObj = (JSONObject) obj;

		JSONObject response_obj = (JSONObject) jsonObj.get("kakao_account");

		// 프로필 조회
		String id = (String) response_obj.get("id");
		String gender = (String) response_obj.get("gender");

		// 세션에 사용자 정보 등록
		session.setAttribute("islogin_r", "Y");
		session.setAttribute("id", id);
		session.setAttribute("gender", gender);

		return "redirect:/";
	}

	// 로그아웃
	@RequestMapping(value = "/logout.do")
	public String logout(HttpServletRequest request, HttpServletResponse response, HttpSession session)
			throws Exception {

		// 세션 삭제
		session.invalidate();

		return "redirect:/";
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