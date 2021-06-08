package com.mall.login.web;

import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Component;

import com.github.scribejava.core.builder.ServiceBuilder;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.github.scribejava.core.model.OAuthRequest;
import com.github.scribejava.core.model.Response;
import com.github.scribejava.core.model.Verb;
import com.github.scribejava.core.oauth.OAuth20Service;

@Component
public class NaverLoginBO {

	// 네이버 로그인 정보
	private final static String NAVER_CLIENT_ID = "JfxL6j4Q1r7tlTKVfJ6Q";
	private final static String NAVER_CLIENT_SECRET = "s_Viww55bx";
	private final static String NAVER_REDIRECT_URI = "/user/naverOauth.do";
	
	private final static String SESSION_STATE = "naver_oauth_state";
	private final static String PROFILE_API_URL = "https://openapi.naver.com/v1/nid/me";

	public String getAuthorizationUrl(HttpSession session, String serverUrl) {
		String state = generateRandomString();
		setSession(session, state);
		OAuth20Service oauthService = new ServiceBuilder().apiKey(NAVER_CLIENT_ID).apiSecret(NAVER_CLIENT_SECRET).callback(serverUrl + NAVER_REDIRECT_URI).state(state).build(NaverOAuthApi20.instance());
		return oauthService.getAuthorizationUrl();
	}

	public OAuth2AccessToken getAccessToken(HttpSession session, String code, String state, String serverUrl) throws Exception {
		String sessionState = getSession(session);
		if (StringUtils.equals(sessionState, state)) {
			OAuth20Service oauthService = new ServiceBuilder().apiKey(NAVER_CLIENT_ID).apiSecret(NAVER_CLIENT_SECRET).callback(serverUrl + NAVER_REDIRECT_URI).state(state).build(NaverOAuthApi20.instance());
			OAuth2AccessToken accessToken = oauthService.getAccessToken(code);
			return accessToken;
		}
		return null;
	}

	public String getUserProfile(OAuth2AccessToken oauthToken, String serverUrl) throws Exception {
		OAuth20Service oauthService = new ServiceBuilder().apiKey(NAVER_CLIENT_ID).apiSecret(NAVER_CLIENT_SECRET).callback(serverUrl + NAVER_REDIRECT_URI).build(NaverOAuthApi20.instance());
		OAuthRequest request = new OAuthRequest(Verb.GET, PROFILE_API_URL, oauthService);
		oauthService.signRequest(oauthToken, request);
		Response response = request.send();
		return response.getBody();
	}
	
	private String generateRandomString() {
		return UUID.randomUUID().toString();
	}

	private void setSession(HttpSession session, String state) {
		session.setAttribute(SESSION_STATE, state);
	}

	private String getSession(HttpSession session) {
		return (String) session.getAttribute(SESSION_STATE);
	}
}
